
#!/bin/bash
#shell-function

VAR_KAFKA_ROOT=/lkd/srv/kafka_2.12-3.9.0/

# ######################################################################
#
#
# ######################################################################


function fun_restart_broker_id() {
  sudo mv /lkd/srv/kafka-log/tmp/kafka-logs/meta.properties /lkd/srv/kafka-log/tmp/kafka-logs/meta.properties.b5
  sudo mv /lkd/srv/kafka-log/tmp/kafka-logs/ /lkd/srv/kafka-log/tmp/kafka-logs-backup-3/
  sudo mkdir /lkd/srv/kafka-log/tmp/kafka-logs/ 
}


# ######################################################################
#
#
# ######################################################################


function fun_kafka_zookeeper_start() {

    cd "$VAR_KAFKA_ROOT"/lkd/srv/kafka_2.12-3.9.0/
    sudo "$VAR_KAFKA_ROOT"/bin/zookeeper-server-start.sh -daemon "$VAR_KAFKA_ROOT"/config/zookeeper.properties    

    # -- zookeeper start  with daemon
    #sudo /lkd/srv/kafka_2.12-3.9.0/bin/zookeeper-server-start.sh -daemon /lkd/srv/kafka_2.12-3.9.0/config/zookeeper.properties 

    # -- zookeeper start without daemon
    # sudo /lkd/srv/kafka_2.12-3.9.0/bin/zookeeper-server-start.sh /lkd/srv/kafka_2.12-3.9.0/config/zookeeper.properties 

}


# ######################################################################
#
#
# ######################################################################


function fun_kafka_server_start() {

    cd "$VAR_KAFKA_ROOT"/lkd/srv/kafka_2.12-3.9.0/
    sudo "$VAR_KAFKA_ROOT"bin/kafka-server-start.sh -daemon "$VAR_KAFKA_ROOT"/config/server.properties

    # -- kafka serevr start with daemon
    # sudo /lkd/srv/kafka_2.12-3.9.0/bin/kafka-server-start.sh -daemon /lkd/srv/kafka_2.12-3.9.0/config/server.properties

    # -- kafka serevr start without daemon
    # sudo /lkd/srv/kafka_2.12-3.9.0/bin/kafka-server-start.sh /lkd/srv/kafka_2.12-3.9.0/config/server.properties
}



# ######################################################################
#
#
# ######################################################################


function fun_kafka_create_topic() {

    sudo /lkd/srv/kafka_2.12-3.9.0/bin/kafka-topics.sh --create --topic t-1 --bootstrap-server localhost:9092 --partitions 5 --replication-factor 1
    # jtsolv-test-001
}


# ######################################################################
#
#
# ######################################################################


function fun_kafka_consumer() {    

    sudo /lkd/srv/kafka_2.12-3.9.0/bin/kafka-console-consumer.sh --topic jtsolv-test-topic-2 --from-beginning --bootstrap-server localhost:9092
}


# ######################################################################
#
#
# ######################################################################


function fun_kafka_producer() {
    sudo /lkd/srv/kafka_2.12-3.9.0/bin/kafka-console-producer.sh --topic jtsolv-test-001 --bootstrap-server localhost:9092    
}


# ######################################################################
#
#
# ######################################################################


function fun_kafka_topics_list() {
  #novo@lenovo-ThinkPad-T460p:

  #cd /lkd/srv/kafka_2.12-3.9.0$/bin 
  sudo ./kafka-topics.sh --list --bootstrap-server localhost:9092

}

# ######################################################################
#
#
# ######################################################################


function fun_add_partition(){

  echo "start"

  #kafka-topics.sh --describe --topic par-topic-name --bootstrap-server par-broker-host:<broker-port>
  #kafka-topics.sh --alter --topic par-topic-name --partitions <new-partition-count> --bootstrap-server par-broker-host:<broker-port>
  #kafka-topics.sh --alter --topic my_topic --partitions 5 --bootstrap-server localhost:9092

  #sudo /lkd/srv/kafka_2.12-3.9.0/bin/kafka-topics.sh --alter --topic t-1 --partitions 5 --bootstrap-server localhost:9092

  #kafka-topics.sh --describe --topic par-topic-name --bootstrap-server par-broker-host:<broker-port>

}

# ######################################################################
#
#
# ######################################################################


