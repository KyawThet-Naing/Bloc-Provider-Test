import 'package:flutter/material.dart';
import 'package:pro_vider/pages/bloc_provider/bloc_provider.dart';
import 'package:pro_vider/pages/bloc_provider/my_bloc.dart';
import 'package:pro_vider/provider/calculate_provider.dart';
import 'package:pro_vider/provider/count_provider.dart';
import 'package:pro_vider/provider/http_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyProvider());

class MyProvider extends StatelessWidget {
  const MyProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CountProvider>(
            create: (context) => CountProvider()),
        ChangeNotifierProvider<CalculateProvider>(
            create: (context) => CalculateProvider()),
        ChangeNotifierProvider<HttpProvider>(
            create: (context) => HttpProvider()),
        Provider(
          create: (context) => MyBloc(),
          dispose: (context, MyBloc myBloc) => myBloc.disposed(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(),
      ),
    );
  }
}
