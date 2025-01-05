# Apple Delete Provisioning Profile

Deletes given provisioning profile

## Description

Simply deletes local profile file

## Usage

```yaml
jobs:
  install-certs:
    runs-on: macos-latest
    steps:
      - name: Delete Provisioning Profile
        uses: FiveDotTwelve/fdt-ci/actions/apple-delete-provisioning-profile@master
        with:
          provisioning-profile-name: app_name_provisioning-profile
```

## Inputs

| Name                        | Description              | Required | Default                 |
| -------------------------   | -------------------------| -------- | ----------------------- |
| provisioning-profile-name   | Name of file             | No       | `"provisioning_profile"`|
