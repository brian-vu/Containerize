## Kubectl Cheat Sheet

--
## Enable autocomplte kubectl 

If you are using zsh edit the ~/.zshrc file and add the following code to enable kubectl autocompletion:  

```sh
if [ *commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi
```

after that, add kubectl in plugins declarations :

```sh
plugins=(
  git
  docker
  osx
  mvn
  docker-compose
  scala
  kubectl #.  <----------------- declare here
)
```

--

### Syntax : 

```sh
kubectl [command_type] [resource_TYPE] [resource_NAME] [flags]
```
where command, Type, Name and flags are : 

* `command` : Specifies the operation that you want to perform on one or more resource , for example 
	* create
	* get
	* describe
	* delete

* `resource_TYPE` : singular, plural or abbreviated form. 
	* kubectl get pod pod1
	* kubectl get pods pod1
	* kubectl get pods/pod1
	* kubectl get po pod1

* `RESOURCE_NAME` : Spefifies the name of the resource. Names are case-sensitive. If the name is omitted, details for all resources are displayed.  



----
### Common commands : 


#### Kubectl Context and configuration : 
```sh
* kubectl config view 
* kubectl config current-context		  	
* kubectl config [context] [cluster]. # set the default context to [cluster]
```

#### Creating Object : 
```sh
* kubectl create -f ./my-manifest.yaml           # create resource(s)
* kubectl create -f ./my1.yaml -f ./my2.yaml     # create from multiple files
* kubectl create -f ./dir                        # create resource(s) in all manifest files in dir
* kubectl create -f https://git.io/web-yaml      # create resource(s) from url
* kubectl run nginx --image=nginx                # start a single instance of nginx
* kubectl explain pods,svc                       # get the documentation for pod and svc manifests
```

#### Viewing, finding resources : 
```sh
* kubectl get services                          # List all services in the namespace
* kubectl get pods --all-namespaces             # List all pods in all namespaces
* kubectl get pods -o wide                      # List all pods in the namespace, with more details
* kubectl get deployment my-dep                 # List a particular deployment
* kubectl get pods --include-uninitialized      # List all pods in the namespace, including uninitialized ones
```

##### Describe commands with verbose output
```sh
* kubectl describe nodes my-node
* kubectl describe pods my-pod
* kubectl get services --sort-by=.metadata.name # List Services Sorted by Name
```

##### List pods Sorted by Restart Count
```sh
* kubectl get pods --sort-by='.status.containerStatuses[0].restartCount'
```

#### Scaling resources
```sh
* kubectl scale --replicas=3 rs/foo                                 # Scale a replicaset named 'foo' to 3
* kubectl scale --replicas=3 -f foo.yaml                            # Scale a resource specified in "foo.yaml" to 3
* kubectl scale --current-replicas=2 --replicas=3 deployment/mysql  # If the deployment named mysql's current size is 2, scale mysql to 3
* kubectl scale --replicas=5 rc/foo rc/bar rc/baz                   # Scale multiple replication controllers
```

#### Interacting with running Pods
```sh
* kubectl logs my-pod                                 # dump pod logs (stdout)
* kubectl logs my-pod -c my-container                 # dump pod container logs (stdout, multi-container case)
* kubectl logs -f my-pod                              # stream pod logs (stdout)
* kubectl logs -f my-pod -c my-container              # stream pod container logs (stdout, multi-container case)
* kubectl run -i --tty busybox --image=busybox -- sh  # Run pod as interactive shell
* kubectl attach my-pod -i                            # Attach to Running Container
* kubectl port-forward my-pod 5000:6000               # Listen on port 5000 on the local machine and forward to port 6000 on my-pod
* kubectl exec my-pod -- ls /                         # Run command in existing pod (1 container case)
* kubectl exec my-pod -c my-container -- ls /         # Run command in existing pod (multi-container case)
* kubectl top pod POD_NAME --containers               # Show metrics for a given pod and its containers
```

#### Interacting with Nodes and Cluster
```sh
* kubectl cordon my-node                                                # Mark my-node as unschedulable
* kubectl drain my-node                                                 # Drain my-node in preparation for maintenance
* kubectl uncordon my-node                                              # Mark my-node as schedulable
* kubectl top node my-node                                              # Show metrics for a given node
* kubectl cluster-info                                                  # Display addresses of the master and services
* kubectl cluster-info dump                                             # Dump current cluster state to stdout
* kubectl cluster-info dump --output-directory=/path/to/cluster-state   # Dump current cluster state to /path/to/cluster-state
```

#### Port-forward 
	* kubectl port-forward [ service-name ] container_port:host_port



	 			 	