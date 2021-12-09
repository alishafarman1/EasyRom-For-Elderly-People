import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class DialerApp extends StatelessWidget {
  const DialerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("messages_app".tr()),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
