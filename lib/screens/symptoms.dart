import 'package:client/components/selection.dart';
import 'package:client/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../functions/openLink.dart';
import '../providers/symptoms.dart';

bool testval = false;

class SymptomsScreen extends StatefulWidget {
  @override
  _SymptomsScreenState createState() => _SymptomsScreenState();
}

class _SymptomsScreenState extends State<SymptomsScreen> {
  String _cough;
  String _bodyTemperature;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cough = DemoLocalization.of(context).translate('none');
    _bodyTemperature = DemoLocalization.of(context).translate('none');
  }

  @override
  Widget build(BuildContext context) {
    //Provider Symptoms
    var _symptomsProvider = Provider.of<SymptomsProvider>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          //Test
          SelectionComponent(
            title: DemoLocalization.of(context).translate('testsCovid'),
            value: _symptomsProvider.symptoms.tested,
            onChanged: (bool newValue) {
              _symptomsProvider.updateTested(newValue);
            },
          ),
          //Qaurantined or not
          SelectionComponent(
            title: 'Have you been quarantined or visited any containment zone?',
            value: _symptomsProvider.symptoms.qaurantined,
            onChanged: (bool newValue) {
              _symptomsProvider.updateQaurantined(newValue);
            },
          ),
          //Covid Positive during test
          //Dry and tight Cough
          SelectionComponent(
            title: DemoLocalization.of(context).translate('dryCough'),
            value: _symptomsProvider.symptoms.datcough,
            onChanged: (bool newValue) {
              _symptomsProvider.updateDatcough(newValue);
            },
          ),
          //Difficulty Breathing
          SelectionComponent(
            title:
                DemoLocalization.of(context).translate('difficultyBreathing'),
            value: _symptomsProvider.symptoms.difficultyBreathing,
            onChanged: (bool newValue) {
              _symptomsProvider.updateDifficultyBreathing(newValue);
            },
          ),
          //Shaking And Chills
          SelectionComponent(
            title: DemoLocalization.of(context).translate('shakingPositive'),
            value: _symptomsProvider.symptoms.shakingChills,
            onChanged: (bool newValue) {
              _symptomsProvider.updateShakingChills(newValue);
            },
          ),
          //Cough Frequency
          SelectionComponent(
            title: DemoLocalization.of(context).translate('coughFrequency'),
            value: _symptomsProvider.symptoms.coughfrequency,
            onChanged: (bool newValue) {
              _symptomsProvider.updateCoughFrequency(newValue);
            },
          ),
          _symptomsProvider.symptoms.coughfrequency
              ? ListTile(
                  title: Text(
                      DemoLocalization.of(context).translate('coughFrequency')),
                  trailing: DropdownButton<String>(
                    value: _cough,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    onChanged: (String newValue) {
                      setState(() {
                        _cough = newValue;
                      });
                    },
                    items: [
                      DemoLocalization.of(context).translate('none'),
                      DemoLocalization.of(context).translate('mild'),
                      DemoLocalization.of(context).translate('average'),
                      DemoLocalization.of(context).translate('veryFrequent'),
                      DemoLocalization.of(context).translate('severe'),
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                )
              : SizedBox(
                  height: 1,
                ),

          //Body Temperature
          SelectionComponent(
            title: DemoLocalization.of(context).translate('bodyTemperature'),
            value: _symptomsProvider.symptoms.bodyTemperature,
            onChanged: (bool newValue) {
              _symptomsProvider.updateBodyTemperature(newValue);
            },
          ),
          _symptomsProvider.symptoms.bodyTemperature
              ? ListTile(
                  title: Text(DemoLocalization.of(context)
                      .translate('bodyTemperature')),
                  trailing: DropdownButton<String>(
                    value: _bodyTemperature,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    onChanged: (String newValue) {
                      setState(() {
                        _bodyTemperature = newValue;
                      });
                    },
                    items: [
                      DemoLocalization.of(context).translate('none'),
                      DemoLocalization.of(context).translate('mild'),
                      DemoLocalization.of(context).translate('average'),
                      DemoLocalization.of(context).translate('veryFrequent'),
                      DemoLocalization.of(context).translate('severe'),
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                )
              : SizedBox(
                  height: 1,
                ),

          //Call Options
          //Doctor
          ListTile(
            title: Text(DemoLocalization.of(context).translate('callDoctor')),
            leading: Image(
              image: AssetImage('images/doctor.png'),
              width: 30,
            ),
            trailing: Icon(Icons.phone_in_talk),
            dense: true,
            onTap: () => openLink('tel://09513615550'),
          ),
          //Counsellor
          ListTile(
            title:
                Text(DemoLocalization.of(context).translate('callCounselor')),
            leading: Image(
              image: AssetImage('images/advisor.png'),
              width: 30,
            ),
            trailing: Icon(Icons.phone_in_talk),
            dense: true,
            onTap: () => openLink('tel://08448449428'),
          ),
          //Ambulance
          ListTile(
            title: Text(DemoLocalization.of(context).translate('helpline')),
            leading: Image(
              image: AssetImage('images/phone.png'),
              width: 30,
            ),
            trailing: Icon(Icons.phone_in_talk),
            dense: true,
            onTap: () => openLink('tel://108'),
          ),
          ListTile(
            title: Text(
              DemoLocalization.of(context).translate('callAmbulance'),
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            leading: Image(
              image: AssetImage('images/phoner.png'),
              width: 30,
            ),
            dense: true,
            onTap: () => openLink('tel://104'),
          ),
          SizedBox(height: 10),

          //Save Button
          FlatButton(
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'resultscreen');
            },
          ),
        ],
      ),
    );
  }
}
