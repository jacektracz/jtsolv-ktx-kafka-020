#!/bin/bash
# https://127.0.0.1:10443/#/login
# eyJhbGciOiJSUzI1NiIsImtpZCI6ImJwTDZPenVSVEp2dU5aZ3F0c25vRXh4OXRDdkxzQVRXTC1jak82OFZNQ2sifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJtaWNyb2s4cy1kYXNoYm9hcmQtdG9rZW4iLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiZGVmYXVsdCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjIyYTYwOWMwLWRlNmQtNDE3ZS1iOTI4LTVjNTdkNmYzYTBlMyIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDprdWJlLXN5c3RlbTpkZWZhdWx0In0.YfQleAoiEtanYBsHFLnC2xzq9YbCGk1BawQ_8KwdEHQsXCayJCR0sAL6W0uPuc5vnM8X1WT7KoOkHUgJY5i5M5kbtPY_xoTCIys5y0I7JZ0wGWhlHCO3xC6z3tdZyxjI0B46PHWxUqAABPqI2RJQz0Xvp7hwGWU2916gMR13P_wXEZXpYa_-1nfM-Ro9I5-ihqilx6xK3gCDgGzrDmPavqVgu_AT6n1wM-EIWcq2e-FNAn_q4D0A6ImffOVS35GXbO20QsyUQwFRWiMcgYXPfPHiUDY7x38HNtPc1eEKBZaOTQaBhxINVxOYksCiVk2Ixmiq3eXNWr4GnWqUuos9iQ
# https://medium.com/@Shamimw/kafka-a-complete-tutorial-part-1-installing-kafka-server-without-zookeeper-kraft-mode-using-6fc60272457f

ROOT_SCRIPTS_SIR="/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm"

KAFKA_ROOT_BIN="/lkd/srv/kafka_2.12-3.9.0/bin"

function apply_microk8s () {
    local FILE_YAML=$1
    echo "sudo microk8s kubectl apply -f $ROOT_SCRIPTS_SIR/$FILE_YAML"
    sudo microk8s kubectl apply -f "$ROOT_SCRIPTS_SIR"/"$FILE_YAML"
}

function apply_namespace () {
    sudo microk8s kubectl create namespace kafka-xff-nm
}

function create_pvs(){
    sudo mkdir /lkd/srv/mnt/kafka-xff-pv-storage
    sudo chmod 777 /lkd/srv/mnt/kafka-xff-pv-storage
}

function delete_all(){
    sudo microk8s kubectl delete namespace kafka-xff-nm-11
}

function enable_dashboard() {

sudo microk8s dashboard-proxy

#Token:
#eyJhbGciOiJSUzI1NiIsImtpZCI6ImJwTDZPenVSVEp2dU5aZ3F0c25vRXh4OXRDdkxzQVRXTC1jak82OFZNQ2sifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJtaWNyb2s4cy1kYXNoYm9hcmQtdG9rZW4iLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiZGVmYXVsdCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjIyYTYwOWMwLWRlNmQtNDE3ZS1iOTI4LTVjNTdkNmYzYTBlMyIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDprdWJlLXN5c3RlbTpkZWZhdWx0In0.YfQleAoiEtanYBsHFLnC2xzq9YbCGk1BawQ_8KwdEHQsXCayJCR0sAL6W0uPuc5vnM8X1WT7KoOkHUgJY5i5M5kbtPY_xoTCIys5y0I7JZ0wGWhlHCO3xC6z3tdZyxjI0B46PHWxUqAABPqI2RJQz0Xvp7hwGWU2916gMR13P_wXEZXpYa_-1nfM-Ro9I5-ihqilx6xK3gCDgGzrDmPavqVgu_AT6n1wM-EIWcq2e-FNAn_q4D0A6ImffOVS35GXbO20QsyUQwFRWiMcgYXPfPHiUDY7x38HNtPc1eEKBZaOTQaBhxINVxOYksCiVk2Ixmiq3eXNWr4GnWqUuos9iQ

#url:
#https://127.0.0.1:10443/#/login  

}

function exec_all() {
    cd "$ROOT_SCRIPTS_SIR"        
    apply_microk8s "item-001--001-namespace.yaml"
    apply_microk8s "item-001-002-kafka-storage-class.yaml"
    apply_microk8s "item-003-001-pv-kafka.yaml"
    apply_microk8s "item-004-001--pvc-kafka.yaml"
    apply_microk8s "item-005-001--zookeeper-deployment.yaml"
    apply_microk8s "item-006-001--kafka-stateful-set.yaml"
    apply_microk8s "item-007-001--kafka-service.yaml"
    apply_microk8s "item-008-001--kafka-load-balancer.yaml"
    apply_microk8s "item-009-001--kafka-headless-service.yaml"
    apply_microk8s "item-010-001--kafka-node-port.yaml"

}



