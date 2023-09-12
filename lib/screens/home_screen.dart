import 'package:flutter/material.dart';

import '../databases/database.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController dataEntrycontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, ()async{
      await DatabaseHelper().init();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Student Data', style: TextStyle(
          color: Colors.white,
          fontSize: 16.0
        ),),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          TextField(
            controller: dataEntrycontroller,
            style: const TextStyle(
              fontSize: 16.0
            ),
            onSubmitted: (value){
                DatabaseHelper().insert({
                  'name' : dataEntrycontroller.text,
                  'age' : 21
                });
            },
            
            decoration: const InputDecoration(
              
              hintText: 'Enter a student name Or Roll No.',
              
            ),
          )
        ],
      ),
    );
  }
}