import 'package:flutter/material.dart';
import 'package:hynzo/resources/images.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageWidget extends StatefulWidget {
  final String imageUrl;
  final int level;
  final Color backgroundcolor;
  final Color valueColor;

  const ProfileImageWidget(
      {Key? key,
      required this.imageUrl,
      required this.level,
      required this.backgroundcolor,
      required this.valueColor})
      : super(key: key);

  @override
  State<ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  XFile? image;

  // UploadimgFromGallery() async {
  //   XFile? image = await ImagePicker()
  //       .pickImage(source: ImageSource.gallery, imageQuality: 50)
  //       .whenComplete(() => null);

  //   setState(() {
  //     this.image = image;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 70.0,
          height: 70.0,
          child: CircularProgressIndicator(
            value: 0.6,
            backgroundColor: widget.backgroundcolor,
            valueColor: AlwaysStoppedAnimation<Color>(
              widget.valueColor,
            ),
          ),
        ),
        Positioned(
            top: 1.0,
            bottom: 1.0,
            right: 1.0,
            left: 1.0,
            child: widget.imageUrl == ''
                ? CircleAvatar(
                    radius: 30.0,
                    backgroundImage: const AssetImage(Images.PROFILE_PIC),
                    backgroundColor: AppColors.white,
                  )
                : CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(widget.imageUrl),
                    backgroundColor: AppColors.white,
                  )),
        Positioned.fill(
          bottom: 6.0,
          right: 3.0,
          child: Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 20.0,
              height: 20.0,
              child: Image.asset(
                Images.PROFILE_STAR,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned.fill(
          bottom: 8.0,
          right: 11.0,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              widget.level.toString(),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 9,
                    color: AppColors.yellowDark,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