function exec_one() {
    cd "$ROOT_SCRIPTS_SIR"            
    apply_microk8s "item-001-002-kafka-storage-class.yaml"
    apply_microk8s "item-003-001-pv-kafka.yaml"
    apply_microk8s "item-004-001--pvc-kafka.yaml"

    apply_microk8s "item-006-001--kafka-stateful-set.yaml"
    
    apply_microk8s "item-009-001--kafka-headless-service.yaml"

    apply_microk8s "item-007-001--kafka-service.yaml"

    apply_microk8s "item-008-001--kafka-load-balancer.yaml"

    apply_microk8s "item-011-01-metallb.yaml"
    apply_microk8s "item-012-01-node-port.yaml"
    #apply_microk8s "item-010-001--kafka-node-port.yaml"
}

function create_dirs() {
    cd "$ROOT_SCRIPTS_SIR"
    sudo mkdir /var/lib/kafka-xff-pv-storage/
    sudo chmod 777 /var/lib/kafka-xff-pv-storage/

    sudo mkdir /var/lib/kafka-xff-pv-storage/data
    sudo chmod 777 /var/lib/kafka-xff-pv-storage/data

    sudo mkdir /lkd/srv/mnt/kafka-xff-pv-storage
    sudo chmod 777 /lkd/srv/mnt/kafka-xff-pv-storage

    sudo mkdir /lkd/srv/mnt/kafka-xff-pv-storage/data
    sudo chmod 777 /lkd/srv/mnt/kafka-xff-pv-storage/data

    
}

function create_topic() {
    PORT_LST=$1
    "$KAFKA_ROOT_BIN"/kafka-topics.sh \
    --create \
    --topic test-topic \
    --bootstrap-server "$PORT_LST" \
    --partitions 3 \
    --replication-factor 1

}

function send_to_topic() {
    seq 1 10 | "$KAFKA_ROOT_BIN"/kafka-console-producer.sh \
    --broker-list 192.168.55.103:30092 \
    --topic test-topic
}

function send_to_topic_by_lb() {
    seq 1 10 | "$KAFKA_ROOT_BIN"/kafka-console-producer.sh \    
    --broker-list 192.168.55.209:10074\
    --topic test-topic
}

function read_from_topic() {
    "$KAFKA_ROOT_BIN"/kafka-console-consumer.sh \
    --bootstrap-server 192.168.55.103:30092 \
    --topic test-topic \
    --from-beginning
}

function create_listeners() {
    KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://192.168.55.103:9092
    value: "PLAINTEXT://kafka-xff-headless-service.kafka-xff-nm.svc.cluster.local:9092"
}


function get_metallb_config(){
    PREFIX_XFF=$1
    cd "$ROOT_SCRIPTS_SIR"        
    sudo chmod 777 "$ROOT_SCRIPTS_SIR"
    sudo microk8s kubectl get configmap config -n metallb-system -o yaml 
    #> metallb-config-xff-"$PREFIX_XFF".yaml
}

function delete_lb () {
    echo ""
    #sudo microk8s kubectl delete svc kafka-xff-lb-to-listeners -n kafka-xff-nm
    #sudo microk8s kubectl apply -f your-kafka-loadbalancer-service.yaml
}

function get_endpoints () {

    sudo microk8s kubectl get endpoints -A
}
function resolve_ports() {
    sudo microk8s kubectl run testpod --image=busybox:1.28 -it --rm --restart=Never -- /bin/sh
    nslookup kafka-xff-headless-service.kafka-xff-nm.svc.cluster.local

}
function create_topic_inside_cluster() {
    kafka-topics.sh --bootstrap-server kafka-nodeport.kafka.svc.cluster.local:9092 \
    --create --topic test-topic --partitions 1 --replication-factor 1
}
function exec_test_image() {
    sudo microk8s kubectl run kafka-client --restart=Never -it \
    --image=bitnami/kafka:latest --namespace=kafka-xff-nm -- bash
}

function check_metallb_ports() {
    sudo microk8s kubectl get svc -A -o wide | grep LoadBalancer
}

