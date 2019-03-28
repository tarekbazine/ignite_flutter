import 'package:flutter/material.dart';

class CustomRadioList extends StatefulWidget {
  List _data = new List();
  String _label;
  var _onTap;

  CustomRadioList(data, onTap, [String label = '']) {
    this._data = data;
    this._label = label;
    this._onTap = onTap;
  }

  @override
  createState() {
    return new CustomRadioState();
  }
}

class CustomRadioState extends State<CustomRadioList> {
  List<RadioModel> _list = new List<RadioModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget._data[0]['selected']);

    widget._data.forEach((ele) {
      _list.add(new RadioModel(ele['key'], ele['selected'], ele['label']));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 75.0,
      child: new ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget._label.isNotEmpty ? _list.length + 1 : _list.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return new Container(
                padding: new EdgeInsets.only(left: 10.0, top: 27.0),
                child: new Container(
                  height: 50.0,
                  child: Text(
                    widget._label,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 15.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              );
            }
            index -= 1;
            return new InkWell(
              splashColor: Colors.blueAccent,
              onTap: () async {
//                print('changing lang to ${_list[index].key}');
                await widget._onTap(_list[index].key);
                setState(() {
                  _list.forEach((element) => element.isSelected = false);
                  _list[index].isSelected = true;
                });
              },
              child: new RadioItem(_list[index]),
            );
          }),
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;

  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: new EdgeInsets.all(15.0),
        child: new Container(
          height: 50.0,
          width: 50.0,
          child: new Center(
            child: new Text(
              _item.buttonText,
              style: new TextStyle(
                color: _item.isSelected ? Colors.white : Colors.black,
                //fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          decoration: new BoxDecoration(
            color: _item.isSelected ? Colors.blueAccent : Colors.transparent,
            border: new Border.all(
              width: 1.0,
              color: _item.isSelected ? Colors.blueAccent : Colors.grey,
            ),
            borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
          ),
        ));
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;
  final String key;

  RadioModel(this.key, this.isSelected, this.buttonText);
}
