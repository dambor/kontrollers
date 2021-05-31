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