function fun_kafka_commands() {

    cd /lkd/srv/kafka_2.12-3.9.0/
    kafka-topics.sh --list --bootstrap-server localhost:9092
    
    #run Java class

    # ConsumerOffsetCheck. run when Kafka server is up, there is a topic + messages produced and consumed
    bin/kafka-run-class.sh kafka.tools.ConsumerOffsetChecker --broker-info --zookeeper localhost:2181 --group test-consumer-group
    # ConsumerOffsetChecker has been removed in Kafka 1.0.0. Use kafka-consumer-groups.sh to get consumer group details
    bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group consule-consumer-38063
      # bootstrap-server=kafka broker server to connect to, NOT zookeeper
      # --describe => describe consumer group and list offset lag (# messages not yet processed)

    # get a list of active consumer groups in cluster
    bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092 --list

    #get latest offset
    bin/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic test --time -1 --offsets 1

    # offset of last available message in topic's partition --time -1
    bin/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic test --time -1

    # offset of first available message in topic's partition --time -2
    bin/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic test --time -2


    # start zookeeper
    bin/zookeeper-server-start.sh config/zookeeper.properties  

    # start zookeeper
    bin/zookeeper-server-start.sh config/zookeeper.properties

    # start kafka brokers (Servers = cluster)
    bin/kafka-server-start.sh config/server.properties

    # create a topic
    bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test

    # list all topic
    bin/kafka-topics.sh --list --zookeeper localhost:2181

    # configure brokers to auto-create topics when a non-existent topic is published to

    # see topic details (partition, replication factor)
    bin/kafka-topics.sh --describe --zookeeper localhost:2181 --topic test

    # change partition number of a topic --alter
    # Note: While Kafka allows us to add more partitions, it is NOT possible to decrease number of partitions of a Topic. 
    # In order to achieve this, you need to delete and re-create your Topic.
    bin/kafka-topics.sh --alter --zookeeper localhost:2181 --topic test --partitions 3

    # PRODUCER -----------------------------------
    bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test

    # CONSUMER -----------
    bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --from-beginning --topic test
    # removed --from-beginning => consumer only gets message that is produced after it is up
    bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test

    #Kafka CONNECT-----------------------------
    # 2 stand-alone connectors (run in a single,local,dedicated process)
    bin/connect-standalone.sh \ 
      config/connect-standalone.properties \
      config/connect-file-source.properties \
      config/connect-file-sink.properties


}

# ######################################################################
#
#
# ######################################################################



function start_kafdrop(){

  cd /lkd/2024-kafdrop/app/kafdrop/


  #/usr/lib/jvm/java-21-openjdk-amd64/bin/java

  ## go to localhost:9000

  #Once started, you can open Kafdrop in your browser by navigating to localhost:9000⁵. You’ll be
  #presented with a Kafdrop cluster overview screen, showing our fresh, single-node Kafka cluster.  

  sudo java -jar /lkd/2024-kafdrop/app/kafdrop/target/kafdrop-4.1.1-SNAPSHOT.jar --kafka.brokerConnect=localhost:9092

  sudo java -jar /lkd/2024-kafdrop/app/kafdrop/target/kafdrop-4.1.1-SNAPSHOT.jar --kafka.brokerConnect=192.168.55.104:9092

}

function env_kafdrop_java_version() {

  echo "start"

  #lenovo@lenovo-ThinkPad-T460p:/lkd/2024-jtsolvcu/apps/jtsolvcu$ 

  #sudo update-alternatives --config java

  #There are 4 choices for the alternative java (providing /usr/bin/java).

  # Selection    Path                                            Priority   Status
  #------------------------------------------------------------
  #  0            /usr/lib/jvm/java-21-openjdk-amd64/bin/java      2111      auto mode
  #  1            /usr/lib/jvm/java-11-openjdk-amd64/bin/java      1111      manual mode
  #  2            /usr/lib/jvm/java-17-openjdk-amd64/bin/java      1711      manual mode
  #* 3            /usr/lib/jvm/java-21-openjdk-amd64/bin/java      2111      manual mode
  #  4            /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java   1081      manual mode

  #  Press <enter> to keep the current choice[*], or type selection number: 


}

function edit_broker_id() {
  sudo vi /lkd/srv/kafka-log/tmp/kafka-logs/meta.properties
  sudo mv /lkd/srv/kafka-log/tmp/kafka-logs/meta.properties /lkd/srv/kafka-log/tmp/kafka-logs/meta.backup
  sudo cat /lkd/srv/kafka-log/tmp/kafka-logs/meta.properties
  # EFUZisXHTYKNK5WI1bRa5Q,
}

