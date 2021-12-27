import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hynzo/core/models/upload_avatar_model.dart';
import 'package:hynzo/core/models/user_profile_model.dart';
import 'package:hynzo/core/services/upload_avatar_service.dart';
import 'package:hynzo/resources/images.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/widgets/common/buttons/primary_button.dart';
import 'package:hynzo/widgets/common/textField/textField.dart';
import 'package:hynzo/widgets/common/textFieldContainer/textFiledContainer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditProfileWidget extends StatefulWidget {
  final UserProfileModel userDetails;

  final Function updateProfile;

  const EditProfileWidget(
      {Key? key, required this.userDetails, required this.updateProfile})
      : super(key: key);

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  late String url = '';
  String fullName = '';
  String userName = '';
  String mobile = '';
  String genderDetail = '';
  String gender = '';
  String location = '';
  bool uploading = false;

  String dateString = '';
  final firstNameController = TextEditingController();
  final mobileController = TextEditingController();
  final dateController = TextEditingController();
  final genderDetailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    url = widget.userDetails.avatar ?? Images.PROFILE_PIC;
    dateString = widget.userDetails.dob ?? Strings.DOB;
    print(dateString);
  }

  datepick() async {
    var date = await showDatePicker(
        helpText: "",
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    setState(() {
      String dateStr = date.toString().substring(0, 10);
      var inputFormat = DateFormat('yyyy-MM-dd');
      var inputDate = inputFormat.parse(dateStr); // <-- dd/MM 24H format

      var outputFormat = DateFormat('yyyy-MM-dd');
      var outputDate = outputFormat.format(inputDate);
      dateString = outputDate;
      dateController.text = dateString;
    });
  }

  getData() async {
    fullName = widget.userDetails.full_name ?? Strings.NAME;
    mobile = widget.userDetails.contact_number ?? Strings.MOBILE;
    genderDetail = widget.userDetails.gender_detail ?? Strings.GENDER;
    gender = widget.userDetails.gender ?? '';
    userName = widget.userDetails.username ?? '';
    dateString = widget.userDetails.dob ?? Strings.DOB;
  }

  update() {
    widget.updateProfile(firstNameController.text, mobileController.text,
        gender, genderDetail, dateController.text, url);
  }

  Future<UploadAvatarResponse> uploadPhoto(XFile pickedFile) async {
    setState(() {
      uploading = true;
    });
    UploadAvatarResponse response =
        await AvatarUploadService().uploadPicService(pickedFile);
    setState(() {
      uploading = false;
    });
    return response;
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      maxHeight: 2560,
      source: ImageSource.gallery,
    );

    if (result != null) {
      UploadAvatarResponse uploadJob = await uploadPhoto(result);
      setState(() {
        url = uploadJob.avatar;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    TextStyle style = Theme.of(context).textTheme.bodyText2!.copyWith(
        color: AppColors.grey_primary,
        fontWeight: FontWeight.w400,
        fontSize: 13);
    Size size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.white,
      width: size.width,
      height: size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.08,
          ),
          Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      Images.TOP_BACK,
                      width: 15,
                      height: 15,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Text(
                    Strings.BIO,
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: AppColors.greyBlack,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              )),
          SizedBox(
            height: size.height * 0.03,
          ),
          Center(
            child: Stack(children: [
              url == ''
                  ? CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage(Images.PROFILE_PIC),
                      backgroundColor: AppColors.white,
                    )
                  : CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(url),
                      backgroundColor: AppColors.white,
                    ),
              Positioned(
                  right: 0,
                  bottom: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.gray_circle,
                      border:
                          Border.all(width: 8, color: AppColors.gray_circle),
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    child: GestureDetector(
                        onTap: _handleImageSelection,
                        child: Image.asset(Images.CAMERA)),
                  ))
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fullName,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: AppColors.black_secondary,
                        fontWeight: FontWeight.w700,
                        fontSize: 18)),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text('@$userName',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: AppColors.grey_secondary,
                          fontWeight: FontWeight.w400,
                          fontSize: 16)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextFieldContainer(
                  widget: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextFieldWidget(
                        text: fullName,
                        controller: firstNameController,
                        keyboard: TextInputType.text,
                        onchangeFunc: (val) {
                          setState(() {
                            firstNameController.text = val;
                          });
                        }),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                TextFieldContainer(
                  widget: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextFieldWidget(
                        text: mobile,
                        controller: mobileController,
                        leading: Image.asset(
                          Images.FLAG,
                          width: 25,
                          height: 25,
                        ),
                        keyboard: TextInputType.text,
                        onchangeFunc: (val) {
                          print(val);
                          setState(() {
                            mobileController.text = val;
                          });
                        }),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                TextFieldContainer(
                  widget: Row(
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                            style: style,
                            controller: genderDetailController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: genderDetail,
                              hintStyle: style,
                            )),
                      )),
                      PopupMenuButton<String>(
                        icon: const Icon(Icons.arrow_drop_down),
                        onSelected: (String value) {
                          genderDetail = value;
                          genderDetailController.text = genderDetail;
                          if (value == 'Male') {
                            gender = 'M';
                          } else {
                            gender = 'F';
                          }
                        },
                        itemBuilder: (BuildContext context) {
                          return Strings.GENDER_LIST
                              .map<PopupMenuItem<String>>((String value) {
                            return new PopupMenuItem(
                                child: Text(value), value: value);
                          }).toList();
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                TextFieldContainer(
                  widget: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextField(
                              style: style,
                              controller: dateController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: dateString,
                                hintStyle: style,
                              )),
                        )),
                        GestureDetector(
                          onTap: () async {
                            datepick();
                          },
                          child: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Image(image: AssetImage(Images.CALENDAR))),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: PrimaryButton(
                    text: const Text(Strings.UPDATE_PROFILE),
                    onPressed: () {
                      if (firstNameController.text == '') {
                        firstNameController.text = fullName;
                      }
                      if (mobileController.text == '') {
                        mobileController.text = mobile;
                      }
                      if (dateController.text == '') {
                        dateController.text = dateString;
                      }
                      update();
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
