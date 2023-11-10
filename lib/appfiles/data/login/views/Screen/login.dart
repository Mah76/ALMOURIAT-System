// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/Const.dart';
import 'package:final_project/appfiles/data/login/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../../customWidget/customAppBar.dart';
import '../../../../../customWidget/customButton.dart';
import '../../../../../customWidget/customGesureDetector.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  List pageBody = [
    'Login',
    'put the phone number that you registered by',
    'and we will send you a verification code.',
    'Send',
  ];

  @override
  Widget build(BuildContext context) {
    LoginController X = Get.put(LoginController());

    return CustomGestureDetector(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: backgroundColor,
        appBar: CustomAppBar(
          title: '',
          isLeading: false,
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(15.sp),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Image(
                      image: CachedNetworkImageProvider(
                          'https://firebasestorage.googleapis.com/v0/b/hcrsbh-b87b6.appspot.com/o/Home%2FL-one.png?alt=media&token=a2527b0f-7b91-42c8-8003-04ad9642e67b'),
                    ),
                  ),
                  Gap(20.sp),
                  textBody(),
                  Gap(30.sp),
                  _PhoneField(),
                  Gap(20.sp),
                  ButtonVerification(
                      textValue: pageBody[3],
                      buttonPressed:
                          X.isLoading.value ? null : () => X.login()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textBody() {
    return Column(
      children: [
        Text(pageBody[0], style: mystyle30),
        Gap(4),
        Text(
          pageBody[1],
          style: mystyle15,
        ),
        Text(
          pageBody[2],
          style: mystyle15,
        ),
      ],
    );
  }
}

class _PhoneField extends GetView<LoginController> {
  const _PhoneField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController X = Get.put(LoginController());
    return Container(
      padding: EdgeInsets.all(28.sp),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 250, 249, 246),
        borderRadius: BorderRadius.circular(25.sp),
      ),
      child: Form(
        key: X.formKey,
        child: TextFormField(
          onChanged: (value) {
            X.formKey.currentState!.validate();
          },
          controller: X.phoneNumber,
          keyboardType: TextInputType.number,
          maxLength: 8,
          cursorColor: textColor,
          validator: (value) {
            if (value == null || value.trim() == "") return "";

            return null;
          },
          style: mystyle20,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: textColor),
                borderRadius: BorderRadius.circular(10.sp)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: textColor),
                borderRadius: BorderRadius.circular(10.sp)),
            prefix: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                '${generateCountryFlag()}(+973)',
                style: mystyle20,
              ),
            ),
            suffixIcon: Icon(
              // X.isLoading.value
              Icons.check_circle,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }

  String generateCountryFlag() {
    String countryCode = 'bh';

    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

    return flag;
  }
}
