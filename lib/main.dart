import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test",
      theme: ThemeData(
        primaryColor: Colors.redAccent,
        primaryColorDark: Colors.red,
      ),
      home: MyHomePage(
        title: "Home Page",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _name;
  var _age;

  final nameCon = new TextEditingController();
  final ageCon = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.widget.title,
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameCon,
                decoration: InputDecoration(
                  hintText: "Enter your name",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: ageCon,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter your age",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialogShow(
                    name: nameCon.text,
                    age: ageCon.text,
                  ),
                ),
                /*onPressed: () {
                  setState(() {
                    _name = nameCon.text;
                    _age = ageCon.text;
                  });
                },*/
                child: Text("Submit"),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AlertDialogShow extends StatelessWidget {
  final String name, age;

  const AlertDialogShow({Key key, this.name, this.age}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("This is title"),
      content: Text("You have inputted $name and $age"),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Close"),
        ),
      ],
    );
  }
}
