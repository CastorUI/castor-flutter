import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

/// Toast utility functions
/// 
/// These functions depend on [ToastificationWrapper] being present in the widget tree.
/// The [toastification] global instance is initialized by ToastificationWrapper.

// Info toast
ToastificationItem toastInfo(String msg) {
  return toastification.show(
    title: Text(msg),
    type: ToastificationType.info,
    style: ToastificationStyle.flat,
    alignment: Alignment.center,
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    autoCloseDuration: const Duration(seconds: 1),
  );
}

// Success toast
ToastificationItem toastSuccess(String msg) {
  return toastification.show(
    title: Text(msg),
    type: ToastificationType.success,
    style: ToastificationStyle.flat,
    alignment: Alignment.center,
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    autoCloseDuration: const Duration(seconds: 1),
  );
}

// Warning toast
ToastificationItem toastWarning(String msg) {
  return toastification.show(
    title: Text(msg),
    type: ToastificationType.warning,
    style: ToastificationStyle.flat,
    alignment: Alignment.center,
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    autoCloseDuration: const Duration(seconds: 5),
  );
}

// Error toast
ToastificationItem toastError(String msg) {
  return toastification.show(
    title: Text(msg),
    type: ToastificationType.error,
    style: ToastificationStyle.flat,
    alignment: Alignment.center,
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    autoCloseDuration: const Duration(seconds: 5),
  );
}
