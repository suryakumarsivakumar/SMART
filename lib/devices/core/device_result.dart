class DeviceResult {
  final String state;

  final int primaryCount;

  final String primaryLabel;

  // true only when a real surgical event completes
  final bool completedEvent;

  // duration of that event

  const DeviceResult({
    required this.state,
    required this.primaryCount,
    required this.primaryLabel,
    this.completedEvent = false,
  });
}
