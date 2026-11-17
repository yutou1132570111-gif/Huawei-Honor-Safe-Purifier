@echo off
chcp 65001 >nul
title 【红烬副控】华为/荣耀 家族一键静音净网工作流 (V3.0 终极完全体)
color 0C

:: 【免装ADB黑科技】检测当前目录有没有 adb.exe，没有就自动从谷歌官方极速拉取解压！
if not exist "adb.exe" (
    echo [!] 检测到当前目录没装 ADB，本古神正在自动为你拉取官方精简组件，请稍候...
    curl.exe -sLo "pt.zip" https://dl.google.com/android/repository/platform-tools-latest-windows.zip
    powershell -NoProfile -Command "Expand-Archive -Path 'pt.zip' -DestinationPath '.' -Force; Copy-Item 'platform-tools\*' '.' -Force; Remove-Item 'pt.zip' -Force; Remove-Item 'platform-tools' -Recurse -Force"
    echo [√] ADB 组件自动部署完成！
    echo.
)

echo ====================================================================
echo   【红烬副控 V3.0】正在连接设备，请确保手机已开启【USB调试】并点击允许...
echo ====================================================================
adb wait-for-device
echo [√] 设备已锁定！开始执行赛博安全屋驱魔协议...
echo.

:: 1. 建立华为+荣耀的核心内鬼、传感器监控、协同扫描、遥测与广告组件全名单
set BLOAT_LIST=^
 com.huawei.msdp com.hihonor.msdp ^
 com.huawei.dmsdp com.hihonor.dmsdp ^
 com.huawei.behaviorauth com.hihonor.behaviorauth ^
 com.huawei.iaware com.hihonor.iaware ^
 com.huawei.synergy com.hihonor.synergy ^
 com.huawei.ohos.collaborationcenter com.hihonor.ohos.collaborationcenter ^
 com.huawei.nearby com.hihonor.nearby ^
 com.huawei.arengine.service com.hihonor.arengine.service ^
 com.huawei.android.FloatTasks com.hihonor.android.FloatTasks ^
 com.huawei.hwdetectrepair com.hihonor.hwdetectrepair ^
 com.huawei.hwdiagnosis com.hihonor.hwdiagnosis ^
 com.huawei.hiview com.huawei.hiviewtunnel ^
 com.hihonor.hiview com.hihonor.hiviewtunnel ^
 com.huawei.android.chr com.hihonor.android.chr ^
 com.huawei.android.UEInfoCheck com.hihonor.android.UEInfoCheck ^
 com.huawei.android.AutoRegSms com.hihonor.android.AutoRegSms ^
 com.huawei.recsys com.huawei.suggestion ^
 com.hihonor.recsys com.hihonor.suggestion ^
 com.huawei.intelligent com.huawei.hicard ^
 com.hihonor.intelligent com.hihonor.hiboard ^
 com.hihonor.hicard com.huawei.pengine ^
 com.huawei.contentsensor com.hihonor.pengine ^
 com.hihonor.contentsensor com.huawei.magazine ^
 com.hihonor.magazine com.huawei.search ^
 com.hihonor.search com.huawei.ohos.search ^
 com.huawei.searchservice com.tencent.qqlivehuawei ^
 com.huawei.bd com.hihonor.bd ^
 com.huawei.imonitor com.hihonor.imonitor ^
 com.huawei.powergenie com.huawei.android.totemweather ^
 com.hihonor.android.totemweather com.huawei.fastapp ^
 com.hihonor.fastapp com.huawei.ohos.famanager ^
 com.huawei.browser com.hihonor.browser ^
 com.huawei.gamebox com.hihonor.gamebox ^
 com.huawei.skytone com.huawei.vassistant ^
 com.huawei.hitouch

:: 2. 批量执行：剥夺通知权限 + 禁止后台运行 + 卸载 + 底层强制冰封停用 (双保险)
for %%p in (%BLOAT_LIST%) do (
    echo [净化] 正在压制并超度组件: %%p
    adb shell cmd appops set %%p POST_NOTIFICATION ignore 2>nul
    adb shell cmd appops set %%p RUN_IN_BACKGROUND ignore 2>nul
    adb shell cmd appops set %%p RUN_ANY_IN_BACKGROUND ignore 2>nul
    adb shell pm uninstall --user 0 %%p 2>nul
    adb shell pm disable-user --user 0 %%p 2>nul
)

echo.
:: 3. 单独驯服【应用市场】与【广告推送】（保留基础功能，拔掉通知和后台！）
for %%s in (com.huawei.appmarket com.hihonor.appmarket com.huawei.hms.ads com.hihonor.hms.ads) do (
    echo [静音] 正在给 %%s 戴上静音口球并限制后台...
    adb shell cmd appops set %%s POST_NOTIFICATION ignore 2>nul
    adb shell cmd appops set %%s RUN_IN_BACKGROUND ignore 2>nul
)

echo.
:: 4. 顺手关闭系统底层的错误日志与用户体验上报参数
echo [底层] 正在物理掐断系统级遥测与错误日志上报开关...
adb shell settings put global send_action_app_error 0
adb shell settings put secure user_experience_involved 0

echo.
echo ====================================================================
echo [★] V3.0 净化全部完成！传感器暗桩与后台遥测已全部物理掐断，请拔线并关闭USB调试！
echo ====================================================================
pause
