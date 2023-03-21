import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:all_universe_flutter/components/components.dart';
import 'package:all_universe_flutter/components/custom_loading.dart';
import 'package:all_universe_flutter/components/play_btn.dart';
import 'package:all_universe_flutter/pages/details/details_controller.dart';
import 'package:all_universe_flutter/pages/details/widgets/after_appbar.dart';
import 'package:all_universe_flutter/pages/details/widgets/before_appbar.dart';
import 'package:all_universe_flutter/pages/details/widgets/recommend_item.dart';
import 'package:all_universe_flutter/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key}) : super(key: key);
  final controller = Get.put(DetailsController());
  final state = Get.find<DetailsController>().state;
  final padding = EdgeInsets.fromLTRB(20.w, 0, 20.w, 0);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
      builder: (_) => state.isLoading
          ? CustomLoading()
          : BaseScaffold(
              appBar: state.isShowAppbar
                  ? AfterAppbar(state.details)
                  : BeforeAppbar(state.details),
              body: Container(
                child: Scrollbar(
                  controller: state.scrollController,
                  child: CustomScrollView(
                    controller: state.scrollController,
                    slivers: <Widget>[
                      SliverToBoxAdapter(
                        child: SizedBox(height: 20.h),
                      ),

                      /// 封面
                      SliverPadding(
                        padding: padding,
                        sliver: _buildCoverImg(),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(height: 20.h),
                      ),

                      /// 播放器
                      SliverPadding(
                        padding: padding,
                        sliver: _buildPlayBox(),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(height: 20.h),
                      ),

                      /// 播客名称
                      SliverPadding(
                        padding: padding,
                        sliver: _buildNameBox(),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(height: 20.h),
                      ),

                      /// 操作
                      SliverPadding(
                        padding: padding,
                        sliver: _buidActive(),
                      ),

                      /// 内容
                      SliverToBoxAdapter(
                        child: SizedBox(height: 20.h),
                      ),
                      SliverPadding(
                        padding: padding,
                        sliver: _buildContent(),
                      ),

                      /// 分割线
                      SliverToBoxAdapter(
                        child: SizedBox(height: 20.h),
                      ),
                      SliverToBoxAdapter(
                        child: Divider(
                          color: AppColors.primaryBackground,
                          thickness: 1.h,
                          height: 1.h,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(height: 20.h),
                      ),

                      /// 相关单集
                      _buildRecommend(),
                      SliverToBoxAdapter(
                        child: SizedBox(height: 50.h),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  /// 封面
  Widget _buildCoverImg() {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(state.details!.cover),
                fit: BoxFit.cover,
              ), //设置网络图片
              borderRadius: BorderRadius.all(Radius.circular(3.r)),
            ),
          )
        ],
      ),
    );
  }

  /// 播放器
  Widget _buildPlayBox() {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Expanded(
            child: Text(
              state.details!.title,
              softWrap: true,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 20.w),
          PlayBtn(
            size: 35.w,
            data: state.details,
          ),
        ],
      ),
    );
  }

  /// 播客名称
  Widget _buildNameBox() {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Text(
            state.details!.name,
            style: TextStyle(
              color: hexToColor(state.details!.color),
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 14.w,
            color: hexToColor(state.details!.color),
          )
        ],
      ),
    );
  }

  /// 操作区域
  Widget _buidActive() {
    TextStyle style = TextStyle(
      color: AppColors.primaryGreyText,
      fontSize: 14.sp,
    );
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Text(
            '116分钟',
            style: style,
          ),
          SizedBox(width: 3.w),
          Text(
            '2天前',
            style: style,
          ),
          Spacer(),
          Icon(
            Icons.line_style_outlined,
            color: hexToColor(state.details!.color),
            size: 24.w,
          ),
          SizedBox(width: 10.w),
          Icon(
            Icons.message,
            color: hexToColor(state.details!.color),
            size: 24.w,
          ),
          SizedBox(width: 10.w),
          Icon(
            Icons.heart_broken_rounded,
            color: hexToColor(state.details!.color),
            size: 24.w,
          ),
        ],
      ),
    );
  }

  /// 内容
  Widget _buildContent() {
    return SliverToBoxAdapter(
      child: SelectableText(
        state.details!.content,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  /// 相关单集
  SliverToBoxAdapter _buildRecommend() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            padding: padding,
            alignment: Alignment.centerLeft,
            child: Text(
              '相关单集',
              style: TextStyle(
                color: hexToColor(state.details!.color),
                fontSize: 17.sp,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            height: 60.h,
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.9),
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                final data = state.list[index];
                return RecommendItem(data: data);
              },
            ),
          )
        ],
      ),
    );
  }
}
