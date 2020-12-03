import 'package:flutter/material.dart';

class CustomAppBarComponent extends PreferredSize {
  final String title;
  final Widget leadingWidget;
  CustomAppBarComponent({@required this.title, @required this.leadingWidget});

  @override
  Size get preferredSize => Size.fromHeight(130);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 25,
        left: 10,
        right: 25,
      ),
      height: preferredSize.height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leadingWidget,
          Flexible(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Image(
            image: AssetImage('images/splashLogo.png'),
            width: 50,
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(45),
        ),
      ),
    );
  }
}
