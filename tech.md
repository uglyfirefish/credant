---
permalink: /tech
---

# **CredAnt: Background, Technical Principles, Architecture Analysis, and Use Cases**

## 1. Background Knowledge

In modern network environments, the demand for remote networking is increasingly growing, especially in scenarios such as remote work, online gaming, and IoT (Internet of Things) control. In these cases, users need to establish a **secure, efficient, and low-latency** virtual local area network (VLAN) between devices in different geographical locations. While traditional VPNs (like OpenVPN, WireGuard, etc.) can provide remote access functionality, they often suffer from complex configurations, limited performance, and difficulties in NAT (Network Address Translation) traversal in certain network environments.

**CredAnt**, as a novel remote networking technology, focuses on **P2P (Peer-to-Peer) connection, NAT traversal, data encryption, and virtual network adapter** technologies. It allows users to access remote devices as if they were on the same local area network (LAN). CredAnt aims to deliver a **lightweight, low-latency, and highly secure** remote connection solution suitable for remote office, online gaming, file sharing, and remote management of IoT devices.

---

## 2. Technical Principles

CredAnt employs a series of core technologies to achieve seamless remote networking, primarily including:

### **2.1 NAT Traversal**
Since most user devices are located behind NAT (such as home or enterprise networks) and cannot directly connect to each other using public IPs, CredAnt employs the following NAT traversal techniques:

- **AutoNAT (Automatic NAT Detection and Adaptation):** **AutoNAT allows peers to automatically detect their NAT environment and choose the optimal connection method.**
    - If P2P direct connection is feasible, UDP Hole Punching is used.
    - If direct connection fails, Relay is attempted.

- **Relay Mechanism:** **The Relay mechanism is used to address issues where Symmetric NAT or enterprise firewalls block P2P connections.**
    - Trusted Relay nodes (publicly accessible) act as **"data forwarding stations."**
    - Two NAT-restricted peers establish an **indirect channel** through the Relay server.
    - The Relay server is responsible for **forwarding P2P data**, similar to TURN, but is more flexible and supports automatic discovery of Relay nodes in a P2P network.

- **UDP Hole Punching:** Enables the establishment of direct UDP connections between NAT devices, improving communication efficiency.
- **UPnP (Universal Plug and Play) and NAT-PMP (NAT Port Mapping Protocol):** Automatically requests port mapping from routers to avoid NAT restrictions.

### **Distributed Hash Table (DHT)**

- DHT is a decentralized distributed storage and lookup mechanism used to store and query data in a P2P network.
- DHT allows nodes in the network to collaboratively store and manage key-value pair data and enables rapid lookup of target nodes or resources without relying on a central server.
- In CredAnt, DHT technology is used in two scenarios:
    - Peer Discovery: Helping nodes find other available P2P nodes.
    - Content Addressing: Storing and looking up the storage location of data content.

### **2.2 P2P Networking**
- CredAnt prioritizes establishing **end-to-end P2P direct connections** to reduce reliance on central servers, improve transmission efficiency, and lower bandwidth costs and latency.
- Through P2P direct connections, users can achieve more stable transmission rates, especially suitable for real-time communication or large file transfers.

### **2.3 Overlay Network Supporting Virtual DNS/IP Access**
- Nodes using the same network passphrase form a virtual overlay network where they can access each other via DNS/IP.
- Supports fixed DNS pointing to dynamic IP, simplifying network operation and management.
- Allows users to specify IP addresses, reducing DNS resolution overhead while supporting IPv4/IPv6.

### **2.4 Virtual Network Adapter**
- CredAnt creates a **virtual network adapter (TAP/TUN device)** on the client device to simulate a local area network environment.
- Through the virtual network adapter, devices can obtain **virtual private network IPs**, allowing them to access remote devices as if they were on the same LAN.
- This approach allows users to communicate using standard network protocols (such as SMB sharing, remote desktop, gaming LAN multiplayer, etc.).

### **2.5 Data Encryption and Security**
- The transport encryption layer can use **TLS/DTLS** and **AES-256** to encrypt all data traffic, preventing data from being eavesdropped or tampered with during transmission.
- The transport layer supports both traditional TCP/TLS and more modern, efficient, low-latency, and flexible UDP/Quic protocols.


## 3. Architecture Analysis

CredAnt adopts a distributed P2P architecture combined with a centralized management server to ensure efficient connection and ease of use. The overall architecture includes the following key components:

### **3.1 Client**
- Installed on user's Windows, Linux, macOS, Android, or iOS devices.
- Responsible for:
    - Connection management (interaction with Discovery Server and P2P devices).
    - NAT traversal and encrypted transmission processing.
    - Creation of virtual network adapters to provide VLAN connectivity.

### **3.2 Discovery Server Seed Node**
- Used for devices to discover other nodes on the network during initialization.

### **3.3 Relay Server**
- When P2P connections fail, CredAnt uses Relay Servers to forward traffic, ensuring connection availability.
- Suitable for networks with strict NAT types (such as enterprise firewalls, CGNAT environments).
- As Relay mode increases latency and bandwidth costs, it is used as a **backup solution** only.


---
## 4. Use Cases

CredAnt is suitable for various remote networking needs, primarily including:

### **4.1 Remote Office**
- Allows employees to remotely access company intranet resources (file servers, databases, remote desktops).
- Replaces traditional VPNs, reducing maintenance costs and improving connection stability.

### **4.2 Online Gaming**
- Suitable for multiplayer games that support **LAN mode**.
- Players in different locations can join the same virtual LAN, achieving a low-latency gaming experience.

### **4.3 Remote File Sharing**
- Users can use protocols like **SMB, NFS, FTP** for file sharing and transfer as if they were on a LAN.
- Suitable for home NAS access, remote management of company file servers, and similar scenarios.

### **4.4 IoT (Internet of Things) Remote Control**
- Remote access to smart home devices, such as monitoring cameras, routers, smart plugs, etc.
- Remote management of industrial equipment, such as PLCs, sensors, etc.

### **4.5 Personal Cloud Storage**
- By using CredAnt, a home NAS device can be turned into a private cloud, enabling remote access and data synchronization.
