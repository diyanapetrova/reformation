import 'package:flutter/material.dart';
import 'package:reformation/model/person.dart';
import 'package:reformation/model/place.dart';
import 'package:reformation/model/resource.dart';
import 'package:reformation/ui/details_page.dart';

//class SearchBarWidget extends StatefulWidget implements PreferredSizeWidget {
//  final String title;
//
//  @override
//  final Size preferredSize; // default is 56.0
//
//  SearchBarWidget({Key key, this.title})
//      : preferredSize = Size.fromHeight(56.0),
//        super(key: key);
//
//
//  @override
//  _SearchBarWidgetState createState() => new _SearchBarWidgetState(title);
//}
//
//class _SearchBarWidgetState extends State<SearchBarWidget> {
//  final TextEditingController _filter = new TextEditingController();
//  static List names = ['Cathedaral', 'John Knox'];
//  String _searchText = "";
//  List filteredNames = names;
//  Icon _searchIcon = new Icon(Icons.search);
//  Widget _appBarTitle;
//  Text defaultTitle;
//
//  _SearchBarWidgetState(String title) {
//    _filter.addListener(() {
//      if (_filter.text.isEmpty) {
//        setState(() {
//          _searchText = "";
//          filteredNames = names;
//        });
//      } else {
//        setState(() {
//          _searchText = _filter.text;
//        });
//      }
//    });
//    this.defaultTitle = new Text(title);
//    this._appBarTitle = defaultTitle;
//  }
//
//  @override
//  void initState() {
//    this._getNames();
//    super.initState();
//  }
//
//  Widget build(BuildContext context) {
//    return _buildBar(context);
//  }
//
//  Widget _buildBar(BuildContext context) {
//    return new AppBar(
//      title: _appBarTitle,
//      backgroundColor: Color(0xFF00539B),
//      actions: <Widget>[
//        IconButton(
//          icon: _searchIcon,
//          onPressed: _searchPressed,
//        )
//      ],
//    );
//  }
//
//  Widget _buildList() {
//    if (!(_searchText.isEmpty)) {
//      List tempList = new List();
//      for (int i = 0; i < filteredNames.length; i++) {
//        if (filteredNames[i]
//            .toLowerCase()
//            .contains(_searchText.toLowerCase())) {
//          tempList.add(filteredNames[i]);
//        }
//      }
//      filteredNames = tempList;
//    }
//    return ListView.builder(
//      itemCount: names == null ? 0 : filteredNames.length,
//      itemBuilder: (BuildContext context, int index) {
//        return new ListTile(
//          title: Text(filteredNames[index]),
//          onTap: () => print(filteredNames[index]),
//        );
//      },
//    );
//  }
//
//  void _searchPressed() {
//    setState(() {
//      if (this._searchIcon.icon == Icons.search) {
//        this._searchIcon = new Icon(Icons.close);
//        this._appBarTitle = new TextField(
//          controller: _filter,
//          decoration: new InputDecoration(
//              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
//        );
//      } else {
//        this._searchIcon = new Icon(Icons.search);
//        this._appBarTitle = defaultTitle;
//        filteredNames = names;
//        _filter.clear();
//      }
//    });
//  }
//
//  void _getNames() {
//    setState(() {
//      names.shuffle();
//      filteredNames = names;
//    });
//  }
//}

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  final String _appBarTitle;
  final Icon _searchIcon = new Icon(Icons.search);

  @override
  final Size preferredSize;

  SearchBar(this._appBarTitle, {Key key})
      : preferredSize = Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_appBarTitle),
      backgroundColor: Color(0xFF00539B),
      actions: <Widget>[
        IconButton(
          icon: _searchIcon,
          onPressed: () {
            showSearch(context: context, delegate: AppSearch(getContent()));
          },
        )
      ],
    );
  }

  Map<String, Resource> getContent() {
    Map<String, Resource> content = new Map();
    people.forEach((person) => content[person.name] = person);
    places.forEach((place) => content[place.name] = place);

    content.forEach((name, res) => print(name));
    return content;
  }
}

class AppSearch extends SearchDelegate {
  final Map<String, Resource> content;

  AppSearch(this.content);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }

    //get results
    List<String> searchable = content.keys.toList();

    List<String> filtered = searchable
        .where((entry) => entry.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (filtered.length == 0) {
      return Column(
        children: <Widget>[
          Text(
            "No Results Found.",
          ),
        ],
      );
    } else {
      return ListView.builder(
        itemCount: filtered.length,
        itemBuilder: (context, index) {
          var result = filtered[index];
          return ListTile(
            title: Text(result),
          );
        },
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> searchable = content.keys.toList();

    List<String> filtered = searchable
        .where((entry) => entry.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
        itemCount: filtered.length,
        itemBuilder: (context, index) {
          var result = filtered[index];
          return GestureDetector(
            child: ListTile(
              title: Text(result),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsPage(content[result])),
              );
            },
          );
        });
  }
}
