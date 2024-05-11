import 'package:e_commerce_assignment/Components/custom_home_screen_widgets.dart';
import 'package:e_commerce_assignment/helper/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key, required this.title});

  final String title;

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: customText(title: widget.title),
        ),
        body: customSingleChildScrollView(
          child: customColumn(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              showSliderImage(context),
              customSizedBox(height: 5.h),
              showPopularStoresTitle('Top Stores'),
              customSizedBox(height: 5.h),
              customList(context: context, image: 'assets/images/1.jpg', title: "Home & Living"),
              customSizedBox(height: 20.h),
              customList(context: context, image: 'assets/images/2.jpg', title: "Art"),
              customSizedBox(height: 20.h),
              customList(context: context, image: 'assets/images/3.jpg', title: "Bata"),
              customSizedBox(height: 20.h),
              customList(context: context, image: 'assets/images/4.jpg', title: "Data"),
              customSizedBox(height: 20.h),
              customList(context: context, image: 'assets/images/5.jpg', title: "Nma"),
            ],
          ),
        ));
  }
}