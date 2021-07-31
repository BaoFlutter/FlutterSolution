import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/app/shoe_shop/screens/payment/credit_item.dart';
import 'package:online_shop/app/shoe_shop/screens/widget/src/add_card_item.dart';

class ListCreditCard extends StatefulWidget {
  @override
  _ListCreditCardState createState() => _ListCreditCardState();
}

class _ListCreditCardState extends State<ListCreditCard> {
  PageController _pageController = PageController(initialPage: 0,viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/4,
      child: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: [
          CreditItem(title: "VISA",
          date: "15/24",
          name: "JAMES GOUSE",
          number: "0123 4567 8901 2345",
          cvc: "321",),
          CreditItem(title: "MASTERCARD",
            date: "18/25",
            name: "JAMES GOUSE",
            number: "9876 5432 1098 7654",
            cvc: "123",),
          AddCardItem(),
        ],
      ),
    );
  }
}
