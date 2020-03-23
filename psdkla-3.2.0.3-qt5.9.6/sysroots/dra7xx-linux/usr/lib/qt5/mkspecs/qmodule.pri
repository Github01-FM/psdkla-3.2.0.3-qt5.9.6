host_build {
    QT_CPU_FEATURES.arm = neon
} else {
    QT_CPU_FEATURES.arm = neon
}
QT.global_private.enabled_features = alloca_h alloca gui libudev network posix_fallocate reduce_exports system-zlib testlib xml
QT.global_private.disabled_features = alloca_malloc_h android-style-assets sse2 dbus dbus-linked private_tests qml-debug reduce_relocations release_tools sql stack-protector-strong widgets
PKG_CONFIG_EXECUTABLE = $$[QT_HOST_PREFIX/get]/bin/pkg-config
QMAKE_LIBS_LIBUDEV = -ludev
QT_COORD_TYPE = double
QMAKE_LIBS_ZLIB = -lz
CONFIG -= precompile_header
CONFIG += cross_compile compile_examples enable_new_dtags largefile neon silent
QT_BUILD_PARTS += libs tools
QT_HOST_CFLAGS_DBUS += -I$$[QT_SYSROOT]/usr/include/dbus-1.0 -I$$[QT_SYSROOT]/usr/lib/dbus-1.0/include
HOST_QT_TOOLS = $$[QT_HOST_PREFIX/get]/bin/qt5
