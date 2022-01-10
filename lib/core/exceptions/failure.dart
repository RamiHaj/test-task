import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:test_task/core/constants/toast.dart';

class WithThrowException implements Exception
{
  final String error;


  WithThrowException({
    this.error = 'Invalid Value'
  });

  @override
  String toString()
  {
    return error;
  }
}

enum NameException{
  format,
  socket,
  other,
  dio,
  timeout,
  notfound
}

void withException(
  {
  required dynamic exception
})
{
  if(exception is SocketException)
  {
    showToast(text: message(NameException.socket)!, color: ToastColors.error);
  }else if(exception is FormatException)
  {
    showToast(text: message(NameException.format)!, color: ToastColors.error);
  }else if(exception is Exception)
  {
    showToast(text: message(NameException.other)!, color: ToastColors.error);
  }else if(exception is DioError)
  {
    if(exception.response!.statusCode == 403)
    {
    showToast(text: message(NameException.notfound)!, color: ToastColors.error);
    }else
      {
        showToast(text: message(NameException.dio)!, color: ToastColors.error);
      }
  }else if(exception is TimeoutException)
  {
    showToast(text: message(NameException.dio)!, color: ToastColors.error);
  }
}

String? message(NameException nameException) {
  String? message;
  switch(nameException)
  {
    case NameException.socket:
      message = 'Check Your Internet Connection!!';
      break;
    case NameException.format:
      message = 'An error occurred, please try again later , Contact Your Admin!';
      break;
    case NameException.other:
      message = 'Sorry , try again!';
      break;
    case NameException.dio:
      message = 'dio';
      break;
    case NameException.timeout:
      message = 'It\'s been a long time, please try again';
      break;
    case NameException.notfound:
      message = 'User Not Found!';
      break;
  }
  return message;
}