#
# Copyright (C) 2014-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=dns-proxy
PKG_VERSION:=0.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/cookiengineer/dns-proxy.git
PKG_SOURCE_VERSION:=5785038bc1b50cf363f401ff60dd229fbfaae430

PKG_MAINTAINER:=Konstantine A. Shevlakov <shevlakov@132lan.ru>
PKG_LICENSE:=Apache-2.0

include $(INCLUDE_DIR)/package.mk

define Package/dns-proxy
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libc
  TITLE:=A simple dns proxy to tunnel DNS requests over a socks proxy
endef

define Package/dns-proxy/conffiles
/etc/dns-proxy.conf
endef

define Package/dns-proxy/description
A simple dns proxy to tunnel DNS requests over a socks proxy (for example, over ssh or Tor). This can come in handy when setting up transparent proxies.
It chooses a random DNS server for each request from the file "resolv.conf" which is a newline delimited list of DNS servers.
The daemon must be run as root in order for it to bind to port 53.
endef

CONFIGURE_VARS += \
	CC="$(TARGET_CC)" \
	CXX="$(TARGET_CC) +.c++" \
	CFLAGS="$(TARGET_CFLAGS) -Wall -DVERSION=\"\\\"$(PKG_VERSION)\\\"\"" \
	LDFLAGS="$(TARGET_LDFLAGS)"


define Build/Compile
	@echo -e "\n=== Build/Compile ==="
	$(CONFIGURE_VARS) $(MAKE) -C $(PKG_BUILD_DIR)
endef


define Package/dns-proxy/install
	$(INSTALL_DIR) $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dns-proxy $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) files/dns-proxy.init $(1)/etc/init.d/dns-proxy
	$(INSTALL_CONF) files/dns-proxy.conf $(1)/etc/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/resolv.conf $(1)/etc/dns-proxy-resolv.conf
endef

$(eval $(call BuildPackage,dns-proxy))
