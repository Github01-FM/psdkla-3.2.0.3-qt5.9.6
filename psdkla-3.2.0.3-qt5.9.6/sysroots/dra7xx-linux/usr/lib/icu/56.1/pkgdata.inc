GENCCODE_ASSEMBLY_TYPE=-a gcc
SO=so
SOBJ=so
A=a
LIBPREFIX=lib
LIB_EXT_ORDER=.56.1
COMPILE=arm-linux-gnueabihf-gcc  -march=armv7-a -marm -mfpu=neon  -mfloat-abi=hard --sysroot=${STAGING_DIR_HOST} -isystem${TOOLCHAIN_PATH}/arm-linux-gnueabihf/include  -D_REENTRANT  -DU_HAVE_ELF_H=1 -DU_HAVE_ATOMIC=1  -DU_ATTRIBUTE_DEPRECATED= -isystem${TOOLCHAIN_PATH}/arm-linux-gnueabihf/include  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=/home/user01/zzp/g5r2/yocto-layers/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-neon-linux-gnueabi/icu/56.1-r0=/usr/src/debug/icu/56.1-r0 -fdebug-prefix-map=${STAGING_DIR_NATIVE}= -fdebug-prefix-map=${STAGING_DIR_HOST}=  -std=c99 -Wall -pedantic -Wshadow -Wpointer-arith -Wmissing-prototypes -Wwrite-strings   -c
LIBFLAGS=-I/usr/include -DPIC -fPIC
GENLIB=arm-linux-gnueabihf-gcc  -march=armv7-a -marm -mfpu=neon  -mfloat-abi=hard --sysroot=${STAGING_DIR_HOST} -isystem${TOOLCHAIN_PATH}/arm-linux-gnueabihf/include  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=/home/user01/zzp/g5r2/yocto-layers/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-neon-linux-gnueabi/icu/56.1-r0=/usr/src/debug/icu/56.1-r0 -fdebug-prefix-map=${STAGING_DIR_NATIVE}= -fdebug-prefix-map=${STAGING_DIR_HOST}=  -std=c99 -Wall -pedantic -Wshadow -Wpointer-arith -Wmissing-prototypes -Wwrite-strings   -L${TOOLCHAIN_PATH}/arm-linux-gnueabihf/lib -Wl,-rpath-link,${TOOLCHAIN_PATH}/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=gnu  -shared -Wl,-Bsymbolic
LDICUDTFLAGS=
LD_SONAME=-Wl,-soname -Wl,
RPATH_FLAGS=
BIR_LDFLAGS=-Wl,-Bsymbolic
AR=arm-linux-gnueabihf-ar
ARFLAGS=r
RANLIB=arm-linux-gnueabihf-ranlib
INSTALL_CMD=/usr/bin/install -c
