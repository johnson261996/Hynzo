

import 'package:flutter/material.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageWidget extends StatefulWidget {
  final String imageUrl;
  final int level;
  //final Function UploadImage;

  //const ProfileImageWidget({Key? key,required this.imageUrl,required this.level,required this.UploadImage}) : super(key: key);
  const ProfileImageWidget({Key? key,required this.imageUrl,required this.level}) : super(key: key);

  @override
  State<ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  XFile? image;
 // final int level=1;

  UploadimgFromGallery() async {
    XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery, imageQuality: 50).whenComplete(() => null);

    setState(() {
      this.image = image;
    });

    /*HomeService h = HomeService();
    h.postTodProfilePicService(this.image);*/
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 70.0,
          height: 70.0,
          child: CircularProgressIndicator(value:0.6,backgroundColor: AppColors.offyellow,valueColor:  AlwaysStoppedAnimation<Color>(AppColors.darkyellow,),),
        ),
        Positioned(
          top: 1.0,
          bottom: 1.0,
          right: 1.0,
          left: 1.0,
          /*child:widget.imageUrl == '' ? IconButton(onPressed: (){
              UploadimgFromGallery();
              Navigator.of(context).pop();

          }, icon: Icon(Icons.upload_file_rounded)) :*/
          child:CircleAvatar(
            radius: 30.0,
            child:Image.asset('assets/images/profile_pic.png',fit: BoxFit.contain,),
            backgroundColor: AppColors.white,
          ),
        ),
        Positioned.fill(
          bottom: 10.0,
          right: 8.0,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 12.0,
              height: 12.0,
              child: Image.asset(
                'assets/images/profile_star.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned.fill(
          bottom: 10.5,
          right: 10.5,
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
