## The error message you're seeing indicates that there is an issue with the SSL certificate verification when trying to connect to a remote server (IP: 185.46.212.88) over HTTPS. This can happen when you are behind a proxy that intercepts SSL traffic or when the server's certificate is not trusted by your system.

To use the internet via a proxy when you encounter SSL certificate verification errors, you can follow these steps:

1. **Determine Proxy Settings:**

   First, you need to obtain the proxy server details, including the proxy server address and port number, as well as any authentication credentials (username and password) if required. You can usually get this information from your network administrator or the proxy provider.

2. **Set Environment Variables for Proxy:**

   You can set environment variables in your terminal session to configure your proxy settings. Open a terminal and use the following commands, replacing `your_proxy_address` and `your_proxy_port` with the actual proxy server details:

   ```bash
   export http_proxy=http://your_proxy_address:your_proxy_port
   export https_proxy=http://your_proxy_address:your_proxy_port
   ```

   If your proxy requires authentication, you can also set the `http_proxy` and `https_proxy` environment variables with your credentials:

   ```bash
   export http_proxy=http://your_username:your_password@your_proxy_address:your_proxy_port
   export https_proxy=http://your_username:your_password@your_proxy_address:your_proxy_port
   ```

   **Note:** Storing your password in plaintext in your terminal history is not recommended for security reasons. Consider using a more secure method to store your credentials if needed.

3. **Configure Apt for Proxy:**

   If you encounter SSL certificate verification errors while using `apt-get` or `apt`, you can configure them to use the proxy settings by creating a configuration file:

   Create a new file `/etc/apt/apt.conf.d/90proxy`:

   ```bash
   sudo nano /etc/apt/apt.conf.d/90proxy
   ```

   Add the following lines, replacing `your_proxy_address` and `your_proxy_port` with the actual proxy server details:

   ```plaintext
   Acquire::http::Proxy "http://your_proxy_address:your_proxy_port";
   Acquire::https::Proxy "http://your_proxy_address:your_proxy_port";
   ```

   Save the file and exit the text editor.

4. **Test Internet Connection:**

   To test if your internet connection works through the proxy, you can try running an `apt-get update` command:

   ```bash
   sudo apt-get update
   ```

   If there are no SSL certificate verification errors, it means your internet connection is working through the proxy.

Please make sure to replace the placeholders (`your_proxy_address`, `your_proxy_port`, `your_username`, and `your_password`) with the actual values provided by your proxy administrator. Additionally, be aware that configuring a proxy with username and password via environment variables might expose your credentials in your command history, so use this approach with caution in shared environments.
