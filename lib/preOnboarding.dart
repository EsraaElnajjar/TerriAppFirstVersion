import 'package:flutter/material.dart';
import 'package:terristore/screens/Register.dart';

class PreOnboard extends StatelessWidget {
  const PreOnboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("images/try.png",fit: BoxFit.fill,height: double.infinity,width: double.infinity,),
          Padding(
            padding: const EdgeInsets.only(top: 420,left: 110),
            child: Text("TERRI STORE",style: TextStyle(color: Colors.orange,fontSize: 26,fontFamily:'Sen'),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 700,left: 240),
            child: MaterialButton(
              minWidth: 70,
                elevation: 10,splashColor: Color(0xff0a837e),color: Colors.orange,onPressed: (){
              Navigator.pushNamed(context, Register.id);
            },child: Text('Get Started',style: TextStyle(color: Color(0xff0a837e),fontSize: 18),)),
          )
        ],
      ),
    );
  }
}
