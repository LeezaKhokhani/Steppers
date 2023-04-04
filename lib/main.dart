import 'package:flutter/material.dart';

void main() {
  runApp(
    const Homepage(),
  );
}

class Homepage extends StatefulWidget {

  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Stepper App",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          children: [
            Stepper(
              currentStep: currentStep,
              onStepTapped: (val) {
                setState(() {
                  currentStep = val;
                });
              },
              onStepContinue: () {
                setState(() {
                  if (currentStep < 2) currentStep++;
                });
              },
              onStepCancel: () {
                setState(() {
                  if (currentStep > 0) currentStep--;
                });
              },
              steps: [
                Step(
                  isActive: currentStep >= 0,
                  title: const Text("Sing up"),
                  content: Column(
                    children: [
                      TextField(
                        decoration: decoration(
                            Icons.person_outline, "Full Name"),
                      ),
                      const SizedBox(height: 10,),
                      TextField(
                        decoration: decoration(
                            Icons.email_outlined, "Email Id"),
                      ),
                      const SizedBox(height: 10,),
                      TextField(
                        decoration: decoration(Icons.lock_outline, "Password"),
                      ),
                      const SizedBox(height: 10,),
                      TextField(
                        decoration:
                        decoration(Icons.lock_outline, "Confirm Password"),
                      ),
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
                Step(
                  isActive: currentStep >= 1,
                  title: const Text("Login"),
                  content: Column(
                    children: [
                      TextField(
                        decoration: decoration(
                            Icons.person_outline, "User Name"),
                      ),
                      const SizedBox(height: 10,),
                      TextField(
                        decoration: decoration(Icons.lock_outline, "Password"),
                      ),
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
                Step(
                  isActive: currentStep >= 2,
                  title: const Text("Home"),
                  content: Container(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

 decoration(icon, String m)
 {
    return InputDecoration(
        icon: Icon(icon,color: Colors.grey,),
        iconColor: Colors.grey,
        hintText: m,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey),
        ),
          focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
    );
  }
}
