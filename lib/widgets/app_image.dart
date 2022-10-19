// ignore_for_file: must_be_immutable

/*
    CREATED BY: BAKHROMJON POLAT
    CREATED AT: Sep 28 2022 12:17

    Github: https://github.com/BahromjonPolat
    Linked In: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Description: App image 

*/

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:yaaseen/bloc/image/image_bloc.dart';
import 'package:yaaseen/core/core.dart';

class AppImage extends StatelessWidget {
  final String image;
  double? width;
  double? height;
  String? errorImage;
  double radius;
  AppImage({
    Key? key,
    required this.image,
    this.height,
    this.width,
    this.errorImage,
    this.radius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      // alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius.r),
        child: BlocProvider(
          create: (_) => ImageBloc()..add(ImageLoadedEvent(image)),
          child: BlocBuilder<ImageBloc, ImageState>(
            builder: (context, state) {
              if (state is ImageLoadingState) {
                return const CupertinoActivityIndicator();
              }

              if (state is ImageSuccessState) {
                File fileImage = File(state.path);
                return Image.file(
                  fileImage,
                  // height: height,
                  // width: width,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => _errorImage(),
                );
              }

              if (state is ImageFailedState) {
                return _errorImage();
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Image _errorImage() => Image.asset(
        errorImage ?? AppIcons.alif,
        height: height,
        width: width,
        fit: BoxFit.cover,
      );
}
