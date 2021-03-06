import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:platform_channel/platform_channel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isReachable = false;

  // ボタンを押下し、現在の通信状況を確認する
  Future<void> onTap() async {
    try {
      _isReachable = await PlatformChannel.isReachable;
    } on PlatformException {
      _isReachable = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _isReachable ? 'ネットワークに接続されています\n' : 'ネットワークに接続されていません\n',
              ),
              StreamBuilder(
                initialData: 0,
                stream: PlatformChannel.onNetworkStateChange(),
                builder: (context, AsyncSnapshot<int> snapshot) {
                  final networkState = snapshot.data;
                  switch (networkState) {
                    case 1:
                      return const Text('モバイル回線経由で接続しています\n');
                    case 2:
                      return const Text('Wifi経由で接続しています\n');
                    default:
                      return const Text('ネットワークに接続されていません\n');
                  }
                },
              ),
              ElevatedButton(
                onPressed: onTap,
                child: const Text('get isReachable'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
