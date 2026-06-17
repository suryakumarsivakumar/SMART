import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/dashboard_provider.dart';

class ConnectionScreen extends ConsumerWidget {
  const ConnectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Device Connection")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const Card(
              child: ListTile(
                title: Text("SMART Device"),
                subtitle: Text("192.168.4.1"),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () async {
                final dashboardNotifier = ref.read(dashboardProvider.notifier);

                final connected = await dashboardNotifier.startMonitoring();

                if (connected) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("SMART Device Connected")),
                    );

                    context.go('/patient');
                  }
                } else {
                  if (!context.mounted) return;

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Unable to connect to device"),
                    ),
                  );
                }
              },

              child: const Text("Connect"),
            ),
          ],
        ),
      ),
    );
  }
}