# ######################################################################################
#
#   Install confluent platform by docker compose
#
#
# ######################################################################################

function fun_kafka_confluence_install_onto_linux_locally_by_docker_compose() {
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get update
    sudo apt-get install -y docker-ce
    sudo systemctl enable docker
    sudo systemctl start docker


    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose


    mkdir confluent-platform

    cd confluent-platform

    curl -O https://raw.githubusercontent.com/confluentinc/cp-all-in-one/7.0.1-post/cp-all-in-one/docker-compose.yml
    docker-compose up -d


    docker-compose logs -f

    docker-compose exec kafka kafka-topics --create --topic test-topic --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1


    docker-compose exec kafka kafka-console-consumer --topic test-topic --bootstrap-server localhost:9092 --from-beginning

}

# ######################################################################################
#
#   Install confluent platform by download and start platform
#
#
# ######################################################################################


function fun_kafka_confluence_install_onto_linux_locally_by_platform() {

  ssh lenovo@192.168.55.104

  sudo apt-get update

  sudo apt-get install openjdk-8-jdk

  java -version

  wget https://packages.confluent.io/archive/7.0/confluent-community-7.0.1-2.12.tar.gz
  tar -xvzf confluent-community-7.0.1-2.12.tar.gz

  cd confluent-community-7.0.1

  # Installed onto /lkd/srv/cf
  cd /lkd/srv/cf

  cd /lkd/srv/confluent-platform

  # Start Zookeeper
  sudo bin/zookeeper-server-start etc/kafka/zookeeper.properties

  # Start Kafka:
  export KAFKA_OPTS="-Djava.security.auth.login.config=/lkd/srv/confluent-platform/etc/kafka/jaas.conf"
  sudo bin/kafka-server-start etc/kafka/server.properties -Djava.security.auth.login.config=/lkd/srv/confluent-platform/etc/kafka/jaas.conf

  #Start Kafka Connect (optional):
  bin/connect-distributed etc/kafka/connect-distributed.properties

  # Start Schema Registry (optional):
  bin/schema-registry-start etc/schema-registry/schema-registry.properties

  #Start ksqlDB (optional):
  bin/ksql-server-start etc/ksql/ksql-server.properties

  cd /lkd/srv/cf
  # Start Control Center (optional):
  bin/control-center-start etc/confluent-control-center/control-center.properties


  #5. Verify the Installation

  # Once all the components are running, you can verify their status:

  #Kafka: By producing and consuming messages, as described in the Docker Compose setup.
  #Control Center: Access it via a browser at http://localhost:9021.
  #Schema Registry: Access it via http://localhost:8081.

  #http://localhost:9021

  #http://192.168.55.104:9021
}

# ######################################################################
#
#
# ######################################################################


function fun_run_kafka_environment_by_docker_compose() {

  cd /lkd/2024-kafka-streams/app/mastering-kafka-streams-and-ksqldb/chapter-10

  sudo docker-compose up;

  sudo docker-compose exec ksqldb-cli ksql http://ksqldb-server:8088




  sudo mkdir /lkd/srv/kafka-streams-docker-compose-09

  sudo cp -R /lkd/2024-kafka-streams/app/mastering-kafka-streams-and-ksqldb/chapter-09 /lkd/srv/kafka-streams-docker-compose-09

  sudo mkdir /lkd/srv/kafka-streams-docker-compose-10

  cp -R /lkd/2024-kafka-streams/app/mastering-kafka-streams-and-ksqldb/chapter-10 /lkd/srv/kafka-streams-docker-compose-10

  sudo mkdir /lkd/srv/kafka-streams-docker-compose-11

  sudo cp -R /lkd/2024-kafka-streams/app/mastering-kafka-streams-and-ksqldb/chapter-11 /lkd/srv/kafka-streams-docker-compose-11

  sudo mkdir /lkd/srv/kafka-streams-docker-compose-12

  sudo cp -R /lkd/2024-kafka-streams/app/mastering-kafka-streams-and-ksqldb/chapter-12 /lkd/srv/kafka-streams-docker-compose-12


  cd /lkd/srv/kafka-streams-docker-compose-10/chapter-10

  sudo docker-compose up;

  # is running

  sudo cp -R /lkd/srv/kafka-streams-docker-compose-11 /lkd/2024-apps-python-tools/app/git-repo/src-linux-scripts/kafka-environments

  sudo cp -R /lkd/srv/kafka-streams-docker-compose-10 /lkd/2024-apps-python-tools/app/git-repo/src-linux-scripts/kafka-environments


  # ---------------------------------------------------------

    cd /lkd/2024-kafka-avro-jtsolv/app/2024-jtsolv-kafka-avro

    sudo docker-compose up --remove-orphans;

    http://localhost:9021/clusters

    http://localhost:8181/create-events?id=2&topic=t-1

    sudo mkdir /lkd/srv/kafka-avro-docker-compose
    
    cp -R  /lkd/2024-kafka-avro-jtsolv/app/2024-jtsolv-kafka-avro /lkd/srv/kafka-avro-docker-compose
}


