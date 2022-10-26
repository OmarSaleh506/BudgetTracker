import 'package:flutter/material.dart';
import 'views/screens/addTransaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddTransaction(),
    );
  }
}

class T extends StatefulWidget {
  const T({Key? key}) : super(key: key);

  @override
  _TState createState() => _TState();
}

class _TState extends State<T> {
  List<bool> isCardEnabled = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('T'),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(15),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
          ),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            isCardEnabled.add(false);
            return GestureDetector(
                onTap: () {
                  isCardEnabled.replaceRange(0, isCardEnabled.length,
                      [for (int i = 0; i < isCardEnabled.length; i++) false]);
                  isCardEnabled[index] = true;
                  setState(() {});
                },
                child: Card(
                  color: isCardEnabled[index]
                      ? Color(0xffFF5678)
                      : Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Icon(Icons.wifi, color: isCardEnabled[index]
                              ? Colors.white
                              : Colors.black,),
                    
                  ),
                ));
          }),
    );
  }
}
