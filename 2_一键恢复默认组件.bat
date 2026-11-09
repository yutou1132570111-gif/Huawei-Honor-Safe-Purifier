@echo off
chcp 65001 >nul
title Huawei/Honor 一键恢复已禁用组件工具 (Rollback Tool)
color 0E

echo ============================================================================
echo   Huawei / Honor 组件一键恢复工具 (后悔药脚本)
echo ============================================================================
echo.
echo [!] 如果你需要恢复某个被禁用的自带功能，本脚本将为你重新激活所有组件...
pause

adb shell cmd package install-existing com.huawei.bd
adb shell cmd package install-existing com.huawei.hiview
adb shell cmd package install-existing com.huawei.hiviewtunnel
adb shell cmd package install-existing com.huawei.imonitor
adb shell cmd package install-existing com.huawei.powergenie
adb shell cmd package install-existing com.huawei.intelligent
adb shell cmd package install-existing com.huawei.search
adb shell cmd package install-existing com.huawei.magazine
adb shell cmd package install-existing com.huawei.android.totemweather
adb shell cmd package install-existing com.huawei.fastapp
adb shell cmd package install-existing com.hihonor.fastapp
adb shell cmd package install-existing com.huawei.ohos.famanager
adb shell cmd package install-existing com.huawei.vassistant
adb shell cmd package install-existing com.huawei.hitouch
adb shell cmd package install-existing com.huawei.skytone
adb shell cmd package install-existing com.huawei.wallet
adb shell cmd package install-existing com.huawei.browser

echo.
echo ============================================================================
echo   [完成] 所有系统默认组件已恢复完毕！
echo ============================================================================
pause