function find_conn() {
    sudo microk8s kubectl get nodes -o wide
    sudo microk8s kubectl get svc kafka-xff-nodeport -n kafka-xff-nm

    #lenovo@lenovo-ThinkPad-T460p:/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm$ 
    #sudo microk8s kubectl get nodes -o wide

    #NAME                    STATUS   ROLES    AGE    VERSION   INTERNAL-IP      EXTERNAL-IP   OS-IMAGE          KERNEL-VERSION      CONTAINER-RUNTIME
    #lenovo-thinkpad-t460p   Ready    <none>   214d   v1.32.3   192.168.55.103   <none>        Linux Mint 21.3   5.15.0-92-generic   containerd://1.6.36
    #lenovo@lenovo-ThinkPad-T460p:/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm$ 

    #sudo microk8s kubectl get svc kafka-xff-nodeport -n kafka-xff-nm

    #NAME                 TYPE       CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
    #kafka-xff-nodeport   NodePort   10.152.183.120   <none>        9092:30092/TCP   114m

    #lenovo@lenovo-ThinkPad-T460p:/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm$ 
    #NODE_OP:192.168.55.103
    #NODE_PORT : 30092

#env:
#  - name: KAFKA_CFG_LISTENERS
#    value: PLAINTEXT://:9092
#  - name: KAFKA_CFG_ADVERTISED_LISTENERS
#    value: PLAINTEXT://<NODE_IP>:<NODE_PORT>
#  - name: KAFKA_CFG_LISTENER_SECURITY_PROTOCOL_MAP
#    value: PLAINTEXT:PLAINTEXT

#env:
#  - name: KAFKA_LISTENER_SECURITY_PROTOCOL_MAP
#    value: INTERNAL:PLAINTEXT,EXTERNAL:PLAINTEXT
#  - name: KAFKA_LISTENERS
#    value: INTERNAL://:9092,EXTERNAL://:9094
#  - name: KAFKA_ADVERTISED_LISTENERS
#    value: INTERNAL://kafka-0.kafka-headless.kafka.svc.cluster.local:9092,EXTERNAL://192.168.1.100:30092

# cd /lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm/
}


function restart_metallb_safe() {
    sudo microk8s kubectl -n metallb-system rollout restart deployment controller
    sudo microk8s kubectl -n metallb-system rollout restart daemonset speaker
}

function restart_metallb_by_delete_pods() {
    sudo microk8s kubectl -n metallb-system delete pod -l app=metallb
}

function delete_lb() {
    sudo microk8s kubectl delete -n kafka-xff-nm service kafka-xff-lb-to-listeners
}

function disable_enable_lb() {
    sudo microk8s disable metallb
    sudo microk8s enable metallb:192.168.55.200-192.168.55.250
}


function apply_mysql(){
    apply_microk8s "00-001-namespace.yaml"
    apply_microk8s "00-010-mysql-secret.yaml"
    apply_microk8s "00-030-mysql-storage-class.yaml"
    apply_microk8s "00-040-mysql-pv.yaml"
    apply_microk8s "00-050-mysql-pvc.yaml"
    apply_microk8s "00-060-mysql-deployment.yaml"
    apply_microk8s "00-070-mysql-service-internal.yaml"
    apply_microk8s "44-mysql-load-balancer.yaml"

}

function list_files () {
    cd $1
    for file in *; do
        echo "apply_microk8s \"$file\""
    done
}

function create_dirs_item() {
    dir_item=$1
    sudo mkdir "$dir_item"
    sudo chmod 777 "$dir_item"
    ls "$dir_item"
}

function create_dirs_mysql() {
    cd "$ROOT_SCRIPTS_SIR"
    sudo mkdir /var/lib/mysql-xffm-pv-storage/
    sudo chmod 777 /var/lib/mysql-xffm-pv-storage/

    sudo mkdir /var/lib/mysql-xffm-storage/data
    sudo chmod 777 /var/lib/mysql-xffm-pv-storage/data

    sudo mkdir /lkd/srv/mnt/mysql-xffm-pv-storage
    sudo chmod 777 /lkd/srv/mnt/mysql-xffm-pv-storage
    ls /lkd/srv/mnt/mysql-xffm-pv-storage
    sudo mkdir /lkd/srv/mnt/mysql-xffm-pv-storage/data
    sudo chmod 777 /lkd/srv/mnt/mysql-xffm-pv-storage/data
    
}

