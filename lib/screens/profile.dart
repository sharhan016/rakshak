import 'package:client/functions/jwt.dart';
import 'package:client/providers/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    var _jwtProvider = Provider.of<JWTProvider>(context, listen: false);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 16,
      ),
      child: RefreshIndicator(
        onRefresh: () async {
          await userProvider.updatedailyData();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   'Username',
            //   style: TextStyle(fontSize: 18),
            // ),
            FutureBuilder(
              future: _jwtProvider.phone,
              builder: (context, snapshot) {
                Widget child;
                if (snapshot.hasData) {
                  child = ListTile(
                    leading: Icon(Icons.phone),
                    title: snapshot.data,
                    onTap: () {},
                  );
                } else {
                  child = Text('');
                }
                return child;
              },
            ),
            Divider(thickness: 1.5),
            Text('COVID Test History'),
            FutureBuilder(
              future: userProvider.updatedailyData(),
              builder: (context, snapshot) {
                Widget child;
                if (snapshot.hasData) {
                  child = Expanded(
                    //Outer ListView Builder for Total DailyUpdates
                    child: ListView.builder(
                      itemCount: userProvider.userDailyData.length,
                      itemBuilder: (context, index) {
                        return Theme(
                          data: ThemeData(
                            primaryColor: Colors.grey[600],
                          ),
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  userProvider.userDailyData[index]['onDate'],
                                ),
                                //ListView Builder for each question in DailyUpdates
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: userProvider
                                      .userDailyData[index]['data'].length,
                                  itemBuilder: (context, innerindex) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                        top: 8,
                                      ),
                                      child: Text(
                                        userProvider.userDailyData[index]
                                                    ['data'][innerindex]
                                                ['question']['symptom'] +
                                            ' : ' +
                                            (userProvider.userDailyData[index]
                                                            ['data'][innerindex]
                                                        ['answer']['choice'] ==
                                                    'False'
                                                ? 'No'
                                                : 'Yes'),
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  child = SpinKitCircle(
                    color: Colors.black,
                    size: 50.0,
                  );
                }
                return child;
              },
            ),
          ],
        ),
      ),
    );
  }
}
