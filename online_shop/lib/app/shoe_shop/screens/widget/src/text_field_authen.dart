import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldAuthen extends StatefulWidget {
  final  String? labelText;
  TextEditingController? textEditingController;
  Function(String?)? validator;
  Function(String?)? onFieldSubmitted;
  bool? obscureText;
  TextCapitalization? textCapitalization;
  TextInputType? keyboardType;
  FocusNode? focusNode;
  TextInputAction? textInputAction;
  Duration? duration;
  bool? readOnly;
  bool? lightColor;
  Widget? suffix;
  TextFieldAuthen({Key? key,
    this.suffix,
    this.lightColor = false,
    this.readOnly = false,
    this.textEditingController,
    this.labelText,
    this.validator,
    this.obscureText = false,
    this.textCapitalization,
    this.keyboardType,
    this.onFieldSubmitted,
    this.focusNode,
    this.textInputAction,
    this.duration = const Duration(milliseconds: 300)
  }) : super(key: key);

  @override
  _TextFieldAuthenState createState() => _TextFieldAuthenState();
}

class _TextFieldAuthenState extends State<TextFieldAuthen> with TickerProviderStateMixin {
  AnimationController? _animationController ;
  Animation<Offset>? _animation;
  bool showPass = true;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: widget.duration);
    Future.delayed(Duration(milliseconds: 200),(){
      _animationController!.forward();
    });
    super.initState();
  }
  @override
  void dispose() {
    _animationController!.reverse();
    _animationController!.dispose();
    super.dispose();
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
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  offset: Offset(1.1, 1.1),
                  spreadRadius: 2,
                  blurRadius: 2
              )
            ]
        ),
        child: TextFormField(
          readOnly: widget.readOnly!,
          //validator: widget.validator!,
          controller: widget.textEditingController,
          obscureText: widget.obscureText!&&showPass,
          textCapitalization: widget.textCapitalization!,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          focusNode: widget.focusNode,
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle: TextStyle(fontSize: 14,color: Color(0xff1e319d),fontWeight: FontWeight.normal),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300.withOpacity(0.3)),
                  gapPadding: 10
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300.withOpacity(0.3)),
                  gapPadding: 10
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xff1e319d).withOpacity(0.3)),
                  gapPadding: 10
              ),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              suffixIcon:widget.obscureText!? GestureDetector(
                  onTap: (){
                    setState(() {
                      showPass =!showPass;
                    });
                  },
                  child: !showPass?Icon(Icons.visibility): Icon(Icons.visibility_off))
                  :null
          ),
          minLines: 1,
          maxLines: 1,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}