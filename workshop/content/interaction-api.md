Let's interact with the Kubernetes API. This introduces you to an alternate way to affect clusters that doesn't use kubectl. We're going to use curl to do some of the same things kubectl commands might do.

1. Accessing for the first time with kubectl
    
    When accessing the Kubernetes API for the first time, use the Kubernetes command-line tool, kubectl. Check the location and credentials that kubectl knows about with this command:

    ```execute
    kubectl config view
    ```

2. Directly accessing the REST API

    kubectl handles locating and authenticating to the API server. If you want to directly access the REST API with an http client like curl or wget, or a browser, there are multiple ways you can locate and authenticate against the API server:

    * Run kubectl in proxy mode (recommended). This method is recommended, since it uses the stored apiserver location and verifies the identity of the API server using a self-signed cert. No man-in-the-middle (MITM) attack is possible using this method.

    * Alternatively, you can provide the location and credentials directly to the http client. This works with client code that is confused by proxies. To protect against man in the middle attacks, you'll need to import a root cert into your browser.

    Using the Go or Python client libraries provides accessing kubectl in proxy mode.

3. Using kubectl proxy 
    
    The following command runs kubectl in a mode where it acts as a reverse proxy. It handles locating the API server and authenticating. Run it like this:
    
    ```execute-1
    kubectl proxy --port=8080 &
    ```

    Then you can explore the API with curl, wget, or a browser, like so:

    ```execute-2
    curl http://localhost:8080/api/ | jq
    ```

    4. Without kubectl proxy
    
    It is possible to avoid using kubectl proxy by passing an authentication token directly to the API server, like this Using jsonpath approach:

    ```execute-2
    APISERVER=$(kubectl config view --minify -o jsonpath='{.clusters[0].cluster.server}')

    TOKEN=$(kubectl get secret $(kubectl get serviceaccount default -o jsonpath='{.secrets[0].name}') -o jsonpath='{.data.token}' | base64 --decode )

    curl $APISERVER/api --header "Authorization: Bearer $TOKEN" --insecure | jq
    ```