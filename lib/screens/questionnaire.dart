import 'package:client/components/customAppBar.dart';
import 'package:client/localization/localization.dart';
import 'package:flutter/material.dart';

import '../components/selection.dart';

enum WorkSetting { HealthCare, FirstResponder, Prison }

String travel;

class QuestionnaireScreen extends StatefulWidget {
  @override
  _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  WorkSetting _workSetting = WorkSetting.FirstResponder;
  bool tested = false;
  bool qaurantined = false;
  bool testPositive = false;
  bool difficultyBreathing = false;
  bool chronic = false;
  bool shakingChills = false;
  bool diabetes = false;
  bool fever = false;
  bool datcough = false;
  bool heartFailure = false;
  bool hypertension = false;
  bool shortNessBreath = false;

  @override
  Widget build(BuildContext context) {
    //Provider Symptoms

    return Scaffold(
      appBar: CustomAppBarComponent(
        title: 'Questionnaire',
        leadingWidget: Text(''),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 8,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Page Title
              Text(
                DemoLocalization.of(context).translate('completeGuideLines'),
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),

              //Test
              SelectionComponent(
                title: DemoLocalization.of(context).translate('testsCovid'),
                value: tested,
                // value: _symptomsProvider.symptoms.tested,
                onChanged: (bool newValue) {
                  setState(() {
                    tested = !tested;
                  });
                },
              ),
              //Qaurantined or not
              SelectionComponent(
                title: DemoLocalization.of(context).translate('positive'),
                value: qaurantined,
                // value: _symptomsProvider.symptoms.qaurantined,
                onChanged: (bool newValue) {
                  setState(() {
                    qaurantined = !qaurantined;
                  });
                },
              ),
              //Covid Positive during test
              SelectionComponent(
                title: DemoLocalization.of(context).translate('pastContact'),
                value: testPositive,
                // value: _symptomsProvider.symptoms.testPositive,
                onChanged: (bool newValue) {
                  setState(() {
                    testPositive = !testPositive;
                  });
                },
              ),
              //Cough Frequency
              ListTile(
                title: Text(
                  DemoLocalization.of(context).translate('past14'),
                ),
                trailing: DropdownButton<String>(
                  value: travel,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (String newValue) {
                    setState(() {
                      travel = newValue;
                    });
                  },
                  items: <String>[
                    DemoLocalization.of(context).translate('international'),
                    DemoLocalization.of(context).translate('domestic'),
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              //Difficulty Breathing
              SelectionComponent(
                title: DemoLocalization.of(context).translate('bloodPressure'),
                value: difficultyBreathing,
                // value: _symptomsProvider.symptoms.difficultyBreathing,
                onChanged: (bool newValue) {
                  setState(() {
                    difficultyBreathing = !difficultyBreathing;
                  });
                },
              ),

              //Single Option Work Setting
              Text(
                DemoLocalization.of(context).translate('describeWork'),
              ),
              ListTile(
                title: Text(
                  DemoLocalization.of(context).translate('healthCare'),
                ),
                leading: Radio(
                  value: WorkSetting.FirstResponder,
                  groupValue: _workSetting,
                  onChanged: (WorkSetting value) {
                    setState(() {
                      _workSetting = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                  DemoLocalization.of(context).translate('prision'),
                ),
                leading: Radio(
                  value: WorkSetting.Prison,
                  groupValue: _workSetting,
                  onChanged: (WorkSetting value) {
                    setState(() {
                      _workSetting = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                  DemoLocalization.of(context).translate('firstResponder'),
                ),
                leading: Radio(
                  value: WorkSetting.HealthCare,
                  groupValue: _workSetting,
                  onChanged: (WorkSetting value) {
                    setState(() {
                      _workSetting = value;
                    });
                  },
                ),
              ),

              //Title
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  DemoLocalization.of(context).translate('chronicalCondition'),
                ),
              ),
              //Multi Option
              SelectionComponent(
                title: DemoLocalization.of(context)
                    .translate('chronicLungDisease'),
                value: chronic,
                // value: _symptomsProvider.symptoms.difficultyBreathing,
                onChanged: (bool newValue) {
                  setState(() {
                    chronic = !chronic;
                  });
                },
              ),
              //Heat Failure
              SelectionComponent(
                title: DemoLocalization.of(context).translate('heartFailure'),
                value: shakingChills,
                // value: _symptomsProvider.symptoms.shakingChills,
                onChanged: (bool newValue) {
                  setState(() {
                    heartFailure = true;
                  });
                },
              ),
              SelectionComponent(
                title: DemoLocalization.of(context).translate('hypertension'),
                value: hypertension,
                // value: _symptomsProvider.symptoms.hypertension,
                onChanged: (bool newValue) {
                  setState(() {
                    hypertension = !hypertension;
                  });
                },
              ),
              SelectionComponent(
                title: DemoLocalization.of(context).translate('diabetesI'),
                value: diabetes,
                // value: _symptomsProvider.symptoms.shakingChills,
                onChanged: (bool newValue) {
                  setState(() {
                    diabetes = !diabetes;
                  });
                },
              ),

              //Title
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  DemoLocalization.of(context).translate('currentlySymptoms'),
                ),
              ),
              //Multi Option
              SelectionComponent(
                title: DemoLocalization.of(context).translate('fever'),
                value: fever,
                // value: _symptomsProvider.symptoms.fever,
                onChanged: (bool newValue) {
                  setState(() {
                    fever = !fever;
                  });
                },
              ),
              //Shaking And Chills
              SelectionComponent(
                title: DemoLocalization.of(context).translate('cough'),
                value: datcough,
                // value: _symptomsProvider.symptoms.datcough,
                onChanged: (bool newValue) {
                  setState(() {
                    datcough = !datcough;
                  });
                },
              ),
              SelectionComponent(
                title:
                    DemoLocalization.of(context).translate('shortNessBreath'),
                value: shortNessBreath,
                // value: _symptomsProvider.symptoms.difficultyBreathing,
                onChanged: (bool newValue) {
                  setState(() {
                    shortNessBreath = !shortNessBreath;
                  });
                },
              ),

              //Save Button
              FlatButton(
                child: Text(
                  DemoLocalization.of(context).translate('continue'),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.pushNamed(context, 'mainscreen');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
