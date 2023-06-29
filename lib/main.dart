import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Crud());
}

class Crud extends StatelessWidget {
  const Crud({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      debugShowCheckedModeBanner: false,
      title: 'CRUD  APP',
      home: CRUD(),
    );
  }
}

class CRUD extends StatefulWidget {
  const CRUD({Key? key}) : super(key: key);

  @override
  State<CRUD> createState() => _CRUDState();
}

class _CRUDState extends State<CRUD> {
  // String name = "";
  TextEditingController tec = TextEditingController();
  TextEditingController tec2 = TextEditingController();
  TextEditingController tec3 = TextEditingController();
  String Name = "";
  String Description = "";
  String Price = "";

  @override
  void dispose() {
    tec.dispose();
    tec2.dispose();
    tec3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'THIS IS CRUD APP',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 21,
                color: Colors.red,
              ),
            ),
            Container(
              height: 50,
            ),
            Container(
              color: Colors.red,
            ),
            TextField(
              controller: tec,
              decoration: InputDecoration(
                  hintText: 'Enter Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
            ),
            Container(
              height: 10,
            ),
            TextField(
              controller: tec2,
              decoration: InputDecoration(
                  hintText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
            ),
            Container(
              height: 10,
            ),
            TextField(
              controller: tec3,
              decoration: InputDecoration(
                  hintText: 'Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
            ),
            Container(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 5,
                ),
                ElevatedButton(
                  child: Text('CREATE'),
                  onPressed: () {
                    setState(() {
                      Name = tec.text;
                      Description = tec2.text;
                      Price = tec3.text;
                    });
                  },
                ),
                Container(
                  width: 5,
                ),
                ElevatedButton(onPressed: () {}, child: Text('READ')),
                Container(
                  width: 5,
                ),
                ElevatedButton(onPressed: () {}, child: Text('UPDATE')),
                Container(
                  width: 5,
                ),
                ElevatedButton(onPressed: () {}, child: Text('DELETE')),
              ],
            ),
            Container(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$Name"),
                Container(
                  width: 95,
                ),
                Text("$Description"),
                Container(
                  width: 95,
                ),
                Text("$Price"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
