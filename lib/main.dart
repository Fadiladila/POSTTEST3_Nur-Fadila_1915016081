import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nur Fadila',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int angka = 0;
  String nama = "";
  bool? isHadiah = false;
  List<String> pengiriman = ["Kurir", "Ambil Sendiri"];
  String kirim = "";

  final namaController = TextEditingController();

  @override
  void dispose() {
    namaController.dispose();
    // TODO: implement dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(222, 255, 194, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "\n\nCheckout",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(111, 128, 97, 1),
              ),
            ),
            SizedBox(height: 30), //jarak antar textfield

            for (var item in pengiriman)
              ListTile(
                leading: Radio(
                  value: item,
                  groupValue: kirim,
                  onChanged: (String? value) {
                    setState(() {
                      kirim = value!;
                    });
                  },
                ),
                title: Text(item),
              ),

            ListTile(
              leading: Checkbox(
                  value: isHadiah,
                  onChanged: (bool? value) {
                    setState(() {
                      isHadiah = value;
                    });
                  }),
              title:
                  Text("apakah anda ingin membeli barang ini sebagai hadiah?"),
            ),
            SizedBox(height: 30),
            TextField(
                controller: namaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Masukkan nama anda",
                )),
            SizedBox(height: 30),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    nama = namaController.text;
                  });
                },
                child: Text("Checkout"),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(111, 128, 97, 1),
                ),
              ),
            ),
            Container(
              child: Text(
                "nama : $nama",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
            Text(
              "jenis pengantaran: $kirim",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
