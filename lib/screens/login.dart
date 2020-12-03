import 'package:client/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/customAppBar.dart';

//Phone Number
String number;

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarComponent(
        leadingWidget: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: DemoLocalization.of(context).translate('login'),
      ),
      body: Builder(
        builder: (context) => Container(
          padding: EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Logo
              Image(
                image: AssetImage('images/pageLogo_1.png'),
                height: 95,
              ),
              SizedBox(
                height: 20,
              ),

              //Phone Number
              TextFormField(
                decoration: InputDecoration(
                  prefix: Container(
                    child: Text('+91'),
                    margin: EdgeInsets.only(right: 5),
                  ),
                  hintText:
                      DemoLocalization.of(context).translate('mobilNumber'),
                ),
                maxLength: 10,
                maxLines: 1,
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  number = value;
                },
              ),
              SizedBox(
                height: 20,
              ),

              //Message
              Flexible(
                child: Text(
                  DemoLocalization.of(context).translate('receiveText'),
                  style: TextStyle(
                    color: Colors.green[400],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    DemoLocalization.of(context).translate('submit'),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    if (number == null || number.length != 10) {
                      final snackBar = SnackBar(
                        content: Text("Please enter a valid phone number."),
                      );
                      return Scaffold.of(context).showSnackBar(snackBar);
                    }
                    //Function for sending opt
                    //Function Here//
                    Navigator.pushNamed(
                      context,
                      'otpcheckscreen',
                      arguments: number,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
