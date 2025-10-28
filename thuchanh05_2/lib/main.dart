import 'package:flutter/material.dart';
import 'manage_screen.dart';
import 'book_list_screen.dart';
import 'student_screen.dart';
import 'account_screen.dart';

void main() {
  runApp(const LibraryApp());
}

class LibraryApp extends StatelessWidget {
  const LibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hệ thống Quản lý Thư viện',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Tạo 4 trang giống y như ảnh bạn gửi
  final List<Widget> _pages = const [
    ManageScreen(),
    BookListScreen(),
    StudentScreen(),
    AccountScreen(),
  ];

  void _onTap(int idx) {
    setState(() {
      _selectedIndex = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hệ thống Quản lý Thư viện'),
        centerTitle: true,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onTap,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Quản lý'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'DS Sách'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Sinh viên'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Tài khoản'),
        ],
      ),
    );
  }
}
