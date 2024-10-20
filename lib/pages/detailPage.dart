import 'package:flutter/material.dart';
import 'package:lab1/static.dart';


class Detailpage extends StatefulWidget {
  const Detailpage({super.key});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height/4.1,
                  width: size.width,
                  color: Colors.black,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(0),child:
                  Image.network(
                    StaticValue.newsdetail!.urlToImage!
                    //"https://paultan.org/image/2020/12/Volkswagen-China-production-630x399.jpg"
                    ,fit: BoxFit.cover,)),
                ),

                Positioned(left: 15,top: 50,child: GestureDetector(
                    onTap: (){
                  Navigator.pop(context);
                },
                    child: const Icon(Icons.arrow_back_outlined,color: Colors.white,size: 30,))),

                const Positioned(right: 15,top: 50,child: Icon(Icons.share,color: Colors.white,size: 30,)),

                SizedBox(  height: size.height/4.1,
                    width: size.width,child: const Center(child: Icon(Icons.play_circle,size: 50,color: Colors.white,)))

              ],
            ),

            Container(
              padding: const EdgeInsets.only(top: 15,bottom: 10),
              width: size.width/1.1,
              child: Text( StaticValue.newsdetail!.title!,
                style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                  fontSize: 28,),overflow: TextOverflow.ellipsis,maxLines: 2,),
            ),

            SizedBox(
              width: size.width/1.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text( StaticValue.newsdetail!.author!,
                    style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                      fontSize: 12,),overflow: TextOverflow.ellipsis,maxLines: 2,),
                  Text(StaticValue.datetimeconverter( StaticValue.newsdetail!.publishedAt!),
                    style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                      fontSize: 12,),overflow: TextOverflow.ellipsis,maxLines: 2,)
                ],
              ),
            ),

            SizedBox(
              width: size.width/1.1,
              child: Text( StaticValue.newsdetail!.description!,
                style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                  fontSize: 15,),textAlign: TextAlign.justify,overflow: TextOverflow.ellipsis,maxLines: 8,),
            ),


            Container(
              color: Colors.white,
              margin: const EdgeInsets.only(top: 15),
              padding: EdgeInsets.zero,
              height: size.height/2.2,
              width: size.width/1,
              child: ListView.builder(
                itemCount: 20,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container();//dashboardPageState.verticalscollfunc(size);
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
