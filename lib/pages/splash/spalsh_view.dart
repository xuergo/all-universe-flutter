import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:all_universe_flutter/pages/webview/browser.dart';
import 'package:all_universe_flutter/router/app_pages.dart';
import 'package:all_universe_flutter/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  final TextStyle _textStyle = TextStyle(
    color: AppColors.primaryText,
    fontSize: 14.sp,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            /// 图片弹出
            Expanded(child: Container()),

            ///logo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/images/common/logo2.webp',
                  width: 80.w,
                  height: 80.w,
                ),
                Text(
                  '大宇宙',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    fontSize: 40.sp,
                  ),
                )
              ],
            ),
            SizedBox(height: 10.h),

            /// 登陆按钮
            InkWell(
              onTap: () => Get.toNamed(AppRoutes.Login),
              child: Container(
                width: 300.w,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.r),
                  color: hexToColor('#87b48b'),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.wechat_rounded,
                      size: 35.w,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      '微信登陆',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),

            /// 协议
            Container(
              width: 200.w,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: _textStyle,
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(
                        Icons.check_box,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    TextSpan(text: ' 我已阅读井同意'),
                    TextSpan(
                      text: '《用户协议》',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          //若是链接跳转到webview
                          Get.to(
                            () => Browser(
                                key: ValueKey("BiliBrowser:"),
                                url: 'https://www.baidu.com/duty/',
                                title: '用户协议'),
                          );
                        },
                    ),
                    TextSpan(text: '和'),
                    TextSpan(
                      text: '《隐私政策》',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(
                            () => Browser(
                                key: ValueKey("BiliBrowser:"),
                                url: 'https://www.baidu.com/duty/',
                                title: '隐私政策'),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),

            /// 其他方式
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildOther(
                  icon: Icons.phone_android_sharp,
                  tap: () => Get.toNamed(AppRoutes.Login),
                ),
                SizedBox(width: 20.w),
                _buildOther(icon: Icons.apple, tap: () => {}),
              ],
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  /// 其他登陆方式
  Widget _buildOther({required IconData icon, required Function tap}) {
    return GestureDetector(
      onTap: () => tap(),
      child: Container(
        width: 50.w,
        height: 50.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryGreyText,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Icon(
          icon,
          size: 25.w,
          color: AppColors.primaryText,
        ),
      ),
    );
  }
}
