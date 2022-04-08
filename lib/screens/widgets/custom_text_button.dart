import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
      this.title,
     this.onCallback,
  }) : super(key: key);

  final String? title;
  final VoidCallback? onCallback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 45,
        child: TextButton(
          style: TextButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.lightBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            title.toString(),
            textAlign: TextAlign.center,
            style:const TextStyle(color: Colors.white)
          ),
          onPressed:  onCallback,
        ),
      ),
    );
  }
}