# #################################################################################
#
#       MATI tutorial start
#
# #################################################################################


function create_kafka_streams_environment_by_mati() {

  sudo mkdir /lkd/srv/kafka-streams-docker-compose-mati-01
  sudo cp -R /lkd/2024-kafka-streams-mati/app/ksql-connect-tutorial/ /lkd/srv/kafka-streams-docker-compose-mati-01


  ls /lkd/srv/kafka-streams-docker-compose-mati-01


  sudo cp -R /lkd/srv/kafka-streams-docker-compose-mati-01/ksql-connect-tutorial /lkd/2024-apps-python-tools/app/git-repo/src-linux-scripts/kafka-environments
}


# ######################################################################
#
#
# ######################################################################



function execute_tutorial_mati_ksqldb () {

  cd /lkd/srv/kafka-streams-docker-compose-mati-01/ksql-connect-tutorial

  sudo docker-compose exec ksqldb-cli ksql http://ksqldb-server:8088

}

# ######################################################################
#
#
# ######################################################################



function create_mysql_connector () {

  cd /lkd/srv/kafka-streams-docker-compose-mati-01/ksql-connect-tutorial

  echo "
  CREATE SOURCE CONNECTOR mysql_source_connector
  WITH (
    'connector.class' = 'io.confluent.connect.jdbc.JdbcSourceConnector',
    'connection.url' = 'jdbc:mysql://mysql:3306/football',
    'connection.user' = 'root',
    'connection.password' = 'root',
    'table.whitelist' = 'players',
    'mode' = 'incrementing',
    'incrementing.column.name' = 'id',
    'topic.prefix' = '',
    'key'='id'
  );"

}

# ######################################################################
#
#
# ######################################################################


function create_mysql_connector_3309 () {

  cd /lkd/srv/kafka-streams-docker-compose-mati-01/ksql-connect-tutorial

  echo "
  CREATE SOURCE CONNECTOR mysql_source_connector_3309
  WITH (
    'connector.class' = 'io.confluent.connect.jdbc.JdbcSourceConnector',
    'connection.url' = 'jdbc:mysql://mysql:3309/football',
    'connection.user' = 'root',
    'connection.password' = 'root',
    'table.whitelist' = 'players',
    'mode' = 'incrementing',
    'incrementing.column.name' = 'id',
    'topic.prefix' = '',
    'key'='id'
  );"

}


# ######################################################################
#
#
# ######################################################################


function create_redis_connection() {
  
  cd /lkd/srv/kafka-streams-docker-compose-mati-01/ksql-connect-tutorial
  echo "
  CREATE SINK CONNECTOR redis_sink WITH (
    'connector.class'='com.github.jcustenborder.kafka.connect.redis.RedisSinkConnector',
    'tasks.max'='1',
    'topics'='players',
    'redis.hosts'='redis:6379',
    'key.converter'='org.apache.kafka.connect.converters.ByteArrayConverter',
    'value.converter'='org.apache.kafka.connect.converters.ByteArrayConverter'
  );
  "
}

function check_redis_sink() {

  cd /lkd/srv/kafka-streams-docker-compose-mati-01/ksql-connect-tutorial

  sudo docker-compose exec redis redis-cli

}

# ######################################################################
#
#
# ######################################################################


function main_apps_environments() {
  # /lkd/2024-kafka-jtsolv/app/2024-jtsolv-kafka-basic-producer-consumer$ 
  # cp -R kafka-producer-application /lkd/2024-kafka-producer-consumer-raw-jtsolv


  cd /lkd/2024-kafka-producer-consumer-raw-jtsolv

}

# ######################################################################
#
#
# ######################################################################

