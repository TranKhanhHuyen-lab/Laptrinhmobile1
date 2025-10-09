// lib/main.dart
import 'package:flutter/material.dart';

void main() => runApp(const ThucHanhApp());

class ThucHanhApp extends StatelessWidget {
  const ThucHanhApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thực hành 02',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ThucHanhPage(),
    );
  }
}

class ThucHanhPage extends StatefulWidget {
  const ThucHanhPage({super.key});

  @override
  State<ThucHanhPage> createState() => _ThucHanhPageState();
}

class _ThucHanhPageState extends State<ThucHanhPage> {
  final TextEditingController _controller = TextEditingController();
  List<int> _items = [];

  void _createList() {
    final text = _controller.text.trim();
    final count = int.tryParse(text);

    // Kiểm tra hợp lệ: phải là số nguyên dương và không quá giới hạn (ví dụ 200)
    if (count == null || count <= 0 || count > 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Dữ liệu bạn nhập không hợp lệ'),
          backgroundColor: Colors.red,
        ),
      );
      setState(() => _items = []);
      return;
    }

    setState(() => _items = List<int>.generate(count, (i) => i + 1));
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Number'),
        backgroundColor: Colors.black87,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Thực hành 02',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 16),

              // Row: TextField + Button Tạo
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Nhập vào số lượng',
                        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _createList,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Tạo'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Danh sách các nút số (scrollable)
              Expanded(
                child: _items.isEmpty
                    ? const SizedBox()
                    : ListView.separated(
                        itemCount: _items.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final num = _items[index];
                          return SizedBox(
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                elevation: 0,
                              ),
                              child: Text('$num', style: const TextStyle(fontSize: 18, color: Colors.white)),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
