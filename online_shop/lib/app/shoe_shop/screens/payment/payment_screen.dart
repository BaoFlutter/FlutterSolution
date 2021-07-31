import 'package:flutter/material.dart';
import 'package:online_shop/data_source/assets_link/assets_links.dart';
import 'package:online_shop/generated/l10n.dart';

import 'list_credit_card.dart';

class PaymentScreen extends StatefulWidget {

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  List<bool> selectedMethods = [true,false,false,false];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(icon: Icon(Icons.chevron_left), onPressed: (){
          Navigator.pop(context);}),
        title: Text(S.current!.payment, style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: _mainBody(context),
    );
  }

  _mainBody(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                _headerPaymentMethod(context),
                _paymentMethod(context),
              ],
            ),
          ),
          _payment(context)
        ],
      ),
    );
  }

  _headerPaymentMethod(BuildContext context) {
    return ListCreditCard();
  }

  _paymentMethod(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Text(S.current!.payment_methods, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          _itemRowMethod(iconLink: IconsLinks().credit, title: "Credit Card" ,index: 0),
          _itemRowMethod(iconLink: IconsLinks().payPal, title: "PayPal" ,index: 1),
          _itemRowMethod(iconLink: IconsLinks().google, title: "Google Play" ,index: 2),
          _itemRowMethod(iconLink: IconsLinks().stripe, title: "Stripe" ,index: 3),
          SizedBox(height: 200,)
      ],),
    );
  }

  _itemRowMethod({ String? iconLink, String? title, int? index}) {
    return  SwitchListTile(
      value: selectedMethods[index!],
      onChanged: (val){
        setState(() {
          selectedMethods[index]=val;

          for(int i = 0 ; i< selectedMethods.length; i++){
            if(i != index){
              if(selectedMethods.every((element) => element==false)){
                selectedMethods[0]= true;
              }else{
                selectedMethods[i]= false;
              }

            }
          }
        });
      },
     title: Text(title!,style: TextStyle(fontSize: 16),),
      secondary: Image.asset(iconLink!, height: 24,width: 24,),

    );
  }

  _payment(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Text(S.current!.shipping_fee,style: TextStyle(fontSize: 16),),
                  Spacer(),
                  Text("\$10"),
                ],
              ),
              Row(
                children: [
                  Text(S.current!.sub_total,style: TextStyle(fontSize: 16),),
                  Spacer(),
                  Text("\$170",style: TextStyle(fontSize: 16),),
                ],
              ),
              Row(
                children: [
                  Text(S.current!.total, style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  Spacer(),
                  Text("\$180",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 20,),
              FlatButton(
                splashColor: Colors.white.withOpacity(0.3),
                  color: Colors.black,
                  onPressed: (){},
                  padding: EdgeInsets.all(15),
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: Text(S.current!.payment, style: TextStyle(fontSize: 16,color: Colors.white),),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
