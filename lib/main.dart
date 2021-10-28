import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.


  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login UI',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> _genders = ['Male','Female','Other','Rather not to say'];
  String _selectedGender = 'Male';
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20);

  @override
  Widget build(BuildContext context) {

    final nameField = TextFormField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Name',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your Name';
        }
        return null;
      },
    );
    final emailField = TextFormField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Email',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
    );
    final passwordField = TextFormField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Password',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('Sign Up'),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 30, fontFamily: 'Montserrat', fontWeight: FontWeight.bold ),

      ),
      body: Form (
        key: _formKey,
        child: ListView(
        children: <Widget>[
          Center(child:Container(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child:Text('Welcome to MyPage',
            style: TextStyle(fontFamily: 'Montserrat', fontSize: 30, fontWeight: FontWeight.bold)),
          )),
          SizedBox(
            height: 155,
            child: Image.asset("assets/marvel.png",
            fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(
              top:10,
              left: 20,
              right:20,
              bottom:10,
            ),
              child: nameField
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(
              left: 20,
              right:20,
              bottom:10,
            ),
              child: emailField),
          SizedBox(height: 20),
          Container(
              padding: EdgeInsets.only(
                left: 20,
                right:20,
                bottom:10,
              ),
              child: passwordField),
          Center(child: Container(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: DropdownButton<String>(
              hint: Text(
                "Please choose your gender",
              ),
              value: _selectedGender,
              onChanged: (String? newValue){
                setState(() {
                  _selectedGender = newValue ?? "";
                });
              },
              items: _genders.map((String gender) {
                return DropdownMenuItem<String>(
                child: Text (gender),
                value: gender,);
              }).toList(),
          ))),
          Container(
            padding: EdgeInsets.only(
              left:100,
              right: 100,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green, fixedSize: Size(50, 50)),
              onPressed: () {
                if(_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Signed up!'),
                    )
                  );
                }
              },
              // icon: Icon(Icons.add, size: 18),
              child: Text("SIGN UP"),
            ),
          )
        ]
      ),
      )

    );

  }
}
