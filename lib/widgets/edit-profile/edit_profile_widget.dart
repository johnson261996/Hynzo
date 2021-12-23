import 'package:flutter/material.dart';
import 'package:hynzo/resources/images.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/localstorage.dart';
import 'package:hynzo/widgets/common/buttons/primary_button.dart';
import 'package:hynzo/widgets/common/textField/textField.dart';
import 'package:hynzo/widgets/common/textFieldContainer/textFiledContainer.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({Key? key}) : super(key: key);

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  late String url = '';
  String fullName = '';
  String userName = '';
  String mobile = '';
  String gender = '';
  String location = '';

  String dateString = '';
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mobileController = TextEditingController();
  final dateController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  datepick() async {
    var date = await showDatePicker(
        helpText: "",
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    dateController.text = date.toString().substring(0, 10);
    dateString = dateController.text;
  }

  getData() async {
    String _fullName = (await LocalStorage.getUserFullName())!;
    String _userName = (await LocalStorage.getUserName())!;
    String _avatar = (await LocalStorage.getProfilePic())!;
    LocalStorage.getMobileNumber().then((value) => mobile = value!);
    setState(() {
      fullName = _fullName;
      userName = _userName;
      url = _avatar;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              CircleAvatar(
                radius: 50.0,
                child: url == ''
                    ? Image.asset(
                        Images.PROFILE_PIC,
                        fit: BoxFit.contain,
                      )
                    : Image.network(url),
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
                      onTap: null,
                        child: Image.asset(Images.CAMERA)),
                  ))
            ]),
            // child: CircleAvatar(
            //   radius: 50.0,
            //   child: url == ''
            //       ? Image.asset(
            //           Images.PROFILE_PIC,
            //           fit: BoxFit.contain,
            //         )
            //       : Image.network(url),
            //   backgroundColor: AppColors.white,
            // ),
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
                        controller: firstNameController,
                        hintText: fullName,
                        keyboard: TextInputType.text,
                        onchangeFunc: (val) {
                          setState(() {
                            fullName = firstNameController.text;
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
                        controller: mobileController,
                        hintText: '(+91) $mobile',
                        leading: Image.asset(
                          Images.FLAG,
                          width: 25,
                          height: 25,
                        ),
                        keyboard: TextInputType.text,
                        onchangeFunc: (val) {
                          setState(() {
                            mobile = mobileController.text;
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
                        child: DropdownButton(
                            icon: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: AppColors.gray_arrow,
                              ),
                            ),
                            hint: gender == ''
                                ? Text(Strings.GENDER, style: style)
                                : Text(gender, style: style),
                            isExpanded: true,
                            underline: SizedBox(),
                            items: Strings.GENDER_LIST.map(
                              (val) {
                                return DropdownMenuItem<String>(
                                  value: val,
                                  child: Text(val,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              color: AppColors.grey_primary,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13)),
                                );
                              },
                            ).toList(),
                            onChanged: (val) {
                              setState(
                                () {
                                  gender = val as String;
                                },
                              );
                            }))),
                SizedBox(
                  height: size.height * 0.03,
                ),
                TextFieldContainer(
                  widget: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 0.5,
                          ),
                          Expanded(
                            child: Container(
                              width: size.width * 0.60,
                              child: TextFieldWidget(
                                controller: dateController,
                                hintText: Strings.DOB,
                                leading: null,
                                keyboard: TextInputType.none,
                                onchangeFunc: (val) {
                                  datepick();
                                },
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              datepick();
                            },
                            child: Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child:
                                    Image(image: AssetImage(Images.CALENDAR))),
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                TextFieldContainer(
                    widget: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: DropdownButton(
                            icon: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: AppColors.gray_arrow,
                              ),
                            ),
                            hint: location == ''
                                ? Text(Strings.LOCATION, style: style)
                                : Text(location, style: style),
                            isExpanded: true,
                            underline: SizedBox(),
                            items: Strings.LOCATION_LIST.map(
                              (val) {
                                return DropdownMenuItem<String>(
                                    value: val, child: Text(val, style: style));
                              },
                            ).toList(),
                            onChanged: (val) {
                              setState(
                                () {
                                  location = val as String;
                                },
                              );
                            }))),
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
                    onPressed: () {},
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
