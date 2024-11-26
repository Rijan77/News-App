import 'package:flutter/material.dart';
import 'package:lab1/static.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

Widget conversationitem(Size size) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: size.width,
      margin: const EdgeInsets.only(bottom: 35),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
            margin: const EdgeInsets.only(right: 15, left: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                StaticValue.defaulturl,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
            children: [
              Text(
                "name",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "datetime",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              )
            ],
          )
        ],
      ),
    ),
  );
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    // Get the screen size using MediaQuery
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: size.width,
            height: size.height / 1.2,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (context, index) {
                return conversationitem(size);
              },
            ),
          ),
        ],
      ),
    );
  }
}
