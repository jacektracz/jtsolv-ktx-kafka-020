nslookup: can't resolve 'kafka-xff-sts.kafka-xff-headless-service.kafka-xff-nm.svc.cluster.local'
/ # nslookup kafka-xff-sts-0.kafka-xff-headless-service.kafka-xff-nm.svc.cluster.local
Server:    10.152.183.10
Address 1: 10.152.183.10 kube-dns.kube-system.svc.cluster.local

nslookup: can't resolve 'kafka-xff-sts-0.kafka-xff-headless-service.kafka-xff-nm.svc.cluster.local'
/ # nslookup kafka-xff-sts-sn.kafka-xff-headless-service.kafka-xff-nm.svc.cluster.local
Server:    10.152.183.10
Address 1: 10.152.183.10 kube-dns.kube-system.svc.cluster.local

nslookup: can't resolve 'kafka-xff-sts-sn.kafka-xff-headless-service.kafka-xff-nm.svc.cluster.local'
/ # nslookup kafka-xff-headless-service.kafka-xff-nm.svc.cluster.local
Server:    10.152.183.10
Address 1: 10.152.183.10 kube-dns.kube-system.svc.cluster.local

Name:      kafka-xff-headless-service.kafka-xff-nm.svc.cluster.local
Address 1: 10.1.34.157 10-1-34-157.kafka-xff-service.kafka-xff-nm.svc.cluster.local



kafka-xff-nm                         kafka-xff-headless-service                                        <none>                                           11h
kafka-xff-nm                         kafka-xff-lb-to-listeners                                         10.1.34.157:9092                                 115m
kafka-xff-nm                         kafka-xff-nodeport                                                10.1.34.157:9092                                 67m
kafka-xff-nm                         kafka-xff-service                                                 10.1.34.157:9092,10.1.34.157:9093                10h



NAMESPACE                            NAME                                                              ENDPOINTS                                        AGE
container-registry                   registry                                                          10.1.34.178:5000                                 175d
default                              kubernetes                                                        192.168.55.103:16443                             214d
ingress-nginx                        ingress-nginx-controller                                          10.1.34.179:443,10.1.34.179:80                   184d
ingress-nginx                        ingress-nginx-controller-admission                                10.1.34.179:8443                                 184d
jtsolv-namespace-kafka-instance-01   jtsolv-gamedice-ui-load-balancer-instance-01                      <none>                                           161d
jtsolv-namespace-kafka-instance-01   jtsolv-gamedices-kafka-mysql-service-instance-01                  <none>                                           168d
jtsolv-namespace-kafka-instance-01   jtsolv-kafka-consumer-gamedices-service-instance-01               <none>                                           167d
jtsolv-namespace-kafka-instance-01   jtsolv-kafka-external-instance-01                                 <none>                                           178d
jtsolv-namespace-kafka-instance-01   jtsolv-kafka-headless-service-instance-01                         <none>                                           178d
jtsolv-namespace-kafka-instance-01   jtsolv-kafka-kafdrop-load-balancer-instance-01                    <none>                                           152d
jtsolv-namespace-kafka-instance-01   jtsolv-kafka-mysql-loadbalancer-instance-01                       <none>                                           166d
jtsolv-namespace-kafka-instance-01   jtsolv-kafka-mysql-service-instance-01                            <none>                                           173d
jtsolv-namespace-kafka-instance-01   jtsolv-kafka-producer-service-instance-01                         <none>                                           175d
jtsolv-namespace-kafka-instance-01   jtsolv-loadbalancer-kafka-spring-gamedices-consumer-instance-01   <none>                                           167d
jtsolv-namespace-kafka-instance-01   jtsolv-loadbalancer-kafka-spring-producer-instance-01             <none>                                           175d
jtsolv-namespace-kafka-instance-01   kafka                                                             <none>                                           180d
jtsolv-namespace-kafka-instance-01   kafka-external                                                    <none>                                           180d
jtsolv-namespace-kafka-instance-01   zookeeper                                                         10.1.34.176:2181                                 180d
jtsolv-wp-2                          jtsolv-loadbalancer-1-wordpress                                   10.1.34.129:80                                   184d
jtsolv-wp-2                          mysql                                                             10.1.34.180:3306                                 184d
jtsolv-xpd-namespace-instance-04     jtsolv-xpd-app-consumer-service-instance-04                                                                        147d
jtsolv-xpd-namespace-instance-04     jtsolv-xpd-apps-gui-load-balancer-instance-04                     10.1.34.183:80,10.1.34.191:80                    147d
jtsolv-xpd-namespace-instance-04     jtsolv-xpd-apps-kafdrop-load-balancer-instance-04                 <none>                                           147d
jtsolv-xpd-namespace-instance-04     jtsolv-xpd-apps-producer-loadbalancer-instance-04                 <none>                                           147d
jtsolv-xpd-namespace-instance-04     jtsolv-xpd-consumer-loadbalancer-instance-04                                                                       147d
jtsolv-xpd-namespace-instance-04     jtsolv-xpd-inf-kafka-headless-service-instance-04                 <none>                                           147d
jtsolv-xpd-namespace-instance-04     jtsolv-xpd-inf-kafka-internal-service-instance-04                                                                  147d
jtsolv-xpd-namespace-instance-04     jtsolv-xpd-inf-kafka-loadbalancer-instance-04                                                                      147d
jtsolv-xpd-namespace-instance-04     jtsolv-xpd-inf-sql-loadbalancer-instance-04                       10.1.34.187:3306                                 147d
jtsolv-xpd-namespace-instance-04     jtsolv-xpd-inf-sql-service-internal-instance-04                   10.1.34.187:3306                                 147d
jtsolv-xpd-namespace-instance-04     jtsolv-xpd-inf-zookeeper-internal-service-instance-04             10.1.34.189:2181                                 147d
jtsolv-xpd-namespace-instance-04     jtsolv-xpd-producer-service-instance-04                           10.1.34.130:60778                                147d
jtsolv-xpx-namespace-in-08           jtsolv-xpx-kafka-broker-srvc-headless-in-08                       <none>                                           127d
jtsolv-xpx-namespace-in-08           jtsolv-xpx-kafka-zookeeper-srvc-headless-in-08                    <none>                                           127d


kafka-xff-nm                         kafka-xff-headless-service                                        <none>                                           11h
kafka-xff-nm                         kafka-xff-lb-to-listeners                                         10.1.34.157:9092                                 115m
kafka-xff-nm                         kafka-xff-nodeport                                                10.1.34.157:9092                                 67m
kafka-xff-nm                         kafka-xff-service                                                 10.1.34.157:9092,10.1.34.157:9093                10h




kafka-xff                            kafka-headless                                                    <none>                                           13h
kafka-xff                            kafka-xff-headless                                                <none>                                           12h
kafka-xff                            kafka-xff-service                                                                                                  37d
kafka-xxf                            kafka-headless                                                    <none>                                           13h
kube-system                          dashboard-metrics-scraper                                         10.1.34.128:8000                                 214d
kube-system                          kube-dns                                                          10.1.34.177:53,10.1.34.177:53,10.1.34.177:9153   214d
kube-system                          kubernetes-dashboard                                              10.1.34.175:8443                                 214d
kube-system                          metrics-server                                                    10.1.34.185:4443                                 214d
kube-system                          microk8s.io-hostpath                                              <none>                                           179d
metallb-system                       webhook-service                                                   10.1.34.190:9443                                 183d
