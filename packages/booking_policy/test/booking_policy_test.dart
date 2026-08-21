import 'dart:io';

import 'package:booking_policy/booking_policy.dart';
import 'package:test/test.dart';

void main() {
  final policy = loadPolicy(
    File('../shared-contracts/cancellation-policy.json'),
  );
  final now = DateTime.parse('2026-08-21T12:00:00Z');

  test('pending is free', () {
    final decision = evaluateCancel(
      status: 'pending',
      slotStart: now.add(const Duration(minutes: 30)),
      amountPaise: 100000,
      policy: policy,
      now: now,
    );
    expect(decision.allowed, isTrue);
    expect(decision.feePaise, 0);
  });

  test('confirmed inside cutoff takes 50%', () {
    final decision = evaluateCancel(
      status: 'confirmed',
      slotStart: now.add(const Duration(minutes: 45)),
      amountPaise: 320000,
      policy: policy,
      now: now,
    );
    expect(decision.allowed, isTrue);
    expect(decision.feePaise, 160000);
  });

  test('technician en route is blocked', () {
    final decision = evaluateCancel(
      status: 'technician_en_route',
      slotStart: now,
      amountPaise: 150000,
      policy: policy,
      now: now,
    );
    expect(decision.allowed, isFalse);
    expect(decision.code, 'NOT_CANCELLABLE');
  });
}
