import 'package:flutter/material.dart';
import 'package:online_shop/app/shoe_shop/screens/payment/payment_screen.dart';
import 'package:online_shop/generated/l10n.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class SelectedLocationScreen extends StatefulWidget {
  @override
  _SelectedLocationScreenState createState() => _SelectedLocationScreenState();
}

class _SelectedLocationScreenState extends State<SelectedLocationScreen> {
  List<bool> selectedLocation = [true,false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(icon: Icon(Icons.chevron_left), onPressed: (){
          Navigator.pop(context);}),
        title: Text(S.current!.shipping_to, style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: _mainBody(context),
    );
  }

  _mainBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _locationItem(context: context, index: 0,title: "Home",sub: "Brooklyn, New York, US"),
          SizedBox(height: 20,),
          _locationItem(context: context, index: 1,title: "Office",sub: "Brooklyn, New York, US"),
          SizedBox(height: 20,),
          FlatButton(onPressed: (){},
              color: Colors.white,
              padding: EdgeInsets.all(10),
              shape: CircleBorder(     side: BorderSide(color: Colors.grey,width: 0.5)         ),
              child: Icon(Icons.add)),
          SizedBox(height: 20,),
          FlatButton(
              splashColor: Colors.white.withOpacity(0.3),
              color: Colors.black,
              onPressed: (){
                pushNewScreen(context,screen: PaymentScreen(),withNavBar: false);
              },
              padding: EdgeInsets.all(15),
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Text(S.current!.set_payment, style: TextStyle(fontSize: 16,color: Colors.white),),
              ))
        ],
      ),
    );
  }

  _locationItem({BuildContext? context, int? index, String? title, String? sub}) {
    return Container(
      width: MediaQuery.of(context!).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:  Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xff000000).withOpacity(0.25),
            offset: Offset(2,2),
            blurRadius: 2
          )
        ]
      ),
      child: RadioListTile(
        value: selectedLocation[index!],
        onChanged: (val){
          setState(() {
            selectedLocation[index]=true;
            for(int i =0; i<selectedLocation.length; i++){
              if(i!=index){
                selectedLocation[i] = false;
              }
            }
          });
        },
        groupValue: true,
        title: Text(title!,),
        secondary: IconButton(icon: Icon(Icons.edit), onPressed: (){
          print("E");
        },iconSize: 24,),
        subtitle: Text(sub!),
      ),
    );
  }
}
