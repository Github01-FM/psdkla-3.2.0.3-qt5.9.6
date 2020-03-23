dnl -*- mode: autoconf -*-

# serial 1

dnl Usage:
dnl   GTK_DOC_CHECK([minimum-gtk-doc-version])
AC_DEFUN([GTK_DOC_CHECK],
[
  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
  AC_BEFORE([AC_PROG_LIBTOOL],[$0])dnl setup libtool first
  AC_BEFORE([AM_PROG_LIBTOOL],[$0])dnl setup libtool first

  AC_PATH_PROG([GTKDOC_CHECK],[gtkdoc-check])
  AC_PATH_PROGS([GTKDOC_REBASE],[gtkdoc-rebase],[true])
  AC_PATH_PROG([GTKDOC_MKPDF],[gtkdoc-mkpdf])

  AC_ARG_WITH([html-dir],
    AS_HELP_STRING([--with-html-dir=PATH], [path to installed docs]),,
    [with_html_dir='${datadir}/gtk-doc/html'])
  HTML_DIR="$with_html_dir"
  AC_SUBST([HTML_DIR])

  AC_ARG_ENABLE([gtk-doc],
    AS_HELP_STRING([--enable-gtk-doc],
                   [use gtk-doc to build documentation [[default=no]]]),,
    [enable_gtk_doc=no])

  if test x$enable_gtk_doc = xyes; then
     AC_MSG_ERROR([gtk-doc requested but only gtk-doc-stub is installed])
  fi

  AC_MSG_CHECKING([whether to build gtk-doc documentation])
  AC_MSG_RESULT([no])

  AC_ARG_ENABLE([gtk-doc-html],
    AS_HELP_STRING([--enable-gtk-doc-html],
                   [build documentation in html format [[default=yes]]]),,
    [enable_gtk_doc_html=yes])
    AC_ARG_ENABLE([gtk-doc-pdf],
      AS_HELP_STRING([--enable-gtk-doc-pdf],
                     [build documentation in pdf format [[default=no]]]),,
      [enable_gtk_doc_pdf=no])

  AM_CONDITIONAL([ENABLE_GTK_DOC], [false])
  AM_CONDITIONAL([GTK_DOC_BUILD_HTML], [false])
  AM_CONDITIONAL([GTK_DOC_BUILD_PDF], [false])
  AM_CONDITIONAL([GTK_DOC_USE_LIBTOOL], [false])
  AM_CONDITIONAL([GTK_DOC_USE_REBASE], [false])
])
