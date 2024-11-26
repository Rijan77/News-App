import 'package:flutter/material.dart';

class Conversationpage extends StatefulWidget {
  const Conversationpage({super.key});

  @override
  State<Conversationpage> createState() => _ConversationpageState();
}

class _ConversationpageState extends State<Conversationpage> {
  TextEditingController textController = TextEditingController();

  Widget leftsidedataitem(Size size) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
            width: size.width / 1.2,
            // Fixed: use size.width instead of size.Width
            child: const Text(
              "left Side Item",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget rightsidedataitem(Size size) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.only(left: 15, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.only(left: 20, right: 5, top: 10, bottom: 10),
            width: size.width / 1.2, // Fixed: use size.width instead of size.Width
            child: const Text(
              "right Side Item",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget butttonwithtext(Size size) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(15),
        ),
        width: size.width,
        child: Row(
          children: [
            SizedBox(
              width: size.width / 1.5,
              child: TextField(
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87,
                ),
                maxLines: 1,
                textAlign: TextAlign.center,
                controller: textController,
                onEditingComplete: () {},
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 15.0, left: 5, bottom: 5),
              child: Icon(
                Icons.send,
                color: Colors.white,
                size: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get the size of the screen
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                leftsidedataitem(size), // Pass size to the function
                rightsidedataitem(size), // Pass size to the function
              ],
            ),
          ),
          butttonwithtext(size), // Pass size to the function
        ],
      ),
    );
  }
}
