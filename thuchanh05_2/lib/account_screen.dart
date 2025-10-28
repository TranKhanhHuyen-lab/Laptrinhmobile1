import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          const CircleAvatar(radius: 48, child: Icon(Icons.person, size: 48)),
          const SizedBox(height: 16),
          const Text('Admin', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('admin@library.example', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 30),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Cài đặt'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Đăng xuất'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
