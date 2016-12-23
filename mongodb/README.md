mongo replica set
=================

Launch mongo replica set with one primary, one secondary and an arbiter:

    $ docker-compose up

Get mapped MongoDB port for the primary:

    $ docker-compose port primary 27017
    0.0.0.0:32773

Initiate the primary and add the secondary to the replica set with the arbiter:

    $ mongo admin --port 32773 --eval 'rs.initiate(); rs.add("secondary"); rs.addArb("arbiter")'

Check the status of the replica set:

    $ mongo admin --port 32773 --eval 'rs.status()'

Take down the primary mongo server:

    $ docker-compose scale primary=0

Check that the secondary has been promoted to primary:

    $ docker-compose port secondary 27017
    0.0.0.0:32775

    $ mongo admin --port 32775 --eval 'rs.status()'  # <= secondary port

Bring the primary back up and add it back to the replica set:

    $ docker-compose scale primary=1
    $ mongo admin --port 32775 --eval 'rs.add("primary")'   # <= secondary port

References
----------

  * Deploy MongoDB Replica Set - https://docs.mongodb.com/manual/tutorial/deploy-replica-set/
