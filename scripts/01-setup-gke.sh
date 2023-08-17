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
#   Create GKE Cluster
#
###########################################################

# Create Firewall
gcloud compute firewall-rules create ${FIREWALL_NAME} \
  --allow udp:7000-8000 \
  --target-tags game-server \
  --description "Firewall to allow game server udp traffic"


# Create Google Kubernetes Engine (GKE) Cluster
#gcloud container clusters create ${CLUSTER_NAME} --cluster-version=1.21 \
#  --region ${CLUSTER_REGION} \
#  --tags=game-server \
#  --scopes=gke-default \
#  --num-nodes=4 \
#  --no-enable-autoupgrade \
#  --machine-type=e2-standard-4

# Create Node Pool (location where agones resources will be installed)
#gcloud container node-pools create agones-system \
#  --region ${CLUSTER_REGION} \
#  --cluster=${CLUSTER_NAME} \
#  --no-enable-autoupgrade \
#  --node-taints agones.dev/agones-system=true:NoExecute \
#  --node-labels agones.dev/agones-system=true \
#  --num-nodes=1


# Create Google Kubernetes Engine (GKE) Autopilot Cluster
gcloud container clusters create-auto ${CLUSTER_NAME} \
  --region=${CLUSTER_REGION} \
  --release-channel="regular" \
  --autoprovisioning-network-tags=game-server


# Create Node Pool (for metrics)
#gcloud container node-pools create agones-metrics \
#  --region ${CLUSTER_REGION} \
#  --cluster=${CLUSTER_NAME} \
#  --no-enable-autoupgrade \
#  --node-taints agones.dev/agones-metrics=true:NoExecute \
#  --node-labels agones.dev/agones-metrics=true \
#  --num-nodes=1


# Gcloud connect to cluster
gcloud config set container/cluster ${CLUSTER_NAME}
gcloud container clusters get-credentials --region ${CLUSTER_REGION} ${CLUSTER_NAME}

