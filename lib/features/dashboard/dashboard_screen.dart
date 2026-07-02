import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../devices/registry/device_type.dart';
import '../../core/enums/biopsy_state.dart';
import '../../providers/dashboard_provider.dart';
import '../../providers/pdf_provider.dart';
import '../../providers/session_provider.dart';
import 'widgets/live_force_graph.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboard = ref.watch(dashboardProvider);
    final session = ref.watch(sessionProvider);
    final pdfService = ref.read(pdfProvider);

    final data = dashboard.latestData;

    const int batteryLevel = 95;

    Color stateColor;

    switch (dashboard.biopsyState) {
      case BiopsyState.free:
        stateColor = Colors.green;
        break;

      case BiopsyState.armed:
        stateColor = Colors.orange;
        break;

      case BiopsyState.fired:
        stateColor = Colors.red;
        break;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/device');
          },
        ),
        title: Text("${dashboard.selectedDeviceName} Dashboard"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            //--------------------------------
            // DEVICE STATE
            //--------------------------------
            if (dashboard.selectedDevice == DeviceType.unknown)
              Card(
                color: Colors.orange.shade50,
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(Icons.mic, size: 48, color: Colors.orange),
                      SizedBox(height: 12),
                      Text(
                        "No Device Selected",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Waiting for voice command...",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24),

                child: Column(
                  children: [
                    Text(
                      ref
                          .read(dashboardProvider.notifier)
                          .stateLabel
                          .toUpperCase(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Icon(
                      dashboard.biopsyState == BiopsyState.free
                          ? Icons.lock_open
                          : dashboard.biopsyState == BiopsyState.armed
                          ? Icons.security
                          : Icons.flash_on,
                      size: 80,
                      color: stateColor,
                    ),

                    const SizedBox(height: 15),

                    Text(
                      dashboard.biopsyState.name.toUpperCase(),
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: stateColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            //--------------------------------
            // SAMPLES + BATTERY
            //--------------------------------
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),

                      child: Column(
                        children: [
                          Icon(
                            dashboard.selectedDevice == DeviceType.biopsyGun
                                ? Icons.science
                                : dashboard.selectedDevice ==
                                      DeviceType.bowelGrasper
                                ? Icons.pan_tool_alt
                                : dashboard.selectedDevice == DeviceType.trocar
                                ? Icons.adjust
                                : dashboard.selectedDevice == DeviceType.stapler
                                ? Icons.construction
                                : dashboard.selectedDevice == DeviceType.forceps
                                ? Icons.build
                                : dashboard.selectedDevice ==
                                      DeviceType.needleHolder
                                ? Icons.architecture
                                : dashboard.selectedDevice == DeviceType.suction
                                ? Icons.air
                                : dashboard.selectedDevice ==
                                      DeviceType.scissors
                                ? Icons.content_cut
                                : dashboard.selectedDevice ==
                                      DeviceType.clipApplier
                                ? Icons.link
                                : Icons.medical_services,
                            size: 40,
                          ),

                          const SizedBox(height: 10),

                          Text(
                            dashboard.primaryMetricLabel,
                            style: const TextStyle(fontSize: 18),
                          ),

                          Text(
                            dashboard.biopsySampleCount.toString(),
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),

                      child: Column(
                        children: [
                          const Icon(Icons.battery_full, size: 40),

                          const SizedBox(height: 10),

                          const Text("Battery", style: TextStyle(fontSize: 18)),

                          Text(
                            "$batteryLevel%",
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            //--------------------------------
            // LIVE FORCE GRAPH
            //--------------------------------
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  children: [
                    const Text(
                      "Live Force Graph",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    LiveForceGraph(points: dashboard.graphPoints),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            //--------------------------------
            // CURRENT FORCE
            //--------------------------------
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  children: [
                    const Text(
                      "Current Force",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      "${data?.value ?? 0}",
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            //--------------------------------
            // ANALYTICS
            //--------------------------------
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  children: [
                    const Text(
                      "Usage Analytics",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    ListTile(
                      leading: const Icon(Icons.ads_click),
                      title: const Text("Press Count"),
                      trailing: Text(dashboard.totalPressCount.toString()),
                    ),

                    ListTile(
                      leading: const Icon(Icons.bar_chart),
                      title: const Text("Average Force"),
                      trailing: Text(dashboard.averageForce.toStringAsFixed(1)),
                    ),

                    ListTile(
                      leading: const Icon(Icons.trending_up),
                      title: const Text("Maximum Force"),
                      trailing: Text(dashboard.maxForce.toStringAsFixed(1)),
                    ),

                    ListTile(
                      leading: const Icon(Icons.timer),
                      title: const Text("Duration"),
                      trailing: Text("${dashboard.usageDuration.inSeconds}s"),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            //--------------------------------
            // PATIENT / DOCTOR / DEVICE
            //--------------------------------
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text("Patient"),
                    subtitle: Text(
                      session.patient?.patientName ?? "No Patient",
                    ),
                  ),

                  ListTile(
                    leading: const Icon(Icons.local_hospital),
                    title: const Text("Doctor"),
                    subtitle: Text(session.doctor?.doctorName ?? "No Doctor"),
                  ),

                  ListTile(
                    leading: Icon(
                      dashboard.selectedDevice == DeviceType.biopsyGun
                          ? Icons.science
                          : dashboard.selectedDevice == DeviceType.bowelGrasper
                          ? Icons.pan_tool_alt
                          : dashboard.selectedDevice == DeviceType.trocar
                          ? Icons.adjust
                          : dashboard.selectedDevice == DeviceType.stapler
                          ? Icons.construction
                          : dashboard.selectedDevice == DeviceType.forceps
                          ? Icons.build
                          : dashboard.selectedDevice == DeviceType.needleHolder
                          ? Icons.architecture
                          : dashboard.selectedDevice == DeviceType.suction
                          ? Icons.air
                          : dashboard.selectedDevice == DeviceType.scissors
                          ? Icons.content_cut
                          : dashboard.selectedDevice == DeviceType.clipApplier
                          ? Icons.link
                          : Icons.help_outline,
                    ),
                    title: const Text("Selected Device"),
                    subtitle: Text(
                      dashboard.selectedDeviceName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            //--------------------------------
            // GENERATE PDF
            //--------------------------------
            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                onPressed: () async {
                  final file = await pdfService.generateReport(
                    session: session,
                    totalPresses: dashboard.totalPressCount,
                    totalSamples: dashboard.biopsySampleCount,
                    averageForce: dashboard.averageForce,
                    maximumForce: dashboard.maxForce,
                    duration: dashboard.usageDuration,
                  );

                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Saved: ${file.path}')),
                    );
                  }
                },

                icon: const Icon(Icons.picture_as_pdf),

                label: const Text("Generate PDF"),
              ),
            ),

            const SizedBox(height: 10),

            //--------------------------------
            // HISTORY
            //--------------------------------
            SizedBox(
              width: double.infinity,

              child: OutlinedButton.icon(
                onPressed: () {
                  context.go('/history');
                },

                icon: const Icon(Icons.history),

                label: const Text('Procedure History'),
              ),
            ),

            const SizedBox(height: 20),

            //--------------------------------
            // END PROCEDURE
            //--------------------------------
            SizedBox(
              width: double.infinity,

              child: dashboard.procedureEnded
                  ? FilledButton.icon(
                      onPressed: null,

                      icon: const Icon(Icons.check_circle),

                      label: const Text('Procedure Ended'),
                    )
                  : ElevatedButton.icon(
                      onPressed: () async {
                        await ref
                            .read(dashboardProvider.notifier)
                            .stopMonitoring();

                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Procedure Saved')),
                          );
                        }
                      },

                      icon: const Icon(Icons.stop),

                      label: const Text('End Procedure'),
                    ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
