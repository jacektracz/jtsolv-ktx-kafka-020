#!/bin/bash
#shell-function
function install_docker(){
    sudo apt install curl docker.io
}


function install_k8s(){
    # install microk8s on linux
    # install-microk8s-on-linux
    sudo snap install microk8s --classic
}

function check_k8s_status(){
    microk8s status --wait-ready
}

function apply_k8s_dashboard_user(){

    sudo microk8s kubectl apply -f /lkd/2024-apps-python-tools/app/git-repo/src-linux-scripts/k8s-linux-scripts/yamls/dashboard-adminuser.yaml
}

function fun_micrk8s_enable_dashboard() {

    sudo microk8s enable dashboard

}

function fun_microk8s_get_token(){

    token=$(sudo microk8s kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)    
    sudo microk8s kubectl -n kube-system describe secret $token

    dashboard_token=$(sudo microk8s kubectl -n kube-system get secret | grep microk8s-dashboard-token | cut -d " " -f1)
    
    sudo microk8s kubectl -n kube-system describe secret microk8s-dashboard-token

}

function fun_micrk8s_access_dashboard() {
    echo 'https://10.152.183.139:443'

}
function fun_microk8s_comment_token() {

        #enovo@lenovo-ThinkPad-T460p:~$ sudo microk8s kubectl -n kube-system describe secret microk8s-dashboard-token
        #Name:         microk8s-dashboard-token
        #Namespace:    kube-system
        #Labels:       <none>
        #Annotations:  kubernetes.io/service-account.name: default
        #            kubernetes.io/service-account.uid: 22a609c0-de6d-417e-b928-5c57d6f3a0e3

        #Type:  kubernetes.io/service-account-token

        #Data
        #====
        #ca.crt:     1123 bytes
        #namespace:  11 bytes
        #token:      eyJhbGciOiJSUzI1NiIsImtpZCI6ImJwTDZPenVSVEp2dU5aZ3F0c25vRXh4OXRDdkxzQVRXTC1jak82OFZNQ2sifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJtaWNyb2s4cy1kYXNoYm9hcmQtdG9rZW4iLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiZGVmYXVsdCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjIyYTYwOWMwLWRlNmQtNDE3ZS1iOTI4LTVjNTdkNmYzYTBlMyIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDprdWJlLXN5c3RlbTpkZWZhdWx0In0.YfQleAoiEtanYBsHFLnC2xzq9YbCGk1BawQ_8KwdEHQsXCayJCR0sAL6W0uPuc5vnM8X1WT7KoOkHUgJY5i5M5kbtPY_xoTCIys5y0I7JZ0wGWhlHCO3xC6z3tdZyxjI0B46PHWxUqAABPqI2RJQz0Xvp7hwGWU2916gMR13P_wXEZXpYa_-1nfM-Ro9I5-ihqilx6xK3gCDgGzrDmPavqVgu_AT6n1wM-EIWcq2e-FNAn_q4D0A6ImffOVS35GXbO20QsyUQwFRWiMcgYXPfPHiUDY7x38HNtPc1eEKBZaOTQaBhxINVxOYksCiVk2Ixmiq3eXNWr4GnWqUuos9iQ
}

exec_type=""

while getopts ":t:p:" opt; do
  case ${opt} in
    t ) exec_type=$OPTARG;;
    p ) password=$OPTARG;;
    \? ) echo "Usage: cmd [-u] [-p]";;
  esac
done

if [ -z "$exec_type" ] ; then
  echo "Type are required."
  exit 1
fi

if test "$exec_type" == "k8s_user" 
then
  echo "execute k8s_user"
  apply_k8s_dashboard_user
else
  echo "not-exec k8s_user"
fi

# sudo chmod 777 /lkd/2024-apps-python-tools/app/git-repo/src-linux-scripts/k8s-linux-scripts/0-k8s-scripts.sh
# /lkd/2024-apps-python-tools/app/git-repo/src-linux-scripts/k8s-linux-scripts/0-k8s-scripts.sh -t k8s_user