import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HospitalCardComponent extends StatelessWidget {
  final String hospitalName;
  final String ward;
  final String area;
  final int numberOfBeds;
  final String hospitalType;
  HospitalCardComponent({
    @required this.hospitalName,
    @required this.ward,
    @required this.area,
    @required this.numberOfBeds,
    this.hospitalType = '',
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Card(
          margin: EdgeInsets.all(8),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            height: 150,
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          hospitalName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        area,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xffdcdfe8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Private'),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              image: AssetImage('images/bed.png'),
                              height: 16,
                            ),
                            Flexible(
                              child: Text(
                                numberOfBeds.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        hospitalType == 'pvt'
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image(
                                    image: AssetImage('images/ward.png'),
                                    height: 16,
                                  ),
                                  Flexible(
                                    child: Text(
                                      ward + ' ward',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            : SizedBox(),
                      ],
                    ),
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
