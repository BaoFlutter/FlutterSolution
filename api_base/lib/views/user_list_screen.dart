import 'package:api_base/data_sources/api_services.dart';
import 'package:api_base/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}
class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: FutureBuilder<List<User>>(
          future: ApiServices().fetchUser(),
          builder: (context, snapshot)
          {
            if((snapshot.hasError)||(!snapshot.hasData))
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            List<User>? userList = snapshot.data;
            return ListView.builder(
                itemCount:userList!.length,
                itemBuilder: (BuildContext context, int index) {
                  return UserItem(user: userList[index],);
                }
            );

          },
        ),

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
