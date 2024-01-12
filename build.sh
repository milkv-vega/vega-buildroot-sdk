#!/bin/bash

TOP_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
#echo "TOP_DIR: ${TOP_DIR}"
cd ${TOP_DIR}

#set envirenment var
FS_DIR="${TOP_DIR}/work/buildroot_initramfs_sysroot"
CONFIGS_DIR="${TOP_DIR}/u-boot/include/configs"

INSTALL_DIR="install"
UPDATE_FILES="updatefiles"

export TOOLCHAIN_PATH="${TOP_DIR}/host-tools/gcc"
export CROSS_COMPILE=${TOOLCHAIN_PATH}/bin/riscv-nuclei-linux-gnu

function print_info()
{
  printf "\e[1;32m%s\e[0m\n" "$1"
}

function print_err()
{
  printf "\e[1;31mError: %s\e[0m\n" "$1"
}

function get_toolchain()
{
  if [ ! -d host-tools ]; then
    print_info "Toolchain does not exist, download it now..."

    toolchain_url="https://github.com/milkv-vega/vega-tools/releases/download/v1.0/host-tools.tar.gz"
    echo "toolchain_url: ${toolchain_url}"
    toolchain_file=${toolchain_url##*/}
    echo "toolchain_file: ${toolchain_file}"

    wget ${toolchain_url} -O ${toolchain_file}
    if [ $? -ne 0 ]; then
      print_err "Failed to download ${toolchain_url} !"
      exit 1
    fi

    if [ ! -f ${toolchain_file} ]; then
      print_err "${toolchain_file} not found!"
      exit 1
    fi

    print_info "Extracting ${toolchain_file}..."
    tar -xf ${toolchain_file}
    if [ $? -ne 0 ]; then
      print_err "Extract ${toolchain_file} failed!"
      exit 1
    fi

    [ -f ${toolchain_file} ] && rm -rf ${toolchain_file}

  fi
}

get_toolchain

# make freeloarder

make cleanuboot
make cleanfreeloader
make freeloader

echo "copy lib and usr/sbin and www"
cp -a ${UPDATE_FILES}/fs/lib/* ${FS_DIR}/lib
cp -a ${UPDATE_FILES}/fs/usr/sbin/* ${FS_DIR}/usr/sbin
cp -a ${UPDATE_FILES}/fs/www/ ${FS_DIR}/usr

#echo "copy milkv web files"
#if [ -d  device/milkv/www ] ; then
#  cp -rf device/milkv/www/* ${FS_DIR}/usr/www/
#fi

echo "copy etc files"
if [ -d  ${FS_DIR}/usr/etc ] ; then
  rm -rf  ${FS_DIR}/usr/etc/*
else
  mkdir  ${FS_DIR}/usr/etc
fi
cp -a ${UPDATE_FILES}/etc/* ${FS_DIR}/usr/etc


echo "copy files to ${INSTALL_DIR}"

if [ -d ${INSTALL_DIR} ] ; then
  rm -rf ${INSTALL_DIR}
fi
mkdir ${INSTALL_DIR}

cp -rf common/* ${INSTALL_DIR}/

#chmod 777 ${UPDATE_FILES}/rootetc/S40initconfig.sh
cp -a ${UPDATE_FILES}/rootetc/*.sh ${INSTALL_DIR}
cp -a ${UPDATE_FILES}/fs/*.db ${INSTALL_DIR}

if [ -f  device/milkv/version ] ; then
  cp device/milkv/version ${INSTALL_DIR}
fi

echo "create file system"
./${INSTALL_DIR}/cp.sh ubifs web  


echo "copy images to out"

if [ -d out ] ; then
  rm -rf out/*
else
  mkdir out
fi

# cp ubifs.img to current dir
cp -a work/ubifs.img out/
cp -a freeloader_rootfs/freeloader.bin out/
cp -a freeloader_rootfs/kernel.bin out/

print_info "Image generation was successful in the 'out' directory."

