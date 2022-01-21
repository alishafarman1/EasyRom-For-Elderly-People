import 'package:easy_rom_prototype/src/configs/app_setup.locator.dart';
import 'package:easy_rom_prototype/src/services/local/speech_service.dart';
import 'package:easy_rom_prototype/src/shared/app_text_field.dart';
import 'package:easy_rom_prototype/src/shared/custom_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class MessagesApp extends StatefulWidget {
  const MessagesApp({Key? key}) : super(key: key);

  @override
  State<MessagesApp> createState() => _MessagesAppState();
}

class _MessagesAppState extends State<MessagesApp> {
  TextEditingController _controller = TextEditingController();
  ScrollController _scrollController = ScrollController();

  List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("messages_app".tr()),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            controller: _scrollController,
            reverse: false,
            itemCount: messages.length,
            itemBuilder: (_, idx) =>
                _messageItem(messages[idx], isMe: idx == 0 || idx % 2 != 0),
            padding: EdgeInsets.only(top: 20),
          )),
          Row(
            children: [
              Expanded(
                child: AppTextField(
                    controller: _controller,
                    placeholder: "enter_your_message_here".tr()),
              ),
              ElevatedButton(onPressed: _send, child: Text('Send'))
            ],
          ),
          CustomKeyboard(controller: _controller),
        ],
      ),
    );
  }

  Widget _messageItem(String text, {bool isMe = false}) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: EdgeInsets.all(10),
          child: Text(text,
              style: TextStyle(color: !isMe ? Colors.white : Colors.black)),
          decoration: BoxDecoration(
            color: !isMe ? Colors.black : Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }

  void _send() {
    messages.add(_controller.text);
    _controller.clear();
    locator<SpeechService>().speak("sent".tr());
    setState(() {
      (() async {
        //sent
        await Future.delayed(Duration(milliseconds: 100));
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 100),
        );
      })();
    });
  }
}
