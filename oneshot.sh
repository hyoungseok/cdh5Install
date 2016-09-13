#!/bin/sh

sudo wget 'https://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/cloudera.list' -O /etc/apt/sources.list.d/cloudera.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 327574EE02A818DD
sudo apt-get update

sudo sh -c 'echo "Package: *" > /etc/apt/preferences.d/cloudera.pref'
sudo sh -c 'echo "Pin: release o=Cloudera, l=Cloudera" >> /etc/apt/preferences.d/cloudera.pref'
sudo sh -c 'echo "Pin-Priority: 501" >> /etc/apt/preferences.d/cloudera.pref'

wget https://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/archive.key -O archive.key
sudo apt-key add ./archive.key

sudo apt-get -y install zookeeper zookeeper-server

sudo apt-get update; sudo apt-get -y install hadoop-yarn-resourcemanager
sudo apt-get -y install hadoop-hdfs-namenode
sudo apt-get -y install hadoop-yarn-nodemanager hadoop-hdfs-datanode hadoop-mapreduce

sudo locale-gen ko_KR.UTF-8
sudo sh -c 'echo "LANG=\"ko_KR.UTF-8\"" > /etc/default/locale'
sudo sh -c 'echo "LANGUAGE=\"ko_KR:ko:en_US:en\"" >> /etc/default/locale'

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get -y install oracle-java8-installer

wget www.scala-lang.org/files/archive/scala-2.11.8.deb
sudo dpkg -i scala-2.11.8.deb

# Disk Add : http://reachlab-kr.github.io/linux/2015/10/03/Ubuntu-fstab.html

sudo hadoop namenode -format
sudo apt-get -y install spark-core spark-history-server
