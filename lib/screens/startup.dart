import 'dart:async';

import 'package:client/functions/jwt.dart';
import 'package:client/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartupScreen extends StatefulWidget {
  @override
  _StartupScreenState createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  Future<void> checkFirstSeen() async {
    String token = await JWTProvider().token;

    if (token != null) {
      // Check If user is logged in,if not redirect to Signin Screen
      return Navigator.pushNamedAndRemoveUntil(
        context,
        'mainscreen',
        ModalRoute.withName('/startupscreen'),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 300), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    //To store language loval variable
    var jwtProvider = Provider.of<JWTProvider>(context);

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(
              alignment: Alignment.center,
              image: AssetImage('images/chooseLanguage.png'),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Choose Your Language',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 8,
                        ),
                        onPressed: () async {
                          jwtProvider.changeLang('en');
                          MyApp.setLocale(context, Locale('en', 'US'));
                          Navigator.pushNamed(context, 'loginscreen');
                        },
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          'English',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      FlatButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 8,
                        ),
                        onPressed: () async {
                          jwtProvider.changeLang('mr');
                          MyApp.setLocale(context, Locale('mr', 'IN'));
                          Navigator.pushNamed(context, 'loginscreen');
                        },
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          'मराठी',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Initiative by Government of Maharashtra',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
