import 'package:flutter/material.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final books = [
      'Sách 01 - Lập trình Flutter',
      'Sách 02 - Cấu trúc dữ liệu',
      'Sách 03 - Cơ sở dữ liệu',
      'Sách 04 - Lập trình hướng đối tượng',
      'Sách 05 - Mạng máy tính',
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Align(alignment: Alignment.centerLeft, child: Text('Danh sách sách', style: Theme.of(context).textTheme.titleMedium)),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemCount: books.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final title = books[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.book, color: Colors.blue),
                      const SizedBox(width: 12),
                      Expanded(child: Text(title, style: const TextStyle(fontSize: 16))),
                      const SizedBox(width: 8),
                      const Icon(Icons.more_vert, color: Colors.grey),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
