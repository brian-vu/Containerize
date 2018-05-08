### Getting start with minikube

The `minikube start` command create kubectl context called "minikube". This context contains the configuration to communicate with your cluster (Minikube cluster). 

*Note : you can switch between context :*

 `kubectl get pods --context=minikube`

#### Dashboard

To access the Kubernetes Dashboard, run this command :

```sh
 minikube dashboard   
```

#### Services

To acccess your services inside k8s cluster, run : 

```sh
minikube service [-n NAME_SPACE] --url SERVICE_NAME
```



#### Common commands :

*  minikube start : start cluster and create kubectl-context
*  minikube delete : delete your minikube vm
*  minukube service [-n name_space] --url [service_name] : get service url (local host machine mapping).  


