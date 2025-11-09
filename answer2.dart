import 'package:flutter/material.dart';

void main() => runApp(const ConcertApp());

class ConcertApp extends StatelessWidget {
  const ConcertApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Concert Ticket',
      debugShowCheckedModeBanner: false,
      home: const ConcertTicketPage(),
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4ECF6), // โทนอ่อน ๆ
      ),
    );
  }
}

class ConcertTicketPage extends StatelessWidget {
  const ConcertTicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Concert Ticket')),
      body: Center(
        child: Container(
          width: 300,
          height: 180,
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                blurRadius: 10,
                spreadRadius: 0,
                offset: Offset(0, 6),
                color: Colors.black12,
              ),
            ],
          ),
          // ---------- Stack > Row (main) + Positioned (dotted line) ----------
          child: Stack(
            children: [
              // Main content
              Row(
                children: [
                  // -------- ส่วนข้อมูลซ้าย (กว้างกว่า) --------
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Flutter Live',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('Band: The Widgets'),
                          SizedBox(height: 6),
                          Text('Date: 8 NOV 2025'),
                          SizedBox(height: 6),
                          Text('Gate: 7'),
                        ],
                      ),
                    ),
                  ),

                  // -------- ส่วนบาร์โค้ด/QR ขวา --------
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade700,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.qr_code,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // -------- รอยฉีกตั๋ว (ใช้ Icon more_vert) --------
              const Positioned(
                top: 0,
                bottom: 0,
                left: 210, // ตามสเปค
                child: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
