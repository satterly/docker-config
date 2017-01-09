kapacitor define cpu_alert \
    -type stream \
    -tick cpu_alert.tick \
    -dbrp telegraf.autogen
kapacitor enable cpu_alert
kapacitor show cpu_alert
