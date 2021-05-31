# Interaction with the Kubernetes API

Let's interact with the Kubernetes API. This introduces you to an alternate way to affect clusters that doesn't use kubectl. We're going to use curl to do some of the same things kubectl commands might do.

## Accessing for the first time with kubectl

When accessing the Kubernetes API for the first time, use the Kubernetes command-line tool, kubectl.

Check the location and credentials that kubectl knows about with this command:

```execute
kubectl config view
```




* Follow this tutorial
* Run curl <url>/api/ and see it return information about your cluster

## Bonus

Create a deployment using a curl command

Helpful Links
📚 Kubernetes API concepts
📚 Kubernetes API Reference. The Kubernetes API Reference vX.X link has example API requests.
Suggested Timebox
1 hour

```execute
date
```

Did you type the command in yourself? If you did, click on the command instead and you will find that it is executed for you. You can click on any command which has the <span class="fas fa-running"></span> icon shown to the right of it, and it will be copied to the interactive terminal and run. If you would rather make a copy of the command so you can paste it to another window, hold down the shift key when you click on the command.
