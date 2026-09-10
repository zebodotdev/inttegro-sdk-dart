# Changelog

## 0.2.2

- Removed the publish credential from the verification job before resolving dependencies.

## 0.2.1

- Fixed release verification so trusted-publishing credentials are reserved for the publish job.

## 0.2.0

- Breaking: replaced generic maps with named models for balances, purchase intents, products, payment methods, payments, and orders.
- Breaking: exposed API timestamps as `DateTime` values and accepted `DateTime` values in timestamp request fields.

## 0.1.2

- Published the fingerprint-safe SDK through the configured trusted-publishing environment.

## 0.1.1

- Tightened financial-account and payment-method response models to exclude internal platform fields.

## 0.1.0

- Initial typed server SDK.
