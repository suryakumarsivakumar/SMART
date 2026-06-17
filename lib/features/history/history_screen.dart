import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:go_router/go_router.dart';

import 'procedure_details_screen.dart';
import '../../models/session_model.dart';
import '../../providers/pdf_provider.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  late Box<SessionModel> sessionBox;

  @override
  void initState() {
    super.initState();

    sessionBox = Hive.box<SessionModel>('sessions');
  }

  @override
  Widget build(BuildContext context) {
    final sessions = sessionBox.values.toList().reversed.toList();

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
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.history, size: 80),

                  SizedBox(height: 20),

                  Text(
                    "No Procedures Recorded Yet",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: sessions.length,

              itemBuilder: (context, index) {
                final session = sessions[index];

                return Card(
                  margin: const EdgeInsets.all(10),

                  elevation: 4,

                  child: Padding(
                    padding: const EdgeInsets.all(16),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        //--------------------------------
                        // PATIENT
                        //--------------------------------
                        Row(
                          children: [
                            const Icon(Icons.person),

                            const SizedBox(width: 10),

                            Expanded(
                              child: Text(
                                session.patientName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        //--------------------------------
                        // DOCTOR
                        //--------------------------------
                        Text('Doctor: ${session.doctorName}'),

                        //--------------------------------
                        // DEVICE
                        //--------------------------------
                        Text('Device: ${session.deviceName}'),

                        const Divider(height: 24),

                        //--------------------------------
                        // PROCEDURE DATA
                        //--------------------------------
                        Text('Press Count: ${session.totalPressCount}'),

                        Text(
                          'Max Force: ${session.maxForce.toStringAsFixed(1)}',
                        ),

                        Text(
                          'Average Force: ${session.averageForce.toStringAsFixed(1)}',
                        ),

                        Text('Duration: ${session.durationSeconds}s'),

                        Text('Date: ${session.startTime}'),

                        const SizedBox(height: 16),

                        //--------------------------------
                        // ACTION BUTTONS
                        //--------------------------------
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ProcedureDetailsScreen(
                                        session: session,
                                      ),
                                    ),
                                  );
                                },

                                icon: const Icon(Icons.visibility),

                                label: const Text("View"),
                              ),
                            ),

                            const SizedBox(width: 10),

                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () async {
                                  final pdfService = ref.read(pdfProvider);

                                  final file = await pdfService
                                      .generateSessionReport(session);

                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Saved: ${file.path}'),
                                      ),
                                    );
                                  }
                                },

                                icon: const Icon(Icons.picture_as_pdf),

                                label: const Text("PDF"),
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