function exec_example_words_count() {

  cd /lkd/2024-kafka-streams-mati-words-count/app/kafka-streams-word-count/

  sudo docker-compose up;

  ./mvnw compile exec:java -Dexec.mainClass="com.github.programmingwithmati.kafka.streams.wordcount.WordCountApp"


  cd /lkd/2024-kafka-streams-mati-words-count/app/kafka-streams-word-count/
  docker exec -it kafka /bin/bash

  kafka-console-consumer --topic word-count --bootstrap-server localhost:9092 \
 --from-beginning \
 --property print.key=true \
 --property key.separator=" : " \
 --key-deserializer "org.apache.kafka.common.serialization.StringDeserializer" \
 --value-deserializer "org.apache.kafka.common.serialization.LongDeserializer"

  cd /lkd/2024-kafka-streams-mati-words-count/app/kafka-streams-word-count/

  sudo docker exec -it kafka /bin/bash

  kafka-console-producer --topic sentences --bootstrap-server localhost:9092
}


# ######################################################################
#
#
# ######################################################################

function exec_example_avro() {

    cd /lkd/2024-kafka-avro-jtsolv/app/2024-jtsolv-kafka-avro

    sudo docker-compose up --remove-orphans;

    http://localhost:9021/clusters

    http://localhost:8181/create-events?id=2&topic=t-1

}


# ######################################################################
#
#
# ######################################################################


function install_schema() {

  kafka-avro-console-producer --bootstrap-server localhost:9092 --property schema.registry.url=http://localhost:8081 --topic transactions-avro \
  --property value.schema='{"type": "record","name": "Transaction","fields": [{"name": "id", "type": "string"},{"name": "amount", "type": "double"},{"name": "customer_id", "type": "string", "default":null}]}'

}


# ######################################################################
#
#
# ######################################################################


function avro_schema(){

#  http://localhost:8081/subjects/

# "jtsolv-user-raw-value"
#1	"t-1-value"
#2	"jtsolv-user-with-schema-value"
#3	"jtsolv-avro-value"
#4	"jtsolv-avro-schema-3"
#5	"jtsolv-avro-schema"
#6	"jtsolv-user-with-schema-2-value"

curl -X POST \
  -H "Content-Type: application/json" \
  --data @employee.avsc \
  http://localhost:8081/subjects/test-topic-value/versions



  curl -X GET http://localhost:8081/subjects/t-1-value/versions/1

  curl -X GET http://localhost:8081/subjects/t-1-value/versions/1

  #{"subject":"t-1-value","version":1,"id":1,"schema":"{\"type\":\"record\",\"name\":\"Employee\",\"namespace\":\"com.jtsolv.dto\",\"fields\":[{\"name\":\"id\",\"type\":\"string\"},{\"name\":\"firstName\",\"type\":\"string\"},{\"name\":\"middleName\",\"type\":\"string\",\"default\":\"\"},{\"name\":\"lastName\",\"type\":\"string\"},{\"name\":\"emailId\",\"type\":\"string\",\"default\":\"\"}]}"}
}



# ######################################################################
#
#
# ######################################################################

function fun_kafka_confluence_install_onto_linux_locally_by_platform_back() {


  # Installed onto /lkd/srv/cf
  cd /lkd/srv/cf


  # Start Zookeeper
  sudo /lkd/srv/cf/bin/zookeeper-server-start etc/kafka/zookeeper.properties &

  # Start Kafka:

  sudo /lkd/srv/cf/bin/kafka-server-start etc/kafka/server.properties &

  #Start Kafka Connect (optional):
  sudo /lkd/srv/cf/bin/connect-distributed etc/kafka/connect-distributed.properties &

  # Start Schema Registry (optional):
  sudo /lkd/srv/cf/bin/schema-registry-start etc/schema-registry/schema-registry.properties &

  #Start ksqlDB (optional):
  sudo /lkd/srv/cf/bin/ksql-server-start etc/ksql/ksql-server.properties &

  # Start Control Center (optional):
  sudo /lkd/srv/cf/bin/control-center-start etc/confluent-control-center/control-center.properties &


  #5. Verify the Installation

  # Once all the components are running, you can verify their status:

  #Kafka: By producing and consuming messages, as described in the Docker Compose setup.
  #Control Center: Access it via a browser at http://localhost:9021.
  #Schema Registry: Access it via http://localhost:8081.

  #http://localhost:9021

  #http://192.168.55.104:9021
  # kafdrop
  #http://192.168.55.104:9000

}

