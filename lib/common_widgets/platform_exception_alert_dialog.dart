import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'platform_alert_dialog.dart';

class PlatformExceptionAlertDialog extends PlatformAlertDialog {
  PlatformExceptionAlertDialog({
    @required String title,
    @required PlatformException exception,
  }) : super(
          title: title,
          content: _message(exception),
          defaultActionText: 'Ok',
        );

  static String _message(PlatformException exception) {
    if (exception.message ==
        'description=Missing or insufficient permissions.') {
      if (exception.code == 'PERMISSION_DENIED') {
        return 'Missing or insufficient permissions';
      }
    }
    return _errors[exception.code] ?? exception.message;
  }

  static Map<String, String> _errors = {
    'ERROR_WRONG_PASSWORD': 'The password is invalid',
  };
}
