# ===========================================================================
#        https://www.gnu.org/software/autoconf-archive/ax_c_embed.html
# ===========================================================================
#
# SYNOPSIS
#
#   AX_C_EMBED
#
# DESCRIPTION
#
#   This macro tests if the C compiler supports the C23 standard #embed
#   preprocessor directive.
#
#   The new directive allows for a portable way to include binary resources.
#
# LICENSE
#
#   Copyright (c) 2025 by Avery Terrel <averymt@proton.me>
#
#   Permission to use, copy, modify, and/or distribute this software for any
#   purpose with or without fee is hereby granted.
#
#   THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
#   WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
#   MERCHANTIBILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
#   ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
#   WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
#   ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
#   OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

#serial 1

AC_DEFUN([AX_C_EMBED],
[AC_REQUIRE([AC_PROG_CPP])
AC_CACHE_CHECK([for preprocessor #embed],
[ax_cv_c_embed],
[AC_PREPROC_IFELSE([AC_LANG_SOURCE([
const unsigned char embed_test = {
#embed "non-existent-file.xyz" if_empty('\0')
};
])],
[ax_cv_c_embed=yes],
[ax_cv_c_embed=no])
])
if test "x$ax_cv_c_embed" = xyes; then
AC_DEFINE([HAVE_EMBED],,[Define if the preprocessor supports #embed])
fi
])
