import 'package:flutter/material.dart';
import 'data_model.dart';
import 'confirm_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  final UserData userData;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  ResetPasswordScreen({super.key, required this.userData});

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
        title: const Text('Reset Password'),
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
              'Create new password',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Your new password must be different from previously used password.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 30),

            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock_reset),
              ),
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                if (_passwordController.text == _confirmPasswordController.text && _passwordController.text.isNotEmpty) {
                   // LƯU DỮ LIỆU và CHUYỂN MÀN
                   userData.newPassword = _passwordController.text;
                   
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => ConfirmScreen(userData: userData),
                     ),
                   );
                } else {
                   ScaffoldMessenger.of(context).showSnackBar(
                       const SnackBar(content: Text('Mật khẩu không khớp hoặc trống!')));
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