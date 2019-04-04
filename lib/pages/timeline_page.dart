import 'package:flutter/material.dart';
import 'package:reformation/data/events.dart';
import 'package:reformation/ui/timeline_event.dart';
import 'package:reformation/ui/color_sheme.dart';

class TimelinePage extends StatelessWidget {
  final String title = 'Timeline';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Palette.blue,
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return TimelineEvent(events[index]);
          },
          itemCount: events.length,
        ),
        color: Palette.background,
      ),
    );
  }
}
