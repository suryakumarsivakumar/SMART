class PdfReportData {
  // ===================================================
  // PATIENT
  // ===================================================

  final String patientName;
  final String patientId;
  final String uhid;
  final String ipNumber;
  final String admissionNumber;
  final String ward;
  final String bedNumber;
  final String bedType;
  final String procedureName;
  final DateTime? dob;
  final int age;
  final String gender;
  final String mobileNumber;
  final String hospitalName;
  final String department;
  final String diagnosis;
  final String notes;

  // ===================================================
  // DOCTOR
  // ===================================================

  final String doctorName;
  final String doctorId;
  final String doctorHospital;
  final String doctorDepartment;
  final String specialization;
  final String contactNumber;
  final String anesthetistName;
  final String otInchargeName;
  final String surgeryType;

  // ===================================================
  // DEVICE
  // ===================================================

  final String deviceName;
  final String deviceId;

  // ===================================================
  // ANALYTICS
  // ===================================================

  final int totalSamples;
  final int totalPresses;
  final double averageForce;
  final double maximumForce;
  final Duration duration;

  // ===================================================
  // TIMING
  // ===================================================

  final DateTime? startTime;
  final DateTime? endTime;
  final DateTime reportGenerated;

  // ===================================================
  // TIMELINE
  // ===================================================

  final List<String> timeline;

  const PdfReportData({
    required this.patientName,
    required this.patientId,
    required this.uhid,
    required this.ipNumber,
    required this.admissionNumber,
    required this.ward,
    required this.bedNumber,
    required this.bedType,
    required this.procedureName,
    required this.dob,
    required this.age,
    required this.gender,
    required this.mobileNumber,
    required this.hospitalName,
    required this.department,
    required this.diagnosis,
    required this.notes,

    required this.doctorName,
    required this.doctorId,
    required this.doctorHospital,
    required this.doctorDepartment,
    required this.specialization,
    required this.contactNumber,
    required this.anesthetistName,
    required this.otInchargeName,
    required this.surgeryType,

    required this.deviceName,
    required this.deviceId,

    required this.totalSamples,
    required this.totalPresses,
    required this.averageForce,
    required this.maximumForce,
    required this.duration,

    required this.startTime,
    required this.endTime,
    required this.reportGenerated,

    required this.timeline,
  });
}
