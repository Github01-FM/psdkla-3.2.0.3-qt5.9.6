host_build {
    QT_CPU_FEATURES.x86_64 = mmx sse sse2
} else {
    QT_CPU_FEATURES.x86_64 = mmx sse sse2
}
QT.global_private.enabled_features = alloca_h alloca sse2 dbus network posix_fallocate reduce_exports reduce_relocations sql system-zlib testlib xml
QT.global_private.disabled_features = alloca_malloc_h android-style-assets private_tests dbus-linked gui libudev qml-debug release_tools stack-protector-strong widgets
PKG_CONFIG_EXECUTABLE = ${STAGING_DIR_NATIVE}/usr/bin/pkg-config
QT_COORD_TYPE = double
QMAKE_LIBS_ZLIB = -lz
CONFIG += cross_compile use_gold_linker sse2 sse3 ssse3 sse4_1 sse4_2 avx avx2 compile_examples enable_new_dtags f16c largefile precompile_header silent
QT_BUILD_PARTS += libs
QT_HOST_CFLAGS_DBUS += -I${STAGING_DIR_NATIVE}/usr/include/dbus-1.0 -I${STAGING_DIR_NATIVE}/usr/lib/dbus-1.0/include
