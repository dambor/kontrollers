Kubernetes officially supports client libraries for Go, Python, Java, dotnet, Javascript, and Haskell. There are other client libraries that are provided and maintained by their authors, not the Kubernetes team. See client [libraries](https://kubernetes.io/docs/reference/using-api/client-libraries/) for accessing the API from other languages and how they authenticate.

1. Python client

    To use Python client, make sure you have the kubernetes library installed. To install it in your personal envrionment you can run the following command: `pip install kubernetes`. See [Python Client Library](https://github.com/kubernetes-client/python) page for more installation options.

    The Python client can use the same kubeconfig file as the kubectl CLI does to locate and authenticate to the API server. See this example:

    ```
    from kubernetes import client, config

    config.load_kube_config()

    v1=client.CoreV1Api()
    print("Listing pods with their IPs:")
    ret = v1.list_pod_for_all_namespaces(watch=False)
    for i in ret.items:
        print("%s\t%s\t%s" % (i.status.pod_ip, i.metadata.namespace, i.metadata.name))
    ```

2. Go client

    To get the library, run the following command: go get k8s.io/client-go@kubernetes-kubernetes-version-number See https://github.com/kubernetes/client-go/releases to see which versions are supported.

    Write an application atop of the client-go clients.

    Note: client-go defines its own API objects, so if needed, import API definitions from client-go rather than from the main repository. For example, import "k8s.io/client-go/kubernetes" is correct.

    The Go client can use the same kubeconfig file as the kubectl CLI does to locate and authenticate to the API server. See this example:

    ```
    package main

    import (
    "context"
    "fmt"
    "k8s.io/apimachinery/pkg/apis/meta/v1"
    "k8s.io/client-go/kubernetes"
    "k8s.io/client-go/tools/clientcmd"
    )

    func main() {
    // uses the current context in kubeconfig
    // path-to-kubeconfig -- for example, /root/.kube/config
    config, _ := clientcmd.BuildConfigFromFlags("", "<path-to-kubeconfig>")
    // creates the clientset
    clientset, _ := kubernetes.NewForConfig(config)
    // access the API to list pods
    pods, _ := clientset.CoreV1().Pods("").List(context.TODO(), v1.ListOptions{})
    fmt.Printf("There are %d pods in the cluster\n", len(pods.Items))
    }
    ```

If the application is deployed as a Pod in the cluster, see Accessing the API from within a Pod.

