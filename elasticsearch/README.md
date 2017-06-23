elasticsearch cluster
=====================

Launch elasticsearch cluster with 1 master and 1 slave:

    $ docker-compose up

Get mapped HTTP port for REST API:

    $ docker-compose port master 9200
    0.0.0.0:32769

Add some fake data:

    $ http PUT :32769/twitter/tweet/1 user=nick message=hello

    $ http -v PUT :32769/_cluster/settings?flat_settings=true transient:='{"cluster.routing.rebalance.enable": "none"}'

Set number of replicas to 2 for all indexes:

    $ http PUT :32769/_settings index:='{"number_of_replicas":2}'

Scale up to 3 elastic search slaves:

    $ docker-compose scale slave=3

    $ docker-compose down

To run head, run:

    $ docker run -p 9100:9100 mobz/elasticsearch-head:5

