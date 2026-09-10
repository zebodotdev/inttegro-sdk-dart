part of '../inttegro.dart';

/// The application's latest GHS balance snapshot.
final class BalanceSnapshot implements _InttegroValue {
  final CurrencyBalanceSnapshot ghs;

  const BalanceSnapshot({required this.ghs});

  factory BalanceSnapshot.fromJson(Object? json) {
    final value = (json as Map).cast<String, Object?>();
    return BalanceSnapshot(
      ghs: CurrencyBalanceSnapshot.fromJson(
        (value['ghs'] as Map).cast<String, Object?>(),
      ),
    );
  }

  @override
  Map<String, Object?> toJson() => {'ghs': _encodeValue(ghs)};
}
