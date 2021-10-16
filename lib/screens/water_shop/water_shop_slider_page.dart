import 'package:flutter/material.dart';

class StepperExam extends StatefulWidget {
  @override
  _StepperState createState() => _StepperState();
}

class _StepperState extends State<StepperExam> {
  int _activStep = 0;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  var _keyUserName = GlobalKey<FormFieldState>();
  var _keyEmail = GlobalKey<FormFieldState>();
  var _keyPassword = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper Example"),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        physics: ScrollPhysics(),
        currentStep: _activStep,
        onStepContinue: (){
          if(_activStep < _steplar().length -1 ){
            if (_keyUserName.currentState!.validate() && _activStep == 0) {
              setState(() {
                _activStep ++;
              });
            }else if (_keyUserName.currentState!.validate() && _activStep == 1) {
              setState(() {
                _activStep ++;
              });
            }else if (_keyUserName.currentState!.validate() && _activStep == 2) {
              setState(() {
                _activStep ++;
              });
            }
          }
          if(_activStep < _steplar().length -1 ){

          }
          if(_activStep < _steplar().length -1 ){

          }
        },
        steps: _steplar(),
      ),
    );
  }

  List<Step> _steplar() {
    return [
      Step(
          title: Text("UserName "),
          content: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _usernameController,
              key: _keyUserName,
              validator: (text) {
                if (text!.length < 5) {
                  return "Kamida 5 ta belgi kiriting !";
                }
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Username...",
                  labelText: "Username"),
            ),
          ),
          state: _steplarmmiTekshir(0),
        isActive: _activStep == 0 ? true : false,
      ),
      Step(
          title: Text("Email "),
          content: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _emailController,
              key: _keyEmail,
              validator: (text) {
                if (text!.length < 5) {
                  return "Kamida 5 ta belgi kiriting !";
                }
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Email...",
                  labelText: "Email"),
            ),
          ),
          state: _steplarmmiTekshir(1),
        isActive: _activStep == 1 ? true : false,
      ),
      Step(
        title: Text("Password "),
        content: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            key: _keyPassword,
            validator: (text) {
              if (text!.length < 5) {
                return "Kamida 5 ta belgi kiriting !";
              }
            },
            controller: _passwordController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Password...",
                labelText: "Password"),
          ),
        ),
        state: _steplarmmiTekshir(2),
        isActive: _activStep == 2 ? true : false,
      )
    ];
  }

  _steplarmmiTekshir(int stepIndex) {
    if (_activStep == stepIndex) {
      return StepState.editing;
    } else {
      return StepState.complete;
    }
  }
}