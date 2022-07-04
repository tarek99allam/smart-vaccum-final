import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothProvider extends ChangeNotifier {
  BluetoothConnection? connection;
  bool get isConnected => connection != null && connection!.isConnected;
  final Map<String, String> map = {
    "up": "1",
    "right": "2",
    "down": "3",
    "left": "4",
    "start": "S",
    "stop": "P",
    "automatic": "A",
    "manual": "M"
  };
  List<String> status = [];
  Future<void> startChat(BluetoothDevice server) async {
    try {
      connection = await BluetoothConnection.toAddress(server.address);

      if (connection != null) {
        connection!.input!.listen(onDataReceived);
      }
    } catch (error) {
      connection = null;
    }
  }

  void onDataReceived(Uint8List data) {
    // Allocate buffer for parsed data
    int backspacesCounter = 0;
    for (var byte in data) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    }
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;
    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }
    String dataString = String.fromCharCodes(buffer);
    status.add(dataString);
    notifyListeners();
    print(dataString);
  }

  Future<bool> sendMessage(String text) async {
    text = text.trim();
    if (text.isNotEmpty && isConnected) {
      try {
        connection!.output
            .add(Uint8List.fromList(utf8.encode(map[text]! + "\r\n")));
        await connection!.output.allSent;
        status.add("Send $text successfully");

        notifyListeners();
        return true;
      } catch (e) {
        status.add("Send Fialed");

        notifyListeners();
        return false;
      }
    } else {
      return false;
    }
  }
}
