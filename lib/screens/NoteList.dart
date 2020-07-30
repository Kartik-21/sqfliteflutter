import 'package:flutter/material.dart';
import 'package:sqfliteflutter/screens/NoteDetails.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Note"),
      ),
      body: getListView(),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Items",
        onPressed: () {
          debugPrint("floating action button");
          navigateToNoteDetails("Add Note");
        },
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getListView() {
    TextStyle textStyle = Theme.of(context).textTheme.headline1;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
//            color: Colors.lightBlueAccent,
            elevation: 3.0,
            margin: EdgeInsets.all(5.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Icon(Icons.arrow_right),
              ),
              title: Text(
                "Title",
                style: textStyle,
              ),
              subtitle: Text(
                "Subtitle",
              ),
              trailing: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
              onTap: () {
                debugPrint("card");
                navigateToNoteDetails("Edit Note");
              },
            ),
          );
        });
  }

  void navigateToNoteDetails(String title) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetails(title);
    }));
  }
}
