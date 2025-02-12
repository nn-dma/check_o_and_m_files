>IMPORTANT: This repository has moved to [here](https://github.com/NovoNordisk-OpenSource/check_o_and_m_files) and is being deprecated and will be disabled on 2025-07-01. This version of the repository is part of the Release Candidate for the QMS v2.0 pipeline tool stack. To migrate, regenerate the pipeline with the latest version of the QMS CLI, which will update paths and dependencies.

# GitHub Action: Check for O and M documents

## Description

This action checks for O and M documents in your GitHub repository.

## Inputs

### `operation_path`

The path to the operation documents. The default is `docs/operations/`.

## Usage

```yaml
- name: Check for O and M documents
  uses: nn-dma/check_o_and_m_files@main
  with:
    operation_path: 'path/to/your/operation/documents'
