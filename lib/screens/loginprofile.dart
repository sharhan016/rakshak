import 'package:client/components/customAppBar.dart';
import 'package:client/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class LoginProfileScreen extends StatefulWidget {
  @override
  _LoginProfileScreenState createState() => _LoginProfileScreenState();
}

enum Sex { male, female, other }

class _LoginProfileScreenState extends State<LoginProfileScreen> {
  //Globalkey for form
  final _formKey = GlobalKey<FormState>();
  //Radio Option for Sex
  Sex _sex = Sex.male;
  //DropDown
  String _dropDownValue = "Doctor";
  //Location
  String address;
  Future<void> _getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var location = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);
    address = location[0].thoroughfare +
        ' ' +
        location[0].locality +
        ' ' +
        location[0].postalCode;
  }

  //locationController
  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarComponent(
        leadingWidget: Text(''),
        title: DemoLocalization.of(context).translate('profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 16,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Username
                TextFormField(
                  decoration: InputDecoration(
                    hintText: DemoLocalization.of(context).translate('name'),
                  ),
                  maxLines: 1,
                  validator: (String value) => value.isEmpty
                      ? DemoLocalization.of(context).translate('firstName')
                      : null,
                ),
                SizedBox(height: 10),

                //Email
                TextFormField(
                  decoration: InputDecoration(
                    hintText: DemoLocalization.of(context).translate('email'),
                  ),
                  maxLines: 1,
                ),
                SizedBox(height: 10),

                //Location
                TextFormField(
                  controller: locationController,
                  decoration: InputDecoration(
                    hintText:
                        DemoLocalization.of(context).translate('location'),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.location_searching),
                      onPressed: () async {
                        await _getLocation();
                        locationController.text = address;
                      },
                    ),
                  ),
                  validator: (String value) => value.isEmpty
                      ? DemoLocalization.of(context).translate('location')
                      : null,
                ),
                SizedBox(height: 10),

                //Age
                TextFormField(
                  decoration: InputDecoration(
                    hintText: DemoLocalization.of(context).translate(''),
                  ),
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  maxLines: 1,
                  maxLength: 2,
                  validator: (String value) =>
                      value.isEmpty ? 'Please enter your age' : null,
                  onSaved: (String value) {
                    print(value);
                  },
                ),
                SizedBox(height: 10),

                //Doctor,Counsellor or other
                DropdownButton<String>(
                  value: _dropDownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (String newValue) {
                    setState(() {
                      _dropDownValue = newValue;
                    });
                  },
                  items: <String>[
                    'Doctor',
                    'Counsellor',
                    DemoLocalization.of(context).translate('others'),
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 10),

                //Sex
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DemoLocalization.of(context).translate('gender'),
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    ListTile(
                      title:
                          Text(DemoLocalization.of(context).translate('male')),
                      leading: Radio(
                        value: Sex.male,
                        groupValue: _sex,
                        onChanged: (Sex value) {
                          setState(() {
                            _sex = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                          DemoLocalization.of(context).translate('female')),
                      leading: Radio(
                        value: Sex.female,
                        groupValue: _sex,
                        onChanged: (Sex value) {
                          setState(() {
                            _sex = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title:
                          Text(DemoLocalization.of(context).translate('other')),
                      leading: Radio(
                        value: Sex.other,
                        groupValue: _sex,
                        onChanged: (Sex value) {
                          setState(() {
                            _sex = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),

                //Continue Button
                Container(
                  alignment: Alignment.center,
                  child: FlatButton(
                    color: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 30,
                    ),
                    child: Text(
                      DemoLocalization.of(context).translate('continue'),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        // print(_formKey);
                        Navigator.pushNamed(context, 'questionnairescreen');
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
