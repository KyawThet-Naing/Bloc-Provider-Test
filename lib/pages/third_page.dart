import 'package:flutter/material.dart';
import 'package:pro_vider/ob/json_ob.dart';
import 'package:pro_vider/ob/response_ob.dart';
import 'package:pro_vider/provider/http_provider.dart';
import 'package:provider/provider.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Third Page')),

      body: Consumer<HttpProvider>(
        builder: (_, HttpProvider hProvider, __) {
          ResponseOb resOb = hProvider.responseOb;
          if (resOb.msgState == MsgState.data) {

            print(resOb.data.runtimeType);

            List<JsonOb> jsList = resOb.data;

            return ListView(
              children: jsList
                  .map((e) => ListTile(
                title: Text(e.title!),
                subtitle: Text(e.body!),
              ))
                  .toList(),
            );
          } else if (resOb.msgState == MsgState.loading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text('Error'));
          }
        },
      ),
    );
  }
}
