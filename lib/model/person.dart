import 'package:reformation/model/resource.dart';

class Person extends Resource {
  final String period;
  final String image;
  final String description;

  const Person(name, this.period, this.image, this.description) : super(name);
}

const description =
    'John Knox (c. 1513 – 24 November 1572) was a Scottish minister, theologian, and writer who was a leader of the country\'s Reformation. He is the founder of the Presbyterian Church of Scotland. Born in Giffordgate, Knox is believed to have been educated at the University of St Andrews and worked as a notary-priest. Influenced by early church reformers such as George Wishart, he joined the movement to reform the Scottish church. He was caught up in the ecclesiastical and political events that involved the murder of Cardinal David Beaton in 1546 and the intervention of the regent of Scotland Mary of Guise, a French noblewoman. He was taken prisoner by French forces the following year and exiled to England on his release in 1549.';

List<Person> people = [
  const Person(
      'John Knox', '(c. 1555–1623)', 'images/john_knox.jpg', description),
];
