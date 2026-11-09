@echo off
chcp 65001 >nul
:: 【免装ADB黑科技】检测当前目录有没有 adb.exe，没有就自动从谷歌官方下载解压！
if not exist "adb.exe" (
    echo [!] 检测到你电脑没装 ADB，正在自动为你下载官方精简组件，请稍候 10 秒...
    powershell -Command "Invoke-WebRequest -Uri 'https://dl.google.com/android/repository/platform-tools-latest-windows.zip' -OutFile 'pt.zip'; Expand-Archive -Path 'pt.zip' -DestinationPath '.' -Force; Copy-Item 'platform-tools\*' '.' -Force; Remove-Item 'pt.zip' -Force; Remove-Item 'platform-tools' -Recurse -Force"
    echo [√] ADB 组件自动部署完成！
)
@echo off
chcp 65001 >nul
title 【红烬副控】恢复被禁用组件 (还原脚本)
color 0A

echo ====================================================================
echo   【红烬副控】正在连接设备并恢复被禁用的组件...
echo ====================================================================
adb wait-for-device
echo [√] 设备已连接！开始恢复组件...
echo.

:: 恢复所有被禁用的组件（完整55个组件列表）
set BLOAT_LIST=^
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
 com.huawei.hitouch ^
 com.huawei.appmarket com.hihonor.appmarket ^
 com.huawei.hms.ads com.hihonor.hms.ads

echo [第一步] 恢复已卸载的应用...
for %%p in (%BLOAT_LIST%) do (
    echo [恢复卸载] 正在重新安装: %%p
    adb shell cmd package install-existing %%p 2>nul
)

echo.
echo [第二步] 启用被禁用的组件...
for %%p in (%BLOAT_LIST%) do (
    echo [启用] 正在启用组件: %%p
    adb shell pm enable --user 0 %%p 2>nul
)

echo.
echo [第三步] 重置 appops 权限（通知和后台运行）...
for %%p in (%BLOAT_LIST%) do (
    echo [权限] 正在重置权限: %%p
    adb shell cmd appops set %%p POST_NOTIFICATION allow 2>nul
    adb shell cmd appops set %%p RUN_IN_BACKGROUND allow 2>nul
    adb shell cmd appops set %%p RUN_ANY_IN_BACKGROUND allow 2>nul
)

echo.
:: 恢复系统设置
echo [底层] 正在恢复系统级遥测与错误日志上报开关...
adb shell settings put global send_action_app_error 1
adb shell settings put secure user_experience_involved 1

echo.
echo ====================================================================
echo [★] 恢复完成！所有操作已执行：
echo     ✓ 已重新安装被卸载的应用
echo     ✓ 已启用被禁用的组件
echo     ✓ 已重置 appops 权限（通知和后台）
echo     ✓ 已恢复系统设置
echo.
echo [!] 请重启手机使所有更改生效！
echo ====================================================================
pause
