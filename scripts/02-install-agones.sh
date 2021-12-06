###########################################################
#
#   Parameters
#
###########################################################

FIREWALL_NAME=game-server-firewall
CLUSTER_NAME=game-server-cluster
CLUSTER_REGION=us-central1

###########################################################
#
#   Install Agones
#
###########################################################

# Create Namespace
kubectl create namespace agones-system

# Create Kubernetes resource with Agones spec
kubectl apply -f https://raw.githubusercontent.com/googleforgames/agones/release-1.19.0/install/yaml/install.yaml

###########################################################
#
#   Check for Running Services
#
###########################################################

# Check Namespace details
kubectl describe --namespace agones-system pods

# Check Pod status (should be running)
kubectl get pods --namespace agones-system
