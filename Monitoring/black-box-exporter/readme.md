##
# Pometheus Side Config
##
```
  - job_name: 'blackbox'
    metrics_path: /probe
    params:
      module: [http_2xx]
    static_configs:
      - targets:
        - packops.dev
        - packops.ir
    relabel_configs:
      - source_labels: [__address__]
        target_label: __param_target
      - source_labels: [__param_target]
        target_label: instance
      - target_label: __address__
        replacement: 192.168.4.182:9115

  - job_name: 'blackbox-ICMP'
    metrics_path: /probe
    params:
      module:
      - icmp
    static_configs:
      - targets:
        - 8.8.8.8
        - 4.2.2.4
        - time.ir
    relabel_configs:
      - source_labels: [__address__]
        target_label: __param_target
      - source_labels: [__param_target]
        target_label: instance
      - target_label: __address__
        replacement: YOUR_BLACKBOX_IP:9115
# change replacement with YOUR Blackbox-exporter IP
```
