import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/repository_provider.dart';
import '../../models/patient_model.dart';
import '../../providers/session_provider.dart';

class PatientScreen extends ConsumerStatefulWidget {
  const PatientScreen({super.key});

  @override
  ConsumerState<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends ConsumerState<PatientScreen> {
  final _formKey = GlobalKey<FormState>();

  final patientIdController = TextEditingController();

  final patientNameController = TextEditingController();

  final ageController = TextEditingController();

  final mobileController = TextEditingController();

  final hospitalController = TextEditingController();

  final departmentController = TextEditingController();

  final diagnosisController = TextEditingController();

  final notesController = TextEditingController();

  String gender = "Male";
  final uhidController = TextEditingController();
  final ipNumberController = TextEditingController();
  final admissionNumberController = TextEditingController();
  final wardController = TextEditingController();
  final bedNumberController = TextEditingController();
  final bedTypeController = TextEditingController();
  final procedureController = TextEditingController();
  final dobController = TextEditingController();

  @override
  void dispose() {
    patientIdController.dispose();
    patientNameController.dispose();
    ageController.dispose();
    mobileController.dispose();
    hospitalController.dispose();
    departmentController.dispose();
    diagnosisController.dispose();
    notesController.dispose();
    uhidController.dispose();
    ipNumberController.dispose();
    admissionNumberController.dispose();
    wardController.dispose();
    bedNumberController.dispose();
    bedTypeController.dispose();
    procedureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/connection');
          },
        ),
        title: const Text("Patient Information"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            children: [
              TextFormField(
                controller: patientIdController,
                decoration: const InputDecoration(labelText: "Patient ID"),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: patientNameController,
                decoration: const InputDecoration(labelText: "Patient Name"),
              ),

              const SizedBox(height: 15),
              TextFormField(
                controller: uhidController,
                decoration: const InputDecoration(labelText: "UHID"),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: ipNumberController,
                decoration: const InputDecoration(labelText: "IP Number"),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: admissionNumberController,
                decoration: const InputDecoration(
                  labelText: "Admission Number",
                ),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: wardController,
                decoration: const InputDecoration(labelText: "Ward"),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: bedNumberController,
                decoration: const InputDecoration(labelText: "Bed Number"),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: bedTypeController,
                decoration: const InputDecoration(labelText: "Bed Type"),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: procedureController,
                decoration: const InputDecoration(labelText: "Procedure"),
              ),

              const SizedBox(height: 15),
              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Age"),
              ),

              const SizedBox(height: 15),
              TextFormField(
                controller: dobController,
                decoration: const InputDecoration(
                  labelText: "DOB (dd/mm/yyyy)",
                ),
              ),
              const SizedBox(height: 15),

              DropdownButtonFormField<String>(
                initialValue: gender,

                items: const [
                  DropdownMenuItem(value: "Male", child: Text("Male")),

                  DropdownMenuItem(value: "Female", child: Text("Female")),

                  DropdownMenuItem(value: "Other", child: Text("Other")),
                ],

                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: mobileController,
                decoration: const InputDecoration(labelText: "Mobile Number"),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: hospitalController,
                decoration: const InputDecoration(labelText: "Hospital Name"),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: departmentController,
                decoration: const InputDecoration(labelText: "Department"),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: diagnosisController,
                decoration: const InputDecoration(labelText: "Diagnosis"),
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: notesController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: "Additional Notes",
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: () {
                    final patient = PatientModel(
                      patientId: patientIdController.text,
                      patientName: patientNameController.text,
                      age: int.tryParse(ageController.text) ?? 0,
                      dob:
                          DateTime.tryParse(dobController.text) ??
                          DateTime.now(),
                      gender: gender,
                      mobileNumber: mobileController.text,
                      hospitalName: hospitalController.text,
                      department: departmentController.text,
                      diagnosis: diagnosisController.text,
                      notes: notesController.text,
                      uhid: uhidController.text,
                      ipNumber: ipNumberController.text,
                      admissionNumber: admissionNumberController.text,
                      ward: wardController.text,
                      bedNumber: bedNumberController.text,
                      bedType: bedTypeController.text,
                      procedureName: procedureController.text,
                    );

                    ref.read(sessionProvider.notifier).savePatient(patient);
                    ref.read(patientRepositoryProvider).save(patient);

                    context.go('/doctor');
                    print('PATIENT SAVED: ${patient.patientName}');
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
