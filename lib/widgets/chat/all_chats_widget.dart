import 'package:flutter/material.dart';
import 'package:hynzo/core/models/chat_model.dart';
import 'package:hynzo/themes/colors.dart';

class AllChatsWidget extends StatefulWidget {
  const AllChatsWidget({Key? key}) : super(key: key);

  @override
  State<AllChatsWidget> createState() => _AllChatsWidgetState();
}

class _AllChatsWidgetState extends State<AllChatsWidget> {
  List<ChatModel> allChats = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allChats.add(
      ChatModel(
        imagePath: 'assets/images/message_image_one.png',
        name: 'Darlene Steward',
        unreadCount: 5,
        status: 'unread',
        isRead: false,
        content: 'Pls take a look at the images.',
        dateTime: '16.04',
      ),
    );
    allChats.add(
      ChatModel(
        imagePath: 'assets/images/message_image_three.png',
        name: 'Fullsnack Designers',
        unreadCount: 0,
        status: 'inactive',
        isRead: false,
        content: 'Hello guys, we have discussed about ...',
        dateTime: '16.04',
      ),
    );
    allChats.add(
      ChatModel(
        imagePath: 'assets/images/message_image_three.png',
        name: 'Lee Williamson',
        unreadCount: 0,
        status: 'active',
        isRead: false,
        content: 'Yes, that’s gonna work, hopefully. ',
        dateTime: '06.12',
      ),
    );
    allChats.add(
      ChatModel(
        imagePath: 'assets/images/message_image_four.png',
        name: 'Ronald Mccoy',
        unreadCount: 0,
        status: 'inactive',
        isRead: true,
        content: 'Thanks dude 😉',
        dateTime: 'Yesterday',
      ),
    );
    allChats.add(
      ChatModel(
        imagePath: 'assets/images/message_image_five.png',
        name: 'Albert Bell',
        unreadCount: 0,
        status: 'inactive',
        isRead: false,
        content: 'I‘m happy this anime has such grea...',
        dateTime: 'Yesterday',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery=MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height,
      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        itemCount: allChats.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: mediaQuery.width,
            height: 80,
            margin: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 10.0,
            ),
            decoration: BoxDecoration(
              color: allChats[index].unreadCount! > 0
                  ? AppColors.lighterblue.withOpacity(0.3)
                  : AppColors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListTile(
              leading: Stack(
                children: [
                  Image.asset(
                    allChats[index].imagePath!,
                    fit: BoxFit.contain,
                    width: 50.0,
                    height: 50.0,
                  ),
                  if(allChats[index].status == "active")...[
                    Positioned(
                      top: 35.0,
                      left: 40.0,
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: AppColors.green,
                        ),
                      ),
                    )
                  ] else if(allChats[index].status == "inactive")...[
                    Positioned(
                      top: 35.0,
                      left: 40.0,
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: AppColors.offline,
                        ),
                      ),
                    )
                  ] else if(allChats[index].status == "unread")...[
                    Positioned(
                      top: 35.0,
                      left: 40.0,
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: AppColors.geryYellow,
                        ),
                      ),
                    )
                  ]
                ],
              ),
              title: Text(
                allChats[index].name!,
                style: Theme.of(context).textTheme.subtitle2!.apply(
                      color: AppColors.greyBlack,
                    ),
              ),
              subtitle: allChats[index].isRead! ?
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/images/read.png',width: 10.0,height: 10.0,),
                  const SizedBox(width: 2.0,),
                  Text(
                    allChats[index].content!,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.offblue,
                    ),
                  ),
                ],
              ):Text(
                allChats[index].content!,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.offblue,
                    ),
              ),
              trailing: allChats[index].unreadCount! > 0
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          allChats[index].dateTime!,
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: AppColors.greishBlack,
                                  ),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: AppColors.blueDark,
                          ),
                          child: Center(
                            child: Text(
                              allChats[index].unreadCount!.toString(),
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : Text(
                      allChats[index].dateTime!,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.greishBlack,
                          ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
