@echo off
chcp 65001 >nul
title Huawei/Honor Safe Privacy & De-bloat Purifier (2026 Safe Edition)
color 0B

echo ============================================================================
echo   Huawei / Honor 隐私净化与后台轻量化工具 (Safe Edition - 保留应用市场与日常功能)
echo ============================================================================
echo.
echo [!] 正在检测 ADB 设备连接状态...
adb devices
echo.
echo [提示] 请确保手机已开启【开发者选项】与【USB调试】，并在手机弹窗上点击“允许”！
pause

echo.
echo ----------------------------------------------------------------------------
echo [阶段 1/4] 正在清除用户体验计划、遥测日志与后台数据收集进程...
echo ----------------------------------------------------------------------------
adb shell pm uninstall -k --user 0 com.huawei.bd
adb shell pm uninstall -k --user 0 com.huawei.hiview
adb shell pm uninstall -k --user 0 com.huawei.hiviewtunnel
adb shell pm uninstall -k --user 0 com.huawei.imonitor
adb shell pm uninstall -k --user 0 com.huawei.powergenie

echo.
echo ----------------------------------------------------------------------------
echo [阶段 2/4] 正在清除全局广告联盟、智慧营销推送与负一屏资讯流...
echo ----------------------------------------------------------------------------
adb shell pm uninstall -k --user 0 com.huawei.intelligent
adb shell pm uninstall -k --user 0 com.huawei.search
adb shell pm uninstall -k --user 0 com.huawei.magazine
adb shell pm uninstall -k --user 0 com.huawei.android.totemweather
adb shell pm uninstall -k --user 0 com.huawei.fastapp
adb shell pm uninstall -k --user 0 com.hihonor.fastapp
adb shell pm uninstall -k --user 0 com.huawei.ohos.famanager

echo.
echo ----------------------------------------------------------------------------
echo [阶段 3/4] 正在卸载高耗电预装娱乐组件与语音追踪助手（可随时恢复）...
echo ----------------------------------------------------------------------------
adb shell pm uninstall -k --user 0 com.huawei.vassistant
adb shell pm uninstall -k --user 0 com.huawei.hitouch
adb shell pm uninstall -k --user 0 com.huawei.skytone
adb shell pm uninstall -k --user 0 com.huawei.wallet
adb shell pm uninstall -k --user 0 com.huawei.browser

echo.
echo ----------------------------------------------------------------------------
echo [阶段 4/4] 正在保护核心生态组件（保留应用市场、HMS基础服务与桌面）...
echo ----------------------------------------------------------------------------
echo [√] 已跳过 com.huawei.appmarket (华为应用市场 - 安全保留)
echo [√] 已跳过 com.huawei.hwid (HMS Core 核心框架 - 安全保留)
echo [√] 已跳过 com.android.Gallery3d (系统图库 - 安全保留)

echo.
echo ============================================================================
echo   [完成] 净化完毕！后台遥测与耗电毒瘤已拔除，请重启手机享受丝滑续航！
echo ============================================================================
pause
