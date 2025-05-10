import 'package:flutter/material.dart';
import 'package:leitor_nfc/core/notifier/nfc_notifier.dart';
import 'package:leitor_nfc/presentation/widgets/dialogs.dart';
import 'package:provider/provider.dart';

class ReadWriteNFCScreen extends StatelessWidget {
  const ReadWriteNFCScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NFCNotifier(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Leitura NFC")),
        body: Builder(
          builder: (BuildContext context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      scanningDialog(context);
                      Provider.of<NFCNotifier>(
                        context,
                        listen: false,
                      ).startNFCOperation(nfcOperation: NFCOperation.read);
                    },
                    child: const Text("Ler NFC"),
                  ),
                  Consumer<NFCNotifier>(
                    builder: (context, provider, _) {
                      if (provider.isProcessing) {
                        return const CircularProgressIndicator();
                      }
                      if (provider.message.isNotEmpty) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.pop(context);
                          showResultDialog(context, provider.message);
                        });
                      }
                      return const SizedBox();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
