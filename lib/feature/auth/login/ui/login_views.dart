import 'package:application_clean/core/utils/app_colors.dart';
import 'package:application_clean/core/widgets/custom_bottom.dart';
import 'package:application_clean/core/widgets/custom_text_formfield.dart';
import 'package:application_clean/core/widgets/validator.dart';
import 'package:application_clean/feature/auth/forgetpassword/ui/forgetpassword_views.dart';
import 'package:application_clean/feature/auth/register/ui/register_ui.dart';
import 'package:application_clean/feature/home/ui/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginViews extends StatefulWidget {
  const LoginViews({super.key});

  @override
  State<LoginViews> createState() => _LoginViewsState();
}

class _LoginViewsState extends State<LoginViews> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "Welcome back! Glad     to see you, Again!",
                  style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 70.h),
                CustomTextFormField(
                  hintText: "Email",
                  keyboardType: TextInputType.emailAddress,
                  suffix: const Icon(Icons.email),
                  validator: Validators.email,
                ),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  hintText: "Password",
                  obscureText: true,
                  suffix: const Icon(Icons.lock),
                  validator: Validators.password,
                ),
                SizedBox(height: 50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgetpasswordViews(),
                          ),
                        );
                      },
                      child: Text(
                        "Forget your password?",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    SizedBox(height: 80.h),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => HomeView()),
                      );
                    }
                  },
                  child: CustomBottom(
                    text: "Login",
                    bottomcolor: AppColors.primaryColor,
                  ),
                ),
                SizedBox(height: 50.h),
                Text("Or"),
                SizedBox(height: 50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(child: SvgPicture.asset("images/goggle.svg")),
                    SizedBox(width: 9.w),
                    Text("Sign in with Google"),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(child: SvgPicture.asset("images/ios.svg")),
                    SizedBox(width: 9.w),
                    Text("Sign in with Apple"),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t have an account?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterView(),
                          ),
                        );
                      },
                      child: Text(
                        " Register Now",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
