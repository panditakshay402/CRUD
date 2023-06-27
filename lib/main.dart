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

class CRUD extends StatelessWidget {
  const CRUD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var Name = TextEditingController();
    var Description = TextEditingController();
    var Price = TextEditingController();
    // String name, description;
    // double price;

    // getName(name) {
    //   this.name = name;
    //   print(this.name);
    // }
    //
    // getDescription(description) {
    //   this.description = description;
    //   print(this.description);
    // }

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
            controller: Name,
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
              ElevatedButton(onPressed: () {}, child: Text('CREATE')),
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
              Text(('Name  $Name')),
              Container(
                width: 95,
              ),
              Text('Description $Description'),
              Container(
                width: 95,
              ),
              Text(('Price $Price')),
            ],
          )
        ],
      ),
    );
  }
}
