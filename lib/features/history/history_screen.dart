import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:go_router/go_router.dart';
import '../../models/session_model.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late Box<SessionModel> sessionBox;

  @override
  void initState() {
    super.initState();

    sessionBox = Hive.box<SessionModel>('sessions');
  }

  @override
  Widget build(BuildContext context) {
    final sessions = sessionBox.values.toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/dashboard');
          },
        ),
        title: const Text("Procedure History"),
      ),

      body: sessions.isEmpty
          ? const Center(child: Text('No Procedures Found'))
          : ListView.builder(
              itemCount: sessions.length,

              itemBuilder: (context, index) {
                final session = sessions[index];

                return Card(
                  margin: const EdgeInsets.all(10),

            child: Padding(
  padding: const EdgeInsets.all(16),

  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,

    children: [
      Row(
        children: [
          const Icon(Icons.history),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              session.sessionId,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),

      const SizedBox(height: 12),

      Text(
        'Press Count: ${session.totalPressCount}',
      ),

      Text(
        'Max Force: ${session.maxForce.toStringAsFixed(1)}',
      ),

      Text(
        'Duration: ${session.durationSeconds}s',
      ),

      Text(
        session.startTime.toString(),
      ),

      const SizedBox(height: 16),

      //--------------------------------
      // VIEW + PDF BUTTONS
      //--------------------------------
      Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {
                // Later:
                // Open Session Details Screen
              },

              icon: const Icon(Icons.visibility),

              label: const Text(
                "View",
              ),
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: ElevatedButton.icon(
              onPressed: () async {
                // Later:
                // Generate PDF for THIS session

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Session PDF coming soon',
                    ),
                  ),
                );
              },

              icon: const Icon(
                Icons.picture_as_pdf,
              ),

              label: const Text(
                "PDF",
              ),
            ),
          ),
        ],
      ),
    ],
  ),
),
                );
              },
            ),
    );
  }
}
