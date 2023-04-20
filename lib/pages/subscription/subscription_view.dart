import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:all_universe_flutter/components/custom_appbar.dart';
import 'package:all_universe_flutter/components/custom_loading.dart';
import 'package:all_universe_flutter/components/custom_title.dart';
import 'package:all_universe_flutter/pages/subscription/widgets/sub_list.dart';
import 'package:all_universe_flutter/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'subscription_controller.dart';

class SubscriptionPage extends StatelessWidget {
  final controller = Get.put(SubscriptionController());
  final state = Get.find<SubscriptionController>().state;
  final padding = EdgeInsets.fromLTRB(20.w, 0, 20.w, 0);

  SubscriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionController>(
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
                        '更新',
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
                        child: TopTitle('更新', SizedBox()),
                      ),
                    ),

                    SliverToBoxAdapter(
                      child: SizedBox(height: 20.h),
                    ),

                    /// 推荐tag
                    SliverPadding(
                      padding: padding,
                      sliver: SliverToBoxAdapter(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryGreyBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.w,
                                vertical: 6.h,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.airplane_ticket_sharp,
                                    color: AppColors.primaryColor,
                                    size: 18.w,
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    '为您推荐',
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SliverToBoxAdapter(
                      child: SizedBox(height: 20.h),
                    ),

                    /// 列表
                    SliverPadding(
                      padding: padding,
                      sliver: SubList(list: state.list),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(height: 60.h),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
