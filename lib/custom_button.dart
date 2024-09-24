import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  // const CustomButton({super.key});
  String label;
  int index;
  void Function(int) onpressed;
  CustomButton({required this.label,required this.onpressed,required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(2),
      // width: double.infinity,
      // height: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black.withOpacity(0.8),
            shape: RoundedRectangleBorder(),
            // padding: EdgeInsets.symmetric(vertical: 20)
          ),
          onPressed: (){
            onpressed(index);
          },
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          )),
    );
  }
}
