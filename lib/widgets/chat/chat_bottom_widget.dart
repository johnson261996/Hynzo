import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:hynzo/themes/colors.dart';

class ChatBottomWidget extends StatefulWidget {
  Function(types.PartialText) onSendPressed;
  Function() onAttachPressed;
  Function() onEmojiPressed;
  ChatBottomWidget(
      {Key? key, required this.onSendPressed, required this.onAttachPressed,required this.onEmojiPressed})
      : super(key: key);

  @override
  State<ChatBottomWidget> createState() => _ChatBottomWidgetState();
}

class _ChatBottomWidgetState extends State<ChatBottomWidget> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
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
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              textAlign: TextAlign.start,
              controller: controller,
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
                  onPressed: () {},
                  icon: Icon(
                    Icons.mood,
                    size: 25,
                    color: AppColors.offgrey,
                  ),
                ),
                suffixIcon: IconButton(
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
    );
  }
}
