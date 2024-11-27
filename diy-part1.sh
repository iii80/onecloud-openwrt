#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
# echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> "feeds.conf.default"
sed -i '2s/^#//' feeds.conf.default
sed -i '3s/^/#/' feeds.conf.default
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default

# git clone https://github.com/sbwml/luci-app-alist package/alist
# git clone https://github.com/rufengsuixing/luci-app-onliner package/onliner

# 此脚本用处是：添加第三方插件
#=========================================================================================================================


# 1-添加 ShadowSocksR Plus+ 插件
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
#临时使用 SSR+ 自用修改源
# git clone https://github.com/iii80/helloworld.git;master package/helloworld
# echo "src-git helloworld https://github.com/fw876/helloworld.git;master" >> "feeds.conf.default"
#echo "src-git helloworld https://github.com/iii80/helloworld.git;master" >> "feeds.conf.default"


# 2-添加 PowerOff 关机插件
git clone https://github.com/WukongMaster/luci-app-poweroff.git package/luci-app-poweroff

# 3-添加 opentomcat 主题
git clone https://github.com/WukongMaster/luci-theme-opentomcat.git package/luci-theme-opentomcat

# 4-添加 OpenClash 插件
sed -i '$a\src-git openclash https://github.com/vernesong/OpenClash' ./feeds.conf.default

# 5-添加 PassWall 插件
echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> "feeds.conf.default"
echo "src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git;main" >> "feeds.conf.default"
echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"

# 6-添加 Lucky 插件
git clone https://github.com/gdy666/luci-app-lucky.git package/luci-app-lucky

# 7-添加 Easytier 插件
git clone https://github.com/EasyTier/luci-app-easytier.git package/easytier
