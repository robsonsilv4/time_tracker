import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'platform_alert_dialog.dart';

class PlatformExceptionAlertDialog extends PlatformAlertDialog {
  PlatformExceptionAlertDialog({
    @required String title,
    @required PlatformException exception,
  }) : super(
          title: title,
          content: exception.message,
          defaultActionText: 'Ok',
        );
}
