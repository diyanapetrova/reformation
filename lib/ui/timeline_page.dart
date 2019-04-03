import 'package:flutter/material.dart';
import 'package:reformation/common/color_sheme.dart';
import 'package:reformation/data/events.dart';
import 'package:reformation/model/event.dart';

class TimelinePage extends StatelessWidget {
  final String title = 'Timeline';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Palette.burgundy,
      ),
//      drawer: MyDrawer(),
//    backgroundColor: Palette.lightBlue,
      body: timeline(),
    );
  }

  Widget timeline() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return TimelineEvent(events[index]);
      },
      itemCount: events.length,
    );
  }
}

class TimelineEvent extends StatelessWidget {
  final Event event;

  const TimelineEvent(this.event);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[_box(context), _line(), _icon(), _date(context)]);
  }

  Widget _date(BuildContext context) {
    return Positioned(
        top: 30.0,
        left: 15.0,
        child: Container(
          color: Colors.white,
          child: Text(
            event.date,
            style: Theme.of(context).textTheme.body1,
          ),
        ));
  }

  Widget _line() {
    return Positioned(
      top: 0.0,
      bottom: 0.0,
      left: 40.0,
      child: Container(
        height: double.infinity,
        width: 1.0,
        color: Palette.blue,
      ),
    );
  }

  Widget _icon() {
    return Positioned(
      top: 47.0,
      left: 22.0,
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Container(
          margin: EdgeInsets.all(5.0),
          height: 25.0,
          width: 25.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(event.icon)),
          ),
        ),
      ),
    );
  }

  Widget _box(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(95, 10, 10, 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFFe285a2),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Container(
        child: Text(
          event.description,
          style: Theme.of(context).textTheme.body1,
          overflow: TextOverflow.clip,
        ),
      ),
    );
  }
}
