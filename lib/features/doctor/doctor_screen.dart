import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/repository_provider.dart';
import '../../models/doctor_model.dart';
import '../../providers/session_provider.dart';

class DoctorScreen extends ConsumerStatefulWidget {
  const DoctorScreen({super.key});

  @override
  ConsumerState<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends ConsumerState<DoctorScreen> {
  final _formKey = GlobalKey<FormState>();

  final doctorNameController = TextEditingController();
  final doctorIdController = TextEditingController();
  final hospitalController = TextEditingController();
  final departmentController = TextEditingController();
  final specializationController = TextEditingController();
  final contactController = TextEditingController();

  @override
  void dispose() {
    doctorNameController.dispose();
    doctorIdController.dispose();
    hospitalController.dispose();
    departmentController.dispose();
    specializationController.dispose();
    contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/patient');
          },
        ),
        title: const Text("Doctor Information"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            children: [
              TextFormField(
                controller: doctorNameController,
                decoration: const InputDecoration(labelText: "Doctor Name"),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: doctorIdController,
                decoration: const InputDecoration(labelText: "Doctor ID"),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: hospitalController,
                decoration: const InputDecoration(labelText: "Hospital"),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: departmentController,
                decoration: const InputDecoration(labelText: "Department"),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: specializationController,
                decoration: const InputDecoration(labelText: "Specialization"),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: contactController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: "Contact Number"),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: () {
                    final doctor = DoctorModel(
                      doctorId: doctorIdController.text,
                      doctorName: doctorNameController.text,
                      hospital: hospitalController.text,
                      department: departmentController.text,
                      specialization: specializationController.text,
                      contactNumber: contactController.text,
                    );

                    ref.read(sessionProvider.notifier).saveDoctor(doctor);
                    ref.read(doctorRepositoryProvider).save(doctor);
                    context.go('/device');
                  },

                  child: const Text("Next"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
