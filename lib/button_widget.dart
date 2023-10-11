import 'package:flutter/material.dart';

class ButtoonWidget extends StatelessWidget {
  String title;
  Function onClick;

  ButtoonWidget(this.title, this.onClick);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(1),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: () {
            onClick(title);
          },
          child: Text(
            title,
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
