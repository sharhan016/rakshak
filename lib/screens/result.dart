import 'package:client/components/customAppBar.dart';
import 'package:client/localization/localization.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarComponent(
        leadingWidget: Text(''),
        title: DemoLocalization.of(context).translate('eligibility'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          children: [
            FlatButton(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              child: Text(
                DemoLocalization.of(context).translate('continue'),
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'mainscreen');
              },
            )
          ],
        ),
      ),
    );
  }
}
