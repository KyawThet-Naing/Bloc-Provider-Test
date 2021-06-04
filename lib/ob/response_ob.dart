class ResponseOb {
  ErrState? errState;
  MsgState? msgState;
  dynamic data;

  ResponseOb({this.errState, this.msgState, this.data});

}

enum ErrState {
  notFoundErr,
  serverErr,
  unknownErr,
}

enum MsgState {
  data,
  loading,
  error,
  unknown,
}
