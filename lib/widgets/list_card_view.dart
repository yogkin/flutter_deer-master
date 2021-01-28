import 'package:flutter/material.dart';
import 'package:flutter_deer/res/resources.dart';
import 'package:flutter_deer/routers/fluro_navigator.dart';

class ItemTap {
  ItemTap(this.title, this.jumpName);

  String title;
  String jumpName;
}

class ListCardView extends StatelessWidget {
  const ListCardView(this.itemTap, {this.height = 90, this.callBack});

  final ItemTap itemTap;
  final double height;
  final CallBack callBack;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: InkWell(
          onTap: () {
            if (callBack != null) {
              callBack();
            } else {
              NavigatorUtils.push(context, itemTap.jumpName);
            }
          },
          child: SizedBox(
              height: height,
              width: double.infinity,
              child: Center(
                child: Text(itemTap.title),
              )),
        ));
  }
}
