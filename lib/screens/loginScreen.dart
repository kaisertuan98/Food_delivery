import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monkey_app_demo/screens/forgetPwScreen.dart';
import 'package:monkey_app_demo/screens/homeScreen.dart';
import 'package:monkey_app_demo/services/authentication.dart';
import 'package:provider/provider.dart';

import '../widgets/customTextInput.dart';
import '../utils/helper.dart';
import '../const/colors.dart';
import '../screens/signUpScreen.dart';
import '../screens/forgetPwScreen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  static const routeName = "/loginScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 30,
            ),
            child: Column(
              children: [
                Text(
                  "Đăng nhập",
                  style: Helper.getTheme(context).headline6,
                ),
                Spacer(),
                Text('Vui lòng điền thông tin chi tiết'),
                Spacer(),
                // CustomTextInput(
                //   // contro:
                //   hintText: "Email hoặc sđt của bạn",
                // ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: ShapeDecoration(
                    color: AppColor.placeholderBg,
                    shape: StadiumBorder(),
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email của bạn",
                      hintStyle: TextStyle(
                        color: AppColor.placeholder,
                      ),
                      contentPadding: EdgeInsets.only(left: 40),
                    ),
                  ),
                ),
                Spacer(),
                // CustomTextInput(
                //   hintText: "Mật khẩu",
                // ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: ShapeDecoration(
                    color: AppColor.placeholderBg,
                    shape: StadiumBorder(),
                  ),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Mật khẩu",
                      hintStyle: TextStyle(
                        color: AppColor.placeholder,
                      ),
                      contentPadding: EdgeInsets.only(left: 40),
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Provider;
                      context.read<AuthenticateService>().signInWithEmail(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim());
                      //Signin method
                      // context.read<AuthenticateService>().signInWithEmail(
                      //   email:
                      // )
                      // Navigator.of(context)
                      //     .pushReplacementNamed(HomeScreen.routeName);
                    },
                    child: Text("Đăng nhập"),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(ForgetPwScreen.routeName);
                  },
                  child: Text("Quên mật khẩu"),
                ),
                Spacer(
                  flex: 2,
                ),
                Text("Đăng nhập khác"),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(
                          0xFF367FC0,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Helper.getAssetName(
                            "fb.png",
                            "virtual",
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text("Đăng nhập với Facebook")
                      ],
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(
                          0xFFDD4B39,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Helper.getAssetName(
                            "google.png",
                            "virtual",
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text("Đăng nhập với Google")
                      ],
                    ),
                  ),
                ),
                Spacer(
                  flex: 4,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(SignUpScreen.routeName);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Bạn chưa có tài khoản?"),
                      Text(
                        "Đăng ký ngay",
                        style: TextStyle(
                          color: AppColor.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
