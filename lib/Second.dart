import 'package:flutter/material.dart';
import 'Third.dart';

class SecondPage extends StatefulWidget {
  final String name;

  const SecondPage({required this.name});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String selectedUserName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Second Screen',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
        color: Colors.grey.shade300,
        height: 1.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: RichText(
              text: TextSpan(
                children: [
                TextSpan(
                  text: 'Welcome\n',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                TextSpan(
                  text: '${widget.name}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black, height: 1.3),
                ),
                ],
              ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  selectedUserName.isEmpty
                      ? 'Selected User Name'
                      : selectedUserName,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 80.0),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdPage()),
                  );
                  if (result != null && result is String) {
                    setState(() {
                      selectedUserName = result;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 43, 99, 123),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(
                      color: Color.fromARGB(255, 43, 99, 123),
                      width: 1.5,
                    ),
                  ),
                ),
                child: Text(
                  'Choose a User',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
