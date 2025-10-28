import 'package:flutter/material.dart';
import 'data_model.dart';

class ConfirmScreen extends StatelessWidget {
  final UserData userData; 

  ConfirmScreen({super.key, required this.userData});

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
        title: const Text('Confirm'),
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
              'Confirm',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'We are here to help you! Dưới đây là thông tin bạn đã nhập:',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // *** HIỂN THỊ DỮ LIỆU ĐÃ NHẬP ***
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('THÔNG TIN ĐÃ THU THẬP:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue)),
                  const Divider(),
                  const SizedBox(height: 10),
                  
                  // SỬ DỤNG DỮ LIỆU: Hiển thị Email
                  Text('📧 Email: ${userData.email}', style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 10),
                  
                  // SỬ DỤNG DỮ LIỆU: Hiển thị Mật khẩu (đã che)
                  Text('🔑 Mật khẩu mới (Che): ${'*' * userData.newPassword.length}', style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
            // *** KẾT THÚC HIỂN THỊ DỮ LIỆU ***

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                // Quay về màn hình đầu (ForgotPasswordScreen)
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color(0xFF007AFF),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text(
                'Submit',
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