import 'package:application_clean/core/utils/app_colors.dart';
import 'package:application_clean/core/widgets/custom_bottom.dart';
import 'package:application_clean/feature/auth/login/ui/login_views.dart';
import 'package:application_clean/feature/auth/register/ui/register_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen2 extends StatelessWidget {
  const WelcomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("images/welcome.png", fit: BoxFit.cover),
          ),
          Column(
            children: [
              SizedBox(height: 160),
              Image.asset("images/logo 2.png"),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Order Your Book Now!",
                  style: TextStyle(fontSize: 30.h),
                ),
              ),
              SizedBox(height: 420.h),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginViews()),
                  );
                },
                child: CustomBottom(
                  text: "Login",
                  bottomcolor: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterView()),
                  );
                },
                child: CustomBottom(
                  text: "Register",
                  bottomcolor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
