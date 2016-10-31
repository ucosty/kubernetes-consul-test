#!/consul/dumb-init /bin/sh

# Ensure the startup is delayed by a random interval
sleep $[ ( $RANDOM % 10 )  + 5 ]s

# Launch Consul and ensure it is joined to a cluster
/consul/consul \
  -data-dir=/consul/data \
  -ui-dir=/consul/ui \
  -client 0.0.0.0 \
  -bootstrap-expect ${BOOTSTRAP_EXPECT} \
  -retry-join consul
