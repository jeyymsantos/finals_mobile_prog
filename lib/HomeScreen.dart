import 'package:flutter/material.dart';

import 'RecognitionScreen.dart';
import 'RegistrationScreen.dart';
import 'History.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 100),
              child: Image.asset(
                "images/logo.png",
                width: screenWidth - 40,
                height: screenWidth - 40,
              )),
          Container(
            margin: const EdgeInsets.only(bottom: 50, left: 15, right: 15),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Background color
                    foregroundColor: Colors.blue, // Text color
                    minimumSize: Size(screenWidth - 30, 50), // Button size
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Rounded corners
                    ),
                    shadowColor: Colors.grey, // Shadow color
                    elevation: 5, // Shadow intensity
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.blue, // Text color
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8), // Space between text and icon
                      Icon(
                        Icons.add, // Icon to display
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RecognitionScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Background color
                    foregroundColor: Colors.blue, // Text color
                    minimumSize: Size(screenWidth - 30, 50), // Button size
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Rounded corners
                    ),
                    shadowColor: Colors.grey, // Shadow color
                    elevation: 5, // Shadow intensity
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Recognize",
                        style: TextStyle(
                          color: Colors.blue, // Text color
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8), // Space between text and icon
                      Icon(
                        Icons.remove_red_eye_sharp, // Icon to display
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HistoryPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Background color
                    foregroundColor: Colors.blue, // Text color
                    minimumSize: Size(screenWidth - 30, 50), // Button size
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Rounded corners
                    ),
                    shadowColor: Colors.grey, // Shadow color
                    elevation: 5, // Shadow intensity
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "History",
                        style: TextStyle(
                          color: Colors.blue, // Text color
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8), // Space between text and icon
                      Icon(
                        Icons.history, // Icon to display
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
