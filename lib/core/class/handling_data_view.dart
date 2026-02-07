import 'package:electronics_store/core/class/state_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HandlingDataView extends StatelessWidget {
  final StateRequest state;
  final Widget child;

  const HandlingDataView({super.key, required this.state, required this.child});

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case StateRequest.loading:
        return Center(
          child: CircularProgressIndicator(color: Colors.blueAccent),
        );
      case StateRequest.offlinefailure:
        return Center(child: Text("Offline Failure"));
      case StateRequest.serverfailure:
        return Center(child: Text("Server Failure"));
      case StateRequest.failure:
        return Center(child: Text("No Data"));
      default:
        return child;
    }
  }
}
