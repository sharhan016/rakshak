import 'package:client/components/customAppBar.dart';
import 'package:client/localization/localization.dart';
import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarComponent(
        title: DemoLocalization.of(context).translate('termsService'),
        leadingWidget: Text(''),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "> " + DemoLocalization.of(context).translate('allSuggestion'),
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "> " + DemoLocalization.of(context).translate('termsLocation'),
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "> " + DemoLocalization.of(context).translate('termsSecurity'),
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "> " +
                  DemoLocalization.of(context).translate('termsNotification'),
              style: TextStyle(color: Colors.grey),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    DemoLocalization.of(context).translate('iagree'),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      'loginprofilescreen',
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
