import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class TodoCard extends StatelessWidget {
  double screenWidth = 0.0;
  TodoCard(
      {required this.title,
        required this.endTime,
        required this.isCompleted,
        required this.onTap,
        required this.onValueChanged,
        required this.startTime});

  String title;
  String startTime;
  String endTime;
  bool isCompleted;
  final onTap;
  final onValueChanged;

  @override
  Widget build(BuildContext context) {

    return ListTile(
      tileColor: Colors.white,
      onTap:onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffb4b4b4).withOpacity(0.25)//greycolor
        ),
        height: screenWidth * 0.15,
        width: screenWidth * 0.15,
      
      ),
      title: Text(title,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
      subtitle: Text("$startTime - $endTime",style: const TextStyle(fontSize: 16,color: Color(0xffb4b4b4)),),
      trailing: CupertinoSwitch(value: isCompleted, onChanged: onValueChanged,activeColor: Color(0xff3787eb),),
    );
  }
}