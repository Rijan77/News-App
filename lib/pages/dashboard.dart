import 'package:flutter/material.dart';
import 'package:lab1/api/get.dart';
import 'package:lab1/model/newsapi.dart';
import 'package:lab1/pages/detailPage.dart';
import 'package:lab1/static.dart';

class dashboardPage extends StatefulWidget {
  const dashboardPage({super.key});

  @override
  State<dashboardPage> createState() => dashboardPageState();
}

class dashboardPageState extends State<dashboardPage> {

  //Future
  //if else  for loop
  //switch case
  //Future builder
  late Future<NewsApi?> futureNewsData;

  horizontalscollfunc(var size,Articles articledata){
    return GestureDetector(
      onTap: (){
        // variable assign
        StaticValue.newsdetail = articledata;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  const Detailpage()),
        );
      },
      child: Container(
        width: size.width/1.5,
        height: size.height/5,
        margin: const EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
        ),
        child: Stack(
          children: [
            SizedBox(
              height: size.height/5,
              width: size.width/1.5,
              child: ClipRRect(
              borderRadius: BorderRadius.circular(20),child:
              Image.network(
                articledata.urlToImage!
                //"https://paultan.org/image/2020/12/Volkswagen-China-production-630x399.jpg"
              ,fit: BoxFit.cover,)),
             //   Image.asset("images/bg.png",fit: BoxFit.cover,)),
            ),
            Positioned(
              bottom: 30,left: 15,
              child: Container(
                width: size.width/2,
                decoration: const BoxDecoration(
                  color: Colors.black12
                ),
                child:  Text(articledata.title!,style: const TextStyle(color: Colors.white,
                      fontSize: 20,fontWeight: FontWeight.bold)
                  ,maxLines: 2,overflow: TextOverflow.ellipsis,),
              ),
            ),
            Positioned(
              bottom: 10,left: 15,
              child: Container(
                width: size.width/2,
                color: Colors.black12,
                child:  Text(StaticValue.datetimeconverter(articledata.publishedAt!)
                  ,style: const TextStyle(color: Colors.white,
                      fontSize: 14,fontWeight: FontWeight.normal)
                  ,maxLines: 1,overflow: TextOverflow.ellipsis,),
              ),
            ),
            const Positioned(
              right: 5,
              bottom: 5,
              child: Icon(Icons.play_circle,size: 30,
              color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }


  static verticalscollfunc(context,var size, Articles articledata){
    return GestureDetector(
        onTap: (){
          StaticValue.newsdetail = articledata;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  const Detailpage()),
          );
        },
      child: Container(
        width: size.width/1.1,
       //     height: size.height/5,
        margin: const EdgeInsets.only(left: 5,top: 5,bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),child:
                  Image.network(articledata.urlToImage!
                    //"https://paultan.org/image/2020/12/Volkswagen-China-production-630x399.jpg"
                    ,fit: BoxFit.cover,)),
                  //   Image.asset("images/bg.png",fit: BoxFit.cover,)),
                ),
                const Positioned(
                  right: 5,
                  bottom: 5,
                  child: Icon(Icons.play_circle,size: 30,
                    color: Colors.white,),
                )
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width/2,

                  child: Text(articledata.title!
                    ,style: const TextStyle(color: Colors.black,
                        fontSize: 20,fontWeight: FontWeight.bold)
                    ,maxLines: 2,overflow: TextOverflow.ellipsis,),
                ),

                SizedBox(
                  width: size.width/2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.red,
                        ),
                        padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                        child: Text(articledata.source!.name!,style: const TextStyle(
                            color: Colors.white,fontWeight: FontWeight.bold),maxLines: 1,),
                      ),
                       SizedBox(
                         width: 80,
                         child: Text(StaticValue.datetimeconverter(articledata.publishedAt!),style: const TextStyle(
                            color: Colors.black,fontWeight: FontWeight.bold),maxLines: 1,),
                       ),
                    ],
                  ),
                ),


              ],
            )

          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    futureNewsData = GetApi().getNewsApicall();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder(
            future: futureNewsData,
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  // network, server error
                  return SizedBox(
                    height: size.height,
                    width: size.width, child:
                    const Center(child: Text("Server Error")),);
                case ConnectionState.active:
                  return const CircularProgressIndicator();
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                case ConnectionState.done:
                  NewsApi newsdata = snapshot.data;
                  return (snapshot.data != null || snapshot.hasData)?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height/5,
                        width: size.width/1,
                        child: ListView.builder(
                          itemCount: newsdata.articles!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return horizontalscollfunc(size, newsdata.articles![index]);
                          },
                        ),
                      ),
                      SizedBox(
                        height: size.height/1.6,
                        width: size.width/1,
                        child: ListView.builder(
                          itemCount: newsdata.articles!.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return verticalscollfunc(context,size, newsdata.articles![index]);
                          },
                        ),
                      ),
                    ],
                  ):SizedBox(
                    height: size.height,
                    width: size.width, child:
                  const Center(child: Text("No Data Available")),);
                default:
                return SizedBox(
                  height: size.height,
                  width: size.width, child:
                  const Center(child: Text("Server Error")),);

              }
            },
          ),


        ],
      ),

    );
  }
}
