import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteDetails extends StatefulWidget {
  String appbartitle = '';

  NoteDetails(this.appbartitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailsState(this.appbartitle);
  }
}

class NoteDetailsState extends State<NoteDetails> {
  var priority = ["High", "Low"];
  var select = "Low";
  String appbartitle = '';

  NoteDetailsState(this.appbartitle);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.button;
    return Scaffold(
        appBar: AppBar(
          title: Text(appbartitle),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              moveToLastScreen();
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(5.0),
          child: ListView(
            //padding: EdgeInsets.only(top: 10.0,),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: DropdownButton<String>(
                  items: priority.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  style: textStyle,
                  value: select,
                  onChanged: (String newvalue) {
                    setState(() {
                      this.select = newvalue;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 10.0,
                ),
                child: TextField(
                  style: textStyle,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    labelText: "Title",
                    hintText: "Enter Note Title:",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: TextField(
                  style: textStyle,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    labelText: "Description",
                    hintText: "Enter Note Desc:",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Wrap(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        textColor: Theme.of(context).primaryColorDark,
                        child: Text(
                          "Save",
                          style: textStyle,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      width: 10.0,
                    ),
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).accentColor,
                        child: Text(
                          "Delete",
                          style: textStyle,
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  void moveToLastScreen() {
    Navigator.pop(context);
  }
}
