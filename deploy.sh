#!/bin/bash

# Change to true to debug with debugEnv
debug="false"
debugEnv=""
helpers=""

if [ "$debug" == "true" ]; then
# Below is a copy of env in drone container, just for run this shell alone to test
debugEnv=$(cat <<EOF
CI_COMMIT_BRANCH=refs/tags/v0.2.2-test
CI_TAG=v0.2.2-test
CI_REPO_LINK=https://gogs.com/notreal/repo
CI_PREV_COMMIT_AUTHOR_AVATAR=https://gogs.com/avatars/4
CI_REPO=/notreal/repo
DRONE_BUILD_STATUS=success
CI_SYSTEM_HOST=drone.dsmake.com
HOSTNAME=627a6bda21f5
DRONE_COMMIT_BRANCH=refs/tags/v0.2.2-test
DRONE_COMMIT_LINK=https://gogs.com/notreal/repo/src/v0.2.2-test
CI_SYSTEM=drone
CI_PREV_BUILD_LINK=https://gogs.com/notreal/repo/src/v0.2.2-test
DRONE_MACHINE=c644bc6ce6b8
CI_COMMIT_AUTHOR=hector
DRONE_REMOTE_URL=https://gogs.com/notreal/repo.git
DRONE_BUILD_CREATED=1532428586
CI_COMMIT_MESSAGE="created tag v0.2.2-test"
DRONE_REPO_OWNER=notreal
DRONE_JOB_STARTED=1532428587
CI_PREV_COMMIT_MESSAGE="created tag v0.2.2-test"
CI_PREV_BUILD_CREATED=1532425690
KUBERNETES_CERT=JUSTFORTESTUSUZJQ0FURS0tLS0tCk1JSUN5RENDQWJDZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRFNE1EVXhOREV4TWprd05Gb1hEVEk0TURVeE1URXhNamt3TkZvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBSlFYCnlUd2V1WHdWRWNERkkrQlJLbjQwR3o1RUpuMmRvdXF6SFREb2lva3A2YmRpejlDc1ljNE41TFloYkFLcWY4b2kKZXNrTXNBMFJiVG1lNHhNZmo0ZVdqdnB4V2pMd2VJS0loQ1F3dkVuTHJFd3JNRWR3bSt4VkJ6MDd1ckNZd2xzTgpsZDhjY2RuY2syQVlSODVFZWxROXJ5VHlMQXhTY3QxM2daQ0o3VVZPZ3haeVl4MEVURUJMdVU3c01oem5sQkJrCmZXa0w4dTdwSGIrcFZnT0wxTnd5N0FDQ0MyVUJpMGJRTjJYNzFlZzdXYnhvbDhGZThRN2hLbzdWM1ZOZjZBZGEKMlhUanl6cjBSNWxmaUE3ekhnbjlYemxxTlNWaWEvekhkS1BBRktnanYrdGxIOVZiK0RLRjJMOGZuckdlM3ZYTQp5bkpqeXN1T29kOGxvbHZTQ25VQ0F3RUFBYU1qTUNFd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0RRWUpLb1pJaHZjTkFRRUxCUUFEZ2dFQkFHY1BlYnByQWpkaktKc2xtZmlkSXUyQUd2bGYKVG5iT25MS3V1OFlZaDJtVUNpRE5NMmRseWgrMDNkTldPdS9EYkVSa1NWT09GeWQvSmhyaS9PSkRONDIxMHV5LwovZzdZeUZRbm15dnlJNmF5WmkxV05oWEN0Y3N1REpsMUY3TVl6Q3UyUkFoY0tWMktkaDZUYi8wUjErYzlCMTRiCmk3bW1IV3Y2YlJ2ZU9raW1Ka2pSWDhKQ3gxakZYVDdSTGVCalVJK2VETzJtdGpsOHE5ZmtLM2RmTnJiaklRb0gKVEpobFRLbHZ1cmU4SUxUeDFxU2VLNmpDamlxN25YN1kwR3NOMnVRekhJdERFL2tPamN6N3ZpaUhkUXJIdDVFZgp5VHZGYml6dzZPV1RyalJ2RmE5U2h3VTA0K1hLOVg4N25Memd3djdTYnZwWEVvdXhtRDliTm5rNmNjZz0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=
CI_NETRC_MACHINE=gogs.com
CI_PREV_COMMIT_REF=refs/tags/v0.2.2-test
CI=drone
DRONE_BUILD_NUMBER=2
CI_PREV_BUILD_EVENT=tag
DRONE=true
CI_PREV_BUILD_STATUS=success
DRONE_JOB_FINISHED=1532428747
CI_BUILD_STARTED=1532428587
DRONE_BUILD_STARTED=1532428587
DRONE_REPO_BRANCH=master
CI_PREV_BUILD_STARTED=1532425691
CI_PREV_BUILD_NUMBER=1
CI_BUILD_STATUS=success
CI_WORKSPACE=/go/src/gogs.com/notreal/repo
DRONE_REPO=/notreal/repo
CI_PREV_BUILD_FINISHED=1532425857
DRONE_NETRC_PASSWORD=x-oauth-basic
CI_BUILD_FINISHED=1532428747
PWD=/go/src/gogs.com/notreal/repo
DRONE_NETRC_USERNAME=7dbd409f2b9a14fcaacf7b5c3e19265fc950be0d
CI_PREV_COMMIT_BRANCH=refs/tags/v0.2.2-test
HOME=/root
DRONE_BUILD_EVENT=tag
CI_SYSTEM_ARCH=linux/amd64
DRONE_COMMIT_MESSAGE="created tag v0.2.2-test"
DRONE_REPO_NAME=group-act
CI_PREV_COMMIT_AUTHOR_NAME=hector
KUBERNETES_SERVER=https://192.168.50.122:6443
DRONE_PREV_BUILD_NUMBER=78
DRONE_REPO_SCM=git
DRONE_JOB_NUMBER=1
KUBERNETES_TOKEN=eyJhbGciOiJSUzI1NiIsImtpZCI6IiJ9.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJkZWZhdWx0Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6ImRlZmF1bHQtdG9rZW4tNng5cWsiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiZGVmYXVsdCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjFlMzEzNjBiLTU3NmEtMTFlOC1iMWM4LTgwYzE2ZTZmMTE4MCIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDpkZWZhdWx0OmRlZmF1bHQifQ.OYU3BcZhBsoOzwZyI3FY8ES9CpQyHuDudazfgEX-ljla9RB0vuBFNeLi9C6BP3VXqAWbEPinW0VG0CDPizUR6fbGlasNiv71NAm_cZn8feuw6-gRbXzRclGOlQ9ZK4SQ1DV_i7Fim4QVCILamWlccLDId6Y0qkjOf-yQb5YYoDleR-Zo5H_qTqZWVsYFM8cR3CojV5HQiMelE80-hsI-PO084BfepJA_6aIIGMnOfwc1vvYW3BskGxZJF1BlfDEvtY0t0_MX9fenz2e5oUxyC_QzwWrjyRQM_5s5uwllXChUDwbqpfxsPizIyOOKIorUxTV8UHJvtJan6r48FY3PDA
DRONE_REPO_LINK=https://gogs.com/notreal/repo
CI_JOB_FINISHED=1532428747
CI_NETRC_USERNAME=7dbd409f2b9a14fcaacf7b5c3e19265fc950be0d
CI_REPO_REMOTE=https://gogs.com/notreal/repo.git
CI_BUILD_NUMBER=79
DRONE_NETRC_MACHINE=gogs.com
CI_BUILD_CREATED=1532428586
CI_NETRC_PASSWORD=x-oauth-basic
PLUGIN_KUBERNETES_TEMPLATE=deployment.yaml
CI_BUILD_LINK=https://gogs.com/notreal/repo/src/v0.2.2-test
DRONE_ARCH=linux/amd64
CI_BUILD_EVENT=tag
DRONE_JOB_STATUS=success
DRONE_COMMIT_AUTHOR=hector
CI_PREV_COMMIT_AUTHOR=hector
CI_REMOTE_URL=https://gogs.com/notreal/repo.git
DRONE_TAG=v0.2.2-test
CI_SYSTEM_NAME=drone
PLUGIN_KUBERNETES_NAMESPACE=default
CI_COMMIT_AUTHOR_AVATAR=https://gogs.com/avatars/4
DRONE_WORKSPACE=/go/src/gogs.com/notreal/repo
DRONE_PREV_BUILD_STATUS=success
DRONE_REPO_PRIVATE=true
SHLVL=1
CI_COMMIT_REF=refs/tags/v0.2.2-test
CI_JOB_NUMBER=1
CI_REPO_NAME=/notreal/repo
DRONE_BUILD_FINISHED=1532428747
DRONE_COMMIT_AUTHOR_AVATAR=https://gogs.com/avatars/4
DRONE_COMMIT_REF=refs/tags/v0.2.2-test
CI_JOB_STARTED=1532428587
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
CI_COMMIT_AUTHOR_NAME=drone
CI_SYSTEM_LINK=http://ci.drone.com
DRONE_BRANCH=refs/tags/v0.2.2-test
DRONE_BUILD_LINK=http://ci.drone.com/notreal/repo/79
CI_JOB_STATUS=success
CI_REPO_PRIVATE=true
_=/usr/bin/env
EOF
)
  echo -e "debug env is:\n$debugEnv"
  eval "$debugEnv"
