import 'package:client/screens/login.dart';
import 'package:client/screens/loginprofile.dart';
import 'package:client/screens/otpcheck.dart';
import 'package:client/screens/questionnaire.dart';
import 'package:client/screens/result.dart';
import 'package:client/screens/startup.dart';
import 'package:client/screens/terms.dart';
import 'package:flutter/material.dart';

import './screens/main.dart';
import './screens/donate.dart';
import './screens/helpline.dart';
import './screens/bankdetails.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'mainscreen':
        return MaterialPageRoute(builder: (_) => MainScreen());
      case 'donatescreen':
        return MaterialPageRoute(builder: (_) => DonateScreen());
      case 'helplinescreen':
        return MaterialPageRoute(builder: (_) => HelplineScreen());
      case 'bankdetailsscreen':
        return MaterialPageRoute(builder: (_) => BankDetailsScreen());
      case 'loginscreen':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case 'loginprofilescreen':
        return MaterialPageRoute(builder: (_) => LoginProfileScreen());
      case 'questionnairescreen':
        return MaterialPageRoute(builder: (_) => QuestionnaireScreen());
      case 'startupscreen':
        return MaterialPageRoute(builder: (_) => StartupScreen());
      case 'termsscreen':
        return MaterialPageRoute(builder: (_) => TermsScreen());
      case 'resultscreen':
        return MaterialPageRoute(builder: (_) => ResultScreen());
      case 'otpcheckscreen':
        var data = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => OtpCheckScreen(
            number: data,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Container(
              child: Center(
                child: Text('Check Route Name'),
              ),
            ),
          ),
        );
    }
  }
}
