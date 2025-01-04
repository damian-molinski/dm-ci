# Apple Setup Certs

This GitHub Action securely installs Apple certificates in a temporary keychain for use within your workflow.

## Description

This action automates the process of installing Apple certificates stored as Base64 encoded strings into a temporary keychain. This temporary keychain is useful for signing or provisioning steps within your workflow without storing the certificates persistently.

## Usage

```yaml
jobs:
  install-certs:
    runs-on: macos-latest
    steps:
      - name: Install Apple certificates
        uses: FiveDotTwelve/fdt-ci/actions/apple-setup-certs@master
        with:
          certificate-base64: ${{ secrets.APPLE_CERTIFICATE_BASE64 }}
          certificate-password: ${{ secrets.APPLE_CERTIFICATE_PASSWORD }}
```

## Inputs

| Name                      | Description                                                                                 | Required | Default        |
| ------------------------- | --------------------------------------------------------------------------------------------| -------- | -------------- |
| certificate-base64        | Base64 encoded version of your Apple certificate p12 file.                                  | Yes      | `""`           |
| certificate-password      | Password required to import the decoded certificate.                                        | Yes      | `""`           |
| certificate-name          | (Optional) Name of the decoded certificate file (default: certificate.p12).                 | No       | `"certificate"`|
| keychain-db-name          | (Optional) Name of the temporary keychain database file (default: signing.keychain-db).     | No       | `"signing"`    |
| keychain-password         | (Optional) Password for the temporary keychain. A random password will be used if not set.  | No       | `""`           |

### Tips

Create base64 version of certificate file with command:

```bash
base64 -i certificate.p12
```

or copy directly into clipboard (`pbcopy` is osx only)

```bash
base64 -i certificate.p12 | pbcopy
```

## Security Considerations

- This action uses temporary keychains to minimize the risk of persistent security vulnerabilities.
- It is highly recommended to store the certificate-base64 and certificate-password inputs in GitHub Secrets to avoid exposing sensitive information in your workflow file.
