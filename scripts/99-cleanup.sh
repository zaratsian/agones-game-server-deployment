kubectl delete fleets --all --all-namespaces
kubectl delete gameservers --all --all-namespaces
kubectl delete -f https://raw.githubusercontent.com/googleforgames/agones/release-1.19.0/install/yaml/install.yaml
kubectl delete namespace agones-system