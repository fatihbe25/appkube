# Depoloying docker image we have already created in [this repo](https://github.com/fatihbe25/project_todo) to 3 nodes kubernetes cluster.

## ingredients: 
    ## [docker image](https://hub.docker.com/r/fatihbe25/project_todo_web) 
    ## kubectl => tool to create and configure kubernetes cluster (pods,service,ingress) 
       ## deployment.yaml => a configuration file to define kubernetes pods, container image , replicas 
       ## service.yaml  => a configuration file to define service (loadbalancer) to access pods
       ## ingress.yaml  => a configuration file to create an ingress (nginx proxy server)
    
   
  ###### I've used Digital Ocean so to create a kubernetes cluster in DO, use doctl. "kubex" is the name of cluster. 
  
  ```
  
  doctl kubernetes cluster create kubex 
  
  ```
  
  ###### To install kubectl follow the instruction in [this link] (https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/) 
  
  
  To  connect kubernetes cluster from DO droplet, we need to copy configuration of kubernetes cluster to droplet.
  DO interface Kubernetes --> select cluster --> Download Configuration --> copy content and past to  ~/.kube/config   file in droplet. 
  Now, we can use kubectl to manage cluster from droplet. 
   
  ###### To check the cluster and get status of nodes 
  
  ```
  
  kubectl cluster-info 
  
  kubectl get nodes 
  
  ```
  
  To create 3-replicas of pods we will use deployement.yaml file  
  
   ```
   
   kubectl apply -f deployment.yaml 
      
   ```
   
   Then check pods, 
   
    ```
    
    kubectl get pods 
    
    ```
   
    And create loadbalancer service using service.yaml file. 
    
    ```
    
    kubectl apply -f service.yaml
    
    ```
  
    Then check service status, 
    ```
    
    kubectl get service 
    
    ```
  
    Fimally using ingress.yaml file, we will create a reverse proxy to our service
    
    ```
    
    kubectl apply -f ingress.yaml
    
    ```
  
    Then check ingress, 
    
    ```
    
    kubectl describe ingress ingress_x
    
    ```
    
  
  
