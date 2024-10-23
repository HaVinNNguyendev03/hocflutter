import 'package:flutter/material.dart';
class TextInputDemo extends StatefulWidget {
  const TextInputDemo({super.key});

  @override
  _TextInputDemoState createState() => _TextInputDemoState();
}

class _TextInputDemoState extends State<TextInputDemo> {
  final TextEditingController _controller = TextEditingController();
  String latestInput = "Widget Initialized"; // Đặt giá trị khởi tạo

  @override
  void initState() {
    super.initState();
    print("initState: Widget được khởi tạo");
    // Giá trị khởi tạo sẽ hiển thị khi widget được khởi động
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies: Thay đổi dependencies đã xảy ra");
  }

  void _updateInput() {
    setState(() {
      latestInput = _controller.text; // Cập nhật chữ mới nhất
    });
    _controller.clear(); // Xóa nội dung trong TextField
  }

  @override
  void dispose() {
    _controller.dispose(); // Giải phóng tài nguyên của controller
    print("dispose: Widget bị hủy");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Input Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nhập chữ ở đây',
              ),
              onSubmitted: (value) {
                _updateInput(); // Gọi cập nhật khi nhấn Enter
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateInput, // Gọi cập nhật khi nhấn nút
              child: const Text("Cập nhật"),
            ),
            const SizedBox(height: 20),
            // Hiển thị chữ mới nhất
            LatestInputDisplay(latestInput: latestInput),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, 
                MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
              child: const Text("Chuyển đến màn hình mới"),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget hiển thị chữ mới nhất
class LatestInputDisplay extends StatefulWidget {
  final String latestInput;

  const LatestInputDisplay({super.key, required this.latestInput});

  @override
  _LatestInputDisplayState createState() => _LatestInputDisplayState();
}

class _LatestInputDisplayState extends State<LatestInputDisplay> {
  @override
  void didUpdateWidget(covariant LatestInputDisplay oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Gọi setState nếu dữ liệu mới khác với dữ liệu cũ
    if (oldWidget.latestInput != widget.latestInput) {
      print("\x1B[31m" + "didUpdateWidget: Chữ mới nhất đã được cập nhật: ${widget.latestInput}" + "\x1B[0m");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Chữ mới nhất: ${widget.latestInput}', // Hiển thị chữ mới nhất
      style: const TextStyle(fontSize: 24, color: Colors.red), // Chữ màu đỏ
    );
  }
}
// Màn hình thứ hai
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Màn hình thứ hai'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Quay lại màn hình trước
          },
          child: const Text("Quay lại"),
        ),
      ),
    );
  }
}