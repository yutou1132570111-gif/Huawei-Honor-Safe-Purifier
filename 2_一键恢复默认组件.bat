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

:: 恢复所有被禁用的组件
set BLOAT_LIST=^
 com.huawei.bd com.hihonor.bd ^
 com.huawei.imonitor com.hihonor.imonitor ^
 com.huawei.hiview com.huawei.hiviewtunnel ^
 com.hihonor.hiview com.hihonor.hiviewtunnel ^
 com.huawei.android.totemweather com.hihonor.android.totemweather ^
 com.huawei.fastapp com.hihonor.fastapp ^
 com.huawei.ohos.famanager ^
 com.huawei.intelligent com.hihonor.hiboard ^
 com.huawei.magazine com.hihonor.magazine ^
 com.huawei.search com.hihonor.search ^
 com.huawei.browser com.hihonor.browser ^
 com.huawei.gamebox com.hihonor.gamebox ^
 com.huawei.skytone com.huawei.vassistant ^
 com.huawei.appmarket com.hihonor.appmarket com.huawei.hms.ads

for %%p in (%BLOAT_LIST%) do (
    echo [恢复] 正在启用组件: %%p
    adb shell pm enable --user 0 %%p 2>nul
)

echo.
:: 恢复系统设置
echo [底层] 正在恢复系统级遥测与错误日志上报开关...
adb shell settings put global send_action_app_error 1
adb shell settings put secure user_experience_involved 1

echo.
echo ====================================================================
echo [★] 恢复完成！所有组件已重新启用，请重启手机生效！
echo.
echo [注意] appops 权限限制无法通过命令自动恢复，需要手动：
echo       进入 设置 → 应用 → [应用名] → 通知 重新开启
echo ====================================================================
pause
