import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambahkan Data"),
        backgroundColor: Colors.green[300],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Kode Barang"),
            const Padding(padding: EdgeInsets.all(5.0)),
            TextFormField(
                  decoration: const InputDecoration(
                  labelText: "Masukan Kode Barang",
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
                )
              ),
            ),
            

            const Text("Nama Barang"),
            TextFormField(
                  decoration: const InputDecoration(
                  labelText: "Masukan Nama Barang",
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
                )
              ),
            ),

            ButtonTheme(
              height: 60.0,
              minWidth: double.infinity,
              buttonColor: Colors.green[300],
              child: ElevatedButton(
                onPressed: (){}, 
                child: const Text("Simpan Data"))
            )
            
          ],
        ),
      ),
    );
  }
}