# Android Clean Keystore

Safety action that should be used always in order to remove sensitive data just as keystore and its properties.

## Description

Removes if exists keystore and keystore.properties. Use `keystore-name` and `keystore-properties-name` to adjust to non standard names.

## Usage

```yaml
name: Run Setup
on:
  push:

jobs:
  setup:
    runs-on: ubuntu-latest
    steps:
      - name: Clean keystore
        uses: FiveDotTwelve/fdt-ci/actions/android-clean-keystore@master
```

## Inputs

| Name                      | Description                           | Required | Default    |
| ------------------------- | --------------------------------------| -------- | ---------- |
| keystore-name             | Name of keystore files                | No       | `"upload-keystore.jks"`     |
| keystore-properties-name  | Name of keystore properties files     | No       | `"keystore.properties"`     |
| directory                 | Relevant path where to create keystore| No       | `"android/app"`     |

### Tips

Use always [status check function](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/evaluate-expressions-in-workflows-and-actions#status-check-functions) to make sure keystore is removed whe no longer needed.

```yaml
name: Run Setup
on:
  push:

jobs:
  setup:
    runs-on: ubuntu-latest
    steps:
      - name: Clean keystore
        if: ${{ always() }}
        uses: FiveDotTwelve/fdt-ci/actions/android-clean-keystore@master
```
