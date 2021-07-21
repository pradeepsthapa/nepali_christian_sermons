import 'package:ccbclibrary/presentation/screens/homepage.dart';
import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("😭",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            SizedBox(height: 15,),
            Text("No Internet Connection!",style: TextStyle(color: Colors.grey[500],fontWeight: FontWeight.bold,fontSize: 24),),
            TextButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomePage()));
            }, child: Text("Retry"))
          ],
        ),
      ),
    );
  }
}
