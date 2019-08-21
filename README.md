

# iea

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## 使用说明：

1.运行项目之前先执行：flutter packages get

2.flutter run



## 架构： bloc 模式
- [flutter 官方blog](https://medium.com/flutter-io)
- [环境变量设置,通过启动不同main.dart 文件](https://github.com/ROTGP/flutter_environments/)
- [国内常用第三方服务](https://github.com/OpenFlutter)
- [Http library](https://github.com/flutterchina)
- [flutter 资料汇总](https://github.com/Solido/awesome-flutter)
- [dart utility library](https://github.com/google/quiver-dart)





## project rules
- [代码规范](https://www.dartlang.org/guides/language/effective-dart/style)
- 库引用规则
- 1. 首先引用官方库 https://github.com/flutter/plugins
- 2. 引用库之前在群里边通知大家
- 3. 官方包管理网站： https://pub.dartlang.org/flutter

- 公用功能：工具类都单独出来
- [代码检测](https://pub.dartlang.org/packages/linter)



## 图片字体等资源文件的引入
- 图片资源放置sunlands_app/assets/images/目录下，并在pubspec.yaml引入资源依赖
- 执行flutter packages get



## 一些常用控件的使用都放在demo目录下面

- demo目录文件命名规则：必须以控件的名字开头，然后加上"_page.dart".比如Text控件的命名方式，就是text_page.dart.这样做的原因，防止大家重复添加。

- 页面写在screens目录下，运行时想要run自己的界面时，main.dart里引入路径，替换 home: XXXPage( )

- 如果需要查找控件的使用，可以根据名字查找。比如Text控件的使用方法，就是看看text_page.dart命名的文件。如果没有，那就是没有添加。就要自己去查找了。

- 如果要给一个已经存在的控件，添加说明。不需要创建一个新的文件，在已经存在的文件上修改即可。

- master分支提交代码时只需提交 .dart代码层及 .yaml文件部分,自动化配置部分不需添加



##  bloc 状态管理 模型架构
- 参阅代码中 bloclearn_xx.dart 开头相关文件

## 项目结构

-- pubspec.yaml <!-- 该文件集中管理了本项目中所依赖的第三方库，以及图片，文字资源等-->
-- assets <!--本地资源集中管理-->
  -- images <!--本地图片资源集中管理-->
    -- homepage <!--首页使用的本地图片资源-->
-- lib <!-- 这里是 Flutter 的代码，使用 Dart 语言编写。-->
  -- main.dar <!-- flutter项目的主程序入口-->
  -- screens <!--flutter项目的view层代码，以页面为层级区分-->
    -- bottom_navigation_widget.dart <!--整个flutter页面的外壳，比如包括底部tabbar,顶部navigationbar的自定义代码-->
    -- homepage <!--首页内部UI组件-->
      -- home_screen.dart <!--首页上部切换tab组件-->
      -- home_page.dart <!--首页中下部banner和列表组件-->
    -- minepage <!--我的页面内部UI组件-->
  -- blocs <!--数据响应式流处理，状态管理, 以页面为层级区分-->
    -- homepage_blocs <!--首页的数据管理-->
      -- openclasstype_bloc.dart <!--首页课程类型数据管理-->
      -- openclass_bloc.dart <!--首页课程列表数据管理-->
  -- provider <!--数据请求相关-->
    -- base <!--请求方法封装、api相关常量和变量的集中管理-->
      -- base_api_provider.dart <!--基于flutter自带的Dio进行post和get请求的封装，也包括请求拦截等-->
      -- base_resp.dart <!--对接口返回数据进行转化，相当于model-->
      -- api_config.dat <!--api相关常量的管理-->
      -- api_config.dart <!--各个页面的api接口地址的同意管理-->
    -- resource <!--各个页面的请求行为-->
      -- homepage_api_provider.dart <!--首页各个接口的请求行为，Future封装相当于前端的Promise-->
  -- models <!--接口请求数据的转换，以页面为层级-->
    -- homepage_models <!--首页接口请求数据的转换-->
      -- openclasstype_model.dart <!--首页课程类型接口数据转换类-->
      -- openclass_model.dart <!--首页课程列表接口数据转换类-->
  -- utils <!--各种公用工具类的集中管理-->
    -- screen_util.dart <!--屏幕信息相关工具类-->
    -- sign_util.dart <!--接口提交数据签名相关的工具类-->
    -- date_util.dart <!--时间相关工具类-->
  -- widgets <!--各种公共组件的集中管理-->
    -- loading.dart <!--加载中标识组件-->
    -- error.dart <!--接口报错提示组件-->

