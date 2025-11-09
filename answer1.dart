import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CommentScreen(),
    );
  }
}

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comment Thread'),
        backgroundColor: const Color(0xFFF7F2FF),
        elevation: 0,
      ),

      // ✅ ชิดบนซ้ายจริงแน่นอน
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),

            // ✅ กรอบการ์ดขนาดคงที่ 500 × 200
            SizedBox(
              width: 500,
              height: 200,
              child: const CommentCard(),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF7F2FF), // สีพื้นหลังเหมือน screenshot
    );
  }
}

class CommentCard extends StatelessWidget {
  const CommentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.purple.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.purple.shade100),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: const CommentContent(),
    );
  }
}

class CommentContent extends StatelessWidget {
  const CommentContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(radius: 24, child: Text('A')),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('User A', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('This is the main comment. Flutter layouts are fun!'),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        Row(
          children: const [
            Icon(Icons.thumb_up_alt_outlined, size: 18),
            SizedBox(width: 4),
            Text('12'),
            SizedBox(width: 20),
            Icon(Icons.comment_outlined, size: 18),
            SizedBox(width: 4),
            Text('Reply'),
            Spacer(),
            Text('1h ago', style: TextStyle(color: Colors.grey)),
          ],
        ),

        const SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CircleAvatar(radius: 18, child: Text('B')),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('User B', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('I agree!'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
