## Terraform deployment for Agones 

Reference: https://agones.dev/site/docs/installation/terraform/gke/

---

This repo contains a Terraform deployment for Agones, the open source platform for deploying, hosting, scaling, and orchestrating dedicated game servers for large scale multiplayer games.

## Installation

NOTE: The main terraform module can be found [here](https://github.com/googleforgames/agones/blob/release-1.19.0/examples/terraform-submodules/gke/module.tf) (or select a different version if preferred).

1. Initialize a working directory containing Terraform configuration files

    ```
    terraform init
    ```

2. Execute the actions proposed in the Terraform plan

    *Option 1: Creating the cluster in the default VPC*
    ```bash
    terraform apply -var project="<YOUR_GCP_ProjectID>"
    ```

    *Option 2: Creating the cluster in a custom VPC*
    ```bash
    terraform apply -var project="<YOUR_GCP_ProjectID>" \
    -var network="<YOUR_NETWORK_NAME>" \
    -var subnetwork="<YOUR_SUBNETWORK_NAME>"
    ```

3. Verify that the cluster was created successfully

    ```bash
    gcloud container clusters get-credentials --zone us-west1-c agones-terraform-example
    ```

4. Get node resources

    ```
    # Connect to Cluster
    gcloud container clusters get-credentials agones-terraform-example --zone us-west1-c --project <YOUR_GCP_PROJECT>
    
    # Get node resources
    kubectl get nodes
    ```

5. Create Game Server

    ```
    ./create-game-server.sh
    ```


## Cleanup

```bash
terraform destroy -var project="<YOUR_GCP_ProjectID>"
```

