import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/models/information.dart';
import 'package:getx_flutter/resources/strings.dart';
import 'package:getx_flutter/resources/widgets/common_widgets.dart';
class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    final Information information = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(INFORMATION),
        centerTitle: true,
      ),
      body: Container(
            padding: EdgeInsets.all(10) ,
            child: Column(
              children: [

                informationWidget(label: NAME, content: information.name),
                Divider(),
                informationWidget(label: ZALO, content: information.zalo),
                Divider(),
                informationWidget(label: WEBSITE, content: information.website),
                Divider(),
                informationWidget(label: DESCRIPTION, content: information.description),
                Divider(),

              ],
            ),

          )

    );
  }
}
