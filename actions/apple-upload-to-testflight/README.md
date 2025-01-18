# Apple Upload to Testflight

This GitHub Action automates the process of uploading an iOS or macOS build to Apple's Testflight platform.

## Description

This action simplifies the process of uploading your app's IPA (iOS) or build file (macOS) to Testflight. It requires the App Store Connect API credentials (API key, key ID, and issuer ID) to authenticate and authorize the upload. Ensure you have these credentials ready before using the action.

## Usage

```yaml
jobs:
  upload-to-testflight:
    runs-on: macos-latest
    steps:
      - name: Upload to Testflight
        uses: FiveDotTwelve/fdt-ci/actions/apple-upload-to-testflight@master
        with:
          deploy-file: ${{ github.workspace }}/build/ios/ipa/*.ipa
          deploy-key-base64: ${{ secrets.APPLE_API_KEY_BASE64 }}
          deploy-key-id: ${{ secrets.APPLE_API_KEY_ID }}
          deploy-issuer-id: ${{ secrets.APPLE_API_ISSUER_ID }}
```

## Inputs

| Name                      | Description                                               | Required | Default        |
| ------------------------- | ----------------------------------------------------------| -------- | -------------- |
| deploy-file        | Path to the IPA or build file to upload to Testflight.           | Yes      | `""`           |
| deploy-key-base64      | Base64 encoded App Store Connect API key.                    | Yes      | `""`           |
| deploy-key-id          | The App Store Connect API key ID.                            | Yes      | `""`           |
| deploy-issuer-id          | The App Store Connect issuer ID.                          | Yes      | `""`           |
| platform         | The platform type for the build (e.g., ios or macos).              | No       | `"ios"`        |

### How to Obtain API Credentials

To obtain the necessary credentials for the `APPLE_API_KEY_BASE64`, `APPLE_API_KEY_ID`, and `APPLE_API_ISSUER_ID`, follow these steps:

#### Step 1: Generate an API Key on App Store Connect

1. Go to the App Store Connect website and log in with your Apple Developer account.
2. Navigate to Users and Access under Account.
3. Under the Keys section, click the Generate API Key button.
4. Provide a name for your API key and select the appropriate role (e.g., App Manager or Developer).
5. After generating the API key, you'll see the Key ID and Issuer ID. Note these down.

#### Step 2: Convert API Key to Base64 Format

1. Download the .p8 file (API key) that was generated.
2. Encode the .p8 file to Base64 using the following command:
3. Copy the Base64 output and store it securely in GitHub Secrets as APPLE_API_KEY_BASE64.

```bash
base64 -i AuthKey_<KEY_ID>.p8
```

#### Step 3: Store Credentials in GitHub Secrets

For security purposes, store the following details as GitHub Secrets:

- APPLE_API_KEY_BASE64: The Base64 encoded API key.
- APPLE_API_KEY_ID: The API Key ID from App Store Connect.
- APPLE_API_ISSUER_ID: The Issuer ID from App Store Connect.

To add secrets to your repository:

1. Go to your repository on GitHub.
2. Navigate to Settings > Secrets > New repository secret.
3. Add APPLE_API_KEY_BASE64, APPLE_API_KEY_ID, and APPLE_API_ISSUER_ID as secrets.

## Security Considerations

Ensure that your App Store Connect API credentials (API key, key ID, issuer ID) are stored in GitHub Secrets to avoid exposing sensitive information in your workflow file.
This action uses secure connections for file uploads, but always ensure your build files are stored securely.
