import 'package:all_universe_flutter/pages/home/widgets/search_field.dart';
import 'package:all_universe_flutter/pages/home/widgets/top_title.dart';
import 'package:flutter/material.dart';
import 'package:all_universe_flutter/pages/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.fromLTRB(34, 0, 34, 0);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPadding(
              padding: padding,
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  ((context, index) => _buildTop()),
                  childCount: 1,
                ),
              ),
            ),
            SliverPadding(
              padding: padding,
              sliver: _text('编辑精选', Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
}

//画图展位用
Widget _text(String text, Color color) {
  return SliverToBoxAdapter(
    child: Container(
      height: 100,
      color: color,
      child: Center(
        child: Text('$text'),
      ),
    ),
  );
}

//单个大标题
Widget _title(String title, String title2) {
  return SliverToBoxAdapter(
    child: Row(
      children: [
        Text('$title'),
        Text('$title'),
      ],
    ),
  );
}

//顶部布局
Widget _buildTop() {
  return Column(
    children: [
      TopTitle(),
      SizedBox(height: 20),
      SearchField(),
      SizedBox(height: 20),
      _title('编辑', '精选'),
    ],
  );
}
