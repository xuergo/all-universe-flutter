import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:all_universe_flutter/pages/login/login_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  final state = Get.find<LoginController>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (_) => GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),

                        /// 关闭
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 10.w),
                          child: Icon(
                            Icons.close,
                            size: 25.w,
                            color: AppColors.primaryGreyText,
                          ),
                        ),

                        /// 输入框
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 30.w, right: 30.w),
                            child: Column(
                              children: [
                                SizedBox(height: 35.h),

                                /// 标题
                                Text(
                                  '手机验证登陆',
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.sp,
                                  ),
                                ),
                                SizedBox(height: 85.h),

                                /// 手机号码
                                _phoneInput(),
                                SizedBox(height: 20.h),

                                /// 验证码
                                _codeInput(),

                                Spacer(),

                                /// 按钮
                                _loginBtn(),

                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }

  /// 手机号
  Widget _phoneInput() {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: Color.fromRGBO(242, 242, 247, .6),
        borderRadius: BorderRadius.all(Radius.circular(3.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '+86',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
              color: AppColors.primaryColor,
            ),
          ),
          VerticalDivider(
            indent: 10.w,
            endIndent: 10.w,
            color: Color.fromRGBO(209, 209, 215, 1),
          ),
          Expanded(
            child: TextField(
              controller: state.phoneController,
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.only(top: 0, bottom: 0),
              ),
            ),
          ),
          GestureDetector(
            onTap: (() => state.phoneController.clear()),
            child: state.phoneController.text != ''
                ? Icon(
                    Icons.cancel_sharp,
                    size: 25.sp,
                    color: AppColors.primaryGreyText,
                  )
                : SizedBox(),
          )
        ],
      ),
    );
  }

  /// 验证码
  Widget _codeInput() {
    return Container(
      height: 50.r,
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: Color.fromRGBO(242, 242, 247, .6),
        borderRadius: BorderRadius.all(Radius.circular(3.w)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: state.codeController,
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                hintText: '请输入验证码',
                hintStyle: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.primaryGreyText,
                ),
              ),
            ),
          ),
          SizedBox(width: 55.w),
          GestureDetector(
            onTap: () => controller.chageCodeStatus(),
            child: Text(
              '${state.verifyStr}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
                color: state.codeEnable
                    ? AppColors.primaryColor
                    : AppColors.primaryGreyText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 登陆按钮
  Widget _loginBtn() {
    return GestureDetector(
      onTap: (() => controller.login()),
      child: Container(
        height: 50.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: state.loginBtnEable
              ? AppColors.primaryColor
              : AppColors.primaryColor.withOpacity(.5),
          borderRadius: BorderRadius.all(Radius.circular(4.r)),
        ),
        child: Text(
          '登录 😁',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
          ),
        ),
      ),
    );
  }
}
