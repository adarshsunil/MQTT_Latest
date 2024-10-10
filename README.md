## MQTT Subscriber with Mosquitto Broker

This project sets up an MQTT subscriber using Python and the `paho-mqtt` library. The subscriber listens for messages from simulated devices using a Mosquitto broker and logs received messages and errors into separate log files for easy monitoring and troubleshooting.

## Features

- **Dockerized Setup**: Uses **Docker** and **Docker Compose** for easy setup and deployment.
- **Pattern-Based Subscription**: Subscribes to `devices/+/status` to receive messages from multiple devices.
- **Logging**: Logs received messages to `received_messages.log` and errors to `errors.log`.
- **Resilience**: Supports automatic reconnection to the broker and logs connection issues.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/) installed on your system.
- A [GitHub](https://github.com/) account (for cloning this repository).

## Getting Started

### 1. Clone the Repository

Clone this repository to your local machine:

\`\`\`bash
git clone git@github.com:adarshsunil/MQTT_Mosquitto.git
cd MQTT_Mosquitto/mosquitto-docker
\`\`\`

### 2. Environment Configuration

The `config.env` file is located in the `mqtt-subscriber` subfolder and contains the configuration for the MQTT subscriber. You can adjust the settings if needed:

\`\`\`env
MQTT_BROKER_HOST=mosquitto
MQTT_BROKER_PORT=1883
MQTT_CLIENT_ID=mqtt_subscriber
\`\`\`

- `MQTT_BROKER_HOST`: Hostname of the MQTT broker.
- `MQTT_BROKER_PORT`: Port number for the broker (default is `1883`).
- `MQTT_CLIENT_ID`: A unique client ID for the subscriber.

### 3. Build and Run the Docker Containers

Build and start the Mosquitto broker and the MQTT subscriber using Docker Compose:

\`\`\`bash
docker-compose build
docker-compose up -d
\`\`\`

This command will:
- Start the **Mosquitto broker** on port `1883`.
- Start the **MQTT subscriber** to listen for messages on `devices/+/status`.

### 4. Simulate Device Messages

To test the setup, you can simulate devices sending messages using the `mosquitto_pub` command (make sure `mosquitto-clients` is installed):

\`\`\`bash
mosquitto_pub -h localhost -p 1883 -t "devices/device1/status" -m "Device 1 is online"
mosquitto_pub -h localhost -p 1883 -t "devices/device2/status" -m "Device 2 is active"
\`\`\`

### 5. View Logs

Check the logs to see the messages received and any errors:

- **View received messages**:

  \`\`\`bash
  cat mqtt-subscriber/received_messages.log
  \`\`\`

- **View error logs**:

  \`\`\`bash
  cat mqtt-subscriber/errors.log
  \`\`\`

### 6. Stop the Containers

To stop the Mosquitto broker and MQTT subscriber, run:

\`\`\`bash
docker-compose down
\`\`\`

## Project Structure

\`\`\`
mosquitto-docker/
│
├── mqtt-subscriber/
│   ├── mqtt_subscriber.py     # Python script for the MQTT subscriber.
│   ├── config.env             # Environment variables for configuration.
│   ├── received_messages.log  # Logs of received messages (auto-generated).
│   ├── errors.log             # Logs of errors (auto-generated).
│
├── Dockerfile                 # Dockerfile for building the subscriber image.
├── docker-compose.yml         # Docker Compose file for setting up the services.
├── mosquitto/
│   ├── config/
│   │   └── mosquitto.conf     # Configuration for the Mosquitto broker.
│   ├── data/                  # Data directory for Mosquitto.
│   └── log/                   # Log directory for Mosquitto.
└── README.md                  # Documentation for setting up the project.
\`\`\`

## Notes

- **Security**: The current configuration allows anonymous connections for testing purposes. For production, update `mosquitto.conf` to require authentication and enable TLS/SSL for secure communication.
- **Logs**: The `received_messages.log` and `errors.log` files are created automatically when the subscriber starts receiving messages or encounters errors.

## Troubleshooting

- If you encounter issues with `docker-compose`, ensure that Docker and Docker Compose are installed correctly on your system.
- If the MQTT subscriber does not receive messages, check that the `MQTT_BROKER_HOST` is set correctly in `config.env`.
- Use the `docker-compose logs` command to see detailed logs from the running containers:

  \`\`\`bash
  docker-compose logs mosquitto
  docker-compose logs mqtt-subscriber
  \`\`\`

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Feel free to submit issues or pull requests if you would like to improve this project. Contributions are welcome!
"""

# Write the content to a README.md file
readme_path = "/mnt/data/README.md"
with open(readme_path, "w") as f:
    f.write(readme_content)

readme_path

