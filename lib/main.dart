// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_x_go/barang.dart';
import 'package:flutter_x_go/insertdata.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "GET DATA FROM GOLANG",    
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var loading = false;
  final List<Barang> _listProduct = [];

  @override
  void initState() {
    super.initState();
    _fetchDataProduct();
  }

  Future<void> _fetchDataProduct() async {
    try {
      String url = "http://10.0.2.2:3000/barang";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        setState(() {
          loading = true;
          final data = jsonDecode(response.body);
          _listProduct.clear();
          for (Map<String, dynamic> i in data['data']) {
            _listProduct.add(Barang.fromJson(i));
          }
          loading = false;
        });
      }
    } catch (e) {
      // Error handling
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        title: const Text("GET DATA FROM GOLANG"),
        backgroundColor: Colors.green[400]
      ),
      body: Container(
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _listProduct.length,
                itemBuilder: (context, i) {
                  final getdata = _listProduct[i];
                  return SizedBox(
                    child: ItemList(
                      kodebarang: getdata.kodebarang,
                      namabarang: getdata.namabarang,
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddData()));
        }, 
        label: const Text("Tambah Data", 
        style: TextStyle(
          color: Colors.white, 
          fontWeight: FontWeight.bold
        ),
        ),
        icon: const Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.green[300],
        ),
      ),
      
    );
  }
}

class ItemList extends StatefulWidget {
  final String kodebarang;
  final String namabarang;

  const ItemList({super.key, required this.kodebarang, required this.namabarang});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            child: Card(
              child: ListTile(
                title: Text(widget.namabarang),
                subtitle: Text(widget.kodebarang),
              ),
            ),
          )
        ],
      ),
    );
  }
}
