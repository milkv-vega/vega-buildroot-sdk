################################################################################
#
# fakeroot
#
################################################################################

FAKEROOT_VERSION = 1.34
FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20240401T084438Z/pool/main/f/fakeroot

HOST_FAKEROOT_DEPENDENCIES = host-acl
# Force capabilities detection off
# For now these are process capabilities (faked) rather than file
# so they're of no real use
HOST_FAKEROOT_CONF_ENV = \
	ac_cv_header_sys_capability_h=no \
	ac_cv_func_capset=no
# 0003-Select-TCP-when-lack-of-SYSV-IPC.patch touches configure.ac
HOST_FAKEROOT_AUTORECONF = YES
FAKEROOT_LICENSE = GPL-3.0+
FAKEROOT_LICENSE_FILES = COPYING

define HOST_FAKEROOT_BUILD_AUX
	mkdir -p $(@D)/build-aux
endef
HOST_FAKEROOT_POST_PATCH_HOOKS += HOST_FAKEROOT_BUILD_AUX

$(eval $(host-autotools-package))
