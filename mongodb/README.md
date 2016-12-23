mongo replica set
=================

Launch mongo replica with 1 primary and 1 secondary:

    $ docker-compose up

Get mapped MongoDB port for the primary:

    $ docker-compose port primary 27017
    0.0.0.0:32773

Initiate the primary and add the secondary to the replica set:

    $ mongo admin --port 32773 --eval 'rs.initiate(); ; rs.add("secondary")'

References
----------

  * "Append a scale number at the tail of hostname" - https://github.com/docker/compose/issues/677
  * Deploy MongoDB Replica Set - https://docs.mongodb.com/manual/tutorial/deploy-replica-set/
