# Podman for Terraform Operations

## Purpose
All Terraform‑related commands (e.g., `init`, `plan`, `apply`) should be executed inside a Podman container.

## Usage
1. Launch a container with the Terraform image:
   ```bash
   podman run --rm -v $(pwd):/src -w /src docker.io/hashicorp/terraform:<version> terraform init
   ```
   Replace `<version>` with the desired Terraform version (e.g., `1.4.5`).

2. If running from the repository `stormcorgi-iac-learn`, the working path is:
   ```bash
   podman run --rm -v /home/mot/repos/stormcorgi-iac-learn/terraform/aws:/src -w /src docker.io/hashicorp/terraform:1.4.5 terraform init
   ```

3. The same pattern applies for `plan`, `apply`, etc.

## Notes
- The container pulls the image from Docker Hub; network access is required.
- Avoid running Terraform directly on your host unless a container runtime is not available.
- For local development, the repo’s `devcontainer` already installs Terraform.
