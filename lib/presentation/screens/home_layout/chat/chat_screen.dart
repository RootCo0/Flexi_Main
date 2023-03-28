import 'package:flutter/material.dart';

import '../../../widgets/app_body.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return  AppBody(
      child:SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      )
    );
  }
}
