import 'package:flutter/material.dart';
import 'package:lab1/chat_app/chat_page.dart';
import 'package:lab1/static.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 2, top: 10),
              child: Stack(
                children: [
                  Container(
                    height: 500,
                    width: 400,
                    decoration: const BoxDecoration(
                      color: Colors.deepPurpleAccent,
                    ),
                    child: const Icon(
                      Icons.chat,
                      size: 200,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(8.0),

              child: TextField(

                controller: nameController,
                // onChanged: ,
                onEditingComplete: (){
                  StaticValue.username = nameController.text;

                },

                maxLines: 1,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue[50], // Background color of the text field
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2), // No border side
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  hintText: "Enter your name",
                  hintStyle: const TextStyle(color: Colors.black54), // Hint text color
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16, // Padding vertically
                    horizontal: 20, // Padding horizontally
                  ),  
                ),
              ),
            ),

            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChatPage()),);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent, // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4), // Rectangle shape with small corner radius
                ),
                minimumSize: const Size(200, 50), // Button width and height
              ),
              child: const Text(
                "Continue",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  color: Colors.black
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
