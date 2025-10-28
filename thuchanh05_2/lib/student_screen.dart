import 'package:flutter/material.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final students = [
      {'name': 'Nguyễn Văn A', 'id': 'SV001'},
      {'name': 'Trần Thị B', 'id': 'SV002'},
      {'name': 'Lê Văn C', 'id': 'SV003'},
      {'name': 'Phạm Thị D', 'id': 'SV004'},
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Align(alignment: Alignment.centerLeft, child: Text('Danh sách sinh viên', style: Theme.of(context).textTheme.titleMedium)),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemCount: students.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final s = students[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.person, color: Colors.green),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(s['name']!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                            const SizedBox(height: 4),
                            Text('Mã: ${s['id']}', style: const TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                      const Icon(Icons.more_horiz, color: Colors.grey),
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
