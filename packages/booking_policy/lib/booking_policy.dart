import 'dart:convert';
import 'dart:io';

class Policy {
  Policy(this.raw);
  final Map<String, dynamic> raw;

  List<String> get cancellable => List<String>.from(raw['cancellableStatuses'] as List);
  List<String> get blocked => List<String>.from(raw['blockedStatuses'] as List);
  num get cutoffHours => raw['cutoffHours'] as num;
  num get lateFeePercent => raw['lateFeePercent'] as num;
}

class CancelDecision {
  CancelDecision({required this.allowed, required this.code, required this.feePaise});
  final bool allowed;
  final String code;
  final int feePaise;
}

Policy loadPolicy(File file) {
  return Policy(jsonDecode(file.readAsStringSync()) as Map<String, dynamic>);
}

CancelDecision evaluateCancel({
  required String status,
  required DateTime slotStart,
  required int amountPaise,
  required Policy policy,
  DateTime? now,
}) {
  final clock = now ?? DateTime.now();
  if (policy.blocked.contains(status) || !policy.cancellable.contains(status)) {
    return CancelDecision(allowed: false, code: 'NOT_CANCELLABLE', feePaise: 0);
  }
  var fee = 0;
  if (status == 'confirmed') {
    final hours = slotStart.difference(clock).inMilliseconds / 3600000;
    if (hours <= policy.cutoffHours) {
      fee = (amountPaise * policy.lateFeePercent / 100).round();
    }
  }
  return CancelDecision(allowed: true, code: 'OK', feePaise: fee);
}
