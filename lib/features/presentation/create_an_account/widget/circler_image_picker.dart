import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lady_driver/core/constant/app_images.dart';

import '../../../../core/components/custom_botton.dart';
import '../../../../core/constant/app_colors.dart';

class CirclerImagePicker extends StatefulWidget {
  const CirclerImagePicker({super.key});

  @override
  State<CirclerImagePicker> createState() => _CirclerImagePickerState();
}

class _CirclerImagePickerState extends State<CirclerImagePicker> {
  File? imagePicker;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 58,
            //! Saved Image
            backgroundImage: imagePicker == null
                ? const AssetImage(AppImages.kNoprofile)
                : FileImage(imagePicker!),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                      radius: 18,
                      backgroundColor: const Color(0xffe6efec),
                      child: GestureDetector(
                        onTap: () {
                          //! showDialog
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                //! Title
                                title: Text('اضافة صورة',
                                    textAlign: TextAlign.center,
                                    style: textTheme.titleSmall!
                                        .copyWith(fontWeight: FontWeight.w400)),
                                //! Content
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    //! imagePickerGallery
                                    GestureDetector(
                                      onTap: imagePickerGallery,
                                      child: const CustomBotton(
                                        text: 'Gallery',
                                        textThemeColor: AppColors.kWhite,
                                        borderColor: AppColors.kPrimaryColor,
                                        color: AppColors.kPrimaryColor,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    //! imagePickerCamera
                                    GestureDetector(
                                      onTap: imagePickerCamera,
                                      child: const CustomBotton(
                                        text: 'Camera',
                                        textThemeColor: AppColors.kWhite,
                                        borderColor: AppColors.kPrimaryColor,
                                        color: AppColors.kPrimaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                actions: [
                                  GestureDetector(
                                    onTap: () {
                                      context.router.maybePop();
                                    },
                                    child: Text('Cancel',
                                        style: textTheme.titleSmall!.copyWith(
                                            color: AppColors.kPrimaryColor,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.black,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //! imagePickerGallery
  imagePickerGallery() async {
    final imageGallery =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(
      () {
        imagePicker = File(imageGallery!.path);
      },
    );
  }

  //! imagePickerCamera
  imagePickerCamera() async {
    final imageCamera =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      imagePicker = File(imageCamera!.path);
    });
  }
}
