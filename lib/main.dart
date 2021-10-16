import 'package:flutter/material.dart';
import 'package:sawo/sawo.dart';
import 'components/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
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
          primarySwatch: Colors.green,
        ),
        home: LoginScreen());
  }
}

class user {
  final String number;

  const user({
    required this.number,
  });
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Sawo sawo = new Sawo(
    apiKey: "a5e3dd48-072d-432b-b399-fdbd059b7788",
    secretKey: "6166698baaa97bd4878dcbafgotVIIDEiy4a2TZfLflV8N0V",
  );

  String user = "";
  var val, number;
  void payloadCallback(context, payload) {
    if (payload == null || (payload is String && payload.length == 0)) {
      payload = "Login Failed :(";
    }

    setState(() {
      user = payload;
      val = user.indexOf('+91');
      number = user.substring(val, val + 13);
    });
    // final RegExp phone = new RegExp(r'^(\+0?1\s)?((\d{3})|(\(\d{3}\)))?(\s|-)\d{3}(\s|-)\d{4}$');

    if (number != "") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage(number)),
      );
    }

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MyHomePage(number)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GANDALF"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
               /*Image.asset(
              'images/gandalf.jpeg',
              width: 500.0,
              height: 140.0,
              //fit: BoxFit.cover,
            ),*/
            SizedBox(height: 130),
            

            Image.asset('assets/gandalf.png',
            width: 100,
            ),  
            SizedBox(
              height:50),
            SizedBox(
              width: 250,
              height:50,
              
              child:ElevatedButton(
                style: ElevatedButton.styleFrom(shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
               ),),
                onPressed: () {
                  sawo.signIn(
                    context: context,
                    identifierType: 'phone_number_sms',
                    callback: payloadCallback,
                  );

                },
                child: const Text('Phone Login'),
              ),),
            
            ],
          ),
          
        ),
      ),
    );
  }
}
