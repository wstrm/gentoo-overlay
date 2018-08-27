# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit savedconfig git-r3 toolchain-funcs

DESCRIPTION="Simple generic tabbed fronted to xembed aware applications"
HOMEPAGE="https://tools.suckless.org/tabbed"
EGIT_REPO_URI="https://git.suckless.org/tabbed"

LICENSE="MIT"
SLOT="0"
IUSE="savedconfig"

RDEPEND="
	x11-libs/libX11
	x11-libs/libXft
"
DEPEND="
	${RDEPEND}
	x11-base/xorg-proto
"

src_prepare() {
	default

	sed -i \
		-e "/^X11LIB/{s:/usr/X11R6/lib:/usr/$(get_libdir)/X11:}" \
		-e '/^STLDFLAGS/s|= .*|= $(LDFLAGS) $(LIBS)|g' \
		-e '/^X11INC/{s:/usr/X11R6/include:/usr/include/X11:}' \
		config.mk || die
	sed -i \
		-e '/tic/d' \
		Makefile || die

	#sed config.mk \
	#	-e '/^CC/d' \
	#	-e 's|/usr/local|/usr|g' \
	#	-e 's|^CFLAGS.*|CFLAGS += -std=c99 -pedantic -Wall $(INCS) $(CPPFLAGS)|g' \
	#	-e 's|^LDFLAGS.*|LDFLAGS += $(CFLAGS) $(LIBS)|g' \
	#	-e 's|^LIBS.*|LIBS = -lX11|g' \
	#	-e 's|{|(|g;s|}|)|g' \
	#	-i || die

	#sed Makefile \
	#	-e 's|{|(|g;s|}|)|g' \
	#	-e '/^[[:space:]]*@echo/d' \
	#	-e 's|^	@|	|g' \
	#	-i || die

	restore_config config.h
}

src_configure() {
	sed -i \
		-e "s/pkg-config/$(tc-getPKG_CONFIG)/g" \
		config.mk || die

	tc-export CC
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIK}"/usr install

	save_config config.h
}
