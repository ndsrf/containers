FROM python

RUN pip install --upgrade pip setuptools wheel && \
pip3 install Adafruit_DHT && \
pip install influxdb

COPY sensor_data_log.py .

CMD python sensor_data_log.py
