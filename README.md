# Packer Resource

Check, Get, and Put Packer Resources

## Installing

```
resource_types:
- name: packer
  type: docker-image
  source:
    repository: jcderr/concourse-packer-resource
resources:
- name: packer
  type: packer
  source:
    aws_access_key_id: ...
    aws_secret_access_key: ...
    region: us-east-1
```

## Source Configuration

* `aws_access_key_id`: *Required.* AWS SDK Access Key ID.
* `aws_secret_access_key`: *Required.* AWS SDK Secret Access Key.
* `region`: *Optional.* AWS Region. (default: us-east-1)

#### `out`: Begins Packer Build Process

Builds with Packer.

#### Parameters
* `filepath`: *Required.* Path to Packer manifest JSON file.
* `vars`: *Optional.* Any additional vars that must be passed at build time.

## Example

### Out
```
resource_types:
- name: packer
  type: docker-image
  source:
    repository: jcderr/concourse-packer-resource
resources:
- name: packer
  type: packer
  source:
    aws_access_key_id: ...
    aws_secret_access_key: ...
    region: us-east-1
```

```
---
- put: packer
  params:
    filepath: src/packer/build.json
    vars:
    - name: base_ami
      value: ami-123456
    - name: template_name
      value: my-new-ami
```
