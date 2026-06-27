import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({
    super.key,
    required this.text,
    required this.bottomcolor,
  });
  final String text;
  final Color bottomcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.w,
      height: 60.h,
      decoration: BoxDecoration(
        color: bottomcolor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
