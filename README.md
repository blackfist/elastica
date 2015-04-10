Vagrant script to configure four machines in an Elasticsearch cluster,
install logstash and then configure osquery to monitor the machines sending results to elasticsearch.

# Some elasticsearch I should try to remember
## Cluster health information
`curl -XGET http://localhost:9200/_cluster/health?pretty`

* [Cluster health](http://www.elastic.co/guide/en/elasticsearch/reference/1.x/cluster-health.html)
* [Troubleshooting](https://t37.net/how-to-fix-your-elasticsearch-cluster-stuck-in-initializing-shards-mode.html)

## List the indices on the cluster
`curl 'localhost:9200/_cat/indices?v'` or for verbose details about a single index `curl -XGET http://localhost:9200/logstash-2015.04.10/_status?pretty`

## Searching
Find all the port 22 stuff  
`curl -XGET 'http://localhost:9200/logstash-2015.04.09/osquery_json/_search?q=local_port:22&pretty=true'`

Find an md5 hash  
`curl -XGET 'http://localhost:9200/logstash-2015.04.09/osquery_json/_search?q=e19c1283c925b3206685ff522acfe3e6'`
