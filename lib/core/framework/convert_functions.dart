import 'package:rnly/core/core.dart';

Future<NotifierState<Response>> convert<Response>(
  MainFunction<Response> f, {
  Function(ServiceResponse<Response>)? then,
}) async {
  var response = await f();
  then?.call(response);
  return response.toNotifierState();
}

typedef MainFunction<Response> = Future<ServiceResponse<Response>> Function();
