import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:all_universe_flutter/components/components.dart';
import 'package:all_universe_flutter/components/custom_loading.dart';
import 'package:all_universe_flutter/pages/home/widgets/edit_selection.dart';
import 'package:all_universe_flutter/pages/home/widgets/fraternity.dart';
import 'package:all_universe_flutter/pages/home/widgets/hot.dart';
import 'package:all_universe_flutter/pages/home/widgets/recommend.dart';
import 'package:all_universe_flutter/pages/home/widgets/search_bar.dart';
import 'package:all_universe_flutter/components/custom_title.dart';
import 'package:all_universe_flutter/pages/home/widgets/ta_like.dart';
import 'package:all_universe_flutter/pages/home/widgets/treasure_hunt.dart';
import 'package:all_universe_flutter/utils/screen_device.dart';
import 'package:flutter/material.dart';
import 'package:all_universe_flutter/pages/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(HomeController());
  final state = Get.find<HomeController>().state;
  final padding = EdgeInsets.fromLTRB(20.w, 0, 20.w, 0);

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => state.loading
          ? CustomLoading()
          : Scaffold(
              backgroundColor: Colors.white,
              body: RefreshIndicator(
                onRefresh: () => controller.onRefresh(),
                child: CustomScrollView(
                  controller: state.scrollController,
                  slivers: <Widget>[
                    /// appbar
                    SliverAppBar(
                      centerTitle: true,
                      title: MyTitle(
                        '发现',
                        color: state.isShowAppbarText
                            ? Colors.black
                            : Colors.white,
                      ),
                      expandedHeight: getDeviceTopHeight() + 30.h,
                      pinned: true,
                      backgroundColor: Colors.white,
                      elevation: 0,
                    ),

                    /// 标题
                    SliverPadding(
                      padding: padding,
                      sliver: SliverToBoxAdapter(
                        child: TopTitle(
                          '发现',
                          Image.asset(
                            'lib/assets/images/tabbar/toolbar1_active.webp',
                            width: 30.w,
                          ),
                        ),
                      ),
                    ),

                    /// 搜索框
                    SliverPadding(
                      padding: padding,
                      sliver: SliverToBoxAdapter(
                        child: SearchBar(),
                      ),
                    ),

                    /// 编辑精选
                    SliverPadding(
                      padding: padding,
                      sliver: SliverToBoxAdapter(
                        child: EditSelection(
                          editSelectionList: state.editSelectionList,
                        ),
                      ),
                    ),

                    /// 最热榜单 锋芒榜 新星榜
                    SliverToBoxAdapter(
                      child: Hot(list: state.hotList),
                    ),

                    ///  推荐
                    SliverPadding(
                      padding: padding,
                      sliver: SliverToBoxAdapter(
                        child: Recommend(list: state.recommendList1),
                      ),
                    ),

                    /// 互助会推荐
                    SliverToBoxAdapter(
                      child: Fraternity(list: state.recommendList2),
                    ),

                    ///  播客寻宝
                    SliverToBoxAdapter(
                      child: TreasureHunt(list: state.treasureHuntList),
                    ),

                    /// ta喜欢
                    SliverToBoxAdapter(
                      child: TaLike(list: state.taLikeList),
                    ),

                    /// 结束 slog
                    SliverToBoxAdapter(
                      child: Container(
                        height: 290.r,
                        alignment: Alignment.center,
                        child: Text(
                          '- 宇宙无垠，继续探索 -',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.primaryGreyText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
