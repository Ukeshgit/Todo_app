import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/app/authentication/widgets/square_tile.dart';
import 'package:todo_app/app/widgets/custom_button.dart';
import 'package:todo_app/app/widgets/custom_text_filed.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[300],
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //logo
              Center(
                child: Icon(
                  Icons.lock,
                  color: Colors.black,
                  size: 70.sp,
                ),
              ),

              SizedBox(
                height: 16.h,
              ),

              Center(
                child: Text(
                  "Welcome Back You've been missed!",
                  style: TextStyle(color: Colors.grey[600], fontSize: 16.sp),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              //Username and password field
              CustomTextFiled(
                hintText: "Username",
                controller: emailcontroller,
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomTextFiled(
                suffixIcon: true,
                hintText: "Password",
                controller: passwordcontroller,
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.grey[600], fontSize: 16.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomButton(
                  height: 60.h,
                  width: double.infinity,
                  text: "Log in",
                  buttonColor: Colors.black,
                  textColor: Colors.white),
              SizedBox(
                height: 80.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "Or continue with",
                    style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Bounce(
                    child: SquareTile(
                      imagelink: "assets/icons/google_logo.svg",
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Bounce(
                    child: SquareTile(
                      imagelink: "assets/icons/apple_logo.svg",
                    ),
                  ),
                ],
              ),

              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member? ",
                    style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                  ),
                  Text(
                    "Register Now",
                    style: TextStyle(color: Colors.blue, fontSize: 16.sp),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}