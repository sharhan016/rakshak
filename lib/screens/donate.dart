import 'package:client/functions/openLink.dart';
import 'package:flutter/material.dart';

import '../components/customAppBar.dart';

class DonateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarComponent(
        title: 'Donate Now',
        leadingWidget: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 50,
          left: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: Text(
                'Contribute Your Donation via',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Image(
                image: AssetImage('images/paytm.png'),
                width: 70,
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => openLink(
                  'https://paytm.com/helpinghand/maharashtra-chief-minister-s-relief-fund'),
            ),
            ListTile(
              leading: Image(
                image: AssetImage('images/bhim.png'),
                width: 80,
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => openLink(
                  'https://www.bhimupi.org.in/cm-relief-fund-maharashtra'),
            ),
            ListTile(
              leading: Image(
                image: AssetImage('images/account.png'),
                width: 50,
              ),
              title: Text('Bank Transfer Details'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.pushNamed(context, 'bankdetailsscreen'),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Image(
                image: AssetImage('images/payment.png'),
                width: 50,
              ),
              title: Text('Online Payments'),
              onTap: () => openLink(
                  'https://cmrf.maharashtra.gov.in/CMRFCitizen/DonationOnlineForm.action'),
              trailing: Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }
}
