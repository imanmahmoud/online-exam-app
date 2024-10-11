import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/domain/common/CustomExceptions.dart';

Future<Result<T>> excuteApi<T>(Future<T> Function() apiCall) async {
  try {
    var result = await apiCall.call();
    return Success(result);
  } on TimeoutException catch (ex) {
    return Fail(NoInternetError());
  } on IOException catch (ex) {
    return Fail(NoInternetError());
  } on DioException catch (ex) {
    return Fail(DioHttpException(ex));
  } on Exception catch (ex) {
    return Fail(ex);
  }
}
