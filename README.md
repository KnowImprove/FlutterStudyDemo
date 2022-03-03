# flutter_study_github

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 功能列表

- [x] 1.注册登录
- [x] 2.首页、公众号、项目模块列表数据展示，支持下拉刷新上拉加载
- [x] 3.我的模块ui布局
- [x] 4.全局状态刷新
- [x] 5.本地存储
- [x] 6.cookie管理
- [x] 7.android打包配置
- [ ] 8.收藏（已完成部分）
- [ ] 9.我的积分
- [ ] 10.我的收藏
- [ ] 11.与原生交互


## 注意点

### 1.打包

android打正式包的时候，要记得在AndroidManifest.xml中添加网络权限：

```
<uses-permission android:name="android.permission.INTERNET"/>

//不一定需要
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />

```
