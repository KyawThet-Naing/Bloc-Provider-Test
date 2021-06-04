import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:pro_vider/ob/json_ob.dart';
import 'package:pro_vider/ob/response_ob.dart';
import 'package:http/http.dart' as http;

class HttpProvider with ChangeNotifier {
  ResponseOb responseOb = ResponseOb(msgState: MsgState.loading);

  getData() async {
    http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      List<dynamic> dataList = jsonDecode(response.body);
      List<JsonOb> jsonData = dataList.map((e) => JsonOb.fromJson(e)).toList();
      responseOb.msgState = MsgState.data;
      responseOb.data = jsonData;
      notifyListeners();
    } else if (response.statusCode == 404) {
      responseOb.msgState = MsgState.error;
      responseOb.errState = ErrState.notFoundErr;
      notifyListeners();
    } else if (response.statusCode == 500) {
      responseOb.msgState = MsgState.error;
      responseOb.errState = ErrState.serverErr;
      notifyListeners();
    } else {
      responseOb.msgState = MsgState.error;
      responseOb.errState = ErrState.unknownErr;
      notifyListeners();
    }
  }
}