fi

# env

if [ -z ${PLUGIN_KUBERNETES_NAMESPACE} ]; then
  PLUGIN_KUBERNETES_NAMESPACE="default"
fi

if [ -z ${PLUGIN_KUBERNETES_USER} ]; then
  PLUGIN_KUBERNETES_USER="default"
fi

if [ ! -z ${PLUGIN_KUBERNETES_TOKEN} ]; then
  KUBERNETES_TOKEN=$PLUGIN_KUBERNETES_TOKEN
fi

if [ ! -z ${PLUGIN_KUBERNETES_SERVER} ]; then
  KUBERNETES_SERVER=$PLUGIN_KUBERNETES_SERVER
fi

if [ ! -z ${PLUGIN_KUBERNETES_CERT} ]; then
  KUBERNETES_CERT=${PLUGIN_KUBERNETES_CERT}
fi

if [ -z ${KUBERNETES_TOKEN} ]; then
  echo "Error: kubenetes token env is not set"
  exit 1
fi

if [ -z ${PLUGIN_KUBERNETES_TEMPLATE} ]; then
  echo "Error: kubenetes template env is not set"
  exit 1
fi

if [ ! -f "./${PLUGIN_KUBERNETES_TEMPLATE}" ]; then
  echo "Error: kubenetes template file is not found"
  exit 1
