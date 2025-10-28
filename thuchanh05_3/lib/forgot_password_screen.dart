import 'package:flutter/material.dart';
import 'data_model.dart';
import 'verify_code_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final UserData userData = UserData();

  ForgotPasswordScreen({super.key});

  Widget _buildHeader() {
    return const Column(
      children: [
        Icon(Icons.school, size: 50, color: Color(0xFF007AFF)), 
        SizedBox(height: 10),
        Text(
          'SmartTasks',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF007AFF)),
        ),
        SizedBox(height: 30),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nav (Data Flow)'),
        automaticallyImplyLeading: false, 
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildHeader(),
            const Text(
              'Forgot Password?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Enter your Email, we will send you a verification code.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 30),

            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Your Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const Spacer(), 

            ElevatedButton(
              onPressed: () {
                if (_emailController.text.isNotEmpty) {
                  // LƯU DỮ LIỆU và CHUYỂN MÀN
                  userData.email = _emailController.text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerifyCodeScreen(userData: userData),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                       const SnackBar(content: Text('Vui lòng nhập Email!')));
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color(0xFF007AFF), 
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text(
                'Next',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
