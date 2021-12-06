
# Create Game Server
kubectl create -f https://raw.githubusercontent.com/googleforgames/agones/release-1.19.0/examples/simple-game-server/gameserver.yaml

# Confirm running - Get Game Server 
kubectl get gameservers

# Get Game Server Status
kubectl describe gameserver

# Retrieve the IP address and the allocated port of the Game Server
echo ""
echo "kubectl get gs"
kubectl get gs

# Connect to game server   
echo ""
echo "Connect to Game Server"
echo "nc -u {IP} {PORT}"
echo ""