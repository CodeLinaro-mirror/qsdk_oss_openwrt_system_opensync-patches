#
# Makefile extension for libev
#

LIBEV_DIR:=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))

TARGET_CFLAGS+= -fasynchronous-unwind-tables -fno-omit-frame-pointer

define libev_installdev_append
	$(CP) $(PKG_INSTALL_DIR)/usr/include/ev_trace.h $(1)/usr/include/
endef

Build/InstallDev += $(newline)$(libev_installdev_append)
