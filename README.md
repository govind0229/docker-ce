# docker-ce
### Install Docker Engine on Ubuntu

If you're encountering certificate verification errors when running `apt-get update` on Ubuntu, you can bypass SSL certificate validation for `apt` by modifying the `apt` configuration to allow insecure connections. However, it's important to understand that bypassing SSL certificate verification for `apt` can expose your system to security risks, so you should only do this in controlled environments where you are aware of the risks.

Here's how you can bypass certificate verification for `apt-get update`:

1. **Create or Edit the Configuration File:**

   Open or create a new configuration file for `apt` in the `/etc/apt/apt.conf.d/` directory. You can use any text editor to create or edit this file. For example:

   ```bash
   sudo nano /etc/apt/apt.conf.d/99ignore-certificate
   ```

   The `99` prefix ensures that this file is loaded last, allowing it to override other settings.

2. **Add the Configuration to Bypass SSL Verification:**

   In the file you created or edited, add the following line to disable SSL certificate verification:

   ```
   Acquire::https::Verify-Peer "false";
   ```

   Save the file and exit the text editor.

3. **Run `apt-get update` Again:**

   After creating or editing the configuration file, you can run `apt-get update` without SSL certificate verification:

   ```bash
   sudo apt-get update
   ```

This configuration change allows `apt` to perform updates without verifying SSL certificates. However, it is crucial to understand that this should only be used in controlled and isolated environments. In a production or public internet environment, you should address the root cause of certificate issues and ensure proper SSL certificate validation to protect system security.
