# Apple Delete Keychain

Deletes given keychain database.

## Description

Using `security` command removes keychain and all its certificates.

## Usage

```yaml
jobs:
  install-certs:
    runs-on: macos-latest
    steps:
      - name: Delete Keychain and Certs
        uses: FiveDotTwelve/fdt-ci/actions/apple-delete-keychain@master
        with:
          provisioning-profile-name: app_name_keychain
```

## Inputs

| Name               | Description             | Required | Default    |
| ------------------ | ------------------------| -------- | ---------- |
| keychain-db-name   | keychain database file  | No       | `"signing"`|
