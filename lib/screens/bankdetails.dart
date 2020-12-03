import 'package:client/components/customAppBar.dart';
import 'package:client/functions/openLink.dart';
import 'package:flutter/material.dart';

class BankDetailsScreen extends StatelessWidget {
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
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            //1st Card
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 0),
                    blurRadius: 10,
                  ),
                ],
                color: Colors.white,
              ),
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    leading: Text('Name of Fund:'),
                    title: Text(
                      'Chief Minister\'s Relief Fund (Main)',
                      textAlign: TextAlign.start,
                    ),
                  ),
                  ListTile(
                    dense: true,
                    leading: Text('Fund A/c in Bank:'),
                    title: Text('State Bank Of India'),
                  ),
                  ListTile(
                    dense: true,
                    leading: Text('Account No.:'),
                    title: Text('10972433751'),
                  ),
                  ListTile(
                    dense: true,
                    leading: Text('IFSC Code:'),
                    title: Text('SBIN0000300'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            //2nd Card
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 0),
                    blurRadius: 10,
                  ),
                ],
                color: Colors.white,
              ),
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    leading: Text('Name of Fund:'),
                    title: Text(
                      'Chief Minister\'s Relief Fund (COVID 19)',
                      textAlign: TextAlign.start,
                    ),
                  ),
                  ListTile(
                    dense: true,
                    leading: Text('Fund A/c in Bank:'),
                    title: Text('State Bank Of India'),
                  ),
                  ListTile(
                    dense: true,
                    leading: Text('Account No.:'),
                    title: Text('39239591720'),
                  ),
                  ListTile(
                    dense: true,
                    leading: Text('IFSC Code:'),
                    title: Text('SBIN0000300'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            //Link To the Website
            GestureDetector(
              child: Text(
                'Link To Website',
                style: TextStyle(
                  color: Colors.blueGrey[200],
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () => openLink(
                'https://cmrf.maharashtra.gov.in/CMRFCitizen/faqaction.action',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Row(
//                 children: [
//                   Flexible(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Text('Name of Fund:'),
//                         Text('Fund A/c in Bank:'),
//                         Text('Account No.:'),
//                         Text('IFSC Code:'),
//                       ],
//                     ),
//                   ),
//                   Flexible(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Text('Chief Minister\'s Relief Fund (Main)'),
//                         Text('State Bank Of India'),
//                         Text('10972433751'),
//                         Text('SBIN0000300'),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
