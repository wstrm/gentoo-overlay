# Copyright 2019 William Wennerström <william@willeponken.me>
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/yggdrasil-network"
GOLANG_PKG_VERSION="43643e0307c3c6f34358a848796b757f2e9eae17"
GOLANG_PKG_BUILDPATH="/cmd/..."
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_LDFLAGS="\
	-X ${GOLANG_PKG_IMPORTPATH}/${PN}/src/yggdrasil.buildName=yggdrasil \
	-X ${GOLANG_PKG_IMPORTPATH}/${PN}/src/yggdrasil.buildVersion=${PV} \
	-s -w"
GOLANG_PKG_DEPENDENCIES=(
	"github.com/docker/libcontainer:5dc7ba0"
	"github.com/gologme/log:4e5d8cc"
	"github.com/hjson/hjson-go:a25ecf6"
	"github.com/kardianos/minwinsvc:cad6b2b"
	"github.com/mitchellh/mapstructure:3536a92"
	"github.com/songgao/packets:549a10c"
	"github.com/yggdrasil-network/water:f732c88"
	"github.com/golang/crypto:505ab14 -> golang.org/x"
	"github.com/golang/net:6105869 -> golang.org/x"
	"github.com/golang/sys:70b957f -> golang.org/x"
	"github.com/golang/text:f21a4df -> golang.org/x"
)

inherit golang-single

DESCRIPTION="An experiment in scalable routing as an encrypted IPv6 overlay network"
HOMEPAGE="https://yggdrasil-network.github.io/"

LICENSE="LGPL-3_linking-exception"
SLOT="0"

src_install() {
	golang-single_src_install

	newinitd "${FILESDIR}"/${PN}.init yggdrasil || die "installing init failed"
}
