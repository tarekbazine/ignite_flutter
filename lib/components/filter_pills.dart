import 'package:flutter/material.dart';

class FilterPills extends StatefulWidget {
  final Function(int) onSelected;
  final List items;

  const FilterPills({Key key, this.onSelected, this.items}) : super(key: key);

  @override
  _FilterPillsState createState() => _FilterPillsState();
}

class _FilterPillsState extends State<FilterPills> {
  var _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: ListView.builder(
          itemCount: widget.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return _buildCategoryItem(index);
          }),
      color: Colors.transparent,
    );
  }

  Widget _buildCategoryItem(index) {
    return new InkWell(
      onTap: () {
        setSelectedItem(index);
        print("click $index");
      },
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            color: Colors.transparent,
            margin: new EdgeInsets.only(left: 10.0),
            child: new Material(
              elevation: 2.0,
              color: _selected == index
                  ? Theme.of(context).primaryColorDark
                  : Theme.of(context).accentColor,
              borderRadius: const BorderRadius.all(const Radius.circular(25.0)),
              child: new Container(
                padding: new EdgeInsets.only(
                  left: 12.0,
                  top: 7.0,
                  bottom: 7.0,
                  right: 12.0,
                ),
                child: new Text(
                  widget.items[index],
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void setSelectedItem(index) {
    if (index != _selected) {
      widget.onSelected(index);
      setState(() {
        _selected = index;
      });
    }
  }
}
