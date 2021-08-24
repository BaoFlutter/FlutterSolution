import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/controllers/information_controller.dart';
import 'package:getx_flutter/resources/strings.dart';
import 'package:getx_flutter/resources/widgets/common_widgets.dart';
class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    final InformationController informationController = Get.put(InformationController());
    return Scaffold(
      appBar: AppBar(
        title: Text(INFORMATION),
        centerTitle: true,
      ),
      body: Container(
            padding: EdgeInsets.all(10) ,
            child: Obx(()=>Column(
              children: [
                informationWidget(label: NAME, content: informationController.name.value),
                Divider(),
                informationWidget(label: ZALO, content: informationController.zalo.value),
                Divider(),
                informationWidget(label: WEBSITE, content: informationController.website.value),
                Divider(),
                informationWidget(label: DESCRIPTION, content: informationController.description.value),
                Divider(),
              ],
            )),

          )

    );
  }
}
