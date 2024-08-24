# How SSH Keys Works?

## SSH key process

1. **Generating SSH Keys:**
   - You'll generate the SSH key pair (public and private keys) **externally** on your Mac using `ssh-keygen`.
   - The public key (usually named `id_rsa.pub`) will be saved on the VM during provisioning.
   - The private key (usually named `id_rsa`) remains confidential and is used for authentication.

2. **ARM Template:**
   - The ARM template doesn't directly generate the SSH keys. Instead, it configures the VM to accept a specific public key.
   - In the template, you specify the public key (the content of `id_rsa.pub`) as part of the VM's configuration.

3. **Authentication:**
   - When connecting to the VM:
     - Use your private key (`id_rsa`) on your local machine.
     - The VM checks if the corresponding public key (`id_rsa.pub`) is authorized for the specified user (e.g., "azureuser").
     - If authorized, you gain access.

**Remember:**

- Keep your private key secure and never share it.
- If we need need to rotate keys, generate a new pair externally and update the public key in the ARM template.
