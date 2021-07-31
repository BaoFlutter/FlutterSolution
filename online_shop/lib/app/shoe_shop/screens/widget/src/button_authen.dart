import 'package:flutter/material.dart';

class ButtonAuthen extends StatefulWidget {
  final Duration? duration;
  final String? text;
  final Function()? onPress;

  const ButtonAuthen({Key? key, this.duration, this.text, this.onPress}) : super(key: key);
  @override
  _ButtonAuthenState createState() => _ButtonAuthenState();
}

class _ButtonAuthenState extends State<ButtonAuthen> with TickerProviderStateMixin{
  AnimationController? _animationController ;
  Animation<Offset>? _animation;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: widget.duration);
    Future.delayed(Duration(milliseconds: 200),(){
      _animationController!.forward();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _animation = Tween<Offset>(begin: Offset(MediaQuery.of(context).size.width,0.0),end: Offset(0.0,0.0)).animate(_animationController!);

    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child){
        return Transform.translate(
          offset: _animation!.value,
          child: child,);
      },
      child: FlatButton(
          onPressed: widget.onPress,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          ),
          color: Color(0xff2545ff),
          padding: EdgeInsets.symmetric(vertical: 17),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Center(child: Text(widget.text!,style: TextStyle(color: Colors.white, fontSize: 17),),),
          )),
    );
  }
}