function ssh_copy {

  ssh lenovo@192.168.55.104


  sudo ufw allow 4000


  scp -r  /lkd/2024-apps-python-tools lenovo@192.168.55.104:/lkd/2025-mv

  scp -r  /var/www/html/jtsolv-portal lenovo@192.168.55.104:/lkd/2025-mv

  scp -r  /lkd/srv/confluent-platform-install/confluent-7.8.0.zip lenovo@192.168.55.104:/lkd/2025-mv

  scp -r  /lkd/2024-kafdrop lenovo@192.168.55.104:/lkd/2025-mv

  scp -r  /lkd/srv/confluent-platform-install/confluent-7.8.0.zip lenovo@192.168.55.106:/lkd/2025-mv

  scp -r  /lkd/srv/confluent-platform-install/confluent-7.8.0.zip cp24@192.168.55.109:/lkd/2025-mv

  scp -r  /lkd/srv/confluent-platform-install/confluent-7.8.0.zip   debian@57.128.219.194:/lkd/2025-mv

  

  # Ru99!! lub Ru99!



}

function install_k8s(){
  sudo snap install microk8s --classic
  sudo usermod -a -G microk8s $USER
  sudo chown -f -R $USER ~/.kube
  microk8s start
  su - $USER
  microk8s status  
}

function install_sbt() {
sudo apt-get update
sudo apt-get install apt-transport-https curl gnupg -yqq
echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | sudo tee /etc/apt/sources.list.d/sbt.list
echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | sudo tee /etc/apt/sources.list.d/sbt_old.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo -H gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/scalasbt-release.gpg --import
sudo chmod 644 /etc/apt/trusted.gpg.d/scalasbt-release.gpg
sudo apt-get update
sudo apt-get install sbt  
}

function install_kadeck(){
  docker run -d -e xeotek_kadeck_free="kamateon@gmail.com" -e xeotek_kadeck_port=80 -p 80:80 --name kadeck -v kadeck_data:/root/.kadeck/ xeotek/kadeck:5.3.2  
}

function extend_swap() {

  sudo swapoff /swapfile
  sudo fallocate -l 8G /swapfile
  sudo mkswap /swapfile
  sudo swapon /swapfile

}


function install_cockpit() {
  sudo apt install cockpit
}


function install_microk8s() {
  sudo apt install microk8s --classic
}


function k8s_install_local_load_balancer () {
  sudo microk8s enable dns metallb ingress
}


function cp_db() {
  cp /home/lenovo/snap/mysql-workbench-community/13/dumps/Dump20250128.sql /lkd/2024-apps-python-tools/app/git-repo/src-jtsolv-portal-update/jtsolv-db-exports/
  zip /lkd/2024-apps-python-tools/app/git-repo/src-jtsolv-portal-update/jtsolv-db-exports/jtsolv-2025-01-28--001.sql.7z /lkd/2024-apps-python-tools/app/git-repo/src-jtsolv-portal-update/jtsolv-db-exports/Dump20250128.sql
}

function microk8s_important_enable_dashboard() {

sudo microk8s dashboard-proxy

#Token:
#eyJhbGciOiJSUzI1NiIsImtpZCI6ImJwTDZPenVSVEp2dU5aZ3F0c25vRXh4OXRDdkxzQVRXTC1jak82OFZNQ2sifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJtaWNyb2s4cy1kYXNoYm9hcmQtdG9rZW4iLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiZGVmYXVsdCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjIyYTYwOWMwLWRlNmQtNDE3ZS1iOTI4LTVjNTdkNmYzYTBlMyIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDprdWJlLXN5c3RlbTpkZWZhdWx0In0.YfQleAoiEtanYBsHFLnC2xzq9YbCGk1BawQ_8KwdEHQsXCayJCR0sAL6W0uPuc5vnM8X1WT7KoOkHUgJY5i5M5kbtPY_xoTCIys5y0I7JZ0wGWhlHCO3xC6z3tdZyxjI0B46PHWxUqAABPqI2RJQz0Xvp7hwGWU2916gMR13P_wXEZXpYa_-1nfM-Ro9I5-ihqilx6xK3gCDgGzrDmPavqVgu_AT6n1wM-EIWcq2e-FNAn_q4D0A6ImffOVS35GXbO20QsyUQwFRWiMcgYXPfPHiUDY7x38HNtPc1eEKBZaOTQaBhxINVxOYksCiVk2Ixmiq3eXNWr4GnWqUuos9iQ

#url:
#https://127.0.0.1:10443/#/login  

}

