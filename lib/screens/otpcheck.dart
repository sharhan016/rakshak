import 'package:client/localization/localization.dart';
import 'package:client/providers/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/customAppBar.dart';
import '../functions/jwt.dart';

List<String> _otp = ["0", "0", "0", "0", "0", "0"];

updateotp(int index, String char) {
  _otp.removeAt(index);
  _otp.insert(index, char);
}

String _verificationId;

Future registerUser(
    String mobile, BuildContext context, String code, String number) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  _auth.verifyPhoneNumber(
    phoneNumber: mobile,
    timeout: Duration(seconds: 3),
    verificationCompleted: (AuthCredential authCredential) {
      _auth.signInWithCredential(authCredential).then((AuthResult result) {
        _otpPass(context, number);
      }).catchError((e) {
        print(e);
      });
    },
    verificationFailed: (AuthException authException) {
      print(authException.message);
    },
    codeSent: (String verificationId, [int forceResendingToken]) {
      _verificationId = verificationId;
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      verificationId = verificationId;
    },
  );
}

void verifycode(BuildContext context, String number) async {
//Function for checking opt
  //Function Here//
  FirebaseAuth auth = FirebaseAuth.instance;

  //Otp code
  String smsCode = _otp.join('');

  var _credential = PhoneAuthProvider.getCredential(
      verificationId: _verificationId, smsCode: smsCode);
  auth.signInWithCredential(_credential).then((AuthResult result) {
    _otpPass(context, number);
    print('code sent');
  }).catchError((e) {
    print(e);
  });
}

_otpPass(BuildContext context, String number) async {
  //Set the token in function, remove from here
  String token = await UserProvider().loginuser(number);
  print(token);
  //token stored in local storage
  JWTProvider().setToken(token, number);
  Navigator.pushNamedAndRemoveUntil(
    context,
    'termsscreen',
    ModalRoute.withName('/startupscreen'),
  );
}

class OtpCheckScreen extends StatefulWidget {
  //Globalkey for form
  final String number;
  OtpCheckScreen({@required this.number});

  @override
  _OtpCheckScreenState createState() => _OtpCheckScreenState();
}

class _OtpCheckScreenState extends State<OtpCheckScreen> {
  final _otpKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    registerUser(
        '+91' + widget.number, context, _otp.toString(), widget.number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarComponent(
        title: 'Verification',
        leadingWidget: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 16,
        ),
        child: SingleChildScrollView(
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

              //Message
              Text(
                DemoLocalization.of(context).translate('sendNumberText') +
                    '${widget.number}',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),

              Text('Enter Code'),
              //Enter Code
              Builder(builder: (context) {
                return Form(
                  key: _otpKey,
                  child: Row(
                    children: [
                      Container(
                        width: 32,
                        margin: EdgeInsets.all(8),
                        child: TextFormField(
                          validator: (value) => value.length == 0 ? '' : null,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(counterText: ''),
                          maxLength: 1,
                          onChanged: (str) {
                            if (str.length >= 1) {
                              FocusScope.of(context).nextFocus();
                              updateotp(0, str);
                            }
                          },
                        ),
                      ),
                      Container(
                        width: 32,
                        margin: EdgeInsets.all(8),
                        child: TextFormField(
                          validator: (value) => value.length == 0 ? '' : null,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(counterText: ''),
                          maxLength: 1,
                          onChanged: (str) {
                            if (str.length >= 1) {
                              FocusScope.of(context).nextFocus();
                              updateotp(1, str);
                            }
                          },
                        ),
                      ),
                      Container(
                        width: 32,
                        margin: EdgeInsets.all(8),
                        child: TextFormField(
                          validator: (value) => value.length == 0 ? '' : null,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(counterText: ''),
                          maxLength: 1,
                          onChanged: (str) {
                            if (str.length >= 1) {
                              FocusScope.of(context).nextFocus();
                              updateotp(2, str);
                            }
                          },
                        ),
                      ),
                      Container(
                        width: 32,
                        margin: EdgeInsets.all(8),
                        child: TextFormField(
                          validator: (value) => value.length == 0 ? '' : null,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(counterText: ''),
                          maxLength: 1,
                          onChanged: (str) {
                            if (str.length >= 1) {
                              FocusScope.of(context).nextFocus();
                              updateotp(3, str);
                            }
                          },
                        ),
                      ),
                      Container(
                        width: 32,
                        margin: EdgeInsets.all(8),
                        child: TextFormField(
                          validator: (value) => value.length == 0 ? '' : null,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(counterText: ''),
                          maxLength: 1,
                          onChanged: (str) {
                            if (str.length >= 1) {
                              FocusScope.of(context).nextFocus();
                              updateotp(4, str);
                            }
                          },
                        ),
                      ),
                      Container(
                        width: 32,
                        margin: EdgeInsets.all(8),
                        child: TextFormField(
                          validator: (value) => value.length == 0 ? '' : null,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(counterText: ''),
                          maxLength: 1,
                          onChanged: (str) {
                            if (str.length >= 1) {
                              FocusScope.of(context).nextFocus();
                              updateotp(5, str);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(height: 16),

              //Submit
              Builder(
                builder: (context) {
                  return Column(
                    children: [
                      //Resend button
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: Text(DemoLocalization.of(context)
                              .translate('resendCode')),
                        ),
                        onTap: () {
                          final snackBar = SnackBar(
                            content: Text(
                              "OTP has been resent to the number provided.",
                            ),
                          );
                          registerUser('+91' + widget.number, context,
                              _otp.toString(), widget.number);
                          return Scaffold.of(context).showSnackBar(snackBar);
                        },
                      ),

                      //Submit Button
                      FlatButton(
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          DemoLocalization.of(context).translate('submit'),
                          style: TextStyle(color: Colors.white),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        onPressed: () {
                          if (!_otpKey.currentState.validate()) {
                            final snackBar = SnackBar(
                              content: Text("Please enter a valid OTP"),
                            );
                            return Scaffold.of(context).showSnackBar(snackBar);
                          }
                          //Verifying code
                          verifycode(context, widget.number);
                        },
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