fi

# Debug with real Env
if [ ! -z ${PLUGIN_DEBUG} ]; then
  debug="true"
fi

# Load helper in helper file
if [ ! -z ${PLUGIN_HELPER_FILE} ]; then
helpers=`cat ./${PLUGIN_HELPER_FILE}`
fi

# You can add your own helper with PLUGIN_HELPER env, helper parameter also
config=$(cat <<EOF
$debugEnv
$PLUGIN_HELPER
$helpers
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
EOF
)

# Generate real yaml file from template file
templ=`cat ./${PLUGIN_KUBERNETES_TEMPLATE}`
echo -e "$config\ncat << EOF\n$templ\nEOF" | bash > ./drone-k8s-gen.yaml

# Just print the generated yaml file while debug is "true"
if [ "$debug" == "true" ]; then
  cat ./drone-k8s-gen.yaml
fi

# Apply the generated yaml file to kubernetes server while debug is not "true"
if [ "$debug" != "true" ]; then
  echo "Applying to $KUBERNETES_SERVER: "
  kubectl config set-credentials default --token=${KUBERNETES_TOKEN}
  if [ ! -z ${KUBERNETES_CERT} ]; then
    echo ${KUBERNETES_CERT} | base64 -d > ca.crt
    kubectl config set-cluster default --server=${KUBERNETES_SERVER} --certificate-authority=ca.crt
  else
    echo "WARNING: Using insecure connection to cluster"
    kubectl config set-cluster default --server=${KUBERNETES_SERVER} --insecure-skip-tls-verify=true
  fi

  kubectl config set-context default --cluster=default --user=${PLUGIN_KUBERNETES_USER}
  kubectl config use-context default

  kubectl version
  kubectl -n ${PLUGIN_KUBERNETES_NAMESPACE} apply -f ./drone-k8s-gen.yaml
fi