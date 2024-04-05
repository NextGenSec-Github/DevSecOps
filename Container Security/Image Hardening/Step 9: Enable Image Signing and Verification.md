# Step 9: Enable Image Signing and Verification

Enabling image signing and verification helps ensure the integrity and authenticity of container images, reducing the risk of deploying compromised or tampered images. In this guide, we'll explore how to enable image signing and verification using tools like Docker Content Trust or Notary.

## Why Enable Image Signing and Verification?

- **Integrity Assurance**: Image signing allows users to verify that container images have not been tampered with or altered since they were signed.
- **Authenticity Verification**: Image signing enables users to verify the authenticity of container images by confirming their origin and trustworthiness.
- **Mitigated Supply Chain Attacks**: Enabling image signing and verification helps mitigate supply chain attacks by providing assurances about the integrity and provenance of container images.

## Enable Image Signing and Verification

### Docker Content Trust (DCT)

Docker Content Trust (DCT) is a feature of Docker that allows users to sign and verify container images using cryptographic signatures.

#### Enable DCT Globally

Enable Docker Content Trust globally to enforce image signing and verification for all Docker commands.

```bash
export DOCKER_CONTENT_TRUST=1
```

### Sign and Push Images
Sign container images with Docker Content Trust before pushing them to a registry.
```bash
docker trust sign <image_name>
docker push <image_name>
```




