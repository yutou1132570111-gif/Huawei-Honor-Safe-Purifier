# 🛡️ 【V3.0】华为 / 荣耀 深度隐私净网与续航狂飙工具包 (终极完全体收录版)

本工具包专为 **华为 (Huawei / HarmonyOS)** 与 **荣耀 (Honor / MagicOS)** 手机用户打造。通过官方 Android ADB 接口（**免 Root、不破保修、绝不变砖**），一键物理掐断后台常驻的 **25+ 核心遥测内鬼、传感器与行为习惯监控、跨设备扫描信标、静默短信注册、屏幕内容识别传感器、推销画像引擎以及流氓快应用跳转**。

**✨ V3.0 终极安全版核心亮点：**
1. **免装 ADB 极速部署**：脚本内置 `curl.exe` 原生极速拉取引擎，电脑没装 ADB 会自动从 Google 官方下载精简组件，真正实现“双击即用”。
2. **三重物理枷锁（先卸载再冰封）**：同时执行 `appops`（剥夺通知与后台运行权）+ `pm uninstall --user 0`（当前用户空间移除）+ `pm disable-user --user 0`（底层强制冰封停用），彻底攻克系统界面锁死灰色的顽固组件（如综合传感信息处理平台 `msdp`）。
3. **驯服应用市场**：100% 保留华为/荣耀应用市场日常下软件功能，但单独剥夺其后台自启与广告推送权限。
4. **随时无损还原**：内附 `2_一键无损恢复_后悔药.bat`，3 秒恢复默认状态。

---

## 🚀 方法 A：电脑端双击傻瓜式教程（新手 2 分钟搞定）

1. **开启手机【USB 调试】**：
   - 打开手机 **设置** -> **关于手机** -> 连续点击 **版本号** 7 次（提示“您已处于开发者模式”）。
   - 返回 **设置** -> **系统和更新** -> **开发人员选项** -> 开启 **【USB 调试】** 与 **【“仅充电”模式下允许 ADB 调试】**。
2. **连接电脑并双击运行**：
   - 将手机用数据线连上电脑，解压本压缩包，双击运行 **`RedAsh_Clean_V3.bat`**（或 `1_一键深度隐私净化.bat`）。
   - 手机屏幕弹出授权框时，勾选 **“始终允许”** 并点击 **确定**，等待 10 秒跑完代码后拔掉数据线并关闭【USB 调试】即可！

---

## 💻 方法 B：Windows PowerShell 免脚本原生一键流（零语法报错版）

如果你不想建 `.bat` 文件，只需将手机连上电脑，按下键盘 `Win + X` 打开 **终端 (PowerShell)**，直接整段复制粘贴下面这行原生指令回车即可（自动拉取 ADB 并绕过 PowerShell 大括号变量冲突）：

```powershell
$adb = "$env:TEMP\adb\platform-tools\adb.exe"; if (!(Test-Path $adb)) { curl.exe -sLo "$env:TEMP\adb.zip" [https://dl.google.com/android/repository/platform-tools-latest-windows.zip](https://dl.google.com/android/repository/platform-tools-latest-windows.zip); Expand-Archive -Path "$env:TEMP\adb.zip" -DestinationPath "$env:TEMP\adb" -Force }; & $adb shell pm list packages | Select-String -Pattern "msdp|dmsdp|behaviorauth|iaware|synergy|collaborat|nearby|arengine|FloatTasks|hwdetectrepair|hwdiagnosis|hiview|android\.chr|UEInfoCheck|AutoRegSms|recsys|suggestion|intelligent|hicard|hiboard|pengine|contentsensor|magazine|ohos\.search|searchservice|qqlivehuawei|huawei\.bd|hihonor\.bd|imonitor|powergenie|totemweather|fastapp|famanager|gamebox|skytone|vassistant|hitouch" | ForEach-Object { $pkg = $_.Line.Replace("package:","").Trim(); Write-Host "Purging $pkg" -ForegroundColor Cyan; & $adb shell cmd appops set$pkg POST_NOTIFICATION ignore 2>$null; &$adb shell cmd appops set $pkg RUN_IN_BACKGROUND ignore 2>$null; & $adb shell pm uninstall --user 0$pkg; & $adb shell pm disable-user --user 0$pkg }; & $adb shell settings put global send_action_app_error 0; &$adb shell settings put secure user_experience_involved 0

```

---

## 📱 方法 C：纯手机端 Shizuku / 网页版 WebADB 一行流代码

如果你在电脑浏览器打开 **`ya-webadb.com`**（点 Interactive Shell），或者在手机上用 **`Shizuku + aShell`**，直接复制粘贴下面这段 V3.0 浓缩代码回车即可：

**🔥 V3.0 一键深度净化一行流代码：**

```sh
for p in com.huawei.msdp com.hihonor.msdp com.huawei.dmsdp com.hihonor.dmsdp com.huawei.behaviorauth com.hihonor.behaviorauth com.huawei.iaware com.hihonor.iaware com.huawei.synergy com.hihonor.synergy com.huawei.ohos.collaborationcenter com.hihonor.ohos.collaborationcenter com.huawei.nearby com.hihonor.nearby com.huawei.arengine.service com.hihonor.arengine.service com.huawei.android.FloatTasks com.hihonor.android.FloatTasks com.huawei.hwdetectrepair com.hihonor.hwdetectrepair com.huawei.hwdiagnosis com.hihonor.hwdiagnosis com.huawei.hiview com.huawei.hiviewtunnel com.hihonor.hiview com.hihonor.hiviewtunnel com.huawei.android.chr com.hihonor.android.chr com.huawei.android.UEInfoCheck com.hihonor.android.UEInfoCheck com.huawei.android.AutoRegSms com.hihonor.android.AutoRegSms com.huawei.recsys com.huawei.suggestion com.hihonor.recsys com.hihonor.suggestion com.huawei.intelligent com.huawei.hicard com.hihonor.intelligent com.hihonor.hiboard com.hihonor.hicard com.huawei.pengine com.huawei.contentsensor com.hihonor.pengine com.hihonor.contentsensor com.huawei.magazine com.hihonor.magazine com.huawei.search com.hihonor.search com.huawei.ohos.search com.huawei.searchservice com.tencent.qqlivehuawei com.huawei.bd com.hihonor.bd com.huawei.imonitor com.hihonor.imonitor com.huawei.powergenie com.huawei.android.totemweather com.hihonor.android.totemweather com.huawei.fastapp com.hihonor.fastapp com.huawei.ohos.famanager com.huawei.browser com.hihonor.browser com.huawei.gamebox com.hihonor.gamebox com.huawei.skytone com.huawei.vassistant com.huawei.hitouch; do cmd appops set $p POST_NOTIFICATION ignore; cmd appops set $p RUN_IN_BACKGROUND ignore; cmd appops set$p RUN_ANY_IN_BACKGROUND ignore; pm uninstall --user 0 $p; pm disable-user --user 0$p; done; for s in com.huawei.appmarket com.hihonor.appmarket com.huawei.hms.ads com.hihonor.hms.ads; do cmd appops set $s POST_NOTIFICATION ignore; cmd appops set$s RUN_IN_BACKGROUND ignore; done; settings put global send_action_app_error 0; settings put secure user_experience_involved 0

```

---

## 🔍 V3.0 深度拔除内鬼进程全清单

| 包名 (Package Name) | 真实身份与后台行为 |
| --- | --- |
| `com.huawei.msdp` / `dmsdp` | **【综合传感信息处理平台】与分布式跨设备服务**（UI 界面锁死灰色的顽固后台，汇总陀螺仪/步数/姿态等全部传感器数据） |
| `com.huawei.behaviorauth` | **【BehaviorAuth】行为特征认证**（后台静默记录用户握持姿势、滑动轨迹与使用习惯特征） |
| `com.huawei.iaware` | **系统后台行为预测与用户习惯学习分析引擎** |
| `com.huawei.synergy` / `ohos.collaborationcenter` | **【智慧协同】与跨设备协同中心**（常驻后台扫描监听周边设备连接请求） |
| `com.huawei.nearby` | **附近设备发现服务**（后台持续通过蓝牙与 Wi-Fi 广播并扫描周围设备信标） |
| `com.huawei.arengine.service` | **【AREngineServer】华为 AR 视觉引擎后台服务**（非 AR 游戏用户完全无用却常驻后台） |
| `com.huawei.android.FloatTasks` | **系统悬浮导航球组件**（冗余桌面悬浮插件） |
| `com.huawei.hwdetectrepair` | **【智能检测】本尊**（硬件自检与后台状态上报组件） |
| `com.huawei.hwdiagnosis` | **系统故障诊断日志收集器**（后台高频抓取诊断数据） |
| `com.huawei.hiview` / `hiviewtunnel` | **华为底层核心遥测日志收集与加密上传通道**（内鬼头子） |
| `com.huawei.android.chr` | **通信与网络历史记录后台上报服务**（Commercial Health Reporting） |
| `com.huawei.android.UEInfoCheck` | **用户体验信息收集检查器**（User Experience Info Check） |
| `com.huawei.android.AutoRegSms` | **电信运营商后台静默发短信注册服务**（极易在不知情下泄露手机号） |
| `com.huawei.recsys` / `suggestion` | **个性化广告与系统级情景推荐引擎**（用户推销画像核心） |
| `com.huawei.intelligent` / `hicard` | **负一屏智慧助手与资讯卡片流**（常驻后台吃内存与推送广告） |
| `com.huawei.pengine` / `contentsensor` | **智慧感知引擎与屏幕内容识别传感器**（实时扫描你在看什么内容） |
| `com.huawei.magazine` | **杂志锁屏与锁屏广告画报**（后台偷跑流量下载壁纸与广告） |
| `com.huawei.ohos.search` / `searchservice` | **鸿蒙下拉全局搜索与热搜词广告服务**（桌面下拉热搜流氓推广） |
| `com.tencent.qqlivehuawei` | **华为视频内置腾讯视频定制插件**（纯臃肿广告插件） |
| `com.huawei.bd` / `imonitor` | **用户体验大数据计划与系统异常监控上报** |
| `com.huawei.fastapp` / `ohos.famanager` | **快应用中心与卡片管理器**（防网页劫持自动秒开流氓快应用） |
| `com.huawei.powergenie` | **省电精灵**（解除后台误杀与温控锁帧，满血释放性能） |

</ElicitationsGroup>

```
