
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deer/routers/i_router.dart';
import 'package:flutter_deer/routers/not_found_page.dart';
import 'package:flutter_deer/widgets/webview_page.dart';
import 'package:flutter_deer/home/home_page.dart';
import 'package:flutter_deer/home/home_router.dart';
import 'package:flutter_deer/demo/demo_router.dart';


// ignore: avoid_classes_with_only_static_members
class Routes {

  static String home = '/home';
  static String webViewPage = '/webView';

  static final List<IRouterProvider> _listRouter = [];

  static final FluroRouter router = FluroRouter();

  static void initRoutes() {
    /// 指定路由跳转错误返回页
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        debugPrint('未找到目标页');
        return NotFoundPage();
      });

    router.define(home, handler: Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) => Home()));
    
    router.define(webViewPage, handler: Handler(handlerFunc: (_, params) {
      final String title = params['title']?.first;
      final String url = params['url']?.first;
      return WebViewPage(title: title, url: url);
    }));
    
    _listRouter.clear();
    /// 各自路由由各自模块管理，统一在此添加初始化
    _listRouter.add(HomeRouter());
    _listRouter.add(DemoRouter());

    /// 初始化路由
    _listRouter.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });
  }
}
