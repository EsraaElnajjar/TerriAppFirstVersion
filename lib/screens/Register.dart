
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/CustomEditText.dart';
import 'Login.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _RegisterState();
  static String id='Register';
}

class _RegisterState extends State<Register> {
  late bool value = false;
  final _fullNameController=TextEditingController();
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  final _confirmPasswordController=TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body:  Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 53,right: 180),
                child: Text("Register",style: TextStyle(fontSize: 44,color: Colors.orange,fontFamily: "Sen",fontWeight: FontWeight.w500),),
              ),
              SizedBox(height: 25,),
              CustomTextField(text: "Full Name",controller:_fullNameController  ,),
              SizedBox(height: 10,),
              CustomTextField(text: "Email Address",controller: _emailController,),
              SizedBox(height: 10,),
              CustomTextField(text: "Password",controller: _passwordController,),
              SizedBox(height: 10,),
              CustomTextField(text: "Confirm Password",controller: _confirmPasswordController,),
              SizedBox(height: 10,),
              Row(
                children: [
                  Checkbox(
                    activeColor: Colors.orange,
                    value: this.value,
                    onChanged: (bool? value) {
                      setState(() {
                        this.value = value!;
                      });
                    },
                  ),
                  Text("I’ve read and agree to the terms of privacy policy",style: TextStyle(color: Color(0xFF7F8192),fontSize: 12),)
                ],
              ),
              SizedBox(height: 15,),
              MaterialButton(onPressed: (){

              },
                height: 56,splashColor: Colors.white,minWidth: 332,child: Text("Register",style: TextStyle(fontSize: 18,fontFamily: "Sen",color: Colors.white,fontWeight: FontWeight.w500),),color: Colors.orange,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),),
              SizedBox(height: 20,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text("Already have an account?"),
                  ),
                  Spacer(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    InkWell(onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },child: Text('LOGIN',style: TextStyle(letterSpacing: 1.5,color: Colors.orange,fontWeight: FontWeight.w600,fontSize: 16),),),
                    SizedBox(width: 5,),
                    IconButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    }, icon:Icon(Icons.arrow_forward,size: 20,color: Colors.orange,) )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
