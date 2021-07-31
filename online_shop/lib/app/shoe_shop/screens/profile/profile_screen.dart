import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/data_source/assets_link/assets_links.dart';
import 'package:online_shop/generated/l10n.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyMain(context),
    );
  }

  _bodyMain(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: AppBar().preferredSize.height,
          ),
          _profileTile(context),
          SizedBox(
            height: 30,
          ),
          _itemSelectedRow(
              title: S.current!.location,
              iconLink: IconsLinks().location,
              subTitle: "Brooklyn, New York, US"),

          _itemSelectedRow(
              title: S.current!.payment_methods,
              iconLink: IconsLinks().creditCard,
              subTitle: S.current!.none_payment_method),

          _itemSelectedRow(
              title: S.current!.favourites,
              iconLink: IconsLinks().outlineFavourite,),

          _itemSelectedRow(
            title: S.current!.history,
            iconLink: IconsLinks().history,),

          _itemSelectedRow(
            title: S.current!.help_support,
            iconLink: IconsLinks().support,),

          _logOut()
        ],
      ),
    );
  }

  _profileTile(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 15),
          width: MediaQuery.of(context).size.width/4,
          height: MediaQuery.of(context).size.width/4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/8),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(ImageLinks().avatar)
            )
          ),
        ),
        _detailsProfile(context)
      ],
    );
  }

  _detailsProfile(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 20,left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/2,
                    child: AutoSizeText("James Gouse",maxLines: 1,minFontSize: 1, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                Icon(Icons.edit_outlined)
              ],
            ),
            Text("jamesgouse@gmail.com",style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),),
            SizedBox(height: 8,),
            _typeMember(context),
          ],
        ),
      ),
    );
  }

  _typeMember(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          alignment: Alignment.center,
          width: 100,
          height: 33,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xffFFCD1A),
                Color(0xffFFCD1A).withOpacity(0.62),
                Color(0xffFFCD1A),
              ]
            )
          ),
          child: Text(S.current!.golden_mem,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, color: Colors.white), ),
        ),
        Text(S.current!.upgrade,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold, color: Color(0xff0B07CD)),)
      ],
    );
  }

  _itemSelectedRow({String? iconLink, String? title, String? subTitle}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(iconLink!,width: 24,height: 24,),
              SizedBox(width: 5,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title!, style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                    subTitle!=null? SizedBox(height: 9,):SizedBox(),
                    subTitle!=null? Text(subTitle, style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),):SizedBox(),
                  ],
              ),
              Spacer(),
              Icon(Icons.chevron_right)
            ],
          ),
          Divider(thickness: 1,)
        ],
      ),
    );
  }

  _logOut() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: FlatButton(
          onPressed: (){},
          child: Text(S.current!.logout,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
    );
  }
}
