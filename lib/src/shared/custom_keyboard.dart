import 'dart:math';

import 'package:easy_rom_prototype/src/base/utils/utils.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class KeyboardDemo extends StatefulWidget {
  @override
  _KeyboardDemoState createState() => _KeyboardDemoState();
}

class _KeyboardDemoState extends State<KeyboardDemo> {
  TextEditingController _controller = TextEditingController();
  bool _readOnly = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: 50),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            style: TextStyle(fontSize: 24),
            autofocus: true,
            showCursor: true,
            readOnly: _readOnly,
          ),
          IconButton(
            icon: Icon(Icons.keyboard),
            onPressed: () {
              setState(() {
                _readOnly = !_readOnly;
              });
            },
          ),
          Spacer(),
          CustomKeyboard(controller: _controller),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CustomKeyboard extends StatefulWidget {
  final TextEditingController controller;

  CustomKeyboard({required this.controller});

  @override
  State<CustomKeyboard> createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  void _insertText(String myText) {
    speak(myText);
    final text = widget.controller.text;
    final textSelection = widget.controller.selection;
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      myText,
    );
    final myTextLength = myText.length;
    widget.controller.text = newText;
    widget.controller.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
  }

  void _backspace() {
    final text = widget.controller.text;
    final textSelection = widget.controller.selection;
    final selectionLength = textSelection.end - textSelection.start;

    // There is a selection.
    if (selectionLength > 0) {
      final newText = text.replaceRange(
        textSelection.start,
        textSelection.end,
        '',
      );
      widget.controller.text = newText;
      widget.controller.selection = textSelection.copyWith(
        baseOffset: textSelection.start,
        extentOffset: textSelection.start,
      );
      return;
    }

    // The cursor is at the beginning.
    if (textSelection.start == 0) {
      return;
    }

    // Delete the previous character
    final previousCodeUnit = text.codeUnitAt(textSelection.start - 1);
    final offset = _isUtf16Surrogate(previousCodeUnit) ? 2 : 1;
    final newStart = textSelection.start - offset;
    final newEnd = textSelection.start;
    final newText = text.replaceRange(
      newStart,
      newEnd,
      '',
    );
    widget.controller.text = newText;
    widget.controller.selection = textSelection.copyWith(
      baseOffset: newStart,
      extentOffset: newStart,
    );
  }

  startSpeachRecognizer() async {
    speech = stt.SpeechToText();
    bool available = await speech!.initialize(
        onStatus: (str) {},
        onError: (e) {
          setState(() {
            isSpeaking = false;
          });
        });
    setState(() {
      isSpeaking = false;
    });
    if (available) {
      speech!.listen(onResult: (str) {
        _textInputHandler(str.recognizedWords);
      });
    } else {
      print("The user has denied the use of speech recognition.");
    }
  }

  stopSpeachRecognizer() {
    speech?.stop();
  }

  bool _isUtf16Surrogate(int value) {
    return value & 0xF800 == 0xD800;
  }

  void _textInputHandler(String text) => _insertText(text);

  void _backspaceHandler() => _backspace();

  Color keyColor = Colors.black;
  Color bgColor = Colors.grey;

  final List<List<String>> qwertySet = [
    ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'],
    ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l'],
    ['@', 'z', 'x', 'c', 'v', 'b', 'n', 'm', '.']
  ];

  bool isCaps = false;
  bool showEmojiPicker = false;
  bool isSpeaking = false;
  stt.SpeechToText? speech;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      child: Stack(
        children: [
          Column(
            children: [
              navigationButtons(),
              if (showEmojiPicker) SizedBox(height: 15),
              if (showEmojiPicker)
                EmojiPicker(
                  indicatorColor: keyColor,
                  bgColor: bgColor,
                  onEmojiSelected: (emoji, category) {
                    _textInputHandler(emoji.emoji);
                  },
                ),
              ...[
                if (!showEmojiPicker) ...[
                  numRow(),
                  ...List.generate(
                      qwertySet.length,
                      (index) => Row(
                          children: qwertySet[index]
                              .map((letter) => TextKey(
                                    color: keyColor,
                                    text: isCaps
                                        ? letter.toUpperCase()
                                        : letter.toLowerCase(),
                                    onTextInput: _textInputHandler,
                                  ))
                              .toList()))
                ],
                specialCharsRow()
              ].map((row) => Expanded(
                    child: Container(
                      color: bgColor,
                      child: row,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Container navigationButtons() => Container(
        margin: EdgeInsets.only(bottom: 20),
        width: 100,
        decoration: BoxDecoration(
            color: Color(0xFF249FFF), borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(children: [
          Expanded(
            child: InkWell(
                onTap: () {
                  if (widget.controller.selection.start <= 0) {
                    return;
                  }
                  widget.controller.selection = TextSelection.fromPosition(
                      TextPosition(
                          offset: widget.controller.selection.start - 1));

                  speak(
                      "Cursor is now after ${widget.controller.text.substring(0, widget.controller.selection.start).split("").join(" ")}");
                },
                child: Icon(Icons.chevron_left, color: Colors.white, size: 40)),
          ),
          Expanded(
            child: InkWell(
                onTap: () {
                  if (widget.controller.selection.end <
                      widget.controller.text.length) {
                    widget.controller.selection = TextSelection.fromPosition(
                        TextPosition(
                            offset: widget.controller.selection.end + 1));

                    speak(
                        "Cursor is now after ${widget.controller.text.substring(0, widget.controller.selection.end).split("").join(" ")}");
                  }
                },
                child:
                    Icon(Icons.chevron_right, color: Colors.white, size: 40)),
          ),
        ]),
      );

  Expanded numRow() {
    return Expanded(
      child: Row(
          children: List.generate(
              10,
              (index) => TextKey(
                    color: keyColor,
                    text: '$index',
                    onTextInput: _textInputHandler,
                  )).toList()),
    );
  }

  Expanded specialCharsRow() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: "😁",
            onTextInput: (text) {
              setState(() {
                showEmojiPicker = !showEmojiPicker;
              });
            },
            color: showEmojiPicker ? Color(0xFF1b663e) : keyColor,
          ),
          TextKey(
            color: isCaps ? Color(0xFF1b663e) : keyColor,
            flex: 2,
            text: 'Caps',
            onTextInput: (text) => setState(() {
              isCaps = !isCaps;
              speak(isCaps ? 'Caps Letters On' : 'Caps Letters Off');
            }),
          ),
          TextKey(
            color: keyColor,
            text: ' ',
            label: 'Space',
            flex: 4,
            onTextInput: (text) {
              _textInputHandler(text);
              speak("Space");
            },
          ),
          BackspaceKey(
            color: keyColor,
            flex: 2,
            onBackspace: () {
              _backspace();
              speak("Back Space");
            },
          ),
          TextKey(
            text: "🎙",
            onTextInput: (text) {
              setState(() {
                isSpeaking = !isSpeaking;
              });
              if (isSpeaking) {
                startSpeachRecognizer();
              } else {
                stopSpeachRecognizer();
              }
            },
            color: isSpeaking ? Color(0xFF1b663e) : keyColor,
          ),
        ],
      ),
    );
  }
}

class TextKey extends StatelessWidget {
  const TextKey(
      {Key? key,
      required this.text,
      required this.onTextInput,
      required this.color,
      this.label,
      this.flex = 1,
      this.fontSize = 20})
      : super(key: key);

  final String text;
  final String? label;
  final ValueSetter<String> onTextInput;
  final int flex;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            splashColor: Colors.green,
            onTap: () => onTextInput(text),
            child: Container(
              child: Center(
                  child: Text(label ?? text,
                      style: TextStyle(
                          color: Colors.white, fontSize: this.fontSize))),
            ),
          ),
        ),
      ),
    );
  }
}

class BackspaceKey extends StatelessWidget {
  const BackspaceKey({
    Key? key,
    required this.onBackspace,
    required this.color,
    this.flex = 1,
  }) : super(key: key);

  final VoidCallback onBackspace;
  final int flex;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            splashColor: Colors.green,
            onTap: onBackspace,
            child: Container(
              child: Center(
                child: Icon(Icons.backspace, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