function kafka_on_k8s() {

  microk8s enable storage
  #/lkd/2024-apps-python-tools/app/git-repo/src-linux-scripts/k8s-kafka-onto-k8s-deployment/kafka-onto-k8s-execute.sh
  microk8s kafka-topics --create --topic test-topic --bootstrap-server 192.168.55.105:10992 --partitions 1 --replication-factor 1
}


function exec_pods() {
  
  microk8s kubectl exec -it kafka-0 -n jtsolv-namespace-kafka-instance-01 -- /bin/bash
  microk8s kubectl exec -it kafka-0 -n jtsolv-namespace-kafka-instance-01 -- kafka-topics.sh --bootstrap-server localhost:9092 --list

}

function exec_push_gamedices_producer_to_microk8s_registry() {
      echo "exec_push_gamedices_producer_to_microk8s_registry--start"
      cd /lkd/2024-kafka-spring-jtsolvcu/apps/jtsolv-spring-kafka-producer
      sudo docker build -t jtsolv/jtsolv-kafka-producer:0.0.1 .

      cd /lkd/2024-kafka-spring-jtsolvcu/apps/jtsolv-spring-kafka-producer
      sudo docker images
      sudo docker tag jtsolv/jtsolv-kafka-producer:0.0.1 localhost:32000/jtsolv-kafka-producer:0.0.1
      sudo docker push localhost:32000/jtsolv-kafka-producer:0.0.1
      sudo microk8s kubectl get pods -n container-registry
      echo "exec_push_gamedices_producer_to_microk8s_registry--end"
}


function exec_push_gamedices_consumer_to_microk8s_registry() {
      echo "exec_push_gamedices_consumer_to_microk8s_registry--start"
      cd /lkd/2024-kafka-spring-jtsolvcu/apps/jtsolv-spring-kafka-consumer
      sudo docker build -t jtsolv/jtsolv-kafka-consumer:0.0.1 .
      sudo docker images
      sudo docker tag jtsolv/jtsolv-kafka-consumer:0.0.1 localhost:32000/jtsolv-kafka-consumer:0.0.1
      sudo docker push localhost:32000/jtsolv-kafka-consumer:0.0.1
      sudo microk8s kubectl get pods -n container-registry
      echo "exec_push_gamedices_consumer_to_microk8s_registry--end"
}

function exec_last_edit_date() {
      echo "2025-02-03--0640"
}

function exec_gamedices_app() {

    cd /lkd/2024-kafka-spring-jtsolvcu/apps/jtsolv-spring-kafka-producer
    sudo docker build -t jtsolv-kafka-producer:v0.0.1 .
    sudo docker build -t jtsolv/jtsolv-kafka-producer:0.0.1 .
    sudo docker images

    #
    #
    # sudo docker images | grep jtsolv
    # jtsolv/jtsolv-kafka-producer                    0.0.1           aef6ba166059   23 minutes ago   454MB
    #
    #

}

function check_gamedices_kafka_producer() {

    # check
    http://192.168.55.106:50779/kafka/send-get-test?topic=1&message=2


    # working
    http://localhost:50777/kafka/send-get-test?topic=1&message=2

}

function execute_gamedices_kafdrop() { 


    # not-working
    sudo java -jar /lkd/2024-kafdrop/app/kafdrop/target/kafdrop-4.1.1-SNAPSHOT.jar --kafka.brokerConnect=192.168.55.104:10992

    # not-working
    sudo java -jar /lkd/2024-kafdrop/app/kafdrop/target/kafdrop-4.1.1-SNAPSHOT.jar --kafka.brokerConnect=192.168.55.105:10992

    # not-working
    sudo java -jar /lkd/2024-kafdrop/app/kafdrop/target/kafdrop-4.1.1-SNAPSHOT.jar --kafka.brokerConnect=192.168.55.105:30092

    # http://localhost:9000

    # sudo java -jar /lkd/2024-kafdrop/app/kafdrop/target/kafdrop-4.1.1-SNAPSHOT.jar --kafka.brokerConnect=192.168.55.105:30092

}

