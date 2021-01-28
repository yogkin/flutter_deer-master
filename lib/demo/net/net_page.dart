import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deer/mvp/base_page_presenter.dart';
import 'package:flutter_deer/mvp/mvps.dart';
import 'package:flutter_deer/mvp/simple_page.dart';
import 'package:flutter_deer/net/dio_utils.dart';
import 'package:flutter_deer/res/resources.dart';
import 'package:flutter_deer/widgets/list_card_view.dart';
import 'package:flutter_deer/mvp/base_page.dart';
import 'package:flutter_deer/mvp/base_presenter.dart';
import 'package:flutter_deer/net/http_api.dart';

class NetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NetPage();
  }
}

class _NetPage extends SimplePage<NetPage> {
  final items = [ItemTap('请求一个网络', '')];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('网络请求'),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          itemBuilder: (context, index) => ListCardView(
                items[index],
                callBack: () {
                  presenter.requestNetwork<String>(Method.get,
                      url: HttpApi.users, onSuccess: (data) {
                          showToast(data);
                      });
                },
              ),
          separatorBuilder: (context, index) => Gaps.vGap10,
          itemCount: items.length),
    );
  }
}
