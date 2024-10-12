# Android Setup Keystore
This GitHub action automates the creation of a keystore (.jks) and its corresponding properties file for Android development.

## Description
The action takes encoded keystore data (keystore-base64) and passwords for the keystore and key as inputs. It then creates the keystore file, decodes the base64 data, and writes it to the keystore. Finally, it creates a properties file containing the provided passwords, alias, and path to the keystore.

## Usage

```yaml
name: Run Setup
on:
  push:

jobs:
  setup:
    runs-on: ubuntu-latest
    steps:
      - name: Setup keystore
        uses: FiveDotTwelve/fdt-ci/actions/android-setup-keystore@master
        with:
            keystore-base64: ${{ secrets.ANDROID_KEYSTORE_BASE64 }}
            store-password: ${{ secrets.ANDROID_KEYSTORE_STORE_PASSWORD }}
            key-password: ${{ secrets.ANDROID_KEYSTORE_PASSWORD }}
            key-alias: ${{ secrets.ANDROID_KEYSTORE_ALIAS }}
```

## Inputs

| Name                      | Description                           | Required | Default    |
| ------------------------- | --------------------------------------| -------- | ---------- |
| keystore-base64           | Base64 version of keystore            | Yes      | `""`       |
| store-password            | Store password for keystore           | Yes      | `""`       |
| key-password              | Key password for keystore             | Yes      | `""`       |
| key-alias                 | Key alias for keystore                | Yes      | `""`       |
| keystore-name             | Name of keystore files                | No       | `"upload-keystore.jks"`     |
| keystore-properties-name  | Name of keystore properties files     | No       | `"keystore.properties"`     |
| directory                 | Relevent path where to create keystore| No       | `"android"`     |

### Tips

Create base64 version of keystore file with command: 
```bash
base64 -i upload-keystore.jks
```

or copy directly into clipboard (`pbcopy` is osx only)
```bash
base64 -i upload-keystore.jks | pbcopy
```

Read more about android [signing](https://developer.android.com/build/build-variants#signing).

## Security Considerations
Do not store sensitive information like passwords and keystore data directly in the workflow file. Use GitHub Secrets to manage these values securely.
