part of '../models.dart';

class BaseResponse<T> {
  String message;
  bool status;
  T result;

  BaseResponse({
    this.status,
    this.message,
    this.result,
  });
}