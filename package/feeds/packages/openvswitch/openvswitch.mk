#
# Makefile extension for openvswitch
#

OPENVSWITCH_DIR:=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))

HOST_BUILD_DEPENDS+=python3/host

include $(INCLUDE_DIR)/host-build.mk


define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libopenvswitch*.so*  $(1)/usr/lib/
endef

CONFIGURE_VARS += \
	ovs_cv_python3=$(HOST_PYTHON3_BIN)

MAKE_VARS += PYTHONPATH="$(PKG_BUILD_DIR)/python:$(HOST_PYTHON3PATH)"

HOST_CFLAGS += -std=gnu99
HOST_LDFLAGS += -lssl -lcrypto

HOST_CONFIGURE_ARGS+= \
	--enable-ndebug \
	--enable-static \
	--disable-libcapng \
	--disable-silent-rules

HOST_CONFIGURE_VARS += \
	ovs_cv_flake8=no \
	ovs_cv_sphinx=no \
	ovs_cv_python2=no

# We need ovsdb-tool only
define Host/Compile
	@echo Host/Compile Start
	#$(call Host/Compile/Default,include/odp-netlink-macros.h)
	#$(call Host/Compile/Default,lib/ovsdb-server-idl.h)
	#$(call Host/Compile/Default,lib/vswitch-idl.h)
	#$(call Host/Compile/Default,ovsdb/ovsdb-tool)
	@echo Host/Compile End
endef

define Host/Install
	@echo Host/Install Start
	$(INSTALL_DIR) $(STAGING_DIR_HOSTPKG)/bin/
	#$(INSTALL_BIN) $(HOST_BUILD_DIR)/ovsdb/ovsdb-tool $(STAGING_DIR_HOSTPKG)/bin/ovsdb-tool
	@echo Host/Install End
endef

$(eval $(call HostBuild))
