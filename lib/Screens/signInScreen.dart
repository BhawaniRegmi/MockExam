import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mock_exam/Screens/homeScreen.dart';
import 'package:mock_exam/Screens/signUpScreen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _rememberMe = false; // State for the "Remember me" checkbox
  bool _obscurePassword = true; // State for password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Image.asset('assets/auth/logo.png', height: 120), // Replace with your logo
              SizedBox(height: 10),
              Text(
                "Sign in to access your account",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                      ),
                      Text("Remember me"),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("Forgot password?"),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>HomeScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text("Sign in", style: TextStyle(fontSize: 16)),
                ),
              ),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.black54,
                        
                      ),
                    ),
                    
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>SignUpScreen()));
                      // Navigate to Sign Up screen
                      print("Sign Up tapped"); // Replace with actual navigation logic
                    },
                    child: Text(
                      " Sign Up",
                      style: TextStyle(
                        color: Colors.blue,
                        
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text("Or continue with", style: TextStyle(color: Colors.black54)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
                    iconSize: 40,
                    onPressed: () {
                      // Add Google login logic
                    },
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue),
                    iconSize: 40,
                    onPressed: () {
                      // Add Facebook login logic
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text("© 2024 Robust IT. All rights reserved.", style: TextStyle(color: Colors.black54)),
            ],
          ),
        ),
      ),
    );
  }
}
