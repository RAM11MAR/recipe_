import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/data/models/top_chef_model_small.dart';

class TopChefItemHome extends StatelessWidget {
  const TopChefItemHome({
    super.key,
    required this.topChef,
  });

  final TopChefModelSmall topChef;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: CachedNetworkImage(
            imageUrl: topChef.image,
            width: 83.w,
            height: 74.h,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 83.w,
          child: Text(
            topChef.firstName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
