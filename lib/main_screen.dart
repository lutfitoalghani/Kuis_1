import 'package:flutter/material.dart';
import 'package:kuispraktikum1/groceries.dart';
import 'package:kuispraktikum1/second_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Marketplace"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {

          // Instansiasi
          // dengan format
          // final namaClass namaVariabel = namaConstructor
          final Groceries product = groceryList[index];

          // Inkwell mirip seperti button yang bisa diklik dan ada fungsinya
          // Bedanya adalah button hanyalah sebuah tombol
          // Sedangkan Inkwell adalah container yang bisa di klik
          // ElevatedButton menggunakan onPressed, sedangkan InkWell menggunakan onTap
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return SecondScreen(product: product);
                }),
              );
            },

            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(product.productImageUrls[0], width: 120,),
                  Text(product.name),
                  Text(product.storeName)
                ],
              ),
            ),
          );
        },
        itemCount: groceryList.length,
      ),
    );
  }
}