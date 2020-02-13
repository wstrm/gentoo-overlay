# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGO_PN="github.com/cli/cli"
EGO_VENDOR=(
	"github.com/AlecAivazis/survey/v2 v2.0.4 github.com/AlecAivazis/survey"
	"github.com/BurntSushi/toml v0.3.1"
	"github.com/GeertJohan/go.incremental v1.0.0"
	"github.com/GeertJohan/go.rice v1.0.0"
	"github.com/Netflix/go-expect c93bf25de8e8"
	"github.com/akavel/rsrc v0.8.0"
	"github.com/alecthomas/assert 405dbfeb8e38"
	"github.com/alecthomas/chroma v0.6.8"
	"github.com/alecthomas/colour 60882d9e2721"
	"github.com/alecthomas/repr 117648cd9897"
	"github.com/armon/consul-api eb2c6b5be1b6"
	"github.com/aybabtme/rgbterm cc83f3b3ce59"
	"github.com/coreos/etcd v3.3.10"
	"github.com/coreos/go-etcd v2.0.0"
	"github.com/coreos/go-semver v0.2.0"
	"github.com/cpuguy83/go-md2man v1.0.10"
	"github.com/daaku/go.zipexe v1.0.0"
	"github.com/danwakefield/fnmatch cbb64ac3d964"
	"github.com/davecgh/go-spew 152484fe5c9ff65d013f0f372d748c03e8749e6d"
	"github.com/dlclark/regexp2 v1.1.6"
	"github.com/fsnotify/fsnotify c2828203cd70a50dcccfb2761f8b1f8ceef9a8e9"
	"github.com/google/shlex e7afc7fbc510"
	"github.com/gorilla/csrf v1.6.0"
	"github.com/gorilla/handlers v1.4.1"
	"github.com/gorilla/mux v1.7.3"
	"github.com/gorilla/securecookie e59506cc896acb7f7bf732d4fdf5e25f7ccd8983"
	"github.com/hashicorp/go-version v1.2.0"
	"github.com/hashicorp/hcl v1.0.0"
	"github.com/hinshun/vt10x 1954e6464174"
	"github.com/inconshreveable/mousetrap v1.0.0"
	"github.com/jessevdk/go-flags v1.4.0"
	"github.com/kballard/go-shellquote 95032a82bc51"
	"github.com/kr/pty v1.1.4"
	"github.com/kr/text v0.1.0"
	"github.com/magiconair/properties v1.8.0"
	"github.com/mattn/go-colorable v0.1.2"
	"github.com/mattn/go-isatty v0.0.9"
	"github.com/mgutz/ansi 9520e82c474b"
	"github.com/mitchellh/go-homedir v1.1.0"
	"github.com/mitchellh/go-wordwrap v1.0.0"
	"github.com/mitchellh/mapstructure v1.1.2"
	"github.com/nkovacs/streamquote 49af9bddb229"
	"github.com/pelletier/go-toml v1.2.0"
	"github.com/pkg/errors v0.8.1"
	"github.com/pmezard/go-difflib c0b812dadcf4498dede02bb7f0c5c478be997e34"
	"github.com/russross/blackfriday v1.5.2"
	"github.com/russross/blackfriday/v2 v2.0.1 github.com/russross/blackfriday"
	"github.com/sergi/go-diff v1.0.0"
	"github.com/shurcooL/sanitized_anchor_name v1.0.0"
	"github.com/spf13/afero v1.1.2"
	"github.com/spf13/cast v1.3.0"
	"github.com/spf13/cobra v0.0.5"
	"github.com/spf13/jwalterweatherman v1.0.0"
	"github.com/spf13/pflag v1.0.5"
	"github.com/spf13/viper v1.3.2"
	"github.com/stretchr/objx v0.1.0"
	"github.com/stretchr/testify v1.4.0"
	"github.com/tj/assert ee03d75cd160"
	"github.com/tj/go-css 220a796d1705"
	"github.com/ugorji/go d75b2dcb6bc8"
	"github.com/valyala/bytebufferpool v1.0.0"
	"github.com/valyala/fasttemplate v1.0.1"
	"github.com/vilmibm/go-termd v0.0.4"
	"golang.org/x/crypto 20be4c3c3ed5 github.com/golang/crypto"
	"golang.org/x/net eb5bcb51f2a3 github.com/golang/net"
	"golang.org/x/sys fde4db37ae7a github.com/golang/sys"
	"golang.org/x/text v0.3.0 github.com/golang/text"
	"gopkg.in/check.v1 20d25e2804050c1cd24a7eea1e7a6447dd0e74ec github.com/go-check/check"
	"gopkg.in/yaml.v2 v2.2.2 github.com/go-yaml/yaml"
	"gopkg.in/yaml.v3 fc94e3f71652 github.com/go-yaml/yaml"
)

inherit golang-vcs-snapshot

SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_VENDOR_URI}"

DESCRIPTION="The official GitHub CLI tool."
HOMEPAGE="https://cli.github.com/"
LICENSE="MIT"

SLOT="0"
IUSE=""
KEYWORDS="~amd64"

QA_PRESTRIPPED="/usr/bin/gh"

src_compile() {
	GOPATH="${WORKDIR}/${P}:$(get_golibdir_gopath)" \
		go install -v -work -x -ldflags "\
		-X github.com/cli/cli/command.Version=${PV} \
		-X github.com/cli/cli/command.BuildDate=$(date +%Y-%m-%d) \
		-s -w" \
		${EGO_PN}/cmd/gh || die
}

src_install() {
	dobin bin/*
}
