
import 'package:fluro/fluro.dart';
import 'package:flutter_deer/routers/i_router.dart';
import 'package:flutter_deer/demo/dialog/dialog_page.dart';
import 'package:flutter_deer/demo/net/net_page.dart';



class DemoRouter implements IRouterProvider{

  static String dialogPage = '/dialogPage';
  static String netPage = '/netPage';

  @override
  void initRouter(FluroRouter router) {
    router.define(dialogPage, handler: Handler(handlerFunc: (_, __) => DialogPage()));
    router.define(netPage, handler: Handler(handlerFunc: (_, __) => NetPage()));
  }
  
}