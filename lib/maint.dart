import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Crud());
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
  TextEditingController tec = TextEditingController();
  TextEditingController tec2 = TextEditingController();
  TextEditingController tec3 = TextEditingController();
  CollectionReference dishesRef =
      FirebaseFirestore.instance.collection('Dishes');

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
                    String name = tec.text;
                    String description = tec2.text;
                    String price = tec3.text;

                    dishesRef.add({
                      'name': name,
                      'description': description,
                      'price': price,
                    }).then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Item added successfully!')),
                      );
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to add item: $error')),
                      );
                    });
                  },
                ),
                Container(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReadScreen()),
                    );
                  },
                  child: Text('READ'),
                ),
                Container(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    String name = tec.text;
                    String description = tec2.text;
                    String price = tec3.text;

                    dishesRef.doc(name).update({
                      'description': description,
                      'price': price,
                    }).then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Item updated successfully!')),
                      );
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Failed to update item: $error')),
                      );
                    });
                  },
                  child: Text('UPDATE'),
                ),
                Container(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    String name = tec.text;

                    dishesRef.doc(name).delete().then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Item deleted successfully!')),
                      );
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Failed to delete item: $error')),
                      );
                    });
                  },
                  child: Text('DELETE'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ReadScreen extends StatelessWidget {
  const ReadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read Items'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Dishes').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = snapshot.data!.docs[index];
                return ListTile(
                  title: Text(document['name']),
                  subtitle: Text(document['description']),
                  trailing: Text(document['price']),
                );
              },
            );
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
