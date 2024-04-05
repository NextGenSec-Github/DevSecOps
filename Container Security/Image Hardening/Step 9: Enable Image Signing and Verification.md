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

## Notary
Notary is an open-source project that provides a framework for image signing and verification, compatible with various container registries.

### Set Up Notary
Set up Notary to enable image signing and verification for your container images.
```bash
notary init -p <repository>
```

### Sign and Push Images
Sign container images with Notary and push them to a registry.
```bash
notary sign <repository>/<image_name>:<tag>
notary push <repository>/<image_name>:<tag>
```

### Pull and Verify Images
Pull and verify signed container images with Notary.
```bash
notary pull <repository>/<image_name>:<tag>
```

## Best Practices
- **Enable Image Signing Globally:** Enable image signing globally to enforce image signing and verification for all Docker commands.
- **Sign Images Before Pushing:** Sign container images with Docker Content Trust or Notary before pushing them to a registry.
- **Verify Images Before Pulling:** Always verify signed container images before pulling them from a registry to ensure their integrity and authenticity.
- **Secure Key Management:** Securely manage signing keys and credentials used for image signing to prevent unauthorized access and tampering.

## Conclusion
Enabling image signing and verification is crucial for ensuring the integrity and authenticity of container images. By implementing tools like Docker Content Trust or Notary, you can mitigate the risk of deploying compromised or tampered images and enhance the security of your containerized applications.
