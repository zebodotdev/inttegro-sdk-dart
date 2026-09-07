# Releasing

pub.dev requires the first package version to be published interactively before
GitHub Actions trusted publishing can be enabled.

1. From the clean `0.1.0` release commit, run `dart pub publish` and complete the
   pub.dev authorization flow.
2. In pub.dev, configure automated publishing for GitHub repository
   `zebodotdev/inttegro-sdk-dart` and tag pattern `v{{version}}`.
3. Create a `release` GitHub environment with no required reviewers.
4. Push `v0.1.0` after pub.dev shows that version. For subsequent versions,
   update `pubspec.yaml` and `CHANGELOG.md`, then push the matching tag.

The initial tag verifies the already-published bootstrap release. Later tags use
OIDC to publish without a long-lived registry credential. Every tag is tested,
archived, attested, and accompanied by checksums and provenance before its draft
GitHub release is finalized.
