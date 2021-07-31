import 'package:flutter/material.dart';
import 'package:online_shop/app/shoe_shop/screens/root_screen/root_screen.dart';
import 'package:online_shop/app/shoe_shop/screens/widget/src/button_authen.dart';
import 'package:online_shop/app/shoe_shop/screens/widget/src/text_field_authen.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  FocusNode _emailNode = FocusNode();
  FocusNode _passNode = FocusNode();
  FocusNode _confirmPassNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Color(0xff1e319d)),
      ),
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
                child: Text("Create your account", style: TextStyle(fontSize: 18),)),
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
          textInputAction: TextInputAction.next,
          focusNode: _passNode,
          onFieldSubmitted: (term){
            _fieldFocusChange(context, _passNode, _confirmPassNode);
          },
        ),
        SizedBox(height: 10,),
        TextFieldAuthen(
          labelText: "Confirm Pasword",
          duration: Duration(milliseconds: 500),
          obscureText: true,
          textCapitalization: TextCapitalization.none,
          keyboardType: TextInputType.text,
          textEditingController: TextEditingController(),
          textInputAction: TextInputAction.done,
          focusNode: _confirmPassNode,
        ),
        SizedBox(height: 10,),
        ButtonAuthen(
          duration: Duration(milliseconds: 600),
          text: "Sign up",
          onPress: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>RootScreen()),ModalRoute.withName('/'),);
          },
        ),
        SizedBox(height: 50,),

      ],
    );
  }

  /// Change focus text Field
  _fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
