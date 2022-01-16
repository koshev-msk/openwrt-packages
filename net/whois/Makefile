PKG_NAME:=whois
PKG_VERSION:=5.5.10
PKG_RELEASE:=1

PKG_SOURCE:=whois_$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=http://ftp.debian.org/debian/pool/main/w/whois
PKG_MD5SUM:=4db48a482a06261ffa358d9f52c9bd7e
PKG_CAT:=xcat

PKG_BUILD_DIR:=$(BUILD_DIR)/whois-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/whois
        SECTION:=net
        CATEGORY:=Network
        TITLE:=WHOIS commandline utility
        URL:=http://ftp.debian.org/debian/pool/main/w/whois
endef

define Package/whois/description
        Utility to display information from WHOIS servers
endef

define Package/whois/install
        $(INSTALL_DIR) $(1)/usr/sbin
        $(INSTALL_BIN) $(PKG_BUILD_DIR)/whois $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
