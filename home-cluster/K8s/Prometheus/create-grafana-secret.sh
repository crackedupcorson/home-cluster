kubectl -n monitoring create secret generic grafana-admin-secret \
    --from-literal=password=$(echo $GRAFANA_ADMIN_PASSWORD) \
    --from-literal=user=$(echo $GRAFANA_ADMIN_USER)