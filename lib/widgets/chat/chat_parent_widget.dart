import 'package:flutter/material.dart';
import 'package:hynzo/core/models/tab_header_model.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/widgets/chat/all_chats_widget.dart';
import 'package:hynzo/widgets/chat/connected_widget.dart';
import 'package:hynzo/widgets/chat/suggested_widget.dart';
import 'package:hynzo/widgets/common/search_bar/search_bar.dart';

import 'requested_widget.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget(
      {Key? key,
      required this.getChatList,
      required this.createChannel,
      required this.getSuggestedList,
      required this.getRequestedChats,
      required this.getConnectedChats})
      : super(key: key);

  final Function(int, int)? getChatList;
  final Function(List<String>, bool)? createChannel;
  final Function? getSuggestedList;
  final Function getRequestedChats;
  final Function getConnectedChats;

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> with TickerProviderStateMixin {
  String search = '';
  bool showSearchBar = false;
  List<TabHeaderModel> allTabHeader = [];
  int selectedIndexValue = 0;
  late TabController tabController;
  late PageController _pageController;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
    tabController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
    allTabHeader.addAll([
      TabHeaderModel(
        tabName: 'All chats',
      ),
      TabHeaderModel(
        tabName: 'Connected',
      ),
      TabHeaderModel(
        tabName: 'Requested',
      ),
      TabHeaderModel(
        tabName: 'Suggested',
      ),
    ]);
    tabController = TabController(
      initialIndex: selectedIndexValue,
      length: allTabHeader.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      color: AppColors.white,
      width: mediaQuery.width,
      height: mediaQuery.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: mediaQuery.height * 0.06,
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
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: AppColors.greyBlack,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      showSearchBar = !showSearchBar;
                    });
                  },
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
            height: mediaQuery.height * 0.005,
          ),
          if (showSearchBar) ...[
            SearchBar(
              hintText: Strings.SEARCH_CHATS,
              onchangeFunc: (val) {
                setState(() {
                  search = val;
                });
              },
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
              ),
            ),
          ],
          SizedBox(
            height: mediaQuery.height * 0.02,
          ),
          Container(
            height: 25.0,
            child: TabBar(
              padding: EdgeInsets.zero,
              onTap: (index) {
                setState(() {
                  selectedIndexValue = index;
                  _pageController.animateToPage(selectedIndexValue,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastLinearToSlowEaseIn);
                });
              },
              controller: tabController,
              indicatorColor: Colors.transparent,
              tabs: List<Widget>.generate(allTabHeader.length, (int index) {
                return Container(
                  padding: const EdgeInsets.only(
                    left: 5.0,
                    right: 5.0,
                  ),
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
                );
              }),
              isScrollable: true,
            ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.015,
          ),
          Divider(
            color: AppColors.offgrey,
            height: 1.0,
          ),
          Expanded(
            child: Container(
              child: PageView(
                controller: _pageController,
                physics: BouncingScrollPhysics(),
                onPageChanged: (page) {
                  setState(() {
                    selectedIndexValue = page;
                    tabController.animateTo(selectedIndexValue,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastLinearToSlowEaseIn);
                  });
                },
                children: [
                  AllChatsWidget(
                    getChatList: widget.getChatList,
                    createChannel: widget.createChannel,
                  ),
                  ConnectedWidget(getConnectedChats: widget.getConnectedChats,),
                  RequestedWidget(getRequestedChats: widget.getRequestedChats,),
                  SuggestedWidget(
                    getSuggestedList: widget.getSuggestedList,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
