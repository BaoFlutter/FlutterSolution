import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/data_sources/api_services.dart';
import 'package:mvvm/models/user.dart';
import 'package:mvvm/resources/strings.dart';
import 'package:mvvm/view_model/user_list_view_model.dart';
import 'package:provider/provider.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}
class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserListViewModel>(context, listen: false).fetchUserList();
  }
  @override
  Widget build(BuildContext context) {
    final userListOnProvider = Provider.of<UserListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(USER_LIST),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: userListOnProvider.userList.length!= 0 ?
        ListView.builder(
            itemCount: userListOnProvider.userList.length,
            itemBuilder: (BuildContext context, int index) {
              return UserItem(user: userListOnProvider.userList[index],);
            }
        ):
            Center(
              child: Container(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(),
              ),
            )
      ),
      
    );
  }
}

class UserItem extends StatelessWidget {
  User? user;
  UserItem({this.user});

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: 20.0),
      child: new Row(
        children: <Widget>[
          new Container(
            height: 80.0,
            width: 80.0,
            margin: new EdgeInsets.only(right: 20.0),
            child: new CircleAvatar(
              backgroundImage: new NetworkImage(user!.picture!.medium!),
            ),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                user!.name!.first! + " " + user!.name!.last!,
                style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                   ),
              ),
              new Container(
                margin: new EdgeInsets.only(top: 10.0),
                child: new Text(
                  user!.email!,
                  style: new TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey,
                      ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
