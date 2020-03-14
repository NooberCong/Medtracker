import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transparent_image/transparent_image.dart';

class AddSchedule extends StatefulWidget {
  final Function addNewPrescription;
  AddSchedule(this.addNewPrescription, {Key key}) : super(key: key);

  @override
  _AddScheduleState createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
  String _medicineName = "";
  int _medicineQuantity = 0;
  List<Map<String, String>> _medicines = [
    {'name': 'Zephois', 'quantity': '3'},
    {'name': 'Anophil', 'quantity': '4'}
  ];
  final _medNameTC = new TextEditingController();
  final _medQuantityTC = new TextEditingController();

  @override
  void dispose() {
    _medNameTC.dispose();
    _medQuantityTC.dispose();
    super.dispose();
  }

  //Helper functions
  addMedicine(String name, String quantity) {
    setState(() {
      _medicines.add({'name': name, 'quantity': quantity});
    });
  }

  String scheduleChoice = "Everyday";
  DateTime now = new DateTime.now();
  static const List<DropdownMenuItem<String>> scheduleOptions = [
    DropdownMenuItem(
      value: "Everyday",
      child: Text(
        'Everyday',
        style: TextStyle(fontSize: 24, letterSpacing: 1),
      ),
    ),
    DropdownMenuItem(
      value: "Every weekday  ",
      child: Text(
        'Every weekday  ',
        style: TextStyle(fontSize: 24, letterSpacing: 1),
      ),
    ),
    DropdownMenuItem(
      value: "Every weekend",
      child: Text(
        'Every weekend',
        style: TextStyle(fontSize: 24, letterSpacing: 1),
      ),
    ),
    DropdownMenuItem(
      value: "Custom",
      child: Text(
        'Custom',
        style: TextStyle(fontSize: 24, letterSpacing: 1),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Add new schedule',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600)),
              Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: DropdownButton<String>(
                      icon: FaIcon(
                        FontAwesomeIcons.angleDown,
                        size: 14,
                      ),
                      style: TextStyle(fontSize: 24, color: Colors.black),
                      value: scheduleChoice,
                      items: scheduleOptions,
                      onChanged: (value) {
                        setState(() {
                          scheduleChoice = value;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Time: ',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                border: Border.all(width: 1)),
                            padding: EdgeInsets.symmetric(vertical: 1),
                            width: 70,
                            child: Text(now.hour.toString(),
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center),
                          ),
                          Text(
                            '   :   ',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              border: Border.all(width: 1),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 1),
                            width: 70,
                            child: Text(now.minute.toString(),
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Pills: ',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      (_medicines.length > 0
                          ? Container(
                              width: 187,
                              height: 180,
                              child: ListView.builder(
                                  itemCount: _medicines.length,
                                  itemBuilder: (context, index) {
                                    final medicine = _medicines[index];
                                    return Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Flexible(
                                          flex: 1,
                                          child: Stack(
                                            overflow: Overflow.visible,
                                            children: <Widget>[
                                              Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 20),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    color: Color(0xff334E6C)),
                                                height: 30,
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                    '    ' +
                                                        (medicine['name']
                                                                    .length >
                                                                10
                                                            ? medicine['name']
                                                                    .substring(
                                                                        0, 8) +
                                                                '...'
                                                            : medicine['name']),
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white)),
                                              ),
                                              Positioned(
                                                  bottom: 15,
                                                  right: -5,
                                                  child: Container(
                                                    width: 20,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffDE4B65),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Center(
                                                      child: Text(
                                                          medicine['quantity'],
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Colors
                                                                  .white)),
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _medicines.removeAt(index);
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 6),
                                            child: FaIcon(
                                                FontAwesomeIcons.minus,
                                                size: 24,
                                                color: Color(0xff857777)),
                                          ),
                                        ),
                                      ],
                                    );
                                  }))
                          : Column(
                              children: <Widget>[
                                Image(
                                  // loadingBuilder: (context, widget, image) {
                                  //   return CircularProgressIndicator();
                                  // },
                                  image:
                                      AssetImage('assets/images/medicines.png'),
                                ),
                                SizedBox(height: 24),
                                Text('Start by adding pills',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey))
                              ],
                            )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Container(
                            height: 50,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              children: <Widget>[
                                Flexible(
                                  flex: 3,
                                  child: TextField(
                                    controller: _medNameTC,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.text,
                                    decoration: null,
                                  ),
                                ),
                                Text(' x '),
                                Flexible(
                                  flex: 1,
                                  child: TextField(
                                    controller: _medQuantityTC,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    decoration: null,
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            if (_medNameTC.text.length > 0 &&
                                _medQuantityTC.text.length > 0) {
                              addMedicine(_medNameTC.text, _medQuantityTC.text);
                              _medNameTC.clear();
                              _medQuantityTC.clear();
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Color(0xff2ACB6B),
                                borderRadius: BorderRadius.circular(25)),
                            child:
                                Icon(Icons.add, size: 32, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    if (_medicines.length > 0) {
                      widget.addNewPrescription("12:00 pm",
                          _medicines.map((med) => med['name']).toList());
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xff2ACB6B),
                    ),
                    width: 200,
                    height: 60,
                    child: Center(
                      child: Text(
                        'Add',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
