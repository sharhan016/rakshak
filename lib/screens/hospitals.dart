import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../components/hospitalcard.dart';
import '../providers/hospitals.dart';

class HospitalsScreen extends StatefulWidget {
  @override
  _HospitalsScreenState createState() => _HospitalsScreenState();
}

class _HospitalsScreenState extends State<HospitalsScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<Tab> _myTabs = <Tab>[
    Tab(text: 'Mumbai'),
    Tab(
      text: 'Rest of Maharashtra',
    ),
  ];

  @override
  void initState() {
    super.initState();
    var hospitalProvider =
        Provider.of<HospitalsProvider>(context, listen: false);
    hospitalProvider.updatePvtHospitals();
    hospitalProvider.updateGovHospitals();
    _tabController = TabController(vsync: this, length: _myTabs.length);
  }

  @override
  Widget build(BuildContext context) {
    //Hospitals Provider
    var hospitalsProvider = Provider.of<HospitalsProvider>(context);

    return Scaffold(
      appBar: TabBar(
        indicatorWeight: 4,
        indicatorColor: const Color(0xff151a53),
        labelColor: const Color(0xff151a53),
        unselectedLabelColor: const Color(0xff808080),
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        controller: _tabController,
        tabs: _myTabs,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          hospitalsProvider.loaderStatus == LoaderStatus.busy
              ? SpinKitCircle(
                  color: Colors.black,
                  size: 50.0,
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    await hospitalsProvider.updatePvtHospitals();
                    print('finished');
                  },
                  child: Container(
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: hospitalsProvider.pvthospitals.length,
                      itemBuilder: (context, index) {
                        return HospitalCardComponent(
                          hospitalName: hospitalsProvider.pvthospitals[index]
                              ['hospitalName'],
                          area: hospitalsProvider.pvthospitals[index]['area'],
                          ward: hospitalsProvider.pvthospitals[index]['ward'],
                          numberOfBeds: int.parse(
                            hospitalsProvider.pvthospitals[index]
                                ['numberOfBeds'],
                          ),
                          hospitalType: hospitalsProvider.pvthospitals[index]
                              ['hospitalType'],
                        );
                      },
                    ),
                  ),
                ),
          RefreshIndicator(
            onRefresh: () async {
              await hospitalsProvider.updateGovHospitals();
              print('finished');
            },
            child: Container(
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: hospitalsProvider.govhospitals.length,
                itemBuilder: (context, index) {
                  return HospitalCardComponent(
                    hospitalName: hospitalsProvider.govhospitals[index]
                        ['hospitalName'],
                    area: hospitalsProvider.govhospitals[index]['district'],
                    ward: hospitalsProvider.govhospitals[index]['ward'],
                    numberOfBeds: int.parse(
                      hospitalsProvider.govhospitals[index]['numberOfBeds'],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
