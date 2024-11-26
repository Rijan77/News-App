import "package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart';

class UrlLuncher extends StatefulWidget {
  const UrlLuncher({super.key});

  @override
  State<UrlLuncher> createState() => _UrlLuncherState();
}

class _UrlLuncherState extends State<UrlLuncher> {

  final Uri _url = Uri.parse('https://www.daraz.com.np/contact-us/');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              _launchUrl();
            },
            child: Center(
              child: Container(
                height: 100,
                width: 150,
                color: Colors.blue,
                child: const Text("Click Here to launch"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
