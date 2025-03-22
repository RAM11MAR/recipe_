import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Following extends StatelessWidget {
  const Following({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 356.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          width: 1,
          color: Color(0xFFFFC6C9),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ItemsFollowing(title: "recipes", num: 0),
          Container(
            width: 1.w,
            height: 26.h,
            color: Color(0xFFFFC6C9),
          ),
          ItemsFollowing(title: "Following", num:0),
          Container(
            width: 1.w,
            height: 26.h,
            color: Color(0xFFFFC6C9),
          ),
          ItemsFollowing(title: "Followers", num: 0),
        ],
      ),
    );
  }
}

class ItemsFollowing extends StatelessWidget {
  const ItemsFollowing({
    super.key,
    required this.title,
    required this.num,
  });

  final String title;
  final int num;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        spacing: 1,
        children: [
          Text(
            num.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}