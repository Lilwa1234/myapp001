import 'package:flutter/material.dart';

void main() => runApp(const CarWashApp());

class CarWashApp extends StatelessWidget {
  const CarWashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Wash Calculator',
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const CarWashPage(),
    );
  }
}

class CarWashPage extends StatefulWidget {
  const CarWashPage({super.key});

  @override
  State<CarWashPage> createState() => _CarWashPageState();
}

class _CarWashPageState extends State<CarWashPage> {

  int _basePrice = 200; // ค่าเริ่มต้น (รถเก๋ง Medium)
  bool _vacuum = false; // ดูดฝุ่น
  bool _wax = false;    // เคลือบแว็กซ์

  int get total {
    int total = _basePrice;
    if (_vacuum) total += 50;
    if (_wax) total += 100;
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('คำนวณค่าบริการล้างรถ')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text('ขนาดรถ', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            DropdownButtonFormField<int>(
              value: _basePrice,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              items: const [
                DropdownMenuItem(value: 150, child: Text("รถเล็ก (Small) - 150 บาท")),
                DropdownMenuItem(value: 200, child: Text("รถเก๋ง (Medium) - 200 บาท")),
                DropdownMenuItem(value: 250, child: Text("รถ SUV/กระบะ (Large) - 250 บาท")),
              ],
              onChanged: (value) => setState(() => _basePrice = value!),
            ),

            const SizedBox(height: 20),

            CheckboxListTile(
              title: const Text("ดูดฝุ่น (+50 บาท)"),
              value: _vacuum,
              onChanged: (val) => setState(() => _vacuum = val ?? false),
            ),

            CheckboxListTile(
              title: const Text("เคลือบแว็กซ์ (+100 บาท)"),
              value: _wax,
              onChanged: (val) => setState(() => _wax = val ?? false),
            ),

            const SizedBox(height: 20),
            const Divider(),

            Center(
              child: Text(
                "ราคารวม: $total บาท",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
