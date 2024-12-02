# Recipe extension for miniupnpd

MINIUPNPD_DIR:=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))

CONFIGURE_ARGS = \
	--igd2 \
	--iptscript \
	--leasefile \
	--portinuse \
	--firewall=$(BUILD_VARIANT)

define base-files_install_append
	$(INSTALL_DIR) $(1)/etc/miniupnpd
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/iptscript/iptscript.sh $(1)/etc/miniupnpd
endef

Package/miniupnpd/install += $(newline)$(miniupnpd_install_append)
