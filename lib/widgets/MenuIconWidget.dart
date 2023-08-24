import 'package:flutter/material.dart';

class MenuIconWidget extends StatelessWidget {
  String? image;
  String? title;
  void Function()? onTap;

  MenuIconWidget({Key? key, this.title, this.image, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        height: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image!,
              width: 60,
              height: 55,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              title!,
              // maxLines: 3,
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
