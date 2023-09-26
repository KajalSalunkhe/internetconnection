import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:internetconnection/internet_not_connected.dart';
import 'package:provider/provider.dart';

class InternetScreen extends StatefulWidget {
  const InternetScreen({super.key, required this.title});
  final String title;

  @override
  State<InternetScreen> createState() => _InternetScreenState();
}

class _InternetScreenState extends State<InternetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Visibility(
              visible: Provider.of<InternetConnectionStatus>(context) ==
                  InternetConnectionStatus.disconnected,
              child: const InternetNotAvailable(),
            ),
            Provider.of<InternetConnectionStatus>(context) ==
                    InternetConnectionStatus.disconnected
                ? Expanded(
                    child: Center(
                      child: Text('Not connected',
                          style: TextStyle(fontSize: 30, color: Colors.red)),
                    ),
                  )
                : Expanded(
                    child: Center(
                      child: Text('Connected',
                          style: TextStyle(fontSize: 30, color: Colors.green)),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
