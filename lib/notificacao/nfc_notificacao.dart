import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NFCnotificacao extends ChangeNotifier {
  bool _isProcessing = false;
  String _message = "";

  bool get isProcessing => _isProcessing;

  String get message => _message;

  Future<void> startNFCOperacao({
    required NFCOperacao nfcOperacao,
    String dataType = "",
  }) async {
    try {
      _isProcessing = true;
      notifyListeners();

      bool isAvail = await NfcManager.instance.isAvailable();

      if (isAvail) {
      } else {}
    } catch (e) {}
  }
}

enum NFCOperacao { read, write }
