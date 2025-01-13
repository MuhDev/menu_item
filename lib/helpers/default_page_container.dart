import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:menu_item/config/constants/colors_repo.dart';

class DefaultPageContainer extends StatelessWidget {
  const DefaultPageContainer(
      {super.key, this.appBar, this.bottomNavigationBar, required this.body});
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: ColorRepo.backgroundColor,
      appBar: appBar,
      body: body,
    );
  }
}
