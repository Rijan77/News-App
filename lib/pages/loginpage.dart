import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:flutter/material.dart';
import 'package:lab1/static.dart';


class loginPage extends StatefulWidget{
  const loginPage({super.key});

  @override
  State<StatefulWidget> createState() {
   return loginPageState();
  }

}
class loginPageState extends State<loginPage>{ 

  esewapaymentcall(){
    try {
      EsewaFlutterSdk.initPayment(
        esewaConfig: EsewaConfig(
          environment: Environment.test,
          clientId: StaticValue.CLIENT_ID,
          secretId: StaticValue.SECRET_KEY,
        ),
        esewaPayment: EsewaPayment(
          productId: "1d71jd81",
          productName: "Product One",
          productPrice: "20", callbackUrl: '',
        ),
        onPaymentSuccess: (EsewaPaymentSuccessResult data) {
          debugPrint(":::SUCCESS::: => $data");
          // verifyTransactionStatus(data);
        },
        onPaymentFailure: (data) {
          debugPrint(":::FAILURE::: => $data");
        },
        onPaymentCancellation: (data) {
          debugPrint(":::CANCELLATION::: => $data");
        },
      );
    } on Exception catch (e) {
      debugPrint("EXCEPTION : ${e.toString()}");
    }

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width/1.8,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.house,size: 30,color: Colors.blue,),
                  Icon(Icons.arrow_back,color: Colors.black,size: 30,)
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              height: size.height/3,
              width: size.width/1.1,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 15,),
                  const Text("Sign In",style: TextStyle(color: Colors.black,
                      fontSize: 17,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 15,),
                  Container(
                    height: 35,
                    width: size.width/1.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: const Center(
                      child: Text("Email",style: TextStyle(color:
                      Colors.blueGrey,fontSize: 12),),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    height: 35,
                    width: size.width/1.5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: const Center(
                      child: Text("Password",style: TextStyle(color:
                      Colors.blueGrey,fontSize: 12),),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){

                      esewapaymentcall();

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) =>  const E()),
                      // );
                    },
                    child: Container(
                      height: 50,
                      width: size.width/2,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: const Center(
                        child: Text("Signin",style: TextStyle(color:
                        Colors.white,fontSize: 12),),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}