function enable_dashboard() {

sudo microk8s dashboard-proxy

#Token:
#eyJhbGciOiJSUzI1NiIsImtpZCI6ImJwTDZPenVSVEp2dU5aZ3F0c25vRXh4OXRDdkxzQVRXTC1jak82OFZNQ2sifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJtaWNyb2s4cy1kYXNoYm9hcmQtdG9rZW4iLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiZGVmYXVsdCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjIyYTYwOWMwLWRlNmQtNDE3ZS1iOTI4LTVjNTdkNmYzYTBlMyIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDprdWJlLXN5c3RlbTpkZWZhdWx0In0.YfQleAoiEtanYBsHFLnC2xzq9YbCGk1BawQ_8KwdEHQsXCayJCR0sAL6W0uPuc5vnM8X1WT7KoOkHUgJY5i5M5kbtPY_xoTCIys5y0I7JZ0wGWhlHCO3xC6z3tdZyxjI0B46PHWxUqAABPqI2RJQz0Xvp7hwGWU2916gMR13P_wXEZXpYa_-1nfM-Ro9I5-ihqilx6xK3gCDgGzrDmPavqVgu_AT6n1wM-EIWcq2e-FNAn_q4D0A6ImffOVS35GXbO20QsyUQwFRWiMcgYXPfPHiUDY7x38HNtPc1eEKBZaOTQaBhxINVxOYksCiVk2Ixmiq3eXNWr4GnWqUuos9iQ

#url:
#https://127.0.0.1:10443/#/login  

}

exec_type=""

while getopts ":t:p:" opt; do
  case ${opt} in
    t ) exec_type=$OPTARG;;
    p ) password=$OPTARG;;
    \? ) echo "Usage: cmd [-u] [-p]";;
  esac
done

if [ -z "$exec_type" ] 
then
  echo "Type are required."
  exit 1
fi

if test "$exec_type" == "zookeeper_start" 
then
    echo "is-exec zookeeper_start"  
  fun_kafka_zookeeper_start
else
  echo "not-exec zookeeper_start"
fi

if test "$exec_type" == "kafka_server_start" 
then  
    echo "is-exec kafka_server_start"
    fun_kafka_server_start
else
  echo "not-exec kafka_server_start"
fi



if test "$exec_type" == "cf-start" 
then  
    echo "is-exec cf-start"
    fun_kafka_confluence_install_onto_linux_locally_by_platform_back
else
    echo "not-exec cf-start"
fi

if test "$exec_type" == "cf-test" 
then  
    echo "is-exec cf-test"
    
else
    echo "not-exec cf-test"
fi

# /lkd/2024-apps-python-tools/app/git-repo/src-linux-scripts/kafka-linux-script/02-kafka-linux-script-manager.sh
# alias jtsolv-cf='/lkd/2024-apps-python-tools/app/git-repo/src-linux-scripts/kafka-linux-script/02-kafka-linux-script-manager.sh -t cf-start' 
# /lkd/2024-apps-python-tools/app/git-repo/src-k8s-apps/k8s-gamedices/02-kafka-linux-script-manager.sh -t cf-test


#Token:
#eyJhbGciOiJSUzI1NiIsImtpZCI6ImJwTDZPenVSVEp2dU5aZ3F0c25vRXh4OXRDdkxzQVRXTC1jak82OFZNQ2sifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJtaWNyb2s4cy1kYXNoYm9hcmQtdG9rZW4iLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiZGVmYXVsdCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjIyYTYwOWMwLWRlNmQtNDE3ZS1iOTI4LTVjNTdkNmYzYTBlMyIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDprdWJlLXN5c3RlbTpkZWZhdWx0In0.YfQleAoiEtanYBsHFLnC2xzq9YbCGk1BawQ_8KwdEHQsXCayJCR0sAL6W0uPuc5vnM8X1WT7KoOkHUgJY5i5M5kbtPY_xoTCIys5y0I7JZ0wGWhlHCO3xC6z3tdZyxjI0B46PHWxUqAABPqI2RJQz0Xvp7hwGWU2916gMR13P_wXEZXpYa_-1nfM-Ro9I5-ihqilx6xK3gCDgGzrDmPavqVgu_AT6n1wM-EIWcq2e-FNAn_q4D0A6ImffOVS35GXbO20QsyUQwFRWiMcgYXPfPHiUDY7x38HNtPc1eEKBZaOTQaBhxINVxOYksCiVk2Ixmiq3eXNWr4GnWqUuos9iQ

#url:
#https://127.0.0.1:10443/#/login  
