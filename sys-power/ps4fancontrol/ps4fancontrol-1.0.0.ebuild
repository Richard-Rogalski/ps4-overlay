# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Simple program to change the fan speed from Linux (PS4)"
HOMEPAGE="https://github.com/Ps3itaTeam/ps4fancontrol"

SRC_URI="https://github.com/Ps3itaTeam/ps4fancontrol/archive/refs/tags/v1.0.0.tar.gz"

LICENSE="GPL-3"
RESTRICT="mirror"
SLOT="0"
KEYWORDS="-* ~amd64"

DEPEND="x11-libs/xforms"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin ps4fancontrol
	einstalldocs
}

pkg_postinst() {
	elog "ps4fancontrol needs to be run with root privileges, and it is a graphical application."
	elog "The selected temperature will be saved in a config file and loaded when ps4fancontrol starts."
	elog " "
	ewarn "Be careful when setting the temperature, as setting it above default can cause heat damage to"
	ewarn "your hardware, and setting it absurdly low will probably cause damage to your fan."
	ewarn " "
	ewarn "To start ps4fancontrol automatically, the command"
	ewarn "ps4fancontrol --no-gui"
	ewarn "needs to be run with every boot. Personally, I recommend using /etc/local.d/"
	ewarn " "
}
