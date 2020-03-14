import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MedicalCard extends StatefulWidget {
  final String time;
  final Color bgColor;
  final List<String> medicines;
  final Function remove;
  const MedicalCard(
      {Key key, this.time, this.medicines, this.remove, this.bgColor})
      : super(key: key);

  @override
  _MedicalCardState createState() => _MedicalCardState();
}

class _MedicalCardState extends State<MedicalCard>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10), color: Colors.black12, blurRadius: 10)
            ]),
        margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: Dismissible(
          onDismissed: (direction) => widget.remove(),
          key: UniqueKey(),
          direction: DismissDirection.startToEnd,
          background: Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Color(0xff2ACB6B),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: <Widget>[
                Container(
                  width: 10,
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                      color: Color(0xff35AB64),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                ),
                FaIcon(FontAwesomeIcons.checkCircle,
                    size: 64, color: Color(0xffF1ECEC)),
              ],
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 23),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 12,
                                    offset: Offset(0, 6),
                                    color: widget.bgColor.withOpacity(0.3))
                              ],
                              color: widget.bgColor,
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(14),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              height: 50,
                              width: 50,
                              image: AssetImage('assets/images/pill.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: -10,
                            right: -10,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Color(0xff334E6C),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  widget.medicines.length.toString(),
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 82,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(widget.time,
                              style: TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.bold)),
                          Text(widget.medicines[0],
                              style: TextStyle(fontSize: 20))
                        ],
                      ),
                    ),
                  ],
                ),
                PopupMenuButton(
                  onSelected: (result) {
                    if (result.data == 'Edit')
                      print("Edit");
                    else
                      widget.remove();
                  },
                  itemBuilder: (context) => <PopupMenuEntry<Text>>[
                    PopupMenuItem(value: Text('Edit'), child: Text('Edit')),
                    PopupMenuItem(value: Text('Delete'), child: Text('Delete'))
                  ],
                  icon: Icon(Icons.more_vert, size: 32, color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
