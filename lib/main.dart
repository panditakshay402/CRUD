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
      title: 'CRUD APP',
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
  TextEditingController tec = new TextEditingController();
  String Name = "";

  @override
  void dispose() {
    tec.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var Description = TextEditingController();
    var Price = TextEditingController();

    // String name, description;
    // double price;

    // getDescription(description) {
    //   this.description = description;
    //   print(this.description);
    // }
    //
    // getPrice(price){
    //   this.price=double.parse(price);
    //   print(this.price);
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD'),
      ),
      body: Column(
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
            // onChanged: (String name) {
            //   getName(name);
            // },
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
            controller: Description,
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
            controller: Price,
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
              Text(Name),
              // Container(
              //   width: 95,
              // ),
              // Text('Description $Description'),
              // Container(
              //   width: 95,
              // ),
              // Text(('Price $Price')),
            ],
          )
        ],
      ),
    );
  }
}
