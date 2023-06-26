import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CRUD());
}

class CRUD extends StatelessWidget {
  const CRUD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var Name = TextEditingController();
    var Description = TextEditingController();
    var Price = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD'),
      ),
      body: Column(
        children: [
          Text('This is CRUD APP'),
          Container(
            color: Colors.red,
          ),
          TextField(
            controller: Name,
            decoration: InputDecoration(
              hintText: 'Enter Name',
            ),
          )
        ],
      ),
    );
  }
}
