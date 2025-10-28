import 'package:flutter/material.dart';

class ManageScreen extends StatefulWidget {
  const ManageScreen({super.key});

  @override
  State<ManageScreen> createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  // 3 tên mẫu để đổi khi nhấn "Thay đổi"
  final List<String> _students = ['Nguyen Van A', 'Nguyen Thi B', 'Nguyen Van C'];
  int _currentIndex = 0;

  // Mảng sách mượn giả (mặc định rỗng để hiển thị thông báo)
  final List<String> _borrowed = [];

  void _changeStudent() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _students.length;
      // khi đổi sinh viên, clear danh sách borrow hiển thị "chưa mượn" (giữ đơn giản)
      _borrowed.clear();
    });
  }

  void _onAddPressed() {
    // theo yêu cầu bạn không muốn thêm logic, nút này chỉ hiển thị Snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Nút Thêm (theo yêu cầu, không thêm logic)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentStudent = _students[_currentIndex];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Row: Sinh viên + nút Thay đổi
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(currentStudent, style: const TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: _changeStudent,
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
                child: const Text('Thay đổi'),
              ),
            ],
          ),

          const SizedBox(height: 18),
          // Header "Danh sách sách"
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Danh sách sách', style: Theme.of(context).textTheme.titleMedium),
          ),
          const SizedBox(height: 10),

          // Vùng hiển thị sách đã mượn hoặc thông báo
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: _borrowed.isEmpty
                  ? const Center(
                      child: Text(
                        'Bạn chưa mượn quyển sách nào',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    )
                  : ListView.separated(
                      itemCount: _borrowed.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final t = _borrowed[index];
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(t),
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline, color: Colors.redAccent),
                                onPressed: () {
                                  setState(() {
                                    _borrowed.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ),

          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _onAddPressed,
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
              child: const Text('Thêm'),
            ),
          ),
        ],
      ),
    );
  }
}
