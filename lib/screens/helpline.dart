import 'package:client/components/customAppBar.dart';
import 'package:flutter/material.dart';

class HelplineScreen extends StatelessWidget {
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
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Flexible(
                child: Text(
                  'Contact your nearest hospital for information',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff000000),
                      offset: Offset(0, 0),
                      blurRadius: 0,
                    ),
                  ],
                  border: Border.all(
                    color: Colors.grey[300],
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text('State Control room number'),
                      trailing: Text(
                        '020 2456 678 222',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('National helpline number'),
                      trailing: Text(
                        '020 2456 678 222',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('State Control room number'),
                      trailing: Text(
                        '+91 11 2397 8046',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Toll-free number'),
                      trailing: Text(
                        '104',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Ambulance number'),
                      trailing: Text(
                        '108',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Covid Modat'),
                      trailing: Text(
                        '09513615550',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
