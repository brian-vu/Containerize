# Containerize

*  Getting started with k8s, minikube and kubectl. 

*  Kubernetes architecture overview. 

*  How to packed your Spring app onto Docker image. 

*  Play ground with deploy Spring app and backed Couchbase servers stack on k8s.

```sh
$ cd Spring_Couchbase_k8s

# Start your cluster with a single master, worker service under RC, 
# and a single java Spring app client.
#
$ ./couchbase_cluster.sh

# Scale your worker app 
#
$ kubectl scale rc couchbase-worker-rc --replicas=5

# Viewing k8s cluster via cluster : minikube dashboard

# Access client service : 
$ CLIENT_SERVICE=$(minikube service --url client-service)

# Get result : 
$ curl http://$CLIENT_SERVICE/couchbase-javaee/resources/airline
```
