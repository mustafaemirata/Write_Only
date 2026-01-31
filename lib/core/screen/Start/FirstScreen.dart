import 'package:flutter/material.dart';
import 'package:write_only/core/constants/app_decorations.dart';
import 'package:write_only/core/screen/Home/HomeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';


class Firstscreen extends StatefulWidget {
  const Firstscreen({super.key});

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: AppDecorations.coffeeBackground,

        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 150.0),
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 2,
                        ),

                        image: const DecorationImage(
                          image: AssetImage("assets/images/kisi.png"),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      "Maskeleri çıkar,\ndüşüncelerini özgür bırak.\nKimse bilmeyecek.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'PlaywriteNZ',
                        fontSize: 22,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.95),
                        height: 1.3,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black.withOpacity(0.8),
                            offset: const Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),

                  ElevatedButton(
                    onPressed: () async {
                      final random = Random();
                      final id = List.generate(
                        7,
                        (_) => random.nextInt(10),
                      ).join();
                      final username = "user$id";

                      await FirebaseFirestore.instance.collection('users').add({
                        'name': username,
                      });

                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString('username', username);

                      if (!mounted) return;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Homescreen(username: username),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.3),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 18,
                      ),
                      side: BorderSide(
                        color: Colors.white.withOpacity(0.6),
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "İçeri Gir",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
