mongo replica set
=================

Launch mongo replica with 1 primary and 1 secondary:

    $ docker-compose up

Get mapped MongoDB port for the primary:

    $ docker-compose port primary 27017
    0.0.0.0:32773

Initiate the primary and add the secondary to the replica set:

    $ mongo admin --port 32773 --eval 'rs.initiate(); rs.add("secondary"); rs.addArb("arbiter")'

Check the status of the replica set:

    $ mongo admin --port 32773 --eval 'rs.status()'

```
    {
    	"set" : "rs0",
    	"date" : ISODate("2016-12-23T00:42:40.714Z"),
    	"myState" : 1,
    	"term" : NumberLong(1),
    	"heartbeatIntervalMillis" : NumberLong(2000),
    	"optimes" : {
    		"lastCommittedOpTime" : {
    			"ts" : Timestamp(1482453750, 1),
    			"t" : NumberLong(1)
    		},
    		"appliedOpTime" : {
    			"ts" : Timestamp(1482453760, 1),
    			"t" : NumberLong(1)
    		},
    		"durableOpTime" : {
    			"ts" : Timestamp(1482453760, 1),
    			"t" : NumberLong(1)
    		}
    	},
    	"members" : [
    		{
    			"_id" : 0,
    			"name" : "be750c0c8cf8:27017",
    			"health" : 1,
    			"state" : 1,
    			"stateStr" : "PRIMARY",
    			"uptime" : 45,
    			"optime" : {
    				"ts" : Timestamp(1482453760, 1),
    				"t" : NumberLong(1)
    			},
    			"optimeDate" : ISODate("2016-12-23T00:42:40Z"),
    			"infoMessage" : "could not find member to sync from",
    			"electionTime" : Timestamp(1482453749, 2),
    			"electionDate" : ISODate("2016-12-23T00:42:29Z"),
    			"configVersion" : 3,
    			"self" : true
    		},
    		{
    			"_id" : 1,
    			"name" : "secondary:27017",
    			"health" : 1,
    			"state" : 2,
    			"stateStr" : "SECONDARY",
    			"uptime" : 11,
    			"optime" : {
    				"ts" : Timestamp(1482453750, 1),
    				"t" : NumberLong(1)
    			},
    			"optimeDurable" : {
    				"ts" : Timestamp(1482453750, 1),
    				"t" : NumberLong(1)
    			},
    			"optimeDate" : ISODate("2016-12-23T00:42:30Z"),
    			"optimeDurableDate" : ISODate("2016-12-23T00:42:30Z"),
    			"lastHeartbeat" : ISODate("2016-12-23T00:42:39.606Z"),
    			"lastHeartbeatRecv" : ISODate("2016-12-23T00:42:35.912Z"),
    			"pingMs" : NumberLong(0),
    			"configVersion" : 3
    		},
    		{
    			"_id" : 2,
    			"name" : "arbiter:27017",
    			"health" : 1,
    			"state" : 7,
    			"stateStr" : "ARBITER",
    			"uptime" : 11,
    			"lastHeartbeat" : ISODate("2016-12-23T00:42:39.606Z"),
    			"lastHeartbeatRecv" : ISODate("2016-12-23T00:42:39.840Z"),
    			"pingMs" : NumberLong(0),
    			"configVersion" : 3
    		}
    	],
    	"ok" : 1
    }
```

References
----------

  * Deploy MongoDB Replica Set - https://docs.mongodb.com/manual/tutorial/deploy-replica-set/
