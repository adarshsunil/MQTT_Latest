# Official Eclipse Mosquitto image 
FROM eclipse-mosquitto:latest

# To Install Python 3, pip, and other required build dependencies using apk
RUN apk update && apk add --no-cache python3 py3-pip

# To create a directory for the Python application
WORKDIR /app

# Create a virtual environment as the required libraries wont be loaded directly in some ubuntu versions
RUN python3 -m venv /app/venv

# Activate the virtual environment and install the required Python libraries
RUN . /app/venv/bin/activate && pip install paho-mqtt==1.5.1 python-dotenv==0.19.2

# Copy the subscriber script and configuration file into the container
COPY mqtt-subscriber/mqtt_subscriber.py /app/mqtt_subscriber.py
COPY mqtt-subscriber/config.env /app/config.env

# Ensure the Mosquitto config exists
COPY mosquitto/config/mosquitto.conf /mosquitto/config/mosquitto.conf

# Expose the MQTT default port
EXPOSE 1883

# Expose the WebSocket port (if needed)
EXPOSE 9001

# Start both the Mosquitto broker from mosquitto.conf and the Paho subscriber from mqtt_subscriber.py
CMD ["sh", "-c", "mosquitto -c /mosquitto/config/mosquitto.conf & /app/venv/bin/python /app/mqtt_subscriber.py"]




