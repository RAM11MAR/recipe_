import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/data/models/recipe/instruction_model.dart';
import 'package:recipe/features/common/common.dart';

import '../manager/recipe_detail_view_model.dart';
import 'recipe_detail_image_and_video.dart';
import 'recipe_detail_user_section.dart';

class InstructionItem extends StatefulWidget {
  const InstructionItem({
    super.key,
    required this.instruction,
    required this.index,
  });

  final InstructionModel instruction;
  final int index;

  @override
  State<InstructionItem> createState() => _InstructionItemState();
}

class _InstructionItemState extends State<InstructionItem> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        expanded = !expanded;
      }),
      child: Container(
        width: 356.w,
        height: expanded ? null : 80.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: widget.index % 2 == 0 ? AppColors.pinkSub : AppColors.pink,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          "${widget.index + 1}. ${widget.instruction.text}",
          style: TextStyle(
            color: AppColors.beigeColor,
          ),
        ),
      ),
    );
  }
}
