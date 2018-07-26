# Kubernetes plugin for drone.io written in shell language

This plugin allows to update all Kubernetes resources, not only the deployment but anything within a yaml template file by using kubectl command

## Usage

This pipeline will update the resources of Kubernetes in the yaml file, which is generated from the template yaml file by bash, with `kubectl apply -f ./drone-k8s-gen.yaml` command.

In the template yaml file, you can just use variable substitution to replace whatever you want, you can even add your own template helper, and use it in the template.


```yaml
    pipeline:
        deploy:
            image: quay.io/honestbee/drone-kubernetes
            kubernetes_template: deployment.example.yaml
            kubernetes_namespace: default
            secrets: [kubernetes_server, kubernetes_cert, kubernetes_token]
```

## Helper example

Helper must replace the $ to \$ to avoid the variable substitution in the statement phase.

```shell
since(){
  local start=\$1
  local end=\$(date +%s)
  local duration=\$((\$end-\$start))
  local h=0
  local m=0
  local s=0
  if [ \$duration -gt 3600 ]; then
    h=\$((\$duration/3600))
    duration=\$((\$duration%3600))
  fi
  m=\$((\$duration/60))
  s=\$((\$duration%60))
  echo "\${h}h\${m}m\${s}s"
}
```

## Parameter reference

kubernetes_server
: Kubernetes API server URL.

kubernetes_cert
: Kubernetes API cert.

kubernetes_token
: Kubernetes service account token.

kubernetes_namespace
: Kubernetes namespace, default is 'default'

kubernetes_user
: Kubernetes user, default is 'default'

kubernetes_template
: Kubernetes template yaml file name, path in your repo

debug
: Turn into 'true' to debug the template generate and not to apply

helper
: Add your own shell healper here, pay attention to the syntax.

helper_file
: Add your own shell healper in the file, pay attention to the syntax.

Anything
: You can add anything you want to pass to the template file


## Required secrets

```bash
    drone secret add --image=honestbee/drone-kubernetes \
        your-user/your-repo KUBERNETES_SERVER https://mykubernetesapiserver

    drone secret add --image=honestbee/drone-kubernetes \
        your-user/your-repo KUBERNETES_CERT <base64 encoded CA.crt>

    drone secret add --image=honestbee/drone-kubernetes \
        your-user/your-repo KUBERNETES_TOKEN eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJrdWJ...
```

When using TLS Verification, ensure Server Certificate used by kubernetes API server 
is signed for SERVER url ( could be a reason for failures if using aliases of kubernetes cluster )

## How to get token
1. After deployment inspect you pod for name of (k8s) secret with **token** and **ca.crt**
```bash
kubectl describe po/[ your pod name ] | grep SecretName | grep token
```
(When you use **default service account**)

2. Get data from you (k8s) secret
```bash
kubectl get secret [ your default secret name ] -o yaml | egrep 'ca.crt:|token:'
```
3. Copy-paste contents of ca.crt into your drone's **KUBERNETES_CERT** secret
4. Decode base64 encoded token
```bash
echo [ your k8s base64 encoded token ] | base64 -d && echo''
```
5. Copy-paste decoded token into your drone's **KUBERNETES_TOKEN** secret

### RBAC

When using a version of kubernetes with RBAC (role-based access control)
enabled, you will not be able to use the default service account, since it does
not have access to update deployments.  Instead, you will need to create a
custom service account with the appropriate permissions (`Role` and `RoleBinding`, or `ClusterRole` and `ClusterRoleBinding` if you need access across namespaces using the same service account).

As an example (for the `web` namespace):

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: drone-deploy
  namespace: web

---

apiVersion: rbac.authorization.k8s.io/v1beta1
kind: Role
metadata:
  name: drone-deploy
  namespace: web
rules:
  - apiGroups: ["extensions"]
    resources: ["deployments"]
    verbs: ["get","list","patch","update"]

---

apiVersion: rbac.authorization.k8s.io/v1beta1
kind: RoleBinding
metadata:
  name: drone-deploy
  namespace: web
subjects:
  - kind: ServiceAccount
    name: drone-deploy
    namespace: web
roleRef:
  kind: Role
  name: drone-deploy
  apiGroup: rbac.authorization.k8s.io
```

Once the service account is created, you can extract the `ca.cert` and `token`
parameters as mentioned for the default service account above:

```
kubectl -n web get secrets
# Substitute XXXXX below with the correct one from the above command
kubectl -n web get secret/drone-deploy-token-XXXXX -o yaml | egrep 'ca.crt:|token:'
```

### Special thanks

Inspired by [drone-kubernetes](https://github.com/honestbee/drone-kubernetes).
