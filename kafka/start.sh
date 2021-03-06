#!/bin/sh

# If a ZooKeeper container is linked with the alias `zookeeper`, use it.
# You MUST set ZOOKEEPER_IP in env otherwise.
[ -n "$ZOOKEEPER_PORT_2181_TCP_ADDR" ] && ZOOKEEPER_IP=$ZOOKEEPER_PORT_2181_TCP_ADDR
[ -n "$ZOOKEEPER_PORT_2181_TCP_PORT" ] && ZOOKEEPER_PORT=$ZOOKEEPER_PORT_2181_TCP_PORT

IP=$(grep "\s${HOSTNAME}$" /etc/hosts | head -n 1 | awk '{print $1}')

# Concatenate the IP:PORT for ZooKeeper to allow setting a full connection
# string with multiple ZooKeeper hosts
[ -z "$KAFKA_ZOOKEEPER_CONNECT" ] && KAFKA_ZOOKEEPER_CONNECT="${ZOOKEEPER_IP}:${ZOOKEEPER_PORT:-2181}"

if [ -f /kafka/config/server.properties ];then
	echo "server.properties exist."
else
	[ -z "$KAFKA_ZOOKEEPER_CONNECT" ] && ZOOKEEPER_CONNECT_="# "
	[ -z "$KAFKA_ADVERTISED_LISTENERS" ] && ADVERTISED_LISTENERS_="# "
	[ -z "$KAFKA_AUTO_CREATE_TOPICS_ENABLE" ] && AUTO_CREATE_TOPICS_ENABLE_="# "
	[ -z "$KAFKA_AUTO_LEADER_REBALANCE_ENABLE" ] && AUTO_LEADER_REBALANCE_ENABLE_="# "
	[ -z "$KAFKA_BACKGROUND_THREADS" ] && BACKGROUND_THREADS_="# "
	[ -z "$KAFKA_BROKER_ID" ] && BROKER_ID_="# "
	[ -z "$KAFKA_COMPRESSION_TYPE" ] && COMPRESSION_TYPE_="# "
	[ -z "$KAFKA_DELETE_TOPIC_ENABLE" ] && DELETE_TOPIC_ENABLE_="# "
	[ -z "$KAFKA_LEADER_IMBALANCE_CHECK_INTERVAL_SECONDS" ] && LEADER_IMBALANCE_CHECK_INTERVAL_SECONDS_="# "
	[ -z "$KAFKA_LEADER_IMBALANCE_PER_BROKER_PERCENTAGE" ] && LEADER_IMBALANCE_PER_BROKER_PERCENTAGE_="# "
	[ -z "$KAFKA_LISTENERS" ] && LISTENERS_="# "
	[ -z "$KAFKA_LOG_DIR" ] && LOG_DIR_="# "
	[ -z "$KAFKA_LOG_DIRS" ] && LOG_DIRS_="# "
	[ -z "$KAFKA_LOG_FLUSH_INTERVAL_MESSAGES" ] && LOG_FLUSH_INTERVAL_MESSAGES_="# "
	[ -z "$KAFKA_LOG_FLUSH_INTERVAL_MS" ] && LOG_FLUSH_INTERVAL_MS_="# "
	[ -z "$KAFKA_LOG_FLUSH_OFFSET_CHECKPOINT_INTERVAL_MS" ] && LOG_FLUSH_OFFSET_CHECKPOINT_INTERVAL_MS_="# "
	[ -z "$KAFKA_LOG_FLUSH_SCHEDULER_INTERVAL_MS" ] && LOG_FLUSH_SCHEDULER_INTERVAL_MS_="# "
	[ -z "$KAFKA_LOG_RETENTION_BYTES" ] && LOG_RETENTION_BYTES_="# "
	[ -z "$KAFKA_LOG_RETENTION_HOURS" ] && LOG_RETENTION_HOURS_="# "
	[ -z "$KAFKA_LOG_RETENTION_MINUTES" ] && LOG_RETENTION_MINUTES_="# "
	[ -z "$KAFKA_LOG_RETENTION_MS" ] && LOG_RETENTION_MS_="# "
	[ -z "$KAFKA_LOG_ROLL_HOURS" ] && LOG_ROLL_HOURS_="# "
	[ -z "$KAFKA_LOG_ROLL_JITTER_HOURS" ] && LOG_ROLL_JITTER_HOURS_="# "
	[ -z "$KAFKA_LOG_ROLL_JITTER_MS" ] && LOG_ROLL_JITTER_MS_="# "
	[ -z "$KAFKA_LOG_ROLL_MS" ] && LOG_ROLL_MS_="# "
	[ -z "$KAFKA_LOG_SEGMENT_BYTES" ] && LOG_SEGMENT_BYTES_="# "
	[ -z "$KAFKA_LOG_SEGMENT_DELETE_DELAY_MS" ] && LOG_SEGMENT_DELETE_DELAY_MS_="# "
	[ -z "$KAFKA_MESSAGE_MAX_BYTES" ] && MESSAGE_MAX_BYTES_="# "
	[ -z "$KAFKA_MIN_INSYNC_REPLICAS" ] && MIN_INSYNC_REPLICAS_="# "
	[ -z "$KAFKA_NUM_IO_THREADS" ] && NUM_IO_THREADS_="# "
	[ -z "$KAFKA_NUM_NETWORK_THREADS" ] && NUM_NETWORK_THREADS_="# "
	[ -z "$KAFKA_NUM_RECOVERY_THREADS_PER_DATA_DIR" ] && NUM_RECOVERY_THREADS_PER_DATA_DIR_="# "
	[ -z "$KAFKA_NUM_REPLICA_FETCHERS" ] && NUM_REPLICA_FETCHERS_="# "
	[ -z "$KAFKA_OFFSET_METADATA_MAX_BYTES" ] && OFFSET_METADATA_MAX_BYTES_="# "
	[ -z "$KAFKA_OFFSETS_COMMIT_REQUIRED_ACKS" ] && OFFSETS_COMMIT_REQUIRED_ACKS_="# "
	[ -z "$KAFKA_OFFSETS_COMMIT_TIMEOUT_MS" ] && OFFSETS_COMMIT_TIMEOUT_MS_="# "
	[ -z "$KAFKA_OFFSETS_LOAD_BUFFER_SIZE" ] && OFFSETS_LOAD_BUFFER_SIZE_="# "
	[ -z "$KAFKA_OFFSETS_RETENTION_CHECK_INTERVAL_MS" ] && OFFSETS_RETENTION_CHECK_INTERVAL_MS_="# "
	[ -z "$KAFKA_OFFSETS_RETENTION_MINUTES" ] && OFFSETS_RETENTION_MINUTES_="# "
	[ -z "$KAFKA_OFFSETS_TOPIC_COMPRESSION_CODEC" ] && OFFSETS_TOPIC_COMPRESSION_CODEC_="# "
	[ -z "$KAFKA_OFFSETS_TOPIC_NUM_PARTITIONS" ] && OFFSETS_TOPIC_NUM_PARTITIONS_="# "
	[ -z "$KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR" ] && OFFSETS_TOPIC_REPLICATION_FACTOR_="# "
	[ -z "$KAFKA_OFFSETS_TOPIC_SEGMENT_BYTES" ] && OFFSETS_TOPIC_SEGMENT_BYTES_="# "
	[ -z "$KAFKA_QUEUED_MAX_REQUESTS" ] && QUEUED_MAX_REQUESTS_="# "
	[ -z "$KAFKA_REPLICA_FETCH_MIN_BYTES" ] && REPLICA_FETCH_MIN_BYTES_="# "
	[ -z "$KAFKA_REPLICA_FETCH_WAIT_MAX_MS" ] && REPLICA_FETCH_WAIT_MAX_MS_="# "
	[ -z "$KAFKA_REPLICA_HIGH_WATERMARK_CHECKPOINT_INTERVAL_MS" ] && REPLICA_HIGH_WATERMARK_CHECKPOINT_INTERVAL_MS_="# "
	[ -z "$KAFKA_REPLICA_LAG_TIME_MAX_MS" ] && REPLICA_LAG_TIME_MAX_MS_="# "
	[ -z "$KAFKA_REPLICA_SOCKET_RECEIVE_BUFFER_BYTES" ] && REPLICA_SOCKET_RECEIVE_BUFFER_BYTES_="# "
	[ -z "$KAFKA_REPLICA_SOCKET_TIMEOUT_MS" ] && REPLICA_SOCKET_TIMEOUT_MS_="# "
	[ -z "$KAFKA_REQUEST_TIMEOUT_MS" ] && REQUEST_TIMEOUT_MS_="# "
	[ -z "$KAFKA_SOCKET_RECEIVE_BUFFER_BYTES" ] && SOCKET_RECEIVE_BUFFER_BYTES_="# "
	[ -z "$KAFKA_SOCKET_REQUEST_MAX_BYTES" ] && SOCKET_REQUEST_MAX_BYTES_="# "
	[ -z "$KAFKA_SOCKET_SEND_BUFFER_BYTES" ] && SOCKET_SEND_BUFFER_BYTES_="# "
	[ -z "$KAFKA_UNCLEAN_LEADER_ELECTION_ENABLE" ] && UNCLEAN_LEADER_ELECTION_ENABLE_="# "
	[ -z "$KAFKA_ZOOKEEPER_CONNECTION_TIMEOUT_MS" ] && ZOOKEEPER_CONNECTION_TIMEOUT_MS_="# "
	[ -z "$KAFKA_ZOOKEEPER_SESSION_TIMEOUT_MS" ] && ZOOKEEPER_SESSION_TIMEOUT_MS_="# "
	[ -z "$KAFKA_ZOOKEEPER_SET_ACL" ] && ZOOKEEPER_SET_ACL_="# "
	[ -z "$KAFKA_BROKER_ID_GENERATION_ENABLE" ] && BROKER_ID_GENERATION_ENABLE_="# "
	[ -z "$KAFKA_BROKER_RACK" ] && BROKER_RACK_="# "
	[ -z "$KAFKA_CONNECTIONS_MAX_IDLE_MS" ] && CONNECTIONS_MAX_IDLE_MS_="# "
	[ -z "$KAFKA_CONTROLLED_SHUTDOWN_ENABLE" ] && CONTROLLED_SHUTDOWN_ENABLE_="# "
	[ -z "$KAFKA_CONTROLLED_SHUTDOWN_MAX_RETRIES" ] && CONTROLLED_SHUTDOWN_MAX_RETRIES_="# "
	[ -z "$KAFKA_CONTROLLED_SHUTDOWN_RETRY_BACKOFF_MS" ] && CONTROLLED_SHUTDOWN_RETRY_BACKOFF_MS_="# "
	[ -z "$KAFKA_CONTROLLER_SOCKET_TIMEOUT_MS" ] && CONTROLLER_SOCKET_TIMEOUT_MS_="# "
	[ -z "$KAFKA_DEFAULT_REPLICATION_FACTOR" ] && DEFAULT_REPLICATION_FACTOR_="# "
	[ -z "$KAFKA_FETCH_PURGATORY_PURGE_INTERVAL_REQUESTS" ] && FETCH_PURGATORY_PURGE_INTERVAL_REQUESTS_="# "
	[ -z "$KAFKA_GROUP_MAX_SESSION_TIMEOUT_MS" ] && GROUP_MAX_SESSION_TIMEOUT_MS_="# "
	[ -z "$KAFKA_GROUP_MIN_SESSION_TIMEOUT_MS" ] && GROUP_MIN_SESSION_TIMEOUT_MS_="# "
	[ -z "$KAFKA_INTER_BROKER_LISTENER_NAME" ] && INTER_BROKER_LISTENER_NAME_="# "
	[ -z "$KAFKA_INTER_BROKER_PROTOCOL_VERSION" ] && INTER_BROKER_PROTOCOL_VERSION_="# "
	[ -z "$KAFKA_LOG_CLEANER_BACKOFF_MS" ] && LOG_CLEANER_BACKOFF_MS_="# "
	[ -z "$KAFKA_LOG_CLEANER_DEDUPE_BUFFER_SIZE" ] && LOG_CLEANER_DEDUPE_BUFFER_SIZE_="# "
	[ -z "$KAFKA_LOG_CLEANER_DELETE_RETENTION_MS" ] && LOG_CLEANER_DELETE_RETENTION_MS_="# "
	[ -z "$KAFKA_LOG_CLEANER_ENABLE" ] && LOG_CLEANER_ENABLE_="# "
	[ -z "$KAFKA_LOG_CLEANER_IO_BUFFER_LOAD_FACTOR" ] && LOG_CLEANER_IO_BUFFER_LOAD_FACTOR_="# "
	[ -z "$KAFKA_LOG_CLEANER_IO_BUFFER_SIZE" ] && LOG_CLEANER_IO_BUFFER_SIZE_="# "
	[ -z "$KAFKA_LOG_CLEANER_IO_MAX_BYTES_PER_SECOND" ] && LOG_CLEANER_IO_MAX_BYTES_PER_SECOND_="# "
	[ -z "$KAFKA_LOG_CLEANER_MIN_CLEANABLE_RATIO" ] && LOG_CLEANER_MIN_CLEANABLE_RATIO_="# "
	[ -z "$KAFKA_LOG_CLEANER_MIN_COMPACTION_LAG_MS" ] && LOG_CLEANER_MIN_COMPACTION_LAG_MS_="# "
	[ -z "$KAFKA_LOG_CLEANER_THREADS" ] && LOG_CLEANER_THREADS_="# "
	[ -z "$KAFKA_LOG_CLEANUP_POLICY" ] && LOG_CLEANUP_POLICY_="# "
	[ -z "$KAFKA_LOG_INDEX_INTERVAL_BYTES" ] && LOG_INDEX_INTERVAL_BYTES_="# "
	[ -z "$KAFKA_LOG_INDEX_SIZE_MAX_BYTES" ] && LOG_INDEX_SIZE_MAX_BYTES_="# "
	[ -z "$KAFKA_LOG_MESSAGE_FORMAT_VERSION" ] && LOG_MESSAGE_FORMAT_VERSION_="# "
	[ -z "$KAFKA_LOG_MESSAGE_TIMESTAMP_DIFFERENCE_MAX_MS" ] && LOG_MESSAGE_TIMESTAMP_DIFFERENCE_MAX_MS_="# "
	[ -z "$KAFKA_LOG_MESSAGE_TIMESTAMP_TYPE" ] && LOG_MESSAGE_TIMESTAMP_TYPE_="# "
	[ -z "$KAFKA_LOG_PREALLOCATE" ] && LOG_PREALLOCATE_="# "
	[ -z "$KAFKA_LOG_RETENTION_CHECK_INTERVAL_MS" ] && LOG_RETENTION_CHECK_INTERVAL_MS_="# "
	[ -z "$KAFKA_MAX_CONNECTIONS_PER_IP" ] && MAX_CONNECTIONS_PER_IP_="# "
	[ -z "$KAFKA_MAX_CONNECTIONS_PER_IP_OVERRIDES" ] && MAX_CONNECTIONS_PER_IP_OVERRIDES_="# "
	[ -z "$KAFKA_NUM_PARTITIONS" ] && NUM_PARTITIONS_="# "
	[ -z "$KAFKA_PRINCIPAL_BUILDER_CLASS" ] && PRINCIPAL_BUILDER_CLASS_="# "
	[ -z "$KAFKA_PRODUCER_PURGATORY_PURGE_INTERVAL_REQUESTS" ] && PRODUCER_PURGATORY_PURGE_INTERVAL_REQUESTS_="# "
	[ -z "$KAFKA_REPLICA_FETCH_BACKOFF_MS" ] && REPLICA_FETCH_BACKOFF_MS_="# "
	[ -z "$KAFKA_REPLICA_FETCH_MAX_BYTES" ] && REPLICA_FETCH_MAX_BYTES_="# "
	[ -z "$KAFKA_REPLICA_FETCH_RESPONSE_MAX_BYTES" ] && REPLICA_FETCH_RESPONSE_MAX_BYTES_="# "
	[ -z "$KAFKA_RESERVED_BROKER_MAX_ID" ] && RESERVED_BROKER_MAX_ID_="# "
	[ -z "$KAFKA_SASL_ENABLED_MECHANISMS" ] && SASL_ENABLED_MECHANISMS_="# "
	[ -z "$KAFKA_SASL_KERBEROS_KINIT_CMD" ] && SASL_KERBEROS_KINIT_CMD_="# "
	[ -z "$KAFKA_SASL_KERBEROS_MIN_TIME_BEFORE_RELOGIN" ] && SASL_KERBEROS_MIN_TIME_BEFORE_RELOGIN_="# "
	[ -z "$KAFKA_SASL_KERBEROS_PRINCIPAL_TO_LOCAL_RULES" ] && SASL_KERBEROS_PRINCIPAL_TO_LOCAL_RULES_="# "
	[ -z "$KAFKA_SASL_KERBEROS_SERVICE_NAME" ] && SASL_KERBEROS_SERVICE_NAME_="# "
	[ -z "$KAFKA_SASL_KERBEROS_TICKET_RENEW_JITTER" ] && SASL_KERBEROS_TICKET_RENEW_JITTER_="# "
	[ -z "$KAFKA_SASL_KERBEROS_TICKET_RENEW_WINDOW_FACTOR" ] && SASL_KERBEROS_TICKET_RENEW_WINDOW_FACTOR_="# "
	[ -z "$KAFKA_SASL_MECHANISM_INTER_BROKER_PROTOCOL" ] && SASL_MECHANISM_INTER_BROKER_PROTOCOL_="# "
	[ -z "$KAFKA_SECURITY_INTER_BROKER_PROTOCOL" ] && SECURITY_INTER_BROKER_PROTOCOL_="# "
	[ -z "$KAFKA_SSL_CIPHER_SUITES" ] && SSL_CIPHER_SUITES_="# "
	[ -z "$KAFKA_SSL_CLIENT_AUTH" ] && SSL_CLIENT_AUTH_="# "
	[ -z "$KAFKA_SSL_ENABLED_PROTOCOLS" ] && SSL_ENABLED_PROTOCOLS_="# "
	[ -z "$KAFKA_SSL_KEY_PASSWORD" ] && SSL_KEY_PASSWORD_="# "
	[ -z "$KAFKA_SSL_KEYMANAGER_ALGORITHM" ] && SSL_KEYMANAGER_ALGORITHM_="# "
	[ -z "$KAFKA_SSL_KEYSTORE_LOCATION" ] && SSL_KEYSTORE_LOCATION_="# "
	[ -z "$KAFKA_SSL_KEYSTORE_PASSWORD" ] && SSL_KEYSTORE_PASSWORD_="# "
	[ -z "$KAFKA_SSL_KEYSTORE_TYPE" ] && SSL_KEYSTORE_TYPE_="# "
	[ -z "$KAFKA_SSL_PROTOCOL" ] && SSL_PROTOCOL_="# "
	[ -z "$KAFKA_SSL_PROVIDER" ] && SSL_PROVIDER_="# "
	[ -z "$KAFKA_SSL_TRUSTMANAGER_ALGORITHM" ] && SSL_TRUSTMANAGER_ALGORITHM_="# "
	[ -z "$KAFKA_SSL_TRUSTSTORE_LOCATION" ] && SSL_TRUSTSTORE_LOCATION_="# "
	[ -z "$KAFKA_SSL_TRUSTSTORE_PASSWORD" ] && SSL_TRUSTSTORE_PASSWORD_="# "
	[ -z "$KAFKA_SSL_TRUSTSTORE_TYPE" ] && SSL_TRUSTSTORE_TYPE_="# "
	[ -z "$KAFKA_AUTHORIZER_CLASS_NAME" ] && AUTHORIZER_CLASS_NAME_="# "
	[ -z "$KAFKA_CREATE_TOPIC_POLICY_CLASS_NAME" ] && CREATE_TOPIC_POLICY_CLASS_NAME_="# "
	[ -z "$KAFKA_LISTENER_SECURITY_PROTOCOL_MAP" ] && LISTENER_SECURITY_PROTOCOL_MAP_="# "
	[ -z "$KAFKA_METRIC_REPORTERS" ] && METRIC_REPORTERS_="# "
	[ -z "$KAFKA_METRICS_NUM_SAMPLES" ] && METRICS_NUM_SAMPLES_="# "
	[ -z "$KAFKA_METRICS_RECORDING_LEVEL" ] && METRICS_RECORDING_LEVEL_="# "
	[ -z "$KAFKA_METRICS_SAMPLE_WINDOW_MS" ] && METRICS_SAMPLE_WINDOW_MS_="# "
	[ -z "$KAFKA_QUOTA_WINDOW_NUM" ] && QUOTA_WINDOW_NUM_="# "
	[ -z "$KAFKA_QUOTA_WINDOW_SIZE_SECONDS" ] && QUOTA_WINDOW_SIZE_SECONDS_="# "
	[ -z "$KAFKA_REPLICATION_QUOTA_WINDOW_NUM" ] && REPLICATION_QUOTA_WINDOW_NUM_="# "
	[ -z "$KAFKA_REPLICATION_QUOTA_WINDOW_SIZE_SECONDS" ] && REPLICATION_QUOTA_WINDOW_SIZE_SECONDS_="# "
	[ -z "$KAFKA_SSL_ENDPOINT_IDENTIFICATION_ALGORITHM" ] && SSL_ENDPOINT_IDENTIFICATION_ALGORITHM_="# "
	[ -z "$KAFKA_SSL_SECURE_RANDOM_IMPLEMENTATION" ] && SSL_SECURE_RANDOM_IMPLEMENTATION_="# "
	[ -z "$KAFKA_ZOOKEEPER_SYNC_TIME_MS" ] && ZOOKEEPER_SYNC_TIME_MS_="# "

	cat /kafka/config/server.properties.template | sed \
	-e "s|{{ADVERTISED_LISTENERS}}|${KAFKA_ADVERTISED_LISTENERS:-$IP:9092}|g" \
    -e "s|{{INTER_BROKER_PROTOCOL_VERSION}}|${KAFKA_INTER_BROKER_PROTOCOL_VERSION:-$KAFKA_VERSION}|g" \
    -e "s|{{LOG_MESSAGE_FORMAT_VERSION}}|${KAFKA_LOG_MESSAGE_FORMAT_VERSION:-$KAFKA_VERSION}|g" \
    -e "s|{{ZOOKEEPER_CONNECT}}|${KAFKA_ZOOKEEPER_CONNECT:-}|g" \
    -e "s|{{AUTO_CREATE_TOPICS_ENABLE}}|${KAFKA_AUTO_CREATE_TOPICS_ENABLE:-true}|g" \
    -e "s|{{AUTO_LEADER_REBALANCE_ENABLE}}|${KAFKA_AUTO_LEADER_REBALANCE_ENABLE:-true}|g" \
    -e "s|{{BACKGROUND_THREADS}}|${KAFKA_BACKGROUND_THREADS:-10}|g" \
    -e "s|{{BROKER_ID}}|${KAFKA_BROKER_ID:--1}|g" \
    -e "s|{{COMPRESSION_TYPE}}|${KAFKA_COMPRESSION_TYPE:-producer}|g" \
    -e "s|{{DELETE_TOPIC_ENABLE}}|${KAFKA_DELETE_TOPIC_ENABLE:-false}|g" \
    -e "s|{{LEADER_IMBALANCE_CHECK_INTERVAL_SECONDS}}|${KAFKA_LEADER_IMBALANCE_CHECK_INTERVAL_SECONDS:-300}|g" \
    -e "s|{{LEADER_IMBALANCE_PER_BROKER_PERCENTAGE}}|${KAFKA_LEADER_IMBALANCE_PER_BROKER_PERCENTAGE:-10}|g" \
    -e "s|{{LISTENERS}}|${KAFKA_LISTENERS:-null}|g" \
    -e "s|{{LOG_DIR}}|${KAFKA_LOG_DIR:-/tmp/kafka-logs}|g" \
    -e "s|{{LOG_DIRS}}|${KAFKA_LOG_DIRS:-null}|g" \
    -e "s|{{LOG_FLUSH_INTERVAL_MESSAGES}}|${KAFKA_LOG_FLUSH_INTERVAL_MESSAGES:-9223372036854775807}|g" \
    -e "s|{{LOG_FLUSH_INTERVAL_MS}}|${KAFKA_LOG_FLUSH_INTERVAL_MS:-9223372036854775807}|g" \
    -e "s|{{LOG_FLUSH_OFFSET_CHECKPOINT_INTERVAL_MS}}|${KAFKA_LOG_FLUSH_OFFSET_CHECKPOINT_INTERVAL_MS:-60000}|g" \
    -e "s|{{LOG_FLUSH_SCHEDULER_INTERVAL_MS}}|${KAFKA_LOG_FLUSH_SCHEDULER_INTERVAL_MS:-9223372036854775807}|g" \
    -e "s|{{LOG_RETENTION_BYTES}}|${KAFKA_LOG_RETENTION_BYTES:--1}|g" \
    -e "s|{{LOG_RETENTION_HOURS}}|${KAFKA_LOG_RETENTION_HOURS:-168}|g" \
    -e "s|{{LOG_RETENTION_MINUTES}}|${KAFKA_LOG_RETENTION_MINUTES:-null}|g" \
    -e "s|{{LOG_RETENTION_MS}}|${KAFKA_LOG_RETENTION_MS:-null}|g" \
    -e "s|{{LOG_ROLL_HOURS}}|${KAFKA_LOG_ROLL_HOURS:-168}|g" \
    -e "s|{{LOG_ROLL_JITTER_HOURS}}|${KAFKA_LOG_ROLL_JITTER_HOURS:-0}|g" \
    -e "s|{{LOG_ROLL_JITTER_MS}}|${KAFKA_LOG_ROLL_JITTER_MS:-null}|g" \
    -e "s|{{LOG_ROLL_MS}}|${KAFKA_LOG_ROLL_MS:-null}|g" \
    -e "s|{{LOG_SEGMENT_BYTES}}|${KAFKA_LOG_SEGMENT_BYTES:-1073741824}|g" \
    -e "s|{{LOG_SEGMENT_DELETE_DELAY_MS}}|${KAFKA_LOG_SEGMENT_DELETE_DELAY_MS:-60000}|g" \
    -e "s|{{MESSAGE_MAX_BYTES}}|${KAFKA_MESSAGE_MAX_BYTES:-1000012}|g" \
    -e "s|{{MIN_INSYNC_REPLICAS}}|${KAFKA_MIN_INSYNC_REPLICAS:-1}|g" \
    -e "s|{{NUM_IO_THREADS}}|${KAFKA_NUM_IO_THREADS:-8}|g" \
    -e "s|{{NUM_NETWORK_THREADS}}|${KAFKA_NUM_NETWORK_THREADS:-3}|g" \
    -e "s|{{NUM_RECOVERY_THREADS_PER_DATA_DIR}}|${KAFKA_NUM_RECOVERY_THREADS_PER_DATA_DIR:-1}|g" \
    -e "s|{{NUM_REPLICA_FETCHERS}}|${KAFKA_NUM_REPLICA_FETCHERS:-1}|g" \
    -e "s|{{OFFSET_METADATA_MAX_BYTES}}|${KAFKA_OFFSET_METADATA_MAX_BYTES:-4096}|g" \
    -e "s|{{OFFSETS_COMMIT_REQUIRED_ACKS}}|${KAFKA_OFFSETS_COMMIT_REQUIRED_ACKS:--1}|g" \
    -e "s|{{OFFSETS_COMMIT_TIMEOUT_MS}}|${KAFKA_OFFSETS_COMMIT_TIMEOUT_MS:-5000}|g" \
    -e "s|{{OFFSETS_LOAD_BUFFER_SIZE}}|${KAFKA_OFFSETS_LOAD_BUFFER_SIZE:-5242880}|g" \
    -e "s|{{OFFSETS_RETENTION_CHECK_INTERVAL_MS}}|${KAFKA_OFFSETS_RETENTION_CHECK_INTERVAL_MS:-600000}|g" \
    -e "s|{{OFFSETS_RETENTION_MINUTES}}|${KAFKA_OFFSETS_RETENTION_MINUTES:-1440}|g" \
    -e "s|{{OFFSETS_TOPIC_COMPRESSION_CODEC}}|${KAFKA_OFFSETS_TOPIC_COMPRESSION_CODEC:-0}|g" \
    -e "s|{{OFFSETS_TOPIC_NUM_PARTITIONS}}|${KAFKA_OFFSETS_TOPIC_NUM_PARTITIONS:-50}|g" \
    -e "s|{{OFFSETS_TOPIC_REPLICATION_FACTOR}}|${KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR:-3}|g" \
    -e "s|{{OFFSETS_TOPIC_SEGMENT_BYTES}}|${KAFKA_OFFSETS_TOPIC_SEGMENT_BYTES:-104857600}|g" \
    -e "s|{{QUEUED_MAX_REQUESTS}}|${KAFKA_QUEUED_MAX_REQUESTS:-500}|g" \
    -e "s|{{REPLICA_FETCH_MIN_BYTES}}|${KAFKA_REPLICA_FETCH_MIN_BYTES:-1}|g" \
    -e "s|{{REPLICA_FETCH_WAIT_MAX_MS}}|${KAFKA_REPLICA_FETCH_WAIT_MAX_MS:-500}|g" \
    -e "s|{{REPLICA_HIGH_WATERMARK_CHECKPOINT_INTERVAL_MS}}|${KAFKA_REPLICA_HIGH_WATERMARK_CHECKPOINT_INTERVAL_MS:-5000}|g" \
    -e "s|{{REPLICA_LAG_TIME_MAX_MS}}|${KAFKA_REPLICA_LAG_TIME_MAX_MS:-10000}|g" \
    -e "s|{{REPLICA_SOCKET_RECEIVE_BUFFER_BYTES}}|${KAFKA_REPLICA_SOCKET_RECEIVE_BUFFER_BYTES:-65536}|g" \
    -e "s|{{REPLICA_SOCKET_TIMEOUT_MS}}|${KAFKA_REPLICA_SOCKET_TIMEOUT_MS:-30000}|g" \
    -e "s|{{REQUEST_TIMEOUT_MS}}|${KAFKA_REQUEST_TIMEOUT_MS:-30000}|g" \
    -e "s|{{SOCKET_RECEIVE_BUFFER_BYTES}}|${KAFKA_SOCKET_RECEIVE_BUFFER_BYTES:-102400}|g" \
    -e "s|{{SOCKET_REQUEST_MAX_BYTES}}|${KAFKA_SOCKET_REQUEST_MAX_BYTES:-104857600}|g" \
    -e "s|{{SOCKET_SEND_BUFFER_BYTES}}|${KAFKA_SOCKET_SEND_BUFFER_BYTES:-102400}|g" \
    -e "s|{{UNCLEAN_LEADER_ELECTION_ENABLE}}|${KAFKA_UNCLEAN_LEADER_ELECTION_ENABLE:-true}|g" \
    -e "s|{{ZOOKEEPER_CONNECTION_TIMEOUT_MS}}|${KAFKA_ZOOKEEPER_CONNECTION_TIMEOUT_MS:-null}|g" \
    -e "s|{{ZOOKEEPER_SESSION_TIMEOUT_MS}}|${KAFKA_ZOOKEEPER_SESSION_TIMEOUT_MS:-6000}|g" \
    -e "s|{{ZOOKEEPER_SET_ACL}}|${KAFKA_ZOOKEEPER_SET_ACL:-false}|g" \
    -e "s|{{BROKER_ID_GENERATION_ENABLE}}|${KAFKA_BROKER_ID_GENERATION_ENABLE:-true}|g" \
    -e "s|{{BROKER_RACK}}|${KAFKA_BROKER_RACK:-null}|g" \
    -e "s|{{CONNECTIONS_MAX_IDLE_MS}}|${KAFKA_CONNECTIONS_MAX_IDLE_MS:-600000}|g" \
    -e "s|{{CONTROLLED_SHUTDOWN_ENABLE}}|${KAFKA_CONTROLLED_SHUTDOWN_ENABLE:-true}|g" \
    -e "s|{{CONTROLLED_SHUTDOWN_MAX_RETRIES}}|${KAFKA_CONTROLLED_SHUTDOWN_MAX_RETRIES:-3}|g" \
    -e "s|{{CONTROLLED_SHUTDOWN_RETRY_BACKOFF_MS}}|${KAFKA_CONTROLLED_SHUTDOWN_RETRY_BACKOFF_MS:-5000}|g" \
    -e "s|{{CONTROLLER_SOCKET_TIMEOUT_MS}}|${KAFKA_CONTROLLER_SOCKET_TIMEOUT_MS:-30000}|g" \
    -e "s|{{DEFAULT_REPLICATION_FACTOR}}|${KAFKA_DEFAULT_REPLICATION_FACTOR:-1000}|g" \
    -e "s|{{FETCH_PURGATORY_PURGE_INTERVAL_REQUESTS}}|${KAFKA_FETCH_PURGATORY_PURGE_INTERVAL_REQUESTS:-1000}|g" \
    -e "s|{{GROUP_MAX_SESSION_TIMEOUT_MS}}|${KAFKA_GROUP_MAX_SESSION_TIMEOUT_MS:-300000}|g" \
    -e "s|{{GROUP_MIN_SESSION_TIMEOUT_MS}}|${KAFKA_GROUP_MIN_SESSION_TIMEOUT_MS:-6000}|g" \
    -e "s|{{INTER_BROKER_LISTENER_NAME}}|${KAFKA_INTER_BROKER_LISTENER_NAME:-null}|g" \
    -e "s|{{LOG_CLEANER_BACKOFF_MS}}|${KAFKA_LOG_CLEANER_BACKOFF_MS:-15000}|g" \
    -e "s|{{LOG_CLEANER_DEDUPE_BUFFER_SIZE}}|${KAFKA_LOG_CLEANER_DEDUPE_BUFFER_SIZE:-134217728}|g" \
    -e "s|{{LOG_CLEANER_DELETE_RETENTION_MS}}|${KAFKA_LOG_CLEANER_DELETE_RETENTION_MS:-86400000}|g" \
    -e "s|{{LOG_CLEANER_ENABLE}}|${KAFKA_LOG_CLEANER_ENABLE:-true}|g" \
    -e "s|{{LOG_CLEANER_IO_BUFFER_LOAD_FACTOR}}|${KAFKA_LOG_CLEANER_IO_BUFFER_LOAD_FACTOR:-0.9}|g" \
    -e "s|{{LOG_CLEANER_IO_BUFFER_SIZE}}|${KAFKA_LOG_CLEANER_IO_BUFFER_SIZE:-5247288}|g" \
    -e "s|{{LOG_CLEANER_IO_MAX_BYTES_PER_SECOND}}|${KAFKA_LOG_CLEANER_IO_MAX_BYTES_PER_SECOND:-1.7976931348623157E308}|g" \
    -e "s|{{LOG_CLEANER_MIN_CLEANABLE_RATIO}}|${KAFKA_LOG_CLEANER_MIN_CLEANABLE_RATIO:-0.5}|g" \
    -e "s|{{LOG_CLEANER_MIN_COMPACTION_LAG_MS}}|${KAFKA_LOG_CLEANER_MIN_COMPACTION_LAG_MS:-0}|g" \
    -e "s|{{LOG_CLEANER_THREADS}}|${KAFKA_LOG_CLEANER_THREADS:-1}|g" \
    -e "s|{{LOG_CLEANUP_POLICY}}|${KAFKA_LOG_CLEANUP_POLICY:-delete}|g" \
    -e "s|{{LOG_INDEX_INTERVAL_BYTES}}|${KAFKA_LOG_INDEX_INTERVAL_BYTES:-4096}|g" \
    -e "s|{{LOG_INDEX_SIZE_MAX_BYTES}}|${KAFKA_LOG_INDEX_SIZE_MAX_BYTES:-10485760}|g" \
    -e "s|{{LOG_MESSAGE_TIMESTAMP_DIFFERENCE_MAX_MS}}|${KAFKA_LOG_MESSAGE_TIMESTAMP_DIFFERENCE_MAX_MS:-9223372036854775807}|g" \
    -e "s|{{LOG_MESSAGE_TIMESTAMP_TYPE}}|${KAFKA_LOG_MESSAGE_TIMESTAMP_TYPE:-CreateTime}|g" \
    -e "s|{{LOG_PREALLOCATE}}|${KAFKA_LOG_PREALLOCATE:-false}|g" \
    -e "s|{{LOG_RETENTION_CHECK_INTERVAL_MS}}|${KAFKA_LOG_RETENTION_CHECK_INTERVAL_MS:-300000}|g" \
    -e "s|{{MAX_CONNECTIONS_PER_IP}}|${KAFKA_MAX_CONNECTIONS_PER_IP:-2147483647}|g" \
    -e "s|{{MAX_CONNECTIONS_PER_IP_OVERRIDES}}|${KAFKA_MAX_CONNECTIONS_PER_IP_OVERRIDES:-\"\"}|g" \
    -e "s|{{NUM_PARTITIONS}}|${KAFKA_NUM_PARTITIONS:-1}|g" \
    -e "s|{{PRINCIPAL_BUILDER_CLASS}}|${KAFKA_PRINCIPAL_BUILDER_CLASS:-org.apache.kafka.common.security.auth.DefaultPrincipalBuilder}|g" \
    -e "s|{{PRODUCER_PURGATORY_PURGE_INTERVAL_REQUESTS}}|${KAFKA_PRODUCER_PURGATORY_PURGE_INTERVAL_REQUESTS:-1000}|g" \
    -e "s|{{REPLICA_FETCH_BACKOFF_MS}}|${KAFKA_REPLICA_FETCH_BACKOFF_MS:-1000}|g" \
    -e "s|{{REPLICA_FETCH_MAX_BYTES}}|${KAFKA_REPLICA_FETCH_MAX_BYTES:-1048576}|g" \
    -e "s|{{REPLICA_FETCH_RESPONSE_MAX_BYTES}}|${KAFKA_REPLICA_FETCH_RESPONSE_MAX_BYTES:-10485760}|g" \
    -e "s|{{RESERVED_BROKER_MAX_ID}}|${KAFKA_RESERVED_BROKER_MAX_ID:-1000}|g" \
    -e "s|{{SASL_ENABLED_MECHANISMS}}|${KAFKA_SASL_ENABLED_MECHANISMS:-GSSAPI}|g" \
    -e "s|{{SASL_KERBEROS_KINIT_CMD}}|${KAFKA_SASL_KERBEROS_KINIT_CMD:-/usr/bin/kinit	medium}|g" \
    -e "s|{{SASL_KERBEROS_MIN_TIME_BEFORE_RELOGIN}}|${KAFKA_SASL_KERBEROS_MIN_TIME_BEFORE_RELOGIN:-60000}|g" \
    -e "s|{{SASL_KERBEROS_PRINCIPAL_TO_LOCAL_RULES}}|${KAFKA_SASL_KERBEROS_PRINCIPAL_TO_LOCAL_RULES:-DEFAULT}|g" \
    -e "s|{{SASL_KERBEROS_SERVICE_NAME}}|${KAFKA_SASL_KERBEROS_SERVICE_NAME:-null}|g" \
    -e "s|{{SASL_KERBEROS_TICKET_RENEW_JITTER}}|${KAFKA_SASL_KERBEROS_TICKET_RENEW_JITTER:-0.05}|g" \
    -e "s|{{SASL_KERBEROS_TICKET_RENEW_WINDOW_FACTOR}}|${KAFKA_SASL_KERBEROS_TICKET_RENEW_WINDOW_FACTOR:-0.8}|g" \
    -e "s|{{SASL_MECHANISM_INTER_BROKER_PROTOCOL}}|${KAFKA_SASL_MECHANISM_INTER_BROKER_PROTOCOL:-GSSAPI}|g" \
    -e "s|{{SECURITY_INTER_BROKER_PROTOCOL}}|${KAFKA_SECURITY_INTER_BROKER_PROTOCOL:-PLAINTEXT}|g" \
    -e "s|{{SSL_CIPHER_SUITES}}|${KAFKA_SSL_CIPHER_SUITES:-null}|g" \
    -e "s|{{SSL_CLIENT_AUTH}}|${KAFKA_SSL_CLIENT_AUTH:-none}|g" \
    -e "s|{{SSL_ENABLED_PROTOCOLS}}|${KAFKA_SSL_ENABLED_PROTOCOLS:-TLSv1.2,TLSv1.1,TLSv1}|g" \
    -e "s|{{SSL_KEY_PASSWORD}}|${KAFKA_SSL_KEY_PASSWORD:-null}|g" \
    -e "s|{{SSL_KEYMANAGER_ALGORITHM}}|${KAFKA_SSL_KEYMANAGER_ALGORITHM:-SunX509}|g" \
    -e "s|{{SSL_KEYSTORE_LOCATION}}|${KAFKA_SSL_KEYSTORE_LOCATION:-null}|g" \
    -e "s|{{SSL_KEYSTORE_PASSWORD}}|${KAFKA_SSL_KEYSTORE_PASSWORD:-null}|g" \
    -e "s|{{SSL_KEYSTORE_TYPE}}|${KAFKA_SSL_KEYSTORE_TYPE:-JKS}|g" \
    -e "s|{{SSL_PROTOCOL}}|${KAFKA_SSL_PROTOCOL:-TLS}|g" \
    -e "s|{{SSL_PROVIDER}}|${KAFKA_SSL_PROVIDER:-null}|g" \
    -e "s|{{SSL_TRUSTMANAGER_ALGORITHM}}|${KAFKA_SSL_TRUSTMANAGER_ALGORITHM:-PKIX}|g" \
    -e "s|{{SSL_TRUSTSTORE_LOCATION}}|${KAFKA_SSL_TRUSTSTORE_LOCATION:-null}|g" \
    -e "s|{{SSL_TRUSTSTORE_PASSWORD}}|${KAFKA_SSL_TRUSTSTORE_PASSWORD:-}|g" \
    -e "s|{{SSL_TRUSTSTORE_TYPE}}|${KAFKA_SSL_TRUSTSTORE_TYPE:-JKS}|g" \
    -e "s|{{AUTHORIZER_CLASS_NAME}}|${KAFKA_AUTHORIZER_CLASS_NAME:-\"\"}|g" \
    -e "s|{{CREATE_TOPIC_POLICY_CLASS_NAME}}|${KAFKA_CREATE_TOPIC_POLICY_CLASS_NAME:-null}|g" \
    -e "s|{{LISTENER_SECURITY_PROTOCOL_MAP}}|${KAFKA_LISTENER_SECURITY_PROTOCOL_MAP:-SSL:SSL,SASL_PLAINTEXT:SASL_PLAINTEXT,TRACE:TRACE,SASL_SSL:SASL_SSL,PLAINTEXT:PLAINTEXT}|g" \
    -e "s|{{METRIC_REPORTERS}}|${KAFKA_METRIC_REPORTERS:-\"\"}|g" \
    -e "s|{{METRICS_NUM_SAMPLES}}|${KAFKA_METRICS_NUM_SAMPLES:-2}|g" \
    -e "s|{{METRICS_RECORDING_LEVEL}}|${KAFKA_METRICS_RECORDING_LEVEL:-INFO}|g" \
    -e "s|{{METRICS_SAMPLE_WINDOW_MS}}|${KAFKA_METRICS_SAMPLE_WINDOW_MS:-30000}|g" \
    -e "s|{{QUOTA_WINDOW_NUM}}|${KAFKA_QUOTA_WINDOW_NUM:-11}|g" \
    -e "s|{{QUOTA_WINDOW_SIZE_SECONDS}}|${KAFKA_QUOTA_WINDOW_SIZE_SECONDS:-1}|g" \
    -e "s|{{REPLICATION_QUOTA_WINDOW_NUM}}|${KAFKA_REPLICATION_QUOTA_WINDOW_NUM:-11}|g" \
    -e "s|{{REPLICATION_QUOTA_WINDOW_SIZE_SECONDS}}|${KAFKA_REPLICATION_QUOTA_WINDOW_SIZE_SECONDS:-1}|g" \
    -e "s|{{SSL_ENDPOINT_IDENTIFICATION_ALGORITHM}}|${KAFKA_SSL_ENDPOINT_IDENTIFICATION_ALGORITHM:-null}|g" \
    -e "s|{{SSL_SECURE_RANDOM_IMPLEMENTATION}}|${KAFKA_SSL_SECURE_RANDOM_IMPLEMENTATION:-null}|g" \
    -e "s|{{ZOOKEEPER_SYNC_TIME_MS}}|${KAFKA_ZOOKEEPER_SYNC_TIME_MS:-2000}|g" \
	\
    -e "s|{{ZOOKEEPER_CONNECT_}}|${ZOOKEEPER_CONNECT_:-}|g" \
    -e "s|{{ADVERTISED_LISTENERS_}}|${ADVERTISED_LISTENERS_:-}|g" \
    -e "s|{{AUTO_CREATE_TOPICS_ENABLE_}}|${AUTO_CREATE_TOPICS_ENABLE_:-}|g" \
    -e "s|{{AUTO_LEADER_REBALANCE_ENABLE_}}|${AUTO_LEADER_REBALANCE_ENABLE_:-}|g" \
    -e "s|{{BACKGROUND_THREADS_}}|${BACKGROUND_THREADS_:-}|g" \
    -e "s|{{BROKER_ID_}}|${BROKER_ID_:-}|g" \
    -e "s|{{COMPRESSION_TYPE_}}|${COMPRESSION_TYPE_:-}|g" \
    -e "s|{{DELETE_TOPIC_ENABLE_}}|${DELETE_TOPIC_ENABLE_:-}|g" \
    -e "s|{{LEADER_IMBALANCE_CHECK_INTERVAL_SECONDS_}}|${LEADER_IMBALANCE_CHECK_INTERVAL_SECONDS_:-}|g" \
    -e "s|{{LEADER_IMBALANCE_PER_BROKER_PERCENTAGE_}}|${LEADER_IMBALANCE_PER_BROKER_PERCENTAGE_:-}|g" \
    -e "s|{{LISTENERS_}}|${LISTENERS_:-}|g" \
    -e "s|{{LOG_DIR_}}|${LOG_DIR_:-}|g" \
    -e "s|{{LOG_DIRS_}}|${LOG_DIRS_:-}|g" \
    -e "s|{{LOG_FLUSH_INTERVAL_MESSAGES_}}|${LOG_FLUSH_INTERVAL_MESSAGES_:-}|g" \
    -e "s|{{LOG_FLUSH_INTERVAL_MS_}}|${LOG_FLUSH_INTERVAL_MS_:-}|g" \
    -e "s|{{LOG_FLUSH_OFFSET_CHECKPOINT_INTERVAL_MS_}}|${LOG_FLUSH_OFFSET_CHECKPOINT_INTERVAL_MS_:-}|g" \
    -e "s|{{LOG_FLUSH_SCHEDULER_INTERVAL_MS_}}|${LOG_FLUSH_SCHEDULER_INTERVAL_MS_:-}|g" \
    -e "s|{{LOG_RETENTION_BYTES_}}|${LOG_RETENTION_BYTES_:-}|g" \
    -e "s|{{LOG_RETENTION_HOURS_}}|${LOG_RETENTION_HOURS_:-}|g" \
    -e "s|{{LOG_RETENTION_MINUTES_}}|${LOG_RETENTION_MINUTES_:-}|g" \
    -e "s|{{LOG_RETENTION_MS_}}|${LOG_RETENTION_MS_:-}|g" \
    -e "s|{{LOG_ROLL_HOURS_}}|${LOG_ROLL_HOURS_:-}|g" \
    -e "s|{{LOG_ROLL_JITTER_HOURS_}}|${LOG_ROLL_JITTER_HOURS_:-}|g" \
    -e "s|{{LOG_ROLL_JITTER_MS_}}|${LOG_ROLL_JITTER_MS_:-}|g" \
    -e "s|{{LOG_ROLL_MS_}}|${LOG_ROLL_MS_:-}|g" \
    -e "s|{{LOG_SEGMENT_BYTES_}}|${LOG_SEGMENT_BYTES_:-}|g" \
    -e "s|{{LOG_SEGMENT_DELETE_DELAY_MS_}}|${LOG_SEGMENT_DELETE_DELAY_MS_:-}|g" \
    -e "s|{{MESSAGE_MAX_BYTES_}}|${MESSAGE_MAX_BYTES_:-}|g" \
    -e "s|{{MIN_INSYNC_REPLICAS_}}|${MIN_INSYNC_REPLICAS_:-}|g" \
    -e "s|{{NUM_IO_THREADS_}}|${NUM_IO_THREADS_:-}|g" \
    -e "s|{{NUM_NETWORK_THREADS_}}|${NUM_NETWORK_THREADS_:-}|g" \
    -e "s|{{NUM_RECOVERY_THREADS_PER_DATA_DIR_}}|${NUM_RECOVERY_THREADS_PER_DATA_DIR_:-}|g" \
    -e "s|{{NUM_REPLICA_FETCHERS_}}|${NUM_REPLICA_FETCHERS_:-}|g" \
    -e "s|{{OFFSET_METADATA_MAX_BYTES_}}|${OFFSET_METADATA_MAX_BYTES_:-}|g" \
    -e "s|{{OFFSETS_COMMIT_REQUIRED_ACKS_}}|${OFFSETS_COMMIT_REQUIRED_ACKS_:-}|g" \
    -e "s|{{OFFSETS_COMMIT_TIMEOUT_MS_}}|${OFFSETS_COMMIT_TIMEOUT_MS_:-}|g" \
    -e "s|{{OFFSETS_LOAD_BUFFER_SIZE_}}|${OFFSETS_LOAD_BUFFER_SIZE_:-}|g" \
    -e "s|{{OFFSETS_RETENTION_CHECK_INTERVAL_MS_}}|${OFFSETS_RETENTION_CHECK_INTERVAL_MS_:-}|g" \
    -e "s|{{OFFSETS_RETENTION_MINUTES_}}|${OFFSETS_RETENTION_MINUTES_:-}|g" \
    -e "s|{{OFFSETS_TOPIC_COMPRESSION_CODEC_}}|${OFFSETS_TOPIC_COMPRESSION_CODEC_:-}|g" \
    -e "s|{{OFFSETS_TOPIC_NUM_PARTITIONS_}}|${OFFSETS_TOPIC_NUM_PARTITIONS_:-}|g" \
    -e "s|{{OFFSETS_TOPIC_REPLICATION_FACTOR_}}|${OFFSETS_TOPIC_REPLICATION_FACTOR_:-}|g" \
    -e "s|{{OFFSETS_TOPIC_SEGMENT_BYTES_}}|${OFFSETS_TOPIC_SEGMENT_BYTES_:-}|g" \
    -e "s|{{QUEUED_MAX_REQUESTS_}}|${QUEUED_MAX_REQUESTS_:-}|g" \
    -e "s|{{REPLICA_FETCH_MIN_BYTES_}}|${REPLICA_FETCH_MIN_BYTES_:-}|g" \
    -e "s|{{REPLICA_FETCH_WAIT_MAX_MS_}}|${REPLICA_FETCH_WAIT_MAX_MS_:-}|g" \
    -e "s|{{REPLICA_HIGH_WATERMARK_CHECKPOINT_INTERVAL_MS_}}|${REPLICA_HIGH_WATERMARK_CHECKPOINT_INTERVAL_MS_:-}|g" \
    -e "s|{{REPLICA_LAG_TIME_MAX_MS_}}|${REPLICA_LAG_TIME_MAX_MS_:-}|g" \
    -e "s|{{REPLICA_SOCKET_RECEIVE_BUFFER_BYTES_}}|${REPLICA_SOCKET_RECEIVE_BUFFER_BYTES_:-}|g" \
    -e "s|{{REPLICA_SOCKET_TIMEOUT_MS_}}|${REPLICA_SOCKET_TIMEOUT_MS_:-}|g" \
    -e "s|{{REQUEST_TIMEOUT_MS_}}|${REQUEST_TIMEOUT_MS_:-}|g" \
    -e "s|{{SOCKET_RECEIVE_BUFFER_BYTES_}}|${SOCKET_RECEIVE_BUFFER_BYTES_:-}|g" \
    -e "s|{{SOCKET_REQUEST_MAX_BYTES_}}|${SOCKET_REQUEST_MAX_BYTES_:-}|g" \
    -e "s|{{SOCKET_SEND_BUFFER_BYTES_}}|${SOCKET_SEND_BUFFER_BYTES_:-}|g" \
    -e "s|{{UNCLEAN_LEADER_ELECTION_ENABLE_}}|${UNCLEAN_LEADER_ELECTION_ENABLE_:-}|g" \
    -e "s|{{ZOOKEEPER_CONNECTION_TIMEOUT_MS_}}|${ZOOKEEPER_CONNECTION_TIMEOUT_MS_:-}|g" \
    -e "s|{{ZOOKEEPER_SESSION_TIMEOUT_MS_}}|${ZOOKEEPER_SESSION_TIMEOUT_MS_:-}|g" \
    -e "s|{{ZOOKEEPER_SET_ACL_}}|${ZOOKEEPER_SET_ACL_:-}|g" \
    -e "s|{{BROKER_ID_GENERATION_ENABLE_}}|${BROKER_ID_GENERATION_ENABLE_:-}|g" \
    -e "s|{{BROKER_RACK_}}|${BROKER_RACK_:-}|g" \
    -e "s|{{CONNECTIONS_MAX_IDLE_MS_}}|${CONNECTIONS_MAX_IDLE_MS_:-}|g" \
    -e "s|{{CONTROLLED_SHUTDOWN_ENABLE_}}|${CONTROLLED_SHUTDOWN_ENABLE_:-}|g" \
    -e "s|{{CONTROLLED_SHUTDOWN_MAX_RETRIES_}}|${CONTROLLED_SHUTDOWN_MAX_RETRIES_:-}|g" \
    -e "s|{{CONTROLLED_SHUTDOWN_RETRY_BACKOFF_MS_}}|${CONTROLLED_SHUTDOWN_RETRY_BACKOFF_MS_:-}|g" \
    -e "s|{{CONTROLLER_SOCKET_TIMEOUT_MS_}}|${CONTROLLER_SOCKET_TIMEOUT_MS_:-}|g" \
    -e "s|{{DEFAULT_REPLICATION_FACTOR_}}|${DEFAULT_REPLICATION_FACTOR_:-}|g" \
    -e "s|{{FETCH_PURGATORY_PURGE_INTERVAL_REQUESTS_}}|${FETCH_PURGATORY_PURGE_INTERVAL_REQUESTS_:-}|g" \
    -e "s|{{GROUP_MAX_SESSION_TIMEOUT_MS_}}|${GROUP_MAX_SESSION_TIMEOUT_MS_:-}|g" \
    -e "s|{{GROUP_MIN_SESSION_TIMEOUT_MS_}}|${GROUP_MIN_SESSION_TIMEOUT_MS_:-}|g" \
    -e "s|{{INTER_BROKER_LISTENER_NAME_}}|${INTER_BROKER_LISTENER_NAME_:-}|g" \
    -e "s|{{INTER_BROKER_PROTOCOL_VERSION_}}|${INTER_BROKER_PROTOCOL_VERSION_:-}|g" \
    -e "s|{{LOG_CLEANER_BACKOFF_MS_}}|${LOG_CLEANER_BACKOFF_MS_:-}|g" \
    -e "s|{{LOG_CLEANER_DEDUPE_BUFFER_SIZE_}}|${LOG_CLEANER_DEDUPE_BUFFER_SIZE_:-}|g" \
    -e "s|{{LOG_CLEANER_DELETE_RETENTION_MS_}}|${LOG_CLEANER_DELETE_RETENTION_MS_:-}|g" \
    -e "s|{{LOG_CLEANER_ENABLE_}}|${LOG_CLEANER_ENABLE_:-}|g" \
    -e "s|{{LOG_CLEANER_IO_BUFFER_LOAD_FACTOR_}}|${LOG_CLEANER_IO_BUFFER_LOAD_FACTOR_:-}|g" \
    -e "s|{{LOG_CLEANER_IO_BUFFER_SIZE_}}|${LOG_CLEANER_IO_BUFFER_SIZE_:-}|g" \
    -e "s|{{LOG_CLEANER_IO_MAX_BYTES_PER_SECOND_}}|${LOG_CLEANER_IO_MAX_BYTES_PER_SECOND_:-}|g" \
    -e "s|{{LOG_CLEANER_MIN_CLEANABLE_RATIO_}}|${LOG_CLEANER_MIN_CLEANABLE_RATIO_:-}|g" \
    -e "s|{{LOG_CLEANER_MIN_COMPACTION_LAG_MS_}}|${LOG_CLEANER_MIN_COMPACTION_LAG_MS_:-}|g" \
    -e "s|{{LOG_CLEANER_THREADS_}}|${LOG_CLEANER_THREADS_:-}|g" \
    -e "s|{{LOG_CLEANUP_POLICY_}}|${LOG_CLEANUP_POLICY_:-}|g" \
    -e "s|{{LOG_INDEX_INTERVAL_BYTES_}}|${LOG_INDEX_INTERVAL_BYTES_:-}|g" \
    -e "s|{{LOG_INDEX_SIZE_MAX_BYTES_}}|${LOG_INDEX_SIZE_MAX_BYTES_:-}|g" \
    -e "s|{{LOG_MESSAGE_FORMAT_VERSION_}}|${LOG_MESSAGE_FORMAT_VERSION_:-}|g" \
    -e "s|{{LOG_MESSAGE_TIMESTAMP_DIFFERENCE_MAX_MS_}}|${LOG_MESSAGE_TIMESTAMP_DIFFERENCE_MAX_MS_:-}|g" \
    -e "s|{{LOG_MESSAGE_TIMESTAMP_TYPE_}}|${LOG_MESSAGE_TIMESTAMP_TYPE_:-}|g" \
    -e "s|{{LOG_PREALLOCATE_}}|${LOG_PREALLOCATE_:-}|g" \
    -e "s|{{LOG_RETENTION_CHECK_INTERVAL_MS_}}|${LOG_RETENTION_CHECK_INTERVAL_MS_:-}|g" \
    -e "s|{{MAX_CONNECTIONS_PER_IP_}}|${MAX_CONNECTIONS_PER_IP_:-}|g" \
    -e "s|{{MAX_CONNECTIONS_PER_IP_OVERRIDES_}}|${MAX_CONNECTIONS_PER_IP_OVERRIDES_:-}|g" \
    -e "s|{{NUM_PARTITIONS_}}|${NUM_PARTITIONS_:-}|g" \
    -e "s|{{PRINCIPAL_BUILDER_CLASS_}}|${PRINCIPAL_BUILDER_CLASS_:-}|g" \
    -e "s|{{PRODUCER_PURGATORY_PURGE_INTERVAL_REQUESTS_}}|${PRODUCER_PURGATORY_PURGE_INTERVAL_REQUESTS_:-}|g" \
    -e "s|{{REPLICA_FETCH_BACKOFF_MS_}}|${REPLICA_FETCH_BACKOFF_MS_:-}|g" \
    -e "s|{{REPLICA_FETCH_MAX_BYTES_}}|${REPLICA_FETCH_MAX_BYTES_:-}|g" \
    -e "s|{{REPLICA_FETCH_RESPONSE_MAX_BYTES_}}|${REPLICA_FETCH_RESPONSE_MAX_BYTES_:-}|g" \
    -e "s|{{RESERVED_BROKER_MAX_ID_}}|${RESERVED_BROKER_MAX_ID_:-}|g" \
    -e "s|{{SASL_ENABLED_MECHANISMS_}}|${SASL_ENABLED_MECHANISMS_:-}|g" \
    -e "s|{{SASL_KERBEROS_KINIT_CMD_}}|${SASL_KERBEROS_KINIT_CMD_:-}|g" \
    -e "s|{{SASL_KERBEROS_MIN_TIME_BEFORE_RELOGIN_}}|${SASL_KERBEROS_MIN_TIME_BEFORE_RELOGIN_:-}|g" \
    -e "s|{{SASL_KERBEROS_PRINCIPAL_TO_LOCAL_RULES_}}|${SASL_KERBEROS_PRINCIPAL_TO_LOCAL_RULES_:-}|g" \
    -e "s|{{SASL_KERBEROS_SERVICE_NAME_}}|${SASL_KERBEROS_SERVICE_NAME_:-}|g" \
    -e "s|{{SASL_KERBEROS_TICKET_RENEW_JITTER_}}|${SASL_KERBEROS_TICKET_RENEW_JITTER_:-}|g" \
    -e "s|{{SASL_KERBEROS_TICKET_RENEW_WINDOW_FACTOR_}}|${SASL_KERBEROS_TICKET_RENEW_WINDOW_FACTOR_:-}|g" \
    -e "s|{{SASL_MECHANISM_INTER_BROKER_PROTOCOL_}}|${SASL_MECHANISM_INTER_BROKER_PROTOCOL_:-}|g" \
    -e "s|{{SECURITY_INTER_BROKER_PROTOCOL_}}|${SECURITY_INTER_BROKER_PROTOCOL_:-}|g" \
    -e "s|{{SSL_CIPHER_SUITES_}}|${SSL_CIPHER_SUITES_:-}|g" \
    -e "s|{{SSL_CLIENT_AUTH_}}|${SSL_CLIENT_AUTH_:-}|g" \
    -e "s|{{SSL_ENABLED_PROTOCOLS_}}|${SSL_ENABLED_PROTOCOLS_:-}|g" \
    -e "s|{{SSL_KEY_PASSWORD_}}|${SSL_KEY_PASSWORD_:-}|g" \
    -e "s|{{SSL_KEYMANAGER_ALGORITHM_}}|${SSL_KEYMANAGER_ALGORITHM_:-}|g" \
    -e "s|{{SSL_KEYSTORE_LOCATION_}}|${SSL_KEYSTORE_LOCATION_:-}|g" \
    -e "s|{{SSL_KEYSTORE_PASSWORD_}}|${SSL_KEYSTORE_PASSWORD_:-}|g" \
    -e "s|{{SSL_KEYSTORE_TYPE_}}|${SSL_KEYSTORE_TYPE_:-}|g" \
    -e "s|{{SSL_PROTOCOL_}}|${SSL_PROTOCOL_:-}|g" \
    -e "s|{{SSL_PROVIDER_}}|${SSL_PROVIDER_:-}|g" \
    -e "s|{{SSL_TRUSTMANAGER_ALGORITHM_}}|${SSL_TRUSTMANAGER_ALGORITHM_:-}|g" \
    -e "s|{{SSL_TRUSTSTORE_LOCATION_}}|${SSL_TRUSTSTORE_LOCATION_:-}|g" \
    -e "s|{{SSL_TRUSTSTORE_PASSWORD_}}|${SSL_TRUSTSTORE_PASSWORD_:-}|g" \
    -e "s|{{SSL_TRUSTSTORE_TYPE_}}|${SSL_TRUSTSTORE_TYPE_:-}|g" \
    -e "s|{{AUTHORIZER_CLASS_NAME_}}|${AUTHORIZER_CLASS_NAME_:-}|g" \
    -e "s|{{CREATE_TOPIC_POLICY_CLASS_NAME_}}|${CREATE_TOPIC_POLICY_CLASS_NAME_:-}|g" \
    -e "s|{{LISTENER_SECURITY_PROTOCOL_MAP_}}|${LISTENER_SECURITY_PROTOCOL_MAP_:-}|g" \
    -e "s|{{METRIC_REPORTERS_}}|${METRIC_REPORTERS_:-}|g" \
    -e "s|{{METRICS_NUM_SAMPLES_}}|${METRICS_NUM_SAMPLES_:-}|g" \
    -e "s|{{METRICS_RECORDING_LEVEL_}}|${METRICS_RECORDING_LEVEL_:-}|g" \
    -e "s|{{METRICS_SAMPLE_WINDOW_MS_}}|${METRICS_SAMPLE_WINDOW_MS_:-}|g" \
    -e "s|{{QUOTA_WINDOW_NUM_}}|${QUOTA_WINDOW_NUM_:-}|g" \
    -e "s|{{QUOTA_WINDOW_SIZE_SECONDS_}}|${QUOTA_WINDOW_SIZE_SECONDS_:-}|g" \
    -e "s|{{REPLICATION_QUOTA_WINDOW_NUM_}}|${REPLICATION_QUOTA_WINDOW_NUM_:-}|g" \
    -e "s|{{REPLICATION_QUOTA_WINDOW_SIZE_SECONDS_}}|${REPLICATION_QUOTA_WINDOW_SIZE_SECONDS_:-}|g" \
    -e "s|{{SSL_ENDPOINT_IDENTIFICATION_ALGORITHM_}}|${SSL_ENDPOINT_IDENTIFICATION_ALGORITHM_:-}|g" \
    -e "s|{{SSL_SECURE_RANDOM_IMPLEMENTATION_}}|${SSL_SECURE_RANDOM_IMPLEMENTATION_:-}|g" \
    -e "s|{{ZOOKEEPER_SYNC_TIME_MS_}}|${ZOOKEEPER_SYNC_TIME_MS_:-}|g" \
	> /kafka/config/server.properties
