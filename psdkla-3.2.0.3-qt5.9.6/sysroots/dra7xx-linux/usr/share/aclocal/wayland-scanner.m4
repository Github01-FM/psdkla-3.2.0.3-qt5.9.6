AC_DEFUN([WAYLAND_SCANNER_RULES], [
    PKG_PROG_PKG_CONFIG

    

    wayland_scanner=`pkg-config-native --variable=wayland_scanner wayland-scanner`
    AC_SUBST([wayland_scanner])

    wayland_scanner_rules=`pkg-config-native --variable=pkgdatadir wayland-scanner`/wayland-scanner.mk
    AC_SUBST_FILE([wayland_scanner_rules])

    AC_SUBST([wayland_protocoldir], [$1])
])
