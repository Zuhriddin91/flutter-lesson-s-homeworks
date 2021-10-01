import 'package:flutter/material.dart';
import 'package:portfolio/screens/login/login_last_page.dart';

class LoginSecondPage extends StatefulWidget {
  @override
  _LoginSecondPageState createState() => _LoginSecondPageState();
}

class _LoginSecondPageState extends State<LoginSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                  ),
                ),
                SizedBox(height: 100),
                Text(
                  "Hey,\nLogin Now.",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      "If you are new /",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Text(
                      "  Create New",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                nameTextField("Name", TextInputType.text, true),
                SizedBox(height: 30),
                passwordTextField(
                    "Password", TextInputType.visiblePassword, false),
                SizedBox(height: 40),
                Row(
                  children: [
                    Text(
                      "Forgot Passcode? /",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Text(
                      "  Reset",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 80),
                Container(
                  width: 350,
                  child: ElevatedButton(
                      onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginLastPage()));},
                      child: Text(
                        "Next",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffc50000),
                        padding: EdgeInsets.symmetric(vertical: 15)
                      ),
                    ),
                ),
                SizedBox(height: 40),
                Container(
                  alignment: Alignment.center,
                  width: 350,
                  child:Text(
                      "Skip Now",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color textFieldColor = Colors.grey.shade300,
      passwordFieldColor = Colors.grey.shade300;

  nameTextField(String name, TextInputType textInputType, bool icon) =>
      TextField(
        keyboardType: textInputType,
        //textInputAction: TextInputAction.done,
        autofocus: true,
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide.none),
          fillColor: textFieldColor,
          filled: true,
          //border: OutlineInputBorder(),
          hintText: name,
          suffixIcon: IconButton(
                  color: Colors.black,
                  splashColor: Colors.black,
                  onPressed: () {},
                  icon: Stack(
                      alignment: Alignment.center,
                      children: [
                    Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14)
                      ),
                    ),
                    Icon(
                      Icons.bolt,
                    )
                  ]),
                )

        ),
        // ON CHANGED
        onChanged: (v) {
          setState(() {
            print(v);
            textFieldColor = Colors.grey.shade300;
          });
        },
        onSubmitted: (v) {
          setState(() {
            print(v);
            textFieldColor = Colors.amber;
          });
        },
      );

  passwordTextField(String name, TextInputType textInputType, bool icon) =>
      TextField(
        keyboardType: textInputType,
        //textInputAction: TextInputAction.done,
        autofocus: true,
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide.none),
          fillColor: passwordFieldColor,
          filled: true,
          //border: OutlineInputBorder(),
          hintText: name,
        ),
        // ON CHANGED
        onChanged: (v) {
          setState(() {
            print(v);
            passwordFieldColor = Colors.grey.shade300;
          });
        },
        onSubmitted: (v) {
          setState(() {
            print(v);
            passwordFieldColor = Colors.amber;
          });
        },
      );
}
