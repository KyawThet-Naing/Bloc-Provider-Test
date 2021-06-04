import 'package:flutter/material.dart';
import 'package:pro_vider/provider/count_provider.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CountProvider _countProvider = Provider.of<CountProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
                builder: (_, CountProvider _cp, __) =>
                    Text(_cp.count.toString())),
            ElevatedButton(
                onPressed: () => _countProvider.increaseCount(),
                child: Text('+1'))
          ],
        ),
      ),
    );
  }
}
