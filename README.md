
# Tor Docker

[![Tor Relay](https://img.shields.io/badge/tor-relay-purple?logo=tor&style=for-the-badge)](https://www.torproject.org/)
[![Docker](https://img.shields.io/badge/docker-ready-blue?logo=docker&style=for-the-badge)](https://github.com/steffsas/tor-docker/pkgs/container/tor-docker)
[![GitHub](https://img.shields.io/github/license/steffsas/tor-docker?style=for-the-badge)](LICENSE)

A lightweight, easily deployable **Tor relay** running inside Docker containers. This repository enables you to quickly spin up and maintain a Tor relay using Docker for privacy-enhanced web traffic routing on the Tor network.

## 📦 Features

- **Run your own Tor relay**: Contribute to the Tor network by running your own relay node.
- **Lightweight and portable**: Containerized environment ensures easy setup, deployment, and portability.
- **Automatic updates**: Always use the latest stable Tor version.
- **Custom configurations**: Use your own `torrc` configuration file to fine-tune your Tor relay setup.
- **IPv6-ready**: Supports IPv6 alongside IPv4 networking.
- **Secure by default**: Designed to follow best security practices.

## 🛠️ Quick Start

Follow the steps below to get your Tor relay running using Docker and `docker-compose`.

### 1. Clone the Repository

```bash
git clone https://github.com/steffsas/tor-docker.git
cd tor-docker
```

### 2. Update the Tor Configuration

Modify the `torrc` file if you want to customize your Tor relay. The default `torrc` file is already set up to run a middle relay, which contributes to the Tor network.

```bash
nano torrc
```

### 3. Start the Docker Container

With Docker and Docker Compose installed, you can launch the Tor relay using:

```bash
docker compose up -d
```

This will start the Tor relay in detached mode, running in the background.

### 4. Check the Logs

Monitor the Tor relay logs to ensure it’s running smoothly:

```bash
docker compose logs -f
```

### 5. Stop the Relay

To stop the Tor relay, simply run:

```bash
docker compose down
```

## 🛠️ Configuration

### Docker Compose Setup

The provided `docker-compose.yml` is configured to map the necessary ports and persist key data across container restarts.

### Custom Configuration

You can customize the Tor relay's behavior by modifying the `torrc` file. For more details on how to configure your Tor relay, refer to the official [Tor Project documentation](https://www.torproject.org/docs/tor-manual.html.en).

## 🖥️ Monitoring and Stats

Once your Tor relay is up and running, you can monitor its status through various services like:

- [Tor Metrics](https://metrics.torproject.org/)
- [Globe](https://globe.torproject.org/)

Add your relay's fingerprint to these services to track its contribution to the Tor network.

## 🔧 Troubleshooting

### Logs and Debugging

To view logs and debug any issues, use:

```bash
docker logs tor-relay
```

### Common Issues

- **Ports in use**: Ensure the ports defined in `docker-compose.yml` (e.g., 9001 for ORPort) are available on your host machine.
- **Firewall**: Make sure that your firewall allows traffic on the required ports, both for IPv4 and IPv6.

## 🙌 Contributing

Contributions are welcome! If you'd like to contribute, please fork the repository and submit a pull request. Issues and suggestions can be reported in the [Issues](https://github.com/steffsas/tor-docker/issues) section.

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

**Get started today** and contribute to making the internet more private and secure by running a Tor relay with Docker!