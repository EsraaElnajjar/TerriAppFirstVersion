
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/CustomEditText.dart';
import 'Register.dart';
import 'homePage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
  static String id='Login';
}

class _LoginState extends State<Login> {
  late bool value = false;
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
                padding: EdgeInsets.only(top: 53,right: 210),
                child: Text("Log In",style: TextStyle(fontSize: 44,color: Colors.orange,fontFamily: "Sen",fontWeight: FontWeight.w500),),
              ),
              SizedBox(height: 20,),
              CustomTextField(text: "Enter Email Address",controller: _emailController,),
              SizedBox(height: 10,),
              CustomTextField(text: "Password",controller: _passwordController,),
              SizedBox(height: 10,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Forgot Password?",style: TextStyle(color: Colors.orange,fontSize: 13,decoration: TextDecoration.underline,),),
                  )
                ],
              ),
              SizedBox(height: 20,),
              MaterialButton(onPressed: (){
               Navigator.pushNamed(context, HomePage.id);
              },
                height: 56,splashColor: Colors.white,minWidth: 332,child: Text("Login",style: TextStyle(fontSize: 18,fontFamily: "Poppins",color: Colors.white,fontWeight: FontWeight.w500),),color: Colors.orange,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),),
              SizedBox(height: 20,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text("No account Yet?"),
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
                        MaterialPageRoute(builder: (context) => const Register()),
                      );
                    },child: Text('SIGN UP',style: TextStyle(letterSpacing: 1.5,color: Colors.orange,fontWeight: FontWeight.w600,fontSize: 16),),),
                    SizedBox(width: 5,),
                    IconButton(onPressed: (){

                    }, icon:Icon(Icons.arrow_forward,size: 20, color: Colors.orange,) )
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
