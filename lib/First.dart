import 'package:flutter/material.dart';
import 'Second.dart';
import 'apiProvider.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController palindromeController = TextEditingController();

  bool isPalindrome(String text) {
    if (text.isEmpty) return false;
    final cleaned = text.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();
    return cleaned == cleaned.split('').reversed.join('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 64, 165, 170),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 35.0, right: 35.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              CircleAvatar(
                radius: 65.0,
                backgroundColor: Colors.white.withOpacity(0),
                backgroundImage: AssetImage('assets/avatarplus.png'),
              ),
              SizedBox(height: 55.0),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: const Color.fromARGB(69, 0, 0, 0), fontWeight: FontWeight.w500),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
              SizedBox(height: 16.0),
                TextField(
                controller: palindromeController,
                decoration: InputDecoration(
                  labelText: 'Palindrome',
                  labelStyle: TextStyle(color: const Color.fromARGB(69, 0, 0, 0), fontWeight: FontWeight.w500),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.white, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
              SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: () {
                  final text = palindromeController.text;
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          isPalindrome(text) ? 'isPalindrome' : 'not palindrome',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 43, 99, 123),
                  minimumSize: Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(
                      color: Color.fromARGB(255, 43, 99, 123),
                      width: 1.5,
                    ),
                  ),
                ),
                child: Text('CHECK', style: TextStyle(color: Colors.white, fontSize: 14)),
              ),
              SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: () {
                  Provider.of<ApiProvider>(
                    context,
                    listen: false,
                  ).fetchUsers(1);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SecondPage(name: nameController.text),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 43, 99, 123),
                  minimumSize: Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(
                      color: Color.fromARGB(255, 43, 99, 123),
                      width: 1.5,
                    ),
                  ),
                ),
                child: Text('NEXT', style: TextStyle(color: Colors.white, fontSize: 14)),
              ),
              SizedBox(height: 90.0),
            ],
          ),
        ),
      ),
      ),
      ),
      ),
    );
  }
}
