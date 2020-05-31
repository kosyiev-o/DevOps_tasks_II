# Tasks for Demo 5 (Final Demo)

- [Practice after Training 1 Containers](#Practice-after-Training-1-Containers)
- [Practice after Training 2 Containers](#Practice-after-Training-2-Containers)
- [Practice-after-Training-1-Kubernetes](#Practice-after-Training-1-Kubernetes)
- [Practice-after-Training-2-Kubernetes](#Practice-after-Training-2-Kubernetes)
- [Practice-after-Training-3-Kubernetes](#Practice-after-Training-3-Kubernetes)
- [Final Demo Session Requirements](#Demo-Session-Requirements)

Below you will find a list of tasks to play with after each lecture as well as the list of requirements for the demo.

*After lesson tasks*

> __PWD__ is a service called _Play with Docker_ that allows you to run docker for free on hosted machines. See link for this service [here](https://labs.play-with-docker.com/)

## Practice after Training 1 Containers

* Work in DEMO5 folder of your repo
* Have a __PWD__ open
* Verify docker works by running hello-world container
* Create _Dockerfile_ to run Nginx 
* Create _docker image_ based on _Dockerfile_
* Run _docker container_ based on built _docker image_

## Practice after Training 2 Containers

* Verify _docker-compose_ is available on __PWD__
* Create an _image_ to run _Petclinic_ in Docker _container_
* Verify _Petclinic_ works on UI
* Create _docker-compose file_ to run _Nginx_ that [proxy_pass](http://nginx.org/en/docs/http/ngx_http_proxy_module.html) on Petclinic 
    * Both containers should run in a custom network and linked by alaises. 
    * _Nginx_ logs should be on _persistant volume_
* Verify _docker-compose_ starts your stack (Nginx + Petclinic)
* Create docker healthcheck for Petclinic container inside docker-compose definition
* Push _Petclinic_ image to DockerHub public repository

> __Kubernetes-playground__ is a chapter inside Katakoda learning platform that allows you to run simple kubernetes cluster for free on hosted machines. To visit service follow the [__link__](https://www.katacoda.com/courses/kubernetes/playground).
> All of three Kubernetes trainings and Demo are build upon __Kubernetes-playground__

## Practice after Training 1 Kubernetes

* Lunch K8s cluster in [Kubernetes-playground](https://www.katacoda.com/courses/kubernetes/playground)
* Work in DEMO5 folder of your repo inside __Kubernetes-playground__
* Write .yaml file to run [Tutum hello-world](https://hub.docker.com/r/tutum/hello-world/) Pod
* Run Tutum hello-world Pod
* Check pod logs
* Exec into pod
* Describe pod
* __Advanced__ start kubernetes Dashboard [by_following_tutorial](https://www.replex.io/blog/how-to-install-access-and-add-heapster-metrics-to-the-kubernetes-dashboard). Some of the links on this page may be outdated.

## Practice after Training 2 Kubernetes

* Work in DEMO5 folder of your repo inside __Kubernetes-playground__
* Create all resource with .yaml file
* Run "latest" nginx as Relicaset with replicas=2 
    * Scale Relicaset to 4 replicas and delete one pod, observe the results
    * Create Persistant Volume and Persistant Volume Claim  size - 1Gb, policy - RWX  [more info](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/)  
    * Edit Replicaset to use Persistant Volume observe result
* Run "latest" nginx as Deployment with replicas=2 
    * Set nginx Deployment image to version 1.16.1 and rollback
* Run Daemonset with tutum/helloworld on it 
    * Check where daemonset pod were established  
    * use following command to make master node shedulable: kubectl taint node master node-role.kubernetes.io/master:NoSchedule-
    * check daemonset pods again
* Configure MySQL with secret and config map
    *  Create/run configmap that stores a variable for default database name (DB_NAME = EPAM_LABS)
    *  Create/run secret that stores MySQL username and password in a secure way (more info: [here](https://kubernetes.io/docs/concepts/configuration/secret/)
    *  Run Statefulset with MySQL image and set it to use values from previously created secret and configmap
* Push your work to repo

## Practice after Training 3 Kubernetes

 Work in DEMO5 folder of your repo inside __Kubernetes-playground__. By the end of this task you should have the following files in your working folder: mysql.yaml, petclinic.yaml, petconfig.yaml, pet-svc.yaml, mysql-svc.yaml.

#### Requirements
Petclinic deployment should be:
* of type Deployment
* based on image previously pushed to DockerHub
* configured with replicas=2
* using your created ConfigMap under mount path /config (more info in chapter  [21.2 Application property files](https://docs.spring.io/spring-boot/docs/1.0.1.RELEASE/reference/html/boot-features-external-config.html))

MySQL deployment should be:
* of type StatefulSet
* image version 5.7.8
* using username/password and database name from your created Secret object (using env variables)

#### Deploy Petclinic application and couple it with MySQL database:
* Create Petclinic ConfigMap file with values of property files that should override default application parameters 
    * Configure application database endpoint as Kubernetes [service resolution](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/#services) name for MySQL service
    * Modify application.properties and application-mysql.properties files with configuration parameters mentioned in spring-petclinic [readme](https://github.com/spring-projects/spring-petclinic)
* Create/update Petclinic deployment file
* Create Secret object with required MySQL variables (use kubectl command)
* Create/update MySQL deployment file as StatefulSet
* Create Petclinic Service file with type LoadBalancer
* Create MySQL Service file with type ClusterIP
* Lunch Kubernetes objects in the correct order


## Demo Session Requirements
> Demo requires to use previously (in Docker part) pushed image and run it as microservice structure in kubernetes cluster 

* Show  “Petclinic” image in DockerHub
* Show deployment yaml to run Petclinic application, point fields mentioned in "Requirements" list 
* Show deployment yaml to run Mysql, point fields mentioned in "Requirements" list    
* Show config map and secret, provided to Petclinic and Mysql 
* Show that deployments and services are in 'Ready' state
* Show running Petclinic application and its logs
* Show that list of databases in MySQL contains Petclinic database (exec to MySQL pod)
* Show Petclinic on HTTP port from Katacoda UI. 


