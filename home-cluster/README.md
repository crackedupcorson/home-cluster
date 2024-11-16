# Home Cluster Configs


## Prometheus

### Overview
This README provides an overview of the custom kube-prometheus-stack Helm chart setup for monitoring on a Raspberry Pi cluster. The setup includes custom configurations and custom resources to cater to specific requirements such as local storage and targeted scraping of pod metrics.

### Custom Configurations

* A Persistent Volume (PV) template is included to provide the required storage using the local-path storage class, ensuring data is retained locally on the required worker node (pi2 currently)
* Namespace override - this is set to `monitoring` currently,  update create-grafana-secret.sh if you wish to change it.
* Prometheus Configuration
    * Storage: 10Gi PVC with local-path storage class.
    * Retention: Data retention for 120 days or 10GB.
    * Additional Scrape Configs: Scraping pods annotated for Prometheus scraping within the `monitoring` namespace.
    * Node Selector: Schedules Prometheus on node pi2.
    * Service: Exposed via MetalLB LoadBalancer, on an internal IP of 192.168.0.58

* Grafana Configuration
    * Admin Credentials: Stored in a Kubernetes secret grafana-admin-secret.
    * Persistence: Enabled with 5Gi storage using the local-path storage class.
    * Node Selector: Schedules Grafana on node pi2.
    * Service: Exposed via LoadBalancer with IP 192.168.0.57.
    * Prometheus Operator Configuration
    * Node Selector: Schedules the operator on node pi2.
* Grafana Secret
    * Before deploying the Helm chart, create the Grafana admin secret using the `create-grafana-secret.sh`
* Custom Alerting Rules
    * A separate rules.yaml file manages custom alerting rules and disables default ones