fi

# Kafka's built-in start scripts set the first three system properties here, but
# we add two more to make remote JMX easier/possible to access in a Docker
# environment:
#
#   1. RMI port - pinning this makes the JVM use a stable one instead of
#      selecting random high ports each time it starts up.
#   2. RMI hostname - normally set automatically by heuristics that may have
#      hard-to-predict results across environments.
#
# These allow saner configuration for firewalls, EC2 security groups, Docker
# hosts running in a VM with Docker Machine, etc. See:
#
# https://issues.apache.org/jira/browse/CASSANDRA-7087
if [ -z "$KAFKA_JMX_OPTS" ]; then
    KAFKA_JMX_OPTS="-Dcom.sun.management.jmxremote=true"
    KAFKA_JMX_OPTS="$KAFKA_JMX_OPTS -Dcom.sun.management.jmxremote.authenticate=false"
    KAFKA_JMX_OPTS="$KAFKA_JMX_OPTS -Dcom.sun.management.jmxremote.ssl=false"
    KAFKA_JMX_OPTS="$KAFKA_JMX_OPTS -Dcom.sun.management.jmxremote.rmi.port=$JMX_PORT"
    KAFKA_JMX_OPTS="$KAFKA_JMX_OPTS -Djava.rmi.server.hostname=${JAVA_RMI_SERVER_HOSTNAME:-$HOSTNAME}"
    export KAFKA_JMX_OPTS
fi

if [ -z "$KAFKA_HEAP_OPTS" ]; then
	KAFKA_HEAP_OPTS="-XX:+UseG1GC"
	export KAFKA_HEAP_OPTS
fi

echo "Starting kafka"
exec kafka-server-start.sh /kafka/config/server.properties