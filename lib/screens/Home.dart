import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_world/screens/AddSchedule.dart';
import 'package:hello_world/widgets/MedicalCard.dart';
import 'package:hello_world/widgets/QuickDate.dart';
import 'package:hello_world/models/Prescription.dart';
import 'package:hello_world/models/CardBgColors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _myPrescriptions = prescriptions;

  //Helper functions
  void removePrescription(int index) {
    print("Removing $index");
    print(_myPrescriptions);
    setState(() {
      _myPrescriptions.removeAt(index);
    });
  }

  void addPrescription(String time, List<String> medicines) {
    print("Adding new Prescription");
    setState(() {
      _myPrescriptions.add(new Prescription(time: time, medicines: medicines));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF8F9F7),
        body: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                padding:
                    EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Welcome back',
                              style:
                                  TextStyle(fontSize: 27, color: Colors.black),
                            ),
                            Text(
                              'Cong',
                              style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        ),
                        CircleAvatar(
                          radius: 31,
                          backgroundColor: Colors.black12,
                          child: (Text(
                            'C',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 36,
                                fontWeight: FontWeight.w600),
                          )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text('How are you feeling today?',
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 21,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          width: 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Terrible ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffE85858))),
                              FaIcon(
                                FontAwesomeIcons.frownOpen,
                                color: Color(0xffE85858),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: Color(0xffE85858)),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          width: 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Not bad ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffE3B61D))),
                              FaIcon(
                                FontAwesomeIcons.meh,
                                color: Color(0xffE3B61D),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: Color(0xffE3B61D)),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          width: 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Great ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff2ACB6B))),
                              FaIcon(
                                FontAwesomeIcons.grin,
                                color: Color(0xff2ACB6B),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: Color(0xff2ACB6B)),
                              borderRadius: BorderRadius.circular(50)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        QuickDate(),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Today',
                            style: TextStyle(
                                fontSize: 34, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: _myPrescriptions.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          final Prescription pres = _myPrescriptions[index];
                          return MedicalCard(
                            remove: () => removePrescription(index),
                            medicines: pres.medicines,
                            time: pres.time,
                            bgColor: cardColors[index % 5],
                          );
                        }),
                  ),
                  Container(
                    color: Colors.white,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          height: 60,
                          width: 60,
                          child: Center(
                              child: FaIcon(
                            FontAwesomeIcons.heartbeat,
                            size: 24,
                            color: Color(0xff1C69B0),
                          )),
                        ),
                        Transform.translate(
                          offset: Offset(0, -30),
                          child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          maintainState: false,
                                          builder: (context) =>
                                              AddSchedule(addPrescription)));
                                },
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Color(0xff3498DB),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Icon(
                                    Icons.add,
                                    size: 48,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          child: Center(
                              child: FaIcon(
                            FontAwesomeIcons.cog,
                            size: 24,
                            color: Color(0xff7DAAD3),
                          )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
