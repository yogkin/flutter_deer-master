import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_deer/common/common.dart';
import 'package:flutter_deer/demo/demo_router.dart';
import 'package:flutter_deer/net/dio_utils.dart';
import 'package:flutter_deer/net/intercept.dart';
import 'package:flutter_deer/routers/routers.dart';
import 'package:flutter_deer/widgets/list_card_view.dart';

void main() => runApp(FmApp());

class FmApp extends StatelessWidget {
  FmApp() {
    Routes.initRoutes();
    initDio();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FmFlutterDmeo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FmHomePage(title: 'Flutter Demo Home Page'),
    );
  }

  void initDio() {
    final List<Interceptor> interceptors = <Interceptor>[];

    /// 统一添加身份验证请求头
    interceptors.add(AuthInterceptor());

    /// 刷新Token
    interceptors.add(TokenInterceptor());

    /// 打印Log(生产模式去除)
    if (!Constant.inProduction) {
      interceptors.add(LoggingInterceptor());
    }

    /// 适配数据(根据自己的数据结构，可自行选择添加)
    interceptors.add(AdapterInterceptor());
    configDio(
      baseUrl: 'http://www.wanandroid.com/',
      interceptors: interceptors,
    );
  }
}

class FmHomePage extends StatelessWidget {
  FmHomePage({Key key, this.title}) : super(key: key);

  final String title;

  final items = [
    ItemTap('dialog弹窗', DemoRouter.dialogPage),
    ItemTap('net网络相关', DemoRouter.netPage),
    ItemTap('Button按钮相关', ''),
    ItemTap('utils常用工具', ''),
    ItemTap('refresh刷新', ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('富米 FlutterDemo'),
      ),
      body: Center(
        child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(
                  height: 8.0,
                  color: Colors.white,
                ),
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            itemCount: items.length,
            itemBuilder: (context, index) => ListCardView(items[index])),
      ),
    );
  }
}
