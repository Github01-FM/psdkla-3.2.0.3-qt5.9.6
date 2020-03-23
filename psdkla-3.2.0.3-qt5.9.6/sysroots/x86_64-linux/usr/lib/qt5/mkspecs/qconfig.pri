host_build {
    QT_ARCH = x86_64
    QT_BUILDABI = x86_64-little_endian-lp64
    QT_TARGET_ARCH = x86_64
    QT_TARGET_BUILDABI = x86_64-little_endian-lp64
} else {
    QT_ARCH = x86_64
    QT_BUILDABI = x86_64-little_endian-lp64
}
QT.global.enabled_features = cross_compile shared c++11 concurrent pkg-config
QT.global.disabled_features = framework rpath appstore-compliant debug_and_release simulator_and_device build_all c++14 c++1z force_asserts separate_debug_info static
PKG_CONFIG_SYSROOT_DIR = ${STAGING_DIR_NATIVE}
PKG_CONFIG_LIBDIR = ${STAGING_DIR_NATIVE}/usr/lib/pkgconfig
CONFIG += cross_compile shared release
QT_CONFIG += shared release c++11 concurrent dbus no-gui no-qml-debug reduce_exports reduce_relocations stl no-widgets
QT_VERSION = 5.9.6
QT_MAJOR_VERSION = 5
QT_MINOR_VERSION = 9
QT_PATCH_VERSION = 6
QT_GCC_MAJOR_VERSION = 4
QT_GCC_MINOR_VERSION = 8
QT_GCC_PATCH_VERSION = 4
QT_EDITION = OpenSource
