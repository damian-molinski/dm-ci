# Apple Setup Provisioning Profile

Decodes and imports your provisioning profile into correct directory

## Description

Read more about profiles [here](https://developer.apple.com/help/account/manage-profiles/create-an-app-store-provisioning-profile/).

## Usage

```yaml
jobs:
  install-certs:
    runs-on: macos-latest
    steps:
      - name: Install Apple Provisioning Profile
        uses: FiveDotTwelve/fdt-ci/actions/apple-setup-provisioning-profile@master
        with:
          provisioning-profile-base64: ${{ secrets.APPLE_PROVISIONING_PROFILE_BASE64 }}
```

## Inputs

| Name                        | Description                                                      | Required | Default                 |
| -------------------------   | -----------------------------------------------------------------| -------- | ----------------------- |
| provisioning-profile-base64 | Base64 encoded version of your Apple provisioning profile file.  | Yes      | `""`                    |
| provisioning-profile-name   | Name of the decoded file                                         | No       | `"provisioning_profile"`|

### Tips

Create base64 version of certificate file with command:

```bash
base64 -i provisioning_profile.mobileprovision
```

or copy directly into clipboard (`pbcopy` is osx only)

```bash
base64 -i provisioning_profile.mobileprovision | pbcopy
```