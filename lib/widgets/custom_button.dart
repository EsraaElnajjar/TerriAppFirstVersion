import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key,required this.onpressed});
   Function () onpressed;
   @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      height: 56,splashColor: Colors.white,minWidth: double.infinity,
      child: Text("Update ",style: TextStyle(fontSize: 18,color: Colors.white,),),
      color: Colors.blue,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),);
  }
}
