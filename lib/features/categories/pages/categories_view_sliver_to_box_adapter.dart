import 'package:flutter/material.dart';

class CategoriesViewSliverToBoxAdapter extends StatefulWidget {
  const CategoriesViewSliverToBoxAdapter({
    super.key,
  });

  @override
  State<CategoriesViewSliverToBoxAdapter> createState() => _CategoriesViewSliverToBoxAdapterState();
}

class _CategoriesViewSliverToBoxAdapterState extends State<CategoriesViewSliverToBoxAdapter> {
  double currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Transform.rotate(
        angle: 1,
        child: Slider(
          value: currentValue,
          thumbColor: Colors.green,
          overlayColor: WidgetStatePropertyAll(Colors.orange),
          activeColor: Colors.black,
          min: 0,
          max: 100,
          divisions: 100,
          onChanged: (value) {
            currentValue = value;
            setState(() {});
          },
        ),
      ),
    );
  }
}