function display_mysql_endpoints() {

echo ""
echo ""
echo "ENDPOINT--1:"
echo "mysql-xffm-sql-loadbalancer"
echo "LoadBalancer"
echo "10.152.183.208"
echo "mysql-xffm-sql-loadbalancer.mysql-xffm-nm:63306 TCP"
echo "mysql-xffm-sql-loadbalancer.mysql-xffm-nm:31666 TCP"
echo "192.168.55.216:63306 "

echo "connection by :k8s-mysql-xffm-192.168.55.216:63306 through 192.168.55.216:63306"
echo "only external connection by ip enabled"

echo ""
echo ""
echo "ENDPOINT--2:"

echo "mysql-xffm-sql-service-internal"
echo "ClusterIP"
echo "10.152.183.186"
echo "mysql-xffm-sql-service-internal.mysql-xffm-nm:3306 TCP"
echo "mysql-xffm-sql-service-internal.mysql-xffm-nm:0 TCP"
echo "-"

}
exec_type=""

while getopts ":t:p:" opt; do
  case ${opt} in
    t ) exec_type=$OPTARG;;
    p ) password=$OPTARG;;
    \? ) echo "Usage: cmd [-u] [-p]";;
  esac
done

exe_type=1
if test $exec_type == "all"
then
    create_dirs
    apply_namespace
    create_pvs
    exec_one
fi

if test $exec_type == "get-metallb-config"
then
    get_metallb_config
fi

if test $exec_type == "deploy-metallb"
then
    #apply_microk8s "item-011-02-metallb.yaml"
    #apply_microk8s "item-011-03-metallb.yaml"
    apply_microk8s "item-011-04-metallb.yaml"
fi

if test $exec_type == "create-lb"
then
    apply_microk8s "item-008-001--kafka-load-balancer.yaml"
fi

if test $exec_type == "create-np"
then
    apply_microk8s "item-012-01-node-port.yaml"
fi

if test $exec_type == "create-topic"
then
    #PORT_LST="kafka-xff-headless-service.kafka-xff-nm.svc.cluster.local:9092"
    PORT_LST="192.168.55.103:30092"
    #PORT_LST="10.1.34.157:9092"
    #30092
    #PORT_LST="192.168.55.103:9092"
    echo "port: $PORT_LST"
    create_topic "$PORT_LST"
fi

if test $exec_type == "create-sts"
then

    apply_microk8s "item-006-001--kafka-stateful-set.yaml"
fi

if test $exec_type == "get-endpoints"
then

    get_endpoints 
fi

if test $exec_type == "create-image"
then

    exec_test_image
fi

if test $exec_type == "send-to-topic"
then
    send_to_topic 100
fi


if test $exec_type == "read-from-topic"
then
    read_from_topic
fi

if test $exec_type == "check-metallb-ports"
then
    check_metallb_ports
fi

if test $exec_type == "restart_metallb_safe"
then
    restart_metallb_safe
fi

if test $exec_type == "restart_metallb_by_delete_pods"
then
    restart_metallb_by_delete_pods
fi

if test $exec_type == "delete_lb"
then
    delete_lb
fi


if test $exec_type == "disable_enable_lb"
then
    disable_enable_lb
fi


if test $exec_type == "send_to_topic_by_lb"
then
    send_to_topic_by_lb
fi

ROOT_WORK_DIR="/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm"
if test $exec_type == "list_files"
then

    list_files "$ROOT_WORK_DIR"
fi    

if test $exec_type == "create_dirs_mysql"
then

    create_dirs_mysql
fi      


if test $exec_type == "apply_mysql"
then

    apply_mysql
fi      

if test $exec_type == "display_mysql_endpoints"
then
    display_mysql_endpoints
fi      

# chmod 777 "$ROOT_SCRIPTS_SIR"act.sh
# chmod 777 /lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm/act.sh

#/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm/act.sh -t display_mysql_endpoints
#/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm/act.sh -t apply_mysql

#/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm/act.sh -t create_dirs_mysql
#/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm/act.sh -t list_files

#/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm/act.sh -t send_to_topic_by_lb
#/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm/act.sh -t disable_enable_lb
#/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm/act.sh -t restart_metallb_by_delete_pods
#/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm/act.sh -t delete_lb

#/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm/act.sh -t restart_metallb_safe

#/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm/act.sh -t check-metallb-ports

#/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm/act.sh -t deploy-metallb
#/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm/act.sh -t ports
#/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm/act.sh -t get-metallb-config
#/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm/act.sh -t create-lb
#/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm/act.sh -t create-np
#/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm/act.sh -t create-topic
#/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm/act.sh -t create-sts
#/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm/act.sh -t get-endpoints
#/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm/act.sh -t create-image
#/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm/act.sh -t send-to-topic
#/lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm/act.sh -t read-from-topic

#192.168.55.1 - 192.168.55.254


#cd /lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps-latest/mysql-xffm/

#ls -p | grep -v /
#ls -1 | sed 's/^/PREFIX_/'
