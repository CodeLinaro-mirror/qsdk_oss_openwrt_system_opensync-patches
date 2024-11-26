#
# Makefile extension for tinyproxy
#

TINYPROXY_DIR:=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))

define tinyproxy_append
	DEPENDS:=+libpthread +libmnl +libopenssl
endef

TARGET_LDFLAGS += -lcrypto -lssl

Package/tinyproxy += $(newline)$(tinyproxy_append)
