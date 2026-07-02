import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../devices/registry/device_type.dart';
import '../../providers/session_provider.dart';
import '../../providers/dashboard_provider.dart';

class DeviceSelectionScreen extends ConsumerStatefulWidget {
  const DeviceSelectionScreen({super.key});

  @override
  ConsumerState<DeviceSelectionScreen> createState() =>
      _DeviceSelectionScreenState();
}

class _DeviceSelectionScreenState extends ConsumerState<DeviceSelectionScreen> {
  String? selectedDevice;
  final Map<String, DeviceType> deviceMap = {
    "Biopsy Device": DeviceType.biopsyGun,
    "Bowel Grasper": DeviceType.bowelGrasper,
    "Dissector": DeviceType.dissector,
    "Trocar": DeviceType.trocar,
    "Surgical Stapler": DeviceType.stapler,
    "Forceps": DeviceType.forceps,
    "Needle Holder": DeviceType.needleHolder,
    "Suction": DeviceType.suction,
    "Scissors": DeviceType.scissors,
    "Clip Applier": DeviceType.clipApplier,
  };
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

              buildDeviceCard("Bowel Grasper", Icons.pan_tool_alt),

              buildDeviceCard("Dissector", Icons.content_cut),

              buildDeviceCard("Trocar", Icons.adjust),

              buildDeviceCard("Surgical Stapler", Icons.construction),

              buildDeviceCard("Forceps", Icons.build),

              buildDeviceCard("Needle Holder", Icons.architecture),

              buildDeviceCard("Suction", Icons.air),

              buildDeviceCard("Scissors", Icons.content_cut),

              buildDeviceCard("Clip Applier", Icons.link),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (selectedDevice == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please select a device")),
                      );
                      return;
                    }
                    final session = ref.read(sessionProvider);

                    print(
                      'DEVICE SCREEN DOCTOR: ${session.doctor?.doctorName}',
                    );

                    ref
                        .read(sessionProvider.notifier)
                        .saveDevice(selectedDevice!);
                    ref
                        .read(dashboardProvider.notifier)
                        .selectDevice(
                          deviceMap[selectedDevice!] ?? DeviceType.unknown,
                        );
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
