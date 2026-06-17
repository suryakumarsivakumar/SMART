import 'package:flutter/material.dart';
import '../../models/session_model.dart';

class ProcedureDetailsScreen extends StatelessWidget {
  final SessionModel session;

  const ProcedureDetailsScreen({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Procedure Details')),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            //--------------------------------
            // PATIENT INFO
            //--------------------------------
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(Icons.person),
                      title: Text(
                        'Patient Information',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                    ListTile(
                      title: const Text('Patient Name'),
                      trailing: Text(session.patientName),
                    ),

                    ListTile(
                      title: const Text('Patient ID'),
                      trailing: Text(session.patientId),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            //--------------------------------
            // DOCTOR INFO
            //--------------------------------
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(Icons.local_hospital),
                      title: Text(
                        'Doctor Information',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                    ListTile(
                      title: const Text('Doctor Name'),
                      trailing: Text(session.doctorName),
                    ),

                    ListTile(
                      title: const Text('Doctor ID'),
                      trailing: Text(session.doctorId),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            //--------------------------------
            // DEVICE INFO
            //--------------------------------
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(Icons.medical_services),
                      title: Text(
                        'Device Information',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                    ListTile(
                      title: const Text('Device Name'),
                      trailing: Text(session.deviceName),
                    ),

                    ListTile(
                      title: const Text('Device ID'),
                      trailing: Text(session.deviceId),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            //--------------------------------
            // ANALYTICS
            //--------------------------------
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(Icons.analytics),
                      title: Text(
                        'Procedure Analytics',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                    ListTile(
                      title: const Text('Press Count'),
                      trailing: Text(session.totalPressCount.toString()),
                    ),

                    ListTile(
                      title: const Text('Average Force'),
                      trailing: Text(session.averageForce.toStringAsFixed(1)),
                    ),

                    ListTile(
                      title: const Text('Maximum Force'),
                      trailing: Text(session.maxForce.toStringAsFixed(1)),
                    ),

                    ListTile(
                      title: const Text('Duration'),
                      trailing: Text('${session.durationSeconds}s'),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            //--------------------------------
            // TIMINGS
            //--------------------------------
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(Icons.schedule),
                      title: Text(
                        'Procedure Timing',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                    ListTile(
                      title: const Text('Start Time'),
                      subtitle: Text(session.startTime.toString()),
                    ),

                    ListTile(
                      title: const Text('End Time'),
                      subtitle: Text(session.endTime.toString()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
