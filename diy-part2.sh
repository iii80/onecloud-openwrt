#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.0.111/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
sed -i 's/OpenWrt/OneCloud/g' package/base-files/files/bin/config_generate

# 替换终端为bash
sed -i 's/\/bin\/ash/\/bin\/bash/' package/base-files/files/etc/passwd


# 1-设置默认主题
# sed -i 's/bootstrap/opentomcat/g' ./feeds/luci/collections/luci/Makefile

# 2-设置管理地址
sed -i 's/192.168.1.1/192.168.0.111/g' package/base-files/files/bin/config_generate

# 3-编译内核版本
#sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=6.6/g' ./target/linux/x86/Makefile

# 4-设置密码为空
sed -i '/CYXluq4wUazHjmCDBCqXF/d' package/lean/default-settings/files/zzz-default-settings

# 5-修改时间格式
sed -i 's/os.date()/os.date("%Y-%m-%d %H:%M:%S")/g' package/lean/autocore/files/*/index.htm

# 6-添加固件日期
sed -i 's/IMG_PREFIX:=/IMG_PREFIX:=$(BUILD_DATE_PREFIX)-/g' ./include/image.mk
sed -i '/DTS_DIR:=$(LINUX_DIR)/a\BUILD_DATE_PREFIX := $(shell date +'%F')' ./include/image.mk

# 7-修正硬件信息
#sed -i 's/${g}.*/${a}${b}${c}${d}${e}${f}${hydrid}/g' package/lean/autocore/files/x86/autocore

# 8-增固件连接数
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf

# 9-TTYD终端直接登录
sed -i '/\/bin\/login -f root/!s|/bin/login|/bin/login -f root|' feeds/packages/utils/ttyd/files/ttyd.config
