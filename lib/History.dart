import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // Reference to the Firestore 'history' collection
  final CollectionReference _historyCollection =
      FirebaseFirestore.instance.collection('history');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _historyCollection
            .orderBy('recognizedAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No history found"));
          }

          // Retrieve documents from snapshot
          List<DocumentSnapshot> historyDocs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: historyDocs.length,
            itemBuilder: (context, index) {
              var data = historyDocs[index].data() as Map<String, dynamic>;
              String name = data['name'] ?? 'Unknown';
              double distance = data['distance'] ?? 0.0;
              Timestamp timestamp = data['timestamp'] ?? Timestamp.now();

              // Convert distance to a percentage
              String distancePercentage =
                  (distance * 100).toStringAsFixed(2) + '%';

              // Format timestamp to a readable date
              final formattedDate =
                  timeago.format(data['recognizedAt'].toDate());

              return ListTile(
                title: Text(name),
                subtitle: Text(
                    "Percentage: $distancePercentage\nDate: $formattedDate"),
              );
            },
          );
        },
      ),
    );
  }
}
