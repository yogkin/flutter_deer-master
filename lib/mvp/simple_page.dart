import 'package:flutter/material.dart';
import 'base_page.dart';
import 'base_page_presenter.dart';
import 'mvps.dart';

class SimplePage<T extends StatefulWidget> extends State<T>
    with BasePageMixin<T, BasePagePresenter>, AutomaticKeepAliveClientMixin<T>
    implements IMvpView {
  @override
  bool get wantKeepAlive => true;

  @override
  BasePagePresenter<IMvpView> createPresenter() => BasePagePresenter();
}
