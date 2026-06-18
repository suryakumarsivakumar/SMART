import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/session_provider.dart';
import '../../providers/dashboard_provider.dart';

class DeviceSelectionScreen extends ConsumerStatefulWidget {
  const DeviceSelectionScreen({super.key});

  @override
  ConsumerState<DeviceSelectionScreen> createState() =>
      _DeviceSelectionScreenState();
}

class _DeviceSelectionScreenState extends ConsumerState<DeviceSelectionScreen> {
  String selectedDevice = "Biopsy Device";

  Widget buildDeviceCard(String title, IconData icon) {
    final selected = selectedDevice == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDevice = title;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: selected ? Colors.teal.withValues(alpha: 0.2) : Colors.white10,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? Colors.teal : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 40),

            const SizedBox(width: 20),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            if (selected) const Icon(Icons.check_circle, color: Colors.green),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/doctor');
          },
        ),
        title: const Text("Select Device"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              buildDeviceCard("Biopsy Device", Icons.medical_services),

              buildDeviceCard("Needle Device", Icons.vaccines),

              buildDeviceCard("Endoscope", Icons.visibility),

              buildDeviceCard("Surgical Forceps", Icons.build),

              buildDeviceCard("Catheter Device", Icons.water_drop),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final session = ref.read(sessionProvider);

                    print(
                      'DEVICE SCREEN PATIENT: ${session.patient?.patientName}',
                    );

                    print(
                      'DEVICE SCREEN DOCTOR: ${session.doctor?.doctorName}',
                    );

                    print('DEVICE SCREEN DEVICE: $selectedDevice');

                    ref
                        .read(sessionProvider.notifier)
                        .saveDevice(selectedDevice);

                    final started = await ref
                        .read(dashboardProvider.notifier)
                        .startMonitoring();

                    if (!started) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Unable to connect to SMART Device'),
                          ),
                        );
                      }
                      return;
                    }

                    if (context.mounted) {
                      context.go('/dashboard');
                    }
                  },
                  child: const Text("Start Procedure"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
