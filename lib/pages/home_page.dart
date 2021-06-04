
import 'package:flutter/material.dart';
import 'package:pro_vider/pages/second_page.dart';
import 'package:pro_vider/provider/calculate_provider.dart';
import 'package:pro_vider/provider/count_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CountProvider countProvider = Provider.of<CountProvider>(context);
    CalculateProvider calculateProvider =
        Provider.of<CalculateProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Provider')),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          Consumer<CountProvider>(
              builder: (_, CountProvider cProvider, __) =>
                  Text(cProvider.count.toString())),
          ElevatedButton(
              onPressed: () => countProvider.increaseCount(),
              child: Icon(Icons.add)),
          ElevatedButton(
              onPressed: () => countProvider.decreaseCount(),
              child: Icon(Icons.remove)),
          ElevatedButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SecondPage())),
              child: Text('Go Second')),
          TextFormField(controller: _controller1),
          TextFormField(controller: _controller2),
          Consumer(
              builder: (_, CalculateProvider caP, __) =>
                  Text(caP.ans.toString())),
          ElevatedButton(
              onPressed: () {
                int num1 = int.parse(_controller1.text);
                int num2 = int.parse(_controller2.text);
                calculateProvider.sum(num1: num1, num2: num2);
              },
              child: Text('calculate +')),
          ElevatedButton(
              onPressed: () {
                int num1 = int.parse(_controller1.text);
                int num2 = int.parse(_controller2.text);
                calculateProvider.sub(num1: num1, num2: num2);
              },
              child: Text('calculate -')),
        ],
      ),
    );
  }
}
