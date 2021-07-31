import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/app/shoe_shop/model/response_product_model.dart';
import 'package:online_shop/generated/l10n.dart';


class SelectedColor extends StatefulWidget {
  final List<OthersImage>? othersImage;
  final Function(int)? callBackColor;
  const SelectedColor({Key? key, this.othersImage, this.callBackColor}) : super(key: key);
  @override
  _SelectedColorState createState() => _SelectedColorState();
}

class _SelectedColorState extends State<SelectedColor> {

  List<bool> iChoice =[];
  @override
  void initState() {
    setChoice();
    super.initState();
  }
  setChoice(){
    for(int i = 0 ; i < widget.othersImage!.length; i++){
      if(i == 0){
        iChoice.add(true);
      }else{
        iChoice.add(false);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(S.current!.color, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        SizedBox(width: 10,),
        ...List.generate(widget.othersImage!.length, (index) => _itemColor(context,index))
      ],
    );
  }

  _itemColor(BuildContext context,int index) {
    return GestureDetector(
      onTap: (){
        setState(() {
          iChoice[index]=true;
          for(int i = 0 ; i<iChoice.length; i++){
            if(i!=index){
              iChoice[i] = false;
            }
          }
          widget.callBackColor!(index);
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2),
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(widget.othersImage![index].urlPhoto![4])
          ),
          border:iChoice[index]?Border.all(width: 1, color: Colors.black): Border.all(width: 0.5, color: Colors.black.withOpacity(0.5))
        ),
      ),
    );
  }
}
