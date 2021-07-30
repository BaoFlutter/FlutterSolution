import 'package:flutter/material.dart';
import 'package:mvvm/data_sources/api_services.dart';
import 'package:mvvm/models/user.dart';

class UserListViewModel with ChangeNotifier{

  List<User> userList = [];

  fetchUserList() async {
    this.userList  = await ApiServices().fetchUser();
    notifyListeners();
  }

}