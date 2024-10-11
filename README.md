
# MQTT with Mosquitto Broker using Docker Compose

This repository contains three tasks related to setting up and using an MQTT broker with Mosquitto using Docker Compose. Follow the instructions below to complete each task.

## Prerequisites

- Docker and Docker Compose installed on your machine.
- Basic knowledge of MQTT and Docker.
- Clone this repository to your local machine.

## Task 1: Set Up Mosquitto Broker Using Docker Compose

### Description

Set up the Mosquitto MQTT broker using Docker Compose. The broker will be accessible on the default MQTT port (1883) and will be configured to allow device connections.

### Instructions

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/adarshsunil/MQTT_Latest/tree/master
   cd <repository-folder>
   ```

2. **Navigate to the Mosquitto Configuration**:
   ```bash
   cd mosquitto
   ```

3. **Start the Mosquitto Broker**:
   Use Docker Compose to start the Mosquitto service:
   ```bash
   docker-compose up -d
   ```
   The broker will now be accessible on `localhost:1883`.

4. **Stop the Mosquitto Broker**:
   To stop the broker, run:
   ```bash
   docker-compose down
   ```

5. **Verify the Setup**:
   Use an MQTT client or simulator to connect to the broker on `localhost:1883` to ensure it is running.

## Task 2: Implement MQTT Subscriber for Receiving Messages

### Description

Develop an MQTT subscriber that listens for incoming messages from simulated devices and logs them to a `received_messages.log` file.

### Instructions

1. **Navigate to the Subscriber Folder**:
   ```bash
   cd mqtt_subscriber
   ```

2. **Configure Environment Variables**:
   Set up the environment variables in a `.env` file:
   ```bash
   BROKER_HOST=localhost
   BROKER_PORT=1883
   SUBSCRIBE_TOPIC=devices/+/status
   ```

3. **Run the Subscriber**:
   Execute the following command to start the subscriber:
   ```bash
   python3 mqtt_subscriber.py
   ```
   The subscriber will connect to the Mosquitto broker and log messages to `received_messages.log`.

4. **Check Received Messages**:
   Open the `received_messages.log` file to see the logged messages:
   ```bash
   tail -f received_messages.log
   ```

## Task 3: Error Logging for MQTT Subscriber

### Description

Implement error handling for the MQTT subscriber to ensure any issues (such as timeouts, disconnections, etc.) are logged to `errors.log`.

### Instructions

1. **Error Handling Configuration**:
   Make sure the `mqtt_subscriber.py` file includes proper error handling and logging to `errors.log`.

2. **Run the Subscriber with Error Logging**:
   Start the subscriber as mentioned in Task 2:
   ```bash
   python mqtt_subscriber.py
   ```

3. **Check Error Logs**:
   Any disconnections or errors will be logged in `errors.log`. Use the following command to view them:
   ```bash
   tail -f errors.log
   ```

## Notes

- Modify the `docker-compose.yml` and environment variables as needed for your setup.
- Ensure that Docker is running before starting the Mosquitto broker.
- Feel free to adjust the `mqtt_subscriber.py` script for specific requirements.

## Conclusion

By following the above steps, you should be able to set up a Mosquitto MQTT broker, subscribe to messages, and handle errors effectively. If you encounter any issues, check the `errors.log` for troubleshooting.

