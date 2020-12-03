import 'package:meta/meta.dart';

class Symptoms {
  Symptoms({
    @required this.tested,
    @required this.testPositive,
    @required this.qaurantined,
    @required this.datcough,
    @required this.difficultyBreathing,
    @required this.shakingChills,
    @required this.coughfrequency,
    @required this.bodyTemperature,
  });
  bool tested;
  bool testPositive;
  bool qaurantined;
  bool datcough;
  bool difficultyBreathing;
  bool shakingChills;
  bool coughfrequency;
  bool bodyTemperature;
  //During startup
  bool fever = false;
}
