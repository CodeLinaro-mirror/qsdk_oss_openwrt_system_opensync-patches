# Recipe extension for miniupnpd

MINIUPNPD_DIR:=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))

ifeq ($(CONFIG_OPENSYNC_SUPPORTED),y)
CONFIGURE_ARGS = \
	--igd2 \
	--iptscript \
	--leasefile \
	--portinuse \
	--firewall=$(BUILD_VARIANT)
endif

define base-files_install_append
	$(INSTALL_DIR) $(1)/etc/miniupnpd
ifeq ($(CONFIG_OPENSYNC_SUPPORTED),y)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/iptscript/iptscript.sh $(1)/etc/miniupnpd
endif
endef

Package/miniupnpd-iptables/install += $(newline)$(miniupnpd_install_append)
