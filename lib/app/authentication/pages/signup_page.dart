import 'package:bounce/bounce.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/authentication/controller/loading_indicator.dart';
import 'package:todo_app/app/authentication/pages/auth_services.dart';
import 'package:todo_app/app/authentication/widgets/square_tile.dart';
import 'package:todo_app/app/widgets/custom_button.dart';
import 'package:todo_app/app/widgets/custom_text_filed.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController confirmpasswordcontroller = TextEditingController();
    final LoadingIndicator loadingIndicator = Get.put(LoadingIndicator());

    void signup() async {
      try {
        loadingIndicator.isLoading.value = true;
        if (passwordcontroller.text.toString() ==
            confirmpasswordcontroller.text.toString()) {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailcontroller.text.toString(),
              password: passwordcontroller.text.toString());
          Get.toNamed('/login');
        } else {
          Get.snackbar("Error", "Password doesn't match ");
        }
      } on FirebaseAuthException catch (e) {
        Get.snackbar('Error', e.message ?? 'Login failed',
            snackPosition: SnackPosition.BOTTOM);
      } finally {
        loadingIndicator.isLoading.value = false; // Hide loading indicator
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey[300],
          body: SingleChildScrollView(
            child: Padding(
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
                      "Let's create an account for you",
                      style:
                          TextStyle(color: Colors.grey[600], fontSize: 16.sp),
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
                  CustomTextFiled(
                    suffixIcon: true,
                    hintText: "Confirm password",
                    controller: confirmpasswordcontroller,
                  ),

                  SizedBox(
                    height: 16.h,
                  ),

                  Obx(
                    () => CustomButton(
                        isLoading: loadingIndicator.isLoading.value,
                        ontap: signup,
                        height: 60.h,
                        width: double.infinity,
                        text: "Sign Up",
                        buttonColor: Colors.black,
                        textColor: Colors.white),
                  ),

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
                        onTap: () {
                          signInWithGoogle();
                        },
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

                  SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                      ),
                      InkWell(
                        onTap: () => Get.toNamed('/login'),
                        child: Text(
                          "Login Now",
                          style: TextStyle(color: Colors.blue, fontSize: 16.sp),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
