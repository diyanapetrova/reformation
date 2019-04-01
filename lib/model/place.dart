class Place {
  final double lat;
  final double lon;
  final String name;
  final String image;
  final String icon;
  final String text;

  const Place(this.lat, this.lon, this.name, this.image, this.text, this.icon);
}

const text =
    'St Andrews Castle was home to the Catholic archbishops of St Andrews. A number of leading Protestants were imprisoned here before their trials in St Andrews Cathedral. In March 1546 the Reformist preacher George Wishart was hanged and burned outside the castle, in the presence of Cardinal David Beaton. Slightly over two months later, in May 1546, a group of Fife lairds murdered Cardinal Beaton in revenge for Wishart’s execution. Beaton’s assassins took control of the castle, sparking a year-long siege. The remains of a mine and counter-mine from the siege can still be explored today. \n The castle was recaptured by French forces in the summer of 1547, and Catholic control of St Andrews was temporarily re-established. During the 1550s Archbishop John Hamilton ordered major building work to repair damage from the siege. Hamilton created the present day entrance to the castle, which is decorated with his family symbol of the cinquefoil (a flower with five petals).\nThe castle returned to Protestant hands when Archbishop Hamilton fled from St Andrews in June 1559. In the ensuing conflict of the Scottish Reformation, St Andrews Castle became a major Protestant stronghold. It eventually fell into ruins in the seventeenth century.';

List<Place> places = [
  const Place(
      56.342248, -2.790009, 'St Andrews Castle', 'images/castle.jpg', text, 'smt'),
];