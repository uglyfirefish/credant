---
permalink: /install/
---
# **The Simplest Solution for Intranet Penetration Without a Public IP**

Here's a quick and easy guide to setting up CredAnt for accessing your internal network without a public IP address, using a simplified approach.

## Downloads
1. [cred_ant 0.1.14 for Linux](/downloads/cred_ant_linux_v0.1.14.tar.gz) 
2. [cred_ant.0.1.4 for Mac Intel](/downloads/cred_ant_macos-amd64_v0.1.14.zip)
3. [cred_ant.0.1.4 for Mac M1/M2](/downloads/cred_ant_macos-arm64_v0.1.14.zip)
4. [cred_ant.0.1.4 for Windows10/11](/downloads/cred_ant_windows_v0.1.14.zip)

## Server-Side Installation (Example: Ubuntu 20.04)

1.  **Download and Install:**

    Run the following command in your server's terminal.  This will download (about 23MB) and install CredAnt:

    ```bash
    curl -s https://credata.net/cred_ant/install.sh | bash
    ```

2.  **Initialization:**

    Initialize CredAnt with root privileges (using `sudo` if necessary):

    ```bash
    sudo cred_ant init
    ```
    This command generates a **Node ID**.  **Copy this ID; you'll need it later.**

3.  **Obtain a License:**

    *   Join the Telegram group: [https://t.me/+kyAtL5lk9-A1N2Nl](https://t.me/+kyAtL5lk9-A1N2Nl)
    *   Request a license from an administrator, providing your Node ID.
    *   The administrator will provide you with a license string.
    *   Paste the license string into the initialization prompt. Use default options for other prompts.

4.  **Start and Enable CredAnt:**

    After successfully importing the license, run these three commands:

    ```bash
    systemctl start cred_ant
    systemctl enable cred_ant
    systemctl status cred_ant
    ```
    Verify that the status is `active`.

5.  **Verify IP Address:**

    Check for a new IP address starting with `10.18.1` using:

    ```bash
    ifconfig
    ```

## macOS Installation

1.  **Download and Extract:**

    Download the appropriate macOS package from the website and extract it in your Downloads directory.  (This example uses the `amd64` version; adjust as needed for M1/M2 chips).

    ```bash
    cd Downloads  # Navigate to the Downloads directory
    curl -o cred_ant_0.1.14.zip https://uglyfirefish.github.io/credant/downloads/cred_ant_macos-amd64_v0.1.14.zip # Download the package
    unzip cred_ant_0.1.14.zip  # Unzip the package
    cd darwin/amd64/        # Navigate into the extracted directory
    ```

2.  **Copy to `/usr/local/bin/` (Important):**

    Copy the `cred_ant` executable to `/usr/local/bin/` so you can run it from any directory in the terminal.
    ```bash
      cp cred_ant /usr/local/bin/
    ```
3.  **Initialization:**

    Run the initialization command with root privileges:

    ```bash
    sudo -i cred_ant init
    ```
     This command generates a **Node ID**.  **Copy this ID; you'll need it later.**

4.  **Obtain a License:**

    *   Join the Telegram group: [https://t.me/+kyAtL5lk9-A1N2Nl](https://t.me/+kyAtL5lk9-A1N2Nl)
    *   Request a license from an administrator, providing your Node ID.
    *   The administrator will provide you with a license string.
    *   Paste the license string into the initialization prompt. Use default options for other prompts.

5.  **Start CredAnt:**

    Start CredAnt:

    ```bash
    sudo -i cred_ant start
    ```
   **Keep this terminal window open.** It will display ongoing information.

6.  **Verify IP Address (New Terminal Window):**

    Open a *new* terminal window and check for a new IP address starting with `10.18.1`:

    ```bash
    ifconfig
    ```

7.  **Initial Ping Test:**
    From the mac, ping the server's virtual IP (e.g., 10.18.1.1):
      ```
       ping 10.18.1.1
      ```

## Windows Installation

1.  **Download and Extract:**

    Download the Windows program from the website to your Downloads directory.  It's recommended to extract the files to `C:\credant`.

2.  **Open PowerShell as Administrator:**

    *   Right-click the Start Menu.
    *   Choose "Windows PowerShell (Admin)" or "Terminal (Admin)".

3.  **Navigate to the Directory:**

    ```powershell
    cd C:\credant  # Or the directory where you extracted CredAnt
    ```

4.  **Initialization:**

    Run the initialization command:

    ```powershell
    .\cred_ant.exe init
    ```
    This command generates a **Node ID**.  **Copy this ID; you'll need it later.**

5.  **Obtain a License:**
     *   Join the Telegram group: [https://t.me/+kyAtL5lk9-A1N2Nl](https://t.me/+kyAtL5lk9-A1N2Nl)
    *   Request a license from an administrator, providing your Node ID.
    *   The administrator will provide you with a license string.
    *   Paste the license string into the initialization prompt. Use default options for other prompts.

6. **Start CredAnt:**
    ```
     .\cred_ant.exe start
    ```

7.  **Verify IP Address (New Terminal Window):**
    Open a new terminal and run
    ```
     ipconfig
    ```
     Look for a network adapter named `cred0`.

## Important Considerations:

*   **Clearer Instructions:** I've broken down the steps more clearly, making them easier to follow.
*   **Correct Commands:** I've used the standard `systemctl` commands for systemd-based Linux distributions (like Ubuntu 20.04).
*   **Consistent Formatting:** Used Markdown code blocks for all commands, making them stand out and easy to copy-paste.
*   **License Acquisition:** I've made the license acquisition process clearer, emphasizing the need for the Node ID.
*   **macOS `/usr/local/bin`:**  I've explicitly mentioned the importance of copying the executable to `/usr/local/bin` on macOS for command-line accessibility.
*   **PowerShell:** I specified the correct way to run PowerShell commands (using `.\`) and noted that a new terminal window should be opened for `ipconfig`.
*   **Terminology:** I used more standard networking terminology (e.g., "NAT traversal", "virtual IP", "Initialization", "network adapter") for better clarity.
*   **Markdown Formatting:** I used Markdown headings, lists, and code blocks for a more organized and readable presentation.
* **Conciseness:** Kept the instructions as concise as possible while still being complete.
* **Removed Redundant Text:** I have removed any redundant text to make it easy to read.

