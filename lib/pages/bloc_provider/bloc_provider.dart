import 'package:flutter/material.dart';
import 'package:pro_vider/ob/json_ob.dart';
import 'package:pro_vider/ob/response_ob.dart';
import 'package:pro_vider/pages/bloc_provider/my_bloc.dart';
import 'package:provider/provider.dart';

class BlocProvider extends StatelessWidget {
  const BlocProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyBloc _myBloc = Provider.of<MyBloc>(context);
    _myBloc.getData();

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Provider'),
      ),
      body: StreamBuilder<ResponseOb>(
        initialData: ResponseOb(msgState: MsgState.loading),
        stream: _myBloc.getStream(),
        builder: (BuildContext context, AsyncSnapshot<ResponseOb> snapshot) {
          ResponseOb responseOb = snapshot.data!;

          if (responseOb.msgState == MsgState.data) {
            List<JsonOb> jsList = responseOb.data;

            return ListView(
              children: jsList
                  .map((e) => ListTile(
                        title: Text(e.title!),
                        subtitle: Text(e.body!),
                      ))
                  .toList(),
            );
          } else if (responseOb.msgState == MsgState.loading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text('Error'));
          }
        },
      ),
    );
  }
}
