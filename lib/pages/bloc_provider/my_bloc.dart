import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pro_vider/ob/json_ob.dart';
import 'package:pro_vider/ob/response_ob.dart';

class MyBloc {
  StreamController<ResponseOb> _streamController =
      StreamController<ResponseOb>();

  getStream() => _streamController.stream;

  getData() async {
    ResponseOb responseOb = ResponseOb(msgState: MsgState.loading);
    _streamController.sink.add(responseOb);

    http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      List<dynamic> dataList = jsonDecode(response.body);
      List<JsonOb> jsonData = dataList.map((e) => JsonOb.fromJson(e)).toList();
      responseOb.msgState = MsgState.data;
      responseOb.data = jsonData;
      _streamController.sink.add(responseOb);
    } else if (response.statusCode == 404) {
      responseOb.msgState = MsgState.error;
      responseOb.errState = ErrState.notFoundErr;
      _streamController.sink.add(responseOb);
    } else if (response.statusCode == 500) {
      responseOb.msgState = MsgState.error;
      responseOb.errState = ErrState.serverErr;
      _streamController.sink.add(responseOb);
    } else {
      responseOb.msgState = MsgState.error;
      responseOb.errState = ErrState.unknownErr;
      _streamController.sink.add(responseOb);
    }
  }

  disposed() => _streamController.close();
}
