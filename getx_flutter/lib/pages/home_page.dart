import 'package:flutter/material.dart';
import 'package:getx_flutter/models/information.dart';
import 'package:getx_flutter/resources/strings.dart';
import 'package:getx_flutter/resources/widgets/common_widgets.dart';
import 'package:get/get.dart';

import 'information_page.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController nameController, websiteController, zaloController, descriptionController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    websiteController = TextEditingController();
    zaloController = TextEditingController();
    descriptionController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(INFORMATION_INPUT),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              // name input
              inputWidget(
                  label: NAME,
                  hintText: NAME_INPUT,
                  controller: nameController),
              // Zalo input
              inputWidget(
                  label: ZALO,
                  hintText: ZALO_INPUT,
                  controller: zaloController),
              // Website input
              inputWidget(
                  label: WEBSITE,
                  hintText: WEBSITE_INPUT,
                  controller: websiteController),
              // description input
              inputWidget(
                  label: DESCRIPTION,
                  hintText: DESCRIPTION_INPUT,
                  controller: descriptionController),
              // confirm button
              buttonWidget(
                  lable: CONFIRM,
                  colorButton: Colors.blue,
                  colorText: Colors.white,
                  onPress: (){
                    // update information to Provider
                    Get.put(Information()).updateInformation(
                        name: nameController.text,
                        zalo: zaloController.text,
                        website: websiteController.text,
                        description: descriptionController.text);

                    // Routing to Information Page
                    Get.to(InformationPage());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
