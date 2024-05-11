

import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_assignment/helper/common_widgets.dart';
import 'package:e_commerce_assignment/helper/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

Widget showSliderImage(BuildContext context) {
  List<String> images = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
    'assets/images/7.jpg',
    'assets/images/8.jpg',
  ];
  return customSizedBox(
    width: MediaQuery.of(context).size.width * 1,
    height: MediaQuery.of(context).size.height * 0.28,
    child: StatefulBuilder(
      builder: (context, setState) => Column(
        children: [
          customSizedBox(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.225,
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
              child: CarouselSlider.builder(
                itemCount: images.length,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  pauseAutoPlayOnTouch: true,
                ),
                itemBuilder: (context, index, realIdx) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(images[index], fit: BoxFit.fitWidth),
                  );
                },
              ),
            ),
          ),
          customSizedBox(height: 10),
        ],
      ),
    ),
  );
}

Widget showPopularStoresTitle(String title) {
  return customRow(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      customText(
         title: title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      )
    ],
  );
}

Card customList({required BuildContext context,required String title, required String image}) {
    return Card(
      elevation: 8,
      color: cardBackGround,
      child: customContainer(
        height: 270.h,
        color: white,
        width: double.infinity,
        child: customColumn(
          children: <Widget>[
            customText(title: title,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            // SizedBox(height: 1.h),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return imageDialog(image: image, title: title);
                  },
                );
              },
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.fill,
                height: 155.h,
                width: double.infinity,
              ),
            ),
            customSizedBox(height: 3.h),
            customRow(
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return imageDetailsDialog();
                      },
                    );
                  },
                  child: customContainer(
                    margin: const EdgeInsets.all(8.0),
                    width: 90.h,
                    height: 80.h,
                    color: grey,
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Dialog imageDialog({required String image, required String title}) {
    return customDialog(
      child: customContainer(
        color: dialogBG,
        height: 200.h,
        width: 800.w,
        child: customColumn(
          children: [
            customText(title: title),
            Flexible(
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
      ),
    );
  }

  Dialog imageDetailsDialog({File? image, String? title, String? price}) {
    File? image;
    final picker = ImagePicker();

    Future<void> getImage() async {
      var pickedFile = await picker.pickImage(source: ImageSource.gallery);

      
        if (pickedFile != null) {
          image = File(pickedFile.path);
          print('.....................llllllllllllll.....${image?.path.toString()}');
        } else {
          print('...........................No image selected.');
        }
    }

    return customDialog(
      child: customSingleChildScrollView(
        child: StatefulBuilder(builder: (context, setState) => 
           customContainer(
            color: dialogBG,
            height: 360.h,
            width: 800.w,
            child: customColumn(
              children: [
                      image != null ?  GalaryImageWidget(image: Image.file(image!, fit: BoxFit.fill),onTap: () async{ await getImage();
                      setState((){});
                      print('kljjj.lkkkj......................jjhhh.....................${image?.path.toString()}');
                      },): GalaryImageWidget(image: Image.asset("assets/images/1.jpg", fit: BoxFit.fill),onTap: () async{await getImage();
                      setState((){});
                      print('kljjj......................${image?.path.toString()}');})
                 
                ,customSizedBox(
                  height: 10.h,
                ),
                customRow(
                  children: [
                    customSizedBox(
                      width: 30.w,
                    ),
                    customText(
                      title: 'Name: ',
                        style:
                            TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                    customSizedBox(
                      width: 10.w,
                    ),
                    customContainer(
                      height: 30.h,
                      width: 100.w,
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6))),
                        initialValue: title ?? '',
                      ),
                    ),
                  ],
                ),
                customSizedBox(
                  height: 5.h,
                ),
                customRow(
                  children: [
                    customSizedBox(
                      width: 30.w,
                    ),
                    customText(
                      title: 'Price:  ',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    customSizedBox(
                      width: 10.w,
                    ),
                    customContainer(
                      height: 30.h,
                      width: 100.w,
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6))),
                        initialValue: price ?? '',
                      ),
                    ),
                  ],
                ),
                customSizedBox(
                  height: 30.h,
                ),
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(blueAccent)),
                    onPressed: () {},
                    child: const Text('Update'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  class GalaryImageWidget extends StatelessWidget {
  const GalaryImageWidget({super.key, this.image, this.onTap});
  final Image? image;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  customStack(
      alignment: Alignment.center,
      children: [customContainer(
        height: 100.h,
        width: 100.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
        //color: Colors.amber
        ),
        child: ClipRRect(borderRadius: BorderRadius.circular(30),child: image),
      ),
      Positioned(
        top: 80.h,
        bottom: 0,
        left: 80.h,
        child: InkWell(
        onTap: onTap,
        child: const Icon(Icons.camera_alt_outlined, size: 30,color: blue,)))
      ]
    );
  }
}