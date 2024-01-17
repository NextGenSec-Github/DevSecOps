#KUBECTL COMMANDS

#KUBECTL EXPLAIN:

#The explain command in kubectl can tell us about the deployment object:
kubectl explain deployment

#You can also see all of the explanation fields using the --recursive option:
kubectl explain deployment --recursive

#You can use the explain command to help you understand the structure of a deployment object and understand what the individual fields do:
kubectl explain deployment.metadata.name


# Pod Commands
echo "Pod Commands:"
echo "--------------"
echo "Create a pod: kubectl create pod <pod-name> --image=<image>"
echo "Get pods: kubectl get pods"
echo "Describe pod: kubectl describe pod <pod-name>"
echo "Delete pod: kubectl delete pod <pod-name>"
echo ""
