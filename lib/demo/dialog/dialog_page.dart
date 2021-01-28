import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deer/res/resources.dart';
import 'package:flutter_deer/widgets/list_card_view.dart';

class DialogPage extends StatelessWidget {
  final items = [ItemTap('底部弹窗', '')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('弹窗'),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          itemBuilder: (context, index) => ListCardView(
                items[index],
                callBack: () {
                  showCupertinoModalPopup<ItemTap>(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoActionSheet(
                          title: const Text('提示'),
                          message: const Text('是否要删除当前项？'),
                          actions: <Widget>[
                            CupertinoActionSheetAction(
                              child: const Text('删除'),
                              onPressed: () {},
                              isDefaultAction: true,
                            ),
                            CupertinoActionSheetAction(
                              child: const Text('暂时不删'),
                              onPressed: () {},
                              isDestructiveAction: true,
                            ),
                          ],
                        );
                      });
                },
              ),
          separatorBuilder: (context, index) => Gaps.vGap10,
          itemCount: items.length),
    );
  }
}
