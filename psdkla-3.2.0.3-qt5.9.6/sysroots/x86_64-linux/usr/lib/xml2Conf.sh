#
# Configuration file for using the XML library in GNOME applications
#
XML2_LIBDIR="-L${STAGING_DIR_NATIVE}/usr/lib"
XML2_LIBS="-lxml2 -L${STAGING_DIR_NATIVE}/usr/lib -lz     -lm "
XML2_INCLUDEDIR="-I${STAGING_DIR_NATIVE}/usr/include/libxml2"
MODULE_VERSION="xml2-2.9.4"

