import 'package:flutter/material.dart';

void main() => runApp(const ThucHanh03App());

class ThucHanh03App extends StatelessWidget {
  const ThucHanh03App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thực hành 03',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const EmailCheckScreen(),
    );
  }
}

class EmailCheckScreen extends StatefulWidget {
  const EmailCheckScreen({super.key});

  @override
  State<EmailCheckScreen> createState() => _EmailCheckScreenState();
}

class _EmailCheckScreenState extends State<EmailCheckScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String _message = '';

  void _checkEmail() {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      setState(() {
        _message = 'Email không hợp lệ';
      });
      return;
    }

    if (!email.contains('@')) {
      setState(() {
        _message = 'Email không đúng định dạng';
      });
      return;
    }

    setState(() {
      _message = 'Bạn đã nhập email hợp lệ';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Thực hành 03'),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tuổi',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              _message,
              style: TextStyle(
                color: _message.contains('hợp lệ')
                    ? Colors.green
                    : Colors.red,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _checkEmail,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Kiểm tra',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _ageController.dispose();
    super.dispose();
  }
}
