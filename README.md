# 🛡️ 【红烬副控 V3.0】华为 / 荣耀 深度隐私净网与续航狂飙工具包 (基本全收录版)

本工具包专为 **华为 (Huawei / HarmonyOS)** 与 **荣耀 (Honor / MagicOS)** 手机用户打造。通过官方 Android ADB 接口（**免 Root、不破保修、绝不变砖**），一键物理掐断后台常驻的 **16+ 核心遥测内鬼、静默短信注册、屏幕内容扫描传感器、推销画像引擎以及流氓快应用跳转**。

> **✨ V3.0 终极安全版核心亮点：**
> 1. **免装 ADB 自动部署**：脚本内置智能检测，电脑没装 ADB 会自动从 Google 官方拉取精简组件，真正实现“双击即用”。
> 2. **三重物理枷锁**：同时执行 `appops`（剥夺通知与后台运行权）+ `pm disable-user`（冻结）+ `pm uninstall`（当前用户卸载），防死灰复燃。
> 3. **驯服应用市场**：100% 保留华为/荣耀应用市场日常下软件功能，但单独剥夺其后台自启与广告推送权限。
> 4. **随时无损还原**：内附 `2_一键无损恢复_后悔药.bat`，3 秒恢复默认状态。

---

## 🚀 方法 A：电脑端双击傻瓜式教程（新手 2 分钟搞定）

1. **开启手机【USB 调试】**：
   - 打开手机 **设置** -> **关于手机** -> 连续点击 **版本号** 7 次（提示“您已处于开发者模式”）。
   - 返回 **设置** -> **系统和更新** -> **开发人员选项** -> 开启 **【USB 调试】** 与 **【仅充电模式下允许 ADB 调试】**。
2. **连接电脑并双击运行**：
   - 将手机用数据线连上电脑，解压本压缩包，双击运行 **`1_红烬副控V3_一键深度隐私净化.bat`**。
   - 手机屏幕弹出授权框时，勾选 **“始终允许”** 并点击 **确定**，等待 10 秒跑完代码后重启手机即可！

---

## 📱 方法 B：懒人免装软件！（纯手机端 Shizuku / 网页版 WebADB 一行流代码）

如果你懒得下载脚本，可以在电脑浏览器打开 **`ya-webadb.com`**（点 Interactive Shell），或者在手机上用 **`Shizuku + aShell`**，直接复制粘贴下面这段浓缩代码回车即可：

**🔥 一键深度净化一行流代码：**
```sh
for p in com.huawei.hwdetectrepair com.hihonor.hwdetectrepair com.huawei.hwdiagnosis com.hihonor.hwdiagnosis com.huawei.hiview com.huawei.hiviewtunnel com.hihonor.hiview com.hihonor.hiviewtunnel com.huawei.android.chr com.hihonor.android.chr com.huawei.android.UEInfoCheck com.hihonor.android.UEInfoCheck com.huawei.android.AutoRegSms com.hihonor.android.AutoRegSms com.huawei.recsys com.huawei.suggestion com.hihonor.recsys com.hihonor.suggestion com.huawei.intelligent com.huawei.hicard com.hihonor.intelligent com.hihonor.hiboard com.hihonor.hicard com.huawei.pengine com.huawei.contentsensor com.hihonor.pengine com.hihonor.contentsensor com.huawei.magazine com.hihonor.magazine com.huawei.search com.hihonor.search com.huawei.ohos.search com.huawei.searchservice com.tencent.qqlivehuawei com.huawei.bd com.hihonor.bd com.huawei.imonitor com.hihonor.imonitor com.huawei.powergenie com.huawei.android.totemweather com.hihonor.android.totemweather com.huawei.fastapp com.hihonor.fastapp com.huawei.ohos.famanager com.huawei.browser com.hihonor.browser com.huawei.gamebox com.hihonor.gamebox com.huawei.skytone com.huawei.vassistant com.huawei.hitouch; do cmd appops set $p POST_NOTIFICATION ignore; cmd appops set $p RUN_IN_BACKGROUND ignore; cmd appops set $p RUN_ANY_IN_BACKGROUND ignore; pm disable-user --user 0 $p; pm uninstall -k --user 0 $p; done; for s in com.huawei.appmarket com.hihonor.appmarket com.huawei.hms.ads com.hihonor.hms.ads; do cmd appops set $s POST_NOTIFICATION ignore; cmd appops set $s RUN_IN_BACKGROUND ignore; done; settings put global send_action_app_error 0; settings put secure user_experience_involved 0
```

---

## 🔍 V3.0 深度拔除内鬼进程全清单

| 包名 (Package Name) | 真实身份与后台行为 |
| :--- | :--- |
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
