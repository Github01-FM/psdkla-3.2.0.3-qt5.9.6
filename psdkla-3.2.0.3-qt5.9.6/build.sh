#!/bin/sh

# Variable
export SCRIPTDIR=$(dirname $(readlink -f $0))

export TOOLCHAIN_PATH=$(readlink -f "${SCRIPTDIR}/toolchain/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf")
export ELT_TARGET_SYS="arm-linux-gnueabihf"
export HOST_PREFIX="${ELT_TARGET_SYS}-"
export STAGING_DIR_HOST=$(readlink -f "${SCRIPTDIR}/sysroots/dra7xx-linux")
export STAGING_DIR_NATIVE=$(readlink -f "${SCRIPTDIR}/sysroots/x86_64-linux")

PACKAGE_ALL="
qtbase
qtdeclarative
qtgraphicaleffects
qtimageformats
qtxmlpatterns
qtlocation
qtquickcontrols
qtquickcontrols2
qtwayland
qtwebchannel
qtwebsockets
qtwebengine
"

# Help
build_help() {
    echo "Usage:"
    echo "    $0           : Build ALL the Package"
    echo "    $0 clean     : Clean ALL the built-out"
    echo "    $0 output    : Update 'output'"
    echo "    $0 <package> : Build the specified Package"
}

# Env
set_env() {
    export WORKDIR="${SCRIPTDIR}/$1"
    export B="${WORKDIR}/build"
    export D="${WORKDIR}/image"
    export S="${WORKDIR}/git"
    export O="${WORKDIR}/out"
}

# Clean
build_clean() {
    set_env $1
    echo "Clean $B"
    rm -rf $B
    echo "Clean $D"
    rm -rf $D
}

# Patch
build_patch() {
    set_env $1
    echo "NOTE: Patch '$1' source code."
    cd ${S} && git reset --hard HEAD && git clean -df -- . && git status && cd -
    $SCRIPTDIR/$1/scripts/run.do_patch
}

# Configure
build_configure() {
    set_env $1
    echo "NOTE: Configure '$1' source code."
    mkdir -p ${B}
    $SCRIPTDIR/$1/scripts/run.do_configure
}

# Compile
build_compile() {
    set_env $1
    echo "NOTE: Compile '$1' source code."
    mkdir -p ${B}
    $SCRIPTDIR/$1/scripts/run.do_compile
}

# Install
build_install() {
    set_env $1
    echo "NOTE: Install '$1' built-out."
    mkdir -p ${D}
    $SCRIPTDIR/$1/scripts/run.do_install
}

# Out
build_out() {
    set_env $1
    echo "NOTE: Install '$1' target-out."
    $SCRIPTDIR/$1/scripts/run.do_out
}

# Build Package
build_pkg() {
    build_patch $1
    build_configure $1
    build_compile $1
    build_install $1
    build_out $1
}

# Build ALL
build_pkg_all() {
    echo "NOTE: Build all"
    for i in $PACKAGE_ALL
    do
        if [ ! -d "${SCRIPTDIR}/$i" ]; then
            echo "NOTE: Skip '$i': not exists or is not a directory"
            continue
        fi
        build_pkg $i
    done
}

# Clean ALL
build_clean_all() {
    echo "NOTE: Clean all"
    for i in $PACKAGE_ALL
    do
        if [ ! -d "${SCRIPTDIR}/$i" ]; then
            echo "NOTE: Skip '$i': not exists or is not a directory"
            continue
        fi
        build_clean $i
    done
}

# Out ALL
build_out_all() {
    echo "NOTE: Update out all"
    for i in $PACKAGE_ALL
    do
        if [ ! -d "${SCRIPTDIR}/$i" ]; then
            echo "NOTE: Skip '$i': not exists or is not a directory"
            continue
        fi
        build_out $i
    done
}

# Output ALL
build_output_all() {
    echo "NOTE: Output all"
    rm -rf ${SCRIPTDIR}/output
    mkdir -p ${SCRIPTDIR}/output
    for i in $PACKAGE_ALL
    do
        if [ ! -d "${SCRIPTDIR}/$i" ]; then
            echo "NOTE: Skip '$i': not exists or is not a directory"
            continue
        fi
        cp -af ${SCRIPTDIR}/$i/out/* ${SCRIPTDIR}/output
    done
}

# Emit a useful diagnostic if something fails:
bb_exit_handler() {
    ret=$?
    case $ret in
    0)  ;;
    *)  case $BASH_VERSION in
        "") echo "WARNING: exit code $ret from a shell command.";;
        *)  echo "WARNING: ${BASH_SOURCE[0]}:${BASH_LINENO[0]} exit $ret from '$BASH_COMMAND'";;
        esac
        exit $ret
    esac
}
trap 'bb_exit_handler' 0
set -e

# Set qt.conf
test ! -e "${SCRIPTDIR}/qt.conf.template" && echo "ERROR: miss qt.conf.template" && exit -1
cp -f ${SCRIPTDIR}/qt.conf.template ${SCRIPTDIR}/qt.conf
sed -i "s,(STAGING_DIR_HOST),${STAGING_DIR_HOST},g" ${SCRIPTDIR}/qt.conf
sed -i "s,(STAGING_DIR_NATIVE),${STAGING_DIR_NATIVE},g" ${SCRIPTDIR}/qt.conf
export QTCONF_PATH="${SCRIPTDIR}"

# Check Args
if [ -n "$1" ]; then
    if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
        build_help
    elif [ "$1" = "clean" ]; then
        build_clean_all
    elif [ "$1" = "output" ]; then
        build_out_all
        build_output_all
    else
        if [ ! -d "${SCRIPTDIR}/$1" ]; then
            echo "ERROR: '$1' not exists or is not a directory"
            exit -1
        fi
        if [ -n "$2" ]; then
            if [ "$2" = "clean" ]; then
                build_clean $1
            elif [ "$2" = "patch" ]; then
                build_patch $1
            elif [ "$2" = "configure" ]; then
                build_configure $1
            elif [ "$2" = "compile" ]; then
                build_compile $1
            elif [ "$2" = "install" ]; then
                build_install $1
            elif [ "$2" = "out" ]; then
                build_out $1
            fi
        else
            build_pkg $1
        fi
    fi
    exit 0
fi

# Build
build_pkg_all

# Output
build_output_all

echo "Done. Check 'output'."

# cleanup
ret=$?
trap '' 0
exit $ret
