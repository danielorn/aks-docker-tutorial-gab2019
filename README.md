# Container and Azure Kubernetes Service Tutorial

Many are the developers that have experienced the dreaded _”It works on my computer, but not on the servers”_, and then spent far too many hours comparing the environments, just to find that the cause of the error is not at all in the application, but in a configuration file in the application server. 

With containers this is about to change, as one of the many benefits of a container is that it packages most of the runtime environment instead of just the application for distribution.

[Link to slide deck](http://bit.ly/aksdocker)

## Part 1 - What is a Linux Container and what is it good for
This part uncovers what a Linux container really is, how it works and a short walkthrough of useful commands

[Link to Part 1 instructions](introduction/README.md)

## Part 2 - Containerizing an application
Part 2 covers how to containerize a simple web application and how configuration can be externalized using environment variables.

[Link to Part 2 instructions](app/README.md)

## Part 3 - Deploying the container to Azure using AKS and ACR
Finally, we investigate what container orchestration is and how Azure Kubernetes Service (AKS) can be configured to deploy, monitor and scale our application during runtime.

[Link to Part 3 instructions](k8s/README.md)