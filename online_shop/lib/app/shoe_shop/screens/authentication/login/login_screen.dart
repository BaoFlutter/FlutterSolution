import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/app/shoe_shop/screens/authentication/register/register_screen.dart';
import 'package:online_shop/app/shoe_shop/screens/root_screen/root_screen.dart';
import 'package:online_shop/app/shoe_shop/screens/widget/src/button_authen.dart';
import 'package:online_shop/app/shoe_shop/screens/widget/src/text_field_authen.dart';


// ignore: must_be_immutable
class ShoeLoginScreen extends StatelessWidget {
  FocusNode _emailNode = FocusNode();
  FocusNode _passNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainBody(context),
    );
  }

  _mainBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height: AppBar().preferredSize.height+50,),
            Text("Shoe Shop", style: TextStyle(fontSize: 28, color: Color(0xff1e319d),fontWeight: FontWeight.w500),),
            SizedBox(height: 50,),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 20),
                child: Text("Login to your account", style: TextStyle(fontSize: 18),)),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: _formLogin(context),
            ),


          ],
        ),
      ),
    );
  }

  _formLogin(BuildContext context) {
    return Column(
      children: [
        TextFieldAuthen(
          labelText: "Email",
          textCapitalization: TextCapitalization.none,
          keyboardType: TextInputType.emailAddress,
          textEditingController: TextEditingController(),
          textInputAction: TextInputAction.next,
          focusNode: _emailNode,
          onFieldSubmitted: (term){
            _fieldFocusChange(context, _emailNode, _passNode);
          },
        ),
        SizedBox(height: 10,),
        TextFieldAuthen(
          labelText: "Pasword",
          duration: Duration(milliseconds: 400),
          obscureText: true,
          textCapitalization: TextCapitalization.none,
          keyboardType: TextInputType.text,
          textEditingController: TextEditingController(),
          textInputAction: TextInputAction.done,
          focusNode: _passNode,
        ),
        SizedBox(height: 10,),
        ButtonAuthen(
          duration: Duration(milliseconds: 500),
          text: "Login",
          onPress: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RootScreen()));
          },
        ),
        SizedBox(height: 50,),
        RichText(text: TextSpan(
          children: [
            TextSpan(text: "Don't have an acount? ",  style: TextStyle(color: Color(0xff000000))),
            TextSpan(text: "Sign up",
              style: TextStyle(color: Color(0xff2545ff),fontWeight: FontWeight.bold),
              recognizer: new TapGestureRecognizer()..onTap = () => Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen())),
            ),
          ]
        ))
      ],
    );
  }

  /// Change focus text Field
  _fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
