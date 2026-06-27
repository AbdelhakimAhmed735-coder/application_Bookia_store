import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginViews extends StatelessWidget {
  const LoginViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("data", style: TextStyle(fontSize: 20.sp)),
            Container(color: Colors.amber, width: 200.w, height: 400.h),
          ],
        ),
      ),
    );
  }
}
