import 'package:flutter/material.dart';
import 'package:my_app/utils/dimensions.dart';
import 'package:my_app/widgets/small_text.dart';


class ExpandableTextWidget extends StatefulWidget {
  final String text;

  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);
  
  @override
  _ExpandableTextWidget createState() => _ExpandableTextWidget();
}

class _ExpandableTextWidget extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText=true;

  double textHeight = Dimensions.screenHeight/5.63;

  @override
  void initState(){
    super.initState();
    
    //check the lentgh of the text
    if(widget.text.length>textHeight){
      //Divide the text two parts (0 to textHeight and textHeight to text length)
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf=widget.text.substring(textHeight.toInt()+1, widget.text.length);
    }else{
      firstHalf=widget.text;
      secondHalf=""; //late variable type must be initialized before using it
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(color: Colors.purple, size:Dimensions.font16, text: firstHalf):Column(
        children: [
          SmallText(height:1.8, color: Colors.purple, size:Dimensions.font16, text: hiddenText?(firstHalf+"..."):(firstHalf+secondHalf)),

          //create a button
          InkWell(
            onTap: (){
              setState(() {
                hiddenText=!hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: "Show more", color: Colors.lightBlue,),
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up, color: Colors.lightBlue,)
              ],
            ),
          )
        ],
      ), //is the secondHalf is empty, use the firstHalf
    );
  }
}