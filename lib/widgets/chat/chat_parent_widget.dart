import 'package:flutter/material.dart';
import 'package:invent_chat/core/models/tab_header_model.dart';
import 'package:invent_chat/resources/strings.dart';
import 'package:invent_chat/themes/colors.dart';
import 'package:invent_chat/widgets/chat/all_chats_widget.dart';
import 'package:invent_chat/widgets/chat/requested_widget.dart';
import 'package:invent_chat/widgets/chat/suggested_widget.dart';

import 'calls_widget.dart';

class ChatWidget extends StatefulWidget{
  const ChatWidget({Key? key}) : super(key: key);



  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {

  List<TabHeaderModel> allTabHeader = [];
  int selectedIndexValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allTabHeader.add(
      TabHeaderModel(tabName: 'All chats',),
    );
    allTabHeader.add(
      TabHeaderModel(tabName: 'Requested',),
    );
    allTabHeader.add(
      TabHeaderModel(tabName: 'Calls',),
    );
    allTabHeader.add(
      TabHeaderModel(tabName: 'Suggested',),
    );
  }

  Widget _getSelectedWidget(int index){
    switch(index){
      case 0 :
        return AllChatsWidget();
      case 1 :
        return RequestedWidget();
      case 2 :
        return CallsWidget();
      case 3 :
        return SuggestedWidget();
      default:
        return AllChatsWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
            ),
            child: Row(
              children: [
                Text(
                  Strings.CHAT,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: AppColors.greyBlack,fontSize: 23,fontWeight: FontWeight.w500,),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 20,
                    color: AppColors.offBlack,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 15.0,
            ),
            width: MediaQuery.of(context).size.width,
            height: 25.0,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedIndexValue=index;
                    });
                  },
                  child: Container(
                    width: 80.0,
                    height: 25.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: index == selectedIndexValue
                          ? AppColors.blueDark
                          : AppColors.white,
                    ),
                    child: Center(
                      child: Text(
                        allTabHeader[index].tabName!,
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontSize: 12,
                          color: index == selectedIndexValue
                              ? AppColors.white
                              : AppColors.greyBlack,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: allTabHeader.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.015,),
          Divider(
            color: AppColors.offgrey,
            height: 1.0,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: _getSelectedWidget(selectedIndexValue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}