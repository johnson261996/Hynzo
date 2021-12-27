import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:hynzo/resources/sticker_packs.dart';
import 'package:hynzo/themes/colors.dart';

class ChatBottomWidget extends StatefulWidget {
  Function(types.PartialText) onSendPressed;
  Function(String) onStickerSend;
  Function() onAttachPressed;
  Function() onEmojiPressed;
  bool isLoading;
  bool stickerOpen;

  ChatBottomWidget({
    Key? key,
    required this.onSendPressed,
    required this.onStickerSend,
    required this.onAttachPressed,
    required this.onEmojiPressed,
    required this.isLoading,
    required this.stickerOpen,
  }) : super(key: key);

  @override
  State<ChatBottomWidget> createState() => _ChatBottomWidgetState();
}

class _ChatBottomWidgetState extends State<ChatBottomWidget>
    with SingleTickerProviderStateMixin {
  TextEditingController controller = TextEditingController();
  late TabController _tabController;
  late PageController _pageController;
  int selectedIndex = 0;

  @override
  void initState() {
    _tabController = TabController(
        length: StickerPacks.stickerPacks.length, initialIndex: 0, vsync: this);
    _pageController = PageController(initialPage: 0, keepPage: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          if (widget.stickerOpen)
            IntrinsicHeight(
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFF333333),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.blueDark,
                          blurRadius: 2,
                          offset: const Offset(1, 1))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      indicatorColor: AppColors.blueDark,
                      isScrollable: true,
                      onTap: (int value) {
                        setState(() {
                          selectedIndex = value;
                          _pageController.animateToPage(selectedIndex,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                        });
                      },
                      controller: _tabController,
                      tabs: [
                        ...StickerPacks.stickerPacks.map(
                          (e) => Tab(
                            height: 40,
                            child: Image.asset(
                              e.first,
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 220,
                      child: PageView.builder(
                        itemCount: StickerPacks.stickerPacks.length,
                        itemBuilder: (context, indexRoot) {
                          return GridView.builder(
                            padding: const EdgeInsets.all(10),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                widget.onStickerSend(StickerPacks
                                    .stickerPacks[indexRoot][index]);
                              },
                              child: Image.asset(
                                StickerPacks.stickerPacks[indexRoot][index],
                                // height: 55,
                                // width: 55,
                              ),
                            ),
                            itemCount:
                                StickerPacks.stickerPacks[indexRoot].length,
                            shrinkWrap: true,
                          );
                        },
                        controller: _pageController,
                        onPageChanged: (int value) {
                          setState(() {
                            selectedIndex = value;
                          });
                          _tabController.animateTo(selectedIndex);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (widget.stickerOpen)
            const SizedBox(
              height: 10,
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.indigo, shape: BoxShape.circle),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    widget.onAttachPressed();
                  },
                  icon: Icon(
                    Icons.attach_file_rounded,
                    color: AppColors.white,
                    size: 25,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  scrollPadding: EdgeInsets.zero,
                  expands: false,
                  maxLines: 3,
                  minLines: 1,
                  textAlign: TextAlign.start,
                  controller: controller,
                  onTap: () {
                    if (widget.stickerOpen) {
                      setState(() {
                        widget.stickerOpen = false;
                      });
                    }
                  },
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: AppColors.black, fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'Your message here',
                    hintStyle:
                        TextStyle(fontSize: 14, color: AppColors.offgreylight),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    prefixIcon: IconButton(
                        onPressed: () {
                          widget.onEmojiPressed();
                        },
                        icon: Image.asset(
                          'assets/images/chat_sticker.png',
                          height: 25,
                          width: 25,
                        )),
                    suffixIcon: widget.isLoading
                        ? SizedBox(
                            height: 15,
                            width: 15,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.blueDark,
                              ),
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              widget.onSendPressed(
                                  types.PartialText(text: controller.text));
                              controller.clear();
                            },
                            icon: const Icon(
                              Icons.send,
                              color: Colors.indigo,
                              size: 25,
                            ),
                          ),
                    isDense: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
