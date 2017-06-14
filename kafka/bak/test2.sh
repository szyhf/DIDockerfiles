# Zookeeper host string
# string "" "" high
{{ZOOKEEPER_CONNECT_}}{{ZOOKEEPER_CONNECT_}}zookeeper.connect={{ZOOKEEPER_CONNECT}}

# Listeners to publish to ZooKeeper for clients to use, if different than the listeners above. In IaaS environments, this may need to be different from the interface to which the broker binds. If this is not set, the value for `listeners` will be used.
# string null "" high
{{ADVERTISED_LISTENERS_}}advertised.listeners={{ADVERTISED_LISTENERS}}

# Enable auto creation of topic on the server
# boolean true "" high
{{AUTO_CREATE_TOPICS_ENABLE_}}auto.create.topics.enable={{AUTO_CREATE_TOPICS_ENABLE}}

# Enables auto leader balancing. A background thread checks and triggers leader balance if required at regular intervals
# boolean true "" high
{{AUTO_LEADER_REBALANCE_ENABLE_}}auto.leader.rebalance.enable={{AUTO_LEADER_REBALANCE_ENABLE}}

# The number of threads to use for various background processing tasks
# int 10 "" high
{{BACKGROUND_THREADS_}}background.threads={{BACKGROUND_THREADS}}

# The broker id for this server. If unset, a unique broker id will be generated.To avoid conflicts between zookeeper generated broker id's and user configured broker id's, generated broker ids start from reserved.broker.max.id + 1.
# int -1 "" high
{{BROKER_ID_}}broker.id={{BROKER_ID}}

# Specify the final compression type for a given topic. This configuration accepts the standard compression codecs ('gzip', 'snappy', 'lz4'). It additionally accepts 'uncompressed' which is equivalent to no compression; and 'producer' which means retain the original compression codec set by the producer.
# string producer "" high
{{COMPRESSION_TYPE_}}compression.type={{COMPRESSION_TYPE}}

# Enables delete topic. Delete topic through the admin tool will have no effect if this config is turned off
# bollean false "" high
{{DELETE_TOPIC_ENABLE_}}delete.topic.enable={{DELETE_TOPIC_ENABLE}}

# The frequency with which the partition rebalance check is triggered by the controller
# long 300 "" high
{{LEADER_IMBALANCE_CHECK_INTERVAL_SECONDS_}}leader.imbalance.check.interval.seconds={{LEADER_IMBALANCE_CHECK_INTERVAL_SECONDS}}

# The ratio of leader imbalance allowed per broker. The controller would trigger a leader balance if it goes above this value per broker. The value is specified in percentage.
# int 10 "" high
{{LEADER_IMBALANCE_PER_BROKER_PERCENTAGE_}}leader.imbalance.per.broker.percentage={{LEADER_IMBALANCE_PER_BROKER_PERCENTAGE}}

# Listener List - Comma-separated list of URIs we will listen on and the listener names. If the listener name is not a security protocol, listener.security.protocol.map must also be set. Specify hostname as 0.0.0.0 to bind to all interfaces. Leave hostname empty to bind to default interface. Examples of legal listener lists: PLAINTEXT://myhost:9092,SSL://:9091 CLIENT://0.0.0.0:9092,REPLICATION://localhost:9093
# string null "" high
{{LISTENERS_}}listeners={{LISTENERS}}

# The directory in which the log data is kept (supplemental for log.dirs property)
# string /tmp/kafka-logs "" high
{{LOG_DIR_}}log.dir={{LOG_DIR}}

# The directories in which the log data is kept. If not set, the value in log.dir is used
# string null "" high
{{LOG_DIRS_}}log.dirs={{LOG_DIRS}}

# The number of messages accumulated on a log partition before messages are flushed to disk
# long 9223372036854775807 [1,...] high
{{LOG_FLUSH_INTERVAL_MESSAGES_}}log.flush.interval.messages={{LOG_FLUSH_INTERVAL_MESSAGES}}

# The maximum time in ms that a message in any topic is kept in memory before flushed to disk. If not set, the value in log.flush.scheduler.interval.ms is used
# long "" "" high
{{LOG_FLUSH_INTERVAL_MS_}}log.flush.interval.ms={{LOG_FLUSH_INTERVAL_MS}}

# The frequency with which we update the persistent record of the last flush which acts as the log recovery point
# int 60000 [0,...] high
{{LOG_FLUSH_OFFSET_CHECKPOINT_INTERVAL_MS_}}log.flush.offset.checkpoint.interval.ms={{LOG_FLUSH_OFFSET_CHECKPOINT_INTERVAL_MS}}

# The frequency in ms that the log flusher checks whether any log needs to be flushed to disk
# long 9223372036854775807 "" high
{{LOG_FLUSH_SCHEDULER_INTERVAL_MS_}}log.flush.scheduler.interval.ms={{LOG_FLUSH_SCHEDULER_INTERVAL_MS}}

# The maximum size of the log before deleting it
# long -1 "" high
{{LOG_RETENTION_BYTES_}}log.retention.bytes={{LOG_RETENTION_BYTES}}

# The number of hours to keep a log file before deleting it (in hours), tertiary to log.retention.ms property
# int 168 "" high
{{LOG_RETENTION_HOURS_}}log.retention.hours={{LOG_RETENTION_HOURS}}

# The number of minutes to keep a log file before deleting it (in minutes), secondary to log.retention.ms property. If not set, the value in log.retention.hours is used
# int null "" high
{{LOG_RETENTION_MINUTES_}}log.retention.minutes={{LOG_RETENTION_MINUTES}}

# The number of milliseconds to keep a log file before deleting it (in milliseconds), If not set, the value in log.retention.minutes is used
# long null "" high
{{LOG_RETENTION_MS_}}log.retention.ms={{LOG_RETENTION_MS}}

# The maximum time before a new log segment is rolled out (in hours), secondary to log.roll.ms property
# int 168 [1,...] high
{{LOG_ROLL_HOURS_}}log.roll.hours={{LOG_ROLL_HOURS}}

# The maximum jitter to subtract from logRollTimeMillis (in hours), secondary to log.roll.jitter.ms property
# int 0 [0,...] high
{{LOG_ROLL_JITTER_HOURS_}}log.roll.jitter.hours={{LOG_ROLL_JITTER_HOURS}}

# The maximum jitter to subtract from logRollTimeMillis (in milliseconds). If not set, the value in log.roll.jitter.hours is used
# long null "" high
{{LOG_ROLL_JITTER_MS_}}log.roll.jitter.ms={{LOG_ROLL_JITTER_MS}}

# The maximum time before a new log segment is rolled out (in milliseconds). If not set, the value in log.roll.hours is used
# long null "" high
{{LOG_ROLL_MS_}}log.roll.ms={{LOG_ROLL_MS}}

# The maximum size of a single log file
# int 1073741824 [14,...] high
{{LOG_SEGMENT_BYTES_}}log.segment.bytes={{LOG_SEGMENT_BYTES}}

# The amount of time to wait before deleting a file from the filesystem
# long 60000 [0,...] high
{{LOG_SEGMENT_DELETE_DELAY_MS_}}log.segment.delete.delay.ms={{LOG_SEGMENT_DELETE_DELAY_MS}}

# The maximum size of message that the server can receive
# int 1000012 [0,...] high
{{MESSAGE_MAX_BYTES_}}message.max.bytes={{MESSAGE_MAX_BYTES}}

# When a producer sets acks to "all" (or "-1"), min.insync.replicas specifies the minimum number of replicas that must acknowledge a write for the write to be considered successful. If this minimum cannot be met, then the producer will raise an exception (either NotEnoughReplicas or NotEnoughReplicasAfterAppend).
# When used together, min.insync.replicas and acks allow you to enforce greater durability guarantees. A typical scenario would be to create a topic with a replication factor of 3, set min.insync.replicas to 2, and produce with acks of "all". This will ensure that the producer raises an exception if a majority of replicas do not receive a write.
# int 1 [1,...] high
{{MIN_INSYNC_REPLICAS_}}min.insync.replicas={{MIN_INSYNC_REPLICAS}}

# The number of io threads that the server uses for carrying out network requests
# int 8 [1,...] high
{{NUM_IO_THREADS_}}num.io.threads={{NUM_IO_THREADS}}

# the number of network threads that the server uses for handling network requests
# int 3 [1,...] high
{{NUM_NETWORK_THREADS_}}num.network.threads={{NUM_NETWORK_THREADS}}

# The number of threads per data directory to be used for log recovery at startup and flushing at shutdown
# int 1 [1,...] high
{{NUM_RECOVERY_THREADS_PER_DATA_DIR_}}num.recovery.threads.per.data.dir={{NUM_RECOVERY_THREADS_PER_DATA_DIR}}

# Number of fetcher threads used to replicate messages from a source broker. Increasing this value can increase the degree of I/O parallelism in the follower broker.
# int 1 "" high
{{NUM_REPLICA_FETCHERS_}}num.replica.fetchers={{NUM_REPLICA_FETCHERS}}

# The maximum size for a metadata entry associated with an offset commit
# int 4096 "" high
{{OFFSET_METADATA_MAX_BYTES_}}offset.metadata.max.bytes={{OFFSET_METADATA_MAX_BYTES}}

# The required acks before the commit can be accepted. In general, the default (-1) should not be overridden
# short -1 [1,...] high
{{OFFSETS_COMMIT_REQUIRED_ACKS_}}offsets.commit.required.acks={{OFFSETS_COMMIT_REQUIRED_ACKS}}

# Offset commit will be delayed until all replicas for the offsets topic receive the commit or this timeout is reached. This is similar to the producer request timeout.
# int 5000 [1,...] high
{{OFFSETS_COMMIT_TIMEOUT_MS_}}offsets.commit.timeout.ms={{OFFSETS_COMMIT_TIMEOUT_MS}}

# Batch size for reading from the offsets segments when loading offsets into the cache.
# int 5242880 [1,...] high
{{OFFSETS_LOAD_BUFFER_SIZE_}}offsets.load.buffer.size={{OFFSETS_LOAD_BUFFER_SIZE}}

# Frequency at which to check for stale offsets
# long 600000 [1,...] high
{{OFFSETS_RETENTION_CHECK_INTERVAL_MS_}}offsets.retention.check.interval.ms={{OFFSETS_RETENTION_CHECK_INTERVAL_MS}}

# Log retention window in minutes for offsets topic
# int 1440 [1,...] high
{{OFFSETS_RETENTION_MINUTES_}}offsets.retention.minutes={{OFFSETS_RETENTION_MINUTES}}

# Compression codec for the offsets topic - compression may be used to achieve "atomic" commits
# int 0 "" high
{{OFFSETS_TOPIC_COMPRESSION_CODEC_}}offsets.topic.compression.codec={{OFFSETS_TOPIC_COMPRESSION_CODEC}}

# The number of partitions for the offset commit topic (should not change after deployment)
# int 50 [1,...] high
{{OFFSETS_TOPIC_NUM_PARTITIONS_}}offsets.topic.num.partitions={{OFFSETS_TOPIC_NUM_PARTITIONS}}

# The replication factor for the offsets topic (set higher to ensure availability). To ensure that the effective replication factor of the offsets topic is the configured value, the number of alive brokers has to be at least the replication factor at the time of the first request for the offsets topic. If not, either the offsets topic creation will fail or it will get a replication factor of min(alive brokers, configured replication factor)
# short 3 [1,...] high
{{OFFSETS_TOPIC_REPLICATION_FACTOR_}}offsets.topic.replication.factor={{OFFSETS_TOPIC_REPLICATION_FACTOR}}

# The offsets topic segment bytes should be kept relatively small in order to facilitate faster log compaction and cache loads
# int 104857600 [1,...] high
{{OFFSETS_TOPIC_SEGMENT_BYTES_}}offsets.topic.segment.bytes={{OFFSETS_TOPIC_SEGMENT_BYTES}}

# The number of queued requests allowed before blocking the network threads
# int 500 [1,...] high
{{QUEUED_MAX_REQUESTS_}}queued.max.requests={{QUEUED_MAX_REQUESTS}}

# Minimum bytes expected for each fetch response. If not enough bytes, wait up to replicaMaxWaitTimeMs
# int 1 "" high
{{REPLICA_FETCH_MIN_BYTES_}}replica.fetch.min.bytes={{REPLICA_FETCH_MIN_BYTES}}

# max wait time for each fetcher request issued by follower replicas. This value should always be less than the replica.lag.time.max.ms at all times to prevent frequent shrinking of ISR for low throughput topics
# int 500 "" high
{{REPLICA_FETCH_WAIT_MAX_MS_}}replica.fetch.wait.max.ms={{REPLICA_FETCH_WAIT_MAX_MS}}

# The frequency with which the high watermark is saved out to disk
# long 5000 "" high
{{REPLICA_HIGH_WATERMARK_CHECKPOINT_INTERVAL_MS_}}replica.high.watermark.checkpoint.interval.ms={{REPLICA_HIGH_WATERMARK_CHECKPOINT_INTERVAL_MS}}

# If a follower hasn't sent any fetch requests or hasn't consumed up to the leaders log end offset for at least this time, the leader will remove the follower from isr
# long 10000 "" high
{{REPLICA_LAG_TIME_MAX_MS_}}replica.lag.time.max.ms={{REPLICA_LAG_TIME_MAX_MS}}

# The socket receive buffer for network requests
# int 65536 "" high
{{REPLICA_SOCKET_RECEIVE_BUFFER_BYTES_}}replica.socket.receive.buffer.bytes={{REPLICA_SOCKET_RECEIVE_BUFFER_BYTES}}

# The socket timeout for network requests. Its value should be at least replica.fetch.wait.max.ms
# int 30000 "" high
{{REPLICA_SOCKET_TIMEOUT_MS_}}replica.socket.timeout.ms={{REPLICA_SOCKET_TIMEOUT_MS}}

# The configuration controls the maximum amount of time the client will wait for the response of a request. If the response is not received before the timeout elapses the client will resend the request if necessary or fail the request if retries are exhausted.
# int 30000 "" high
{{REQUEST_TIMEOUT_MS_}}request.timeout.ms={{REQUEST_TIMEOUT_MS}}

# The SO_RCVBUF buffer of the socket sever sockets. If the value is -1, the OS default will be used.
# int 102400 "" high
{{SOCKET_RECEIVE_BUFFER_BYTES_}}socket.receive.buffer.bytes={{SOCKET_RECEIVE_BUFFER_BYTES}}

# The maximum number of bytes in a socket request
# int 104857600 [1,...] high
{{SOCKET_REQUEST_MAX_BYTES_}}socket.request.max.bytes={{SOCKET_REQUEST_MAX_BYTES}}

# The SO_SNDBUF buffer of the socket sever sockets. If the value is -1, the OS default will be used.
# int 102400 "" high
{{SOCKET_SEND_BUFFER_BYTES_}}socket.send.buffer.bytes={{SOCKET_SEND_BUFFER_BYTES}}

# Indicates whether to enable replicas not in the ISR set to be elected as leader as a last resort, even though doing so may result in data loss
# boolean true "" high
{{UNCLEAN_LEADER_ELECTION_ENABLE_}}unclean.leader.election.enable={{UNCLEAN_LEADER_ELECTION_ENABLE}}

# The max time that the client waits to establish a connection to zookeeper. If not set, the value in zookeeper.session.timeout.ms is used
# int null "" high
{{ZOOKEEPER_CONNECTION_TIMEOUT_MS_}}zookeeper.connection.timeout.ms={{ZOOKEEPER_CONNECTION_TIMEOUT_MS}}

# Zookeeper session timeout
# int 6000 "" high
{{ZOOKEEPER_SESSION_TIMEOUT_MS_}}zookeeper.session.timeout.ms={{ZOOKEEPER_SESSION_TIMEOUT_MS}}

# Set client to use secure ACLs
# boolean false "" high
{{ZOOKEEPER_SET_ACL_}}zookeeper.set.acl={{ZOOKEEPER_SET_ACL}}

# Enable automatic broker id generation on the server. When enabled the value configured for reserved.broker.max.id should be reviewed.
# bollean true "" medium
{{BROKER_ID_GENERATION_ENABLE_}}broker.id.generation.enable={{BROKER_ID_GENERATION_ENABLE}}

# Rack of the broker. This will be used in rack aware replication assignment for fault tolerance. Examples: `RACK1`, `us-east-1d`
# string null "" medium
{{BROKER_RACK_}}broker.rack={{BROKER_RACK}}

# Idle connections timeout: the server socket processor threads close the connections that idle more than this
# long 600000 "" medium
{{CONNECTIONS_MAX_IDLE_MS_}}connections.max.idle.ms={{CONNECTIONS_MAX_IDLE_MS}}

# Enable controlled shutdown of the server
# boolean true "" medium
{{CONTROLLED_SHUTDOWN_ENABLE_}}controlled.shutdown.enable={{CONTROLLED_SHUTDOWN_ENABLE}}

# Controlled shutdown can fail for multiple reasons. This determines the number of retries when such failure happens
# int 3 "" medium
{{CONTROLLED_SHUTDOWN_MAX_RETRIES_}}controlled.shutdown.max.retries={{CONTROLLED_SHUTDOWN_MAX_RETRIES}}

# Before each retry, the system needs time to recover from the state that caused the previous failure (Controller fail over, replica lag etc). This config determines the amount of time to wait before retrying.
# long 5000 "" medium
{{CONTROLLED_SHUTDOWN_RETRY_BACKOFF_MS_}}controlled.shutdown.retry.backoff.ms={{CONTROLLED_SHUTDOWN_RETRY_BACKOFF_MS}}

# The socket timeout for controller-to-broker channels
# int 30000 "" medium
{{CONTROLLER_SOCKET_TIMEOUT_MS_}}controller.socket.timeout.ms={{CONTROLLER_SOCKET_TIMEOUT_MS}}

# default replication factors for automatically created topics
# int 1000 "" medium
{{DEFAULT_REPLICATION_FACTOR_}}default.replication.factor={{DEFAULT_REPLICATION_FACTOR}}

# The purge interval (in number of requests) of the fetch request purgatory
# int 1000 "" medium
{{FETCH_PURGATORY_PURGE_INTERVAL_REQUESTS_}}fetch.purgatory.purge.interval.requests={{FETCH_PURGATORY_PURGE_INTERVAL_REQUESTS}}

# The maximum allowed session timeout for registered consumers. Longer timeouts give consumers more time to process messages in between heartbeats at the cost of a longer time to detect failures.
# int 300000 "" medium
{{GROUP_MAX_SESSION_TIMEOUT_MS_}}group.max.session.timeout.ms={{GROUP_MAX_SESSION_TIMEOUT_MS}}

# The minimum allowed session timeout for registered consumers. Shorter timeouts result in quicker failure detection at the cost of more frequent consumer heartbeating, which can overwhelm broker resources.
# int 6000 "" medium
{{GROUP_MIN_SESSION_TIMEOUT_MS_}}group.min.session.timeout.ms={{GROUP_MIN_SESSION_TIMEOUT_MS}}

# Name of listener used for communication between brokers. If this is unset, the listener name is defined by security.inter.broker.protocol. It is an error to set this and security.inter.broker.protocol properties at the same time.
# string null "" medium
{{INTER_BROKER_LISTENER_NAME_}}inter.broker.listener.name={{INTER_BROKER_LISTENER_NAME}}

# Specify which version of the inter-broker protocol will be used. This is typically bumped after all brokers were upgraded to a new version. Example of some valid values are: 0.8.0, 0.8.1, 0.8.1.1, 0.8.2, 0.8.2.0, 0.8.2.1, 0.9.0.0, 0.9.0.1 Check ApiVersion for the full list.
# string 0.10.2-IV0 "" medium
{{INTER_BROKER_PROTOCOL_VERSION_}}inter.broker.protocol.version={{INTER_BROKER_PROTOCOL_VERSION}}

# The amount of time to sleep when there are no logs to clean
# long 15000 [0,...] medium
{{LOG_CLEANER_BACKOFF_MS_}}log.cleaner.backoff.ms={{LOG_CLEANER_BACKOFF_MS}}

# The total memory used for log deduplication across all cleaner threads
# long 134217728 "" medium
{{LOG_CLEANER_DEDUPE_BUFFER_SIZE_}}log.cleaner.dedupe.buffer.size={{LOG_CLEANER_DEDUPE_BUFFER_SIZE}}

# How long are delete records retained?
# long 86400000 "" medium
{{LOG_CLEANER_DELETE_RETENTION_MS_}}log.cleaner.delete.retention.ms={{LOG_CLEANER_DELETE_RETENTION_MS}}

# Enable the log cleaner process to run on the server. Should be enabled if using any topics with a cleanup.policy=compact including the internal offsets topic. If disabled those topics will not be compacted and continually grow in size.
# boolean true "" medium
{{LOG_CLEANER_ENABLE_}}log.cleaner.enable={{LOG_CLEANER_ENABLE}}

# Log cleaner dedupe buffer load factor. The percentage full the dedupe buffer can become. A higher value will allow more log to be cleaned at once but will lead to more hash collisions
# double 0.9 "" medium
{{LOG_CLEANER_IO_BUFFER_LOAD_FACTOR_}}log.cleaner.io.buffer.load.factor={{LOG_CLEANER_IO_BUFFER_LOAD_FACTOR}}

# The total memory used for log cleaner I/O buffers across all cleaner threads
# int 5247288 [0,...] medium
{{LOG_CLEANER_IO_BUFFER_SIZE_}}log.cleaner.io.buffer.size={{LOG_CLEANER_IO_BUFFER_SIZE}}

# The log cleaner will be throttled so that the sum of its read and write i/o will be less than this value on average
# double 1.7976931348623157E308 "" medium
{{LOG_CLEANER_IO_MAX_BYTES_PER_SECOND_}}log.cleaner.io.max.bytes.per.second={{LOG_CLEANER_IO_MAX_BYTES_PER_SECOND}}

# The minimum ratio of dirty log to total log for a log to eligible for cleaning
# double 0.5 "" medium
{{LOG_CLEANER_MIN_CLEANABLE_RATIO_}}log.cleaner.min.cleanable.ratio={{LOG_CLEANER_MIN_CLEANABLE_RATIO}}

# The minimum time a message will remain uncompacted in the log. Only applicable for logs that are being compacted.
# long 0 "" medium
{{LOG_CLEANER_MIN_COMPACTION_LAG_MS_}}log.cleaner.min.compaction.lag.ms={{LOG_CLEANER_MIN_COMPACTION_LAG_MS}}

# The number of background threads to use for log cleaning
# int 1 [0,...] medium
{{LOG_CLEANER_THREADS_}}log.cleaner.threads={{LOG_CLEANER_THREADS}}

# The default cleanup policy for segments beyond the retention window. A comma separated list of valid policies. Valid policies are: "delete" and "compact"
# list delete [compact,delete] medium
{{LOG_CLEANUP_POLICY_}}log.cleanup.policy={{LOG_CLEANUP_POLICY}}

# The interval with which we add an entry to the offset index
# int 4096 [0,...] medium
{{LOG_INDEX_INTERVAL_BYTES_}}log.index.interval.bytes={{LOG_INDEX_INTERVAL_BYTES}}

# The maximum size in bytes of the offset index
# int 10485760 [4,...] medium
{{LOG_INDEX_SIZE_MAX_BYTES_}}log.index.size.max.bytes={{LOG_INDEX_SIZE_MAX_BYTES}}

# Specify the message format version the broker will use to append messages to the logs. The value should be a valid ApiVersion. Some examples are: 0.8.2, 0.9.0.0, 0.10.0, check ApiVersion for more details. By setting a particular message format version, the user is certifying that all the existing messages on disk are smaller or equal than the specified version. Setting this value incorrectly will cause consumers with older versions to break as they will receive messages with a format that they don't understand.
# string 0.10.2-IV0 "" medium
{{LOG_MESSAGE_FORMAT_VERSION_}}log.message.format.version={{LOG_MESSAGE_FORMAT_VERSION}}

# The maximum difference allowed between the timestamp when a broker receives a message and the timestamp specified in the message. If log.message.timestamp.type=CreateTime, a message will be rejected if the difference in timestamp exceeds this threshold. This configuration is ignored if log.message.timestamp.type=LogAppendTime.
# long 9223372036854775807 [0,...] medium
{{LOG_MESSAGE_TIMESTAMP_DIFFERENCE_MAX_MS_}}log.message.timestamp.difference.max.ms={{LOG_MESSAGE_TIMESTAMP_DIFFERENCE_MAX_MS}}

# Define whether the timestamp in the message is message create time or log append time. The value should be either `CreateTime` or `LogAppendTime`
# string CreateTime [CreateTime,LogAppendTime] medium
{{LOG_MESSAGE_TIMESTAMP_TYPE_}}log.message.timestamp.type={{LOG_MESSAGE_TIMESTAMP_TYPE}}

# Should pre allocate file when create new segment? If you are using Kafka on Windows, you probably need to set it to true.
# boolean false "" medium
{{LOG_PREALLOCATE_}}log.preallocate={{LOG_PREALLOCATE}}

# The frequency in milliseconds that the log cleaner checks whether any log is eligible for deletion
# long 300000 [1,...] medium
{{LOG_RETENTION_CHECK_INTERVAL_MS_}}log.retention.check.interval.ms={{LOG_RETENTION_CHECK_INTERVAL_MS}}

# The maximum number of connections we allow from each ip address
# int 2147483647 [1,...] medium
{{MAX_CONNECTIONS_PER_IP_}}max.connections.per.ip={{MAX_CONNECTIONS_PER_IP}}

# Per-ip or hostname overrides to the default maximum number of connections
# string "" "" medium
{{MAX_CONNECTIONS_PER_IP_OVERRIDES_}}max.connections.per.ip.overrides={{MAX_CONNECTIONS_PER_IP_OVERRIDES}}

# The default number of log partitions per topic
# int 1 [1,...] medium
{{NUM_PARTITIONS_}}num.partitions={{NUM_PARTITIONS}}

# The fully qualified name of a class that implements the PrincipalBuilder interface, which is currently used to build the Principal for connections with the SSL SecurityProtocol.
# class org.apache.kafka.common.security.auth.DefaultPrincipalBuilder "" medium
{{PRINCIPAL_BUILDER_CLASS_}}principal.builder.class={{PRINCIPAL_BUILDER_CLASS}}

# The purge interval (in number of requests) of the producer request purgatory
# int 1000 "" medium
{{PRODUCER_PURGATORY_PURGE_INTERVAL_REQUESTS_}}producer.purgatory.purge.interval.requests={{PRODUCER_PURGATORY_PURGE_INTERVAL_REQUESTS}}

# The amount of time to sleep when fetch partition error occurs.
# int 1000 [0,...] medium
{{REPLICA_FETCH_BACKOFF_MS_}}replica.fetch.backoff.ms={{REPLICA_FETCH_BACKOFF_MS}}

# The number of bytes of messages to attempt to fetch for each partition. This is not an absolute maximum, if the first message in the first non-empty partition of the fetch is larger than this value, the message will still be returned to ensure that progress can be made. The maximum message size accepted by the broker is defined via message.max.bytes (broker config) or max.message.bytes (topic config).
# int 1048576 [0,...] medium
{{REPLICA_FETCH_MAX_BYTES_}}replica.fetch.max.bytes={{REPLICA_FETCH_MAX_BYTES}}

# Maximum bytes expected for the entire fetch response. This is not an absolute maximum, if the first message in the first non-empty partition of the fetch is larger than this value, the message will still be returned to ensure that progress can be made. The maximum message size accepted by the broker is defined via message.max.bytes (broker config) or max.message.bytes (topic config).
# int 10485760 [0,...] medium
{{REPLICA_FETCH_RESPONSE_MAX_BYTES_}}replica.fetch.response.max.bytes={{REPLICA_FETCH_RESPONSE_MAX_BYTES}}

# Max number that can be used for a broker.id
# int 1000 [0,...] medium
{{RESERVED_BROKER_MAX_ID_}}reserved.broker.max.id={{RESERVED_BROKER_MAX_ID}}

# The list of SASL mechanisms enabled in the Kafka server. The list may contain any mechanism for which a security provider is available. Only GSSAPI is enabled by default.
# list GSSAPI "" medium
{{SASL_ENABLED_MECHANISMS_}}sasl.enabled.mechanisms={{SASL_ENABLED_MECHANISMS}}

# Kerberos kinit command path.
# string /usr/bin/kinit	medium
{{SASL_KERBEROS_KINIT_CMD_}}sasl.kerberos.kinit.cmd={{SASL_KERBEROS_KINIT_CMD}}

# Login thread sleep time between refresh attempts.
# long 60000 "" medium
{{SASL_KERBEROS_MIN_TIME_BEFORE_RELOGIN_}}sasl.kerberos.min.time.before.relogin={{SASL_KERBEROS_MIN_TIME_BEFORE_RELOGIN}}

# A list of rules for mapping from principal names to short names (typically operating system usernames). The rules are evaluated in order and the first rule that matches a principal name is used to map it to a short name. Any later rules in the list are ignored. By default, principal names of the form {username}/{hostname}@{REALM} are mapped to {username}. For more details on the format please see security authorization and acls.
# list DEFAULT "" medium
{{SASL_KERBEROS_PRINCIPAL_TO_LOCAL_RULES_}}sasl.kerberos.principal.to.local.rules={{SASL_KERBEROS_PRINCIPAL_TO_LOCAL_RULES}}

# The Kerberos principal name that Kafka runs as. This can be defined either in Kafka's JAAS config or in Kafka's config.
# string null "" medium
{{SASL_KERBEROS_SERVICE_NAME_}}sasl.kerberos.service.name={{SASL_KERBEROS_SERVICE_NAME}}

# Percentage of random jitter added to the renewal time.
# double 0.05 "" medium
{{SASL_KERBEROS_TICKET_RENEW_JITTER_}}sasl.kerberos.ticket.renew.jitter={{SASL_KERBEROS_TICKET_RENEW_JITTER}}

# Login thread will sleep until the specified window factor of time from last refresh to ticket's expiry has been reached, at which time it will try to renew the ticket.
# double 0.8 "" medium
{{SASL_KERBEROS_TICKET_RENEW_WINDOW_FACTOR_}}sasl.kerberos.ticket.renew.window.factor={{SASL_KERBEROS_TICKET_RENEW_WINDOW_FACTOR}}

# SASL mechanism used for inter-broker communication. Default is GSSAPI.
# string GSSAPI "" medium
{{SASL_MECHANISM_INTER_BROKER_PROTOCOL_}}sasl.mechanism.inter.broker.protocol={{SASL_MECHANISM_INTER_BROKER_PROTOCOL}}

# Security protocol used to communicate between brokers. Valid values are: PLAINTEXT, SSL, SASL_PLAINTEXT, SASL_SSL. It is an error to set this and inter.broker.listener.name properties at the same time.
# string PLAINTEXT "" medium
{{SECURITY_INTER_BROKER_PROTOCOL_}}security.inter.broker.protocol={{SECURITY_INTER_BROKER_PROTOCOL}}

# A list of cipher suites. This is a named combination of authentication, encryption, MAC and key exchange algorithm used to negotiate the security settings for a network connection using TLS or SSL network protocol. By default all the available cipher suites are supported.
# list null "" medium
{{SSL_CIPHER_SUITES_}}ssl.cipher.suites={{SSL_CIPHER_SUITES}}

# Configures kafka broker to request client authentication. The following settings are common:
# required If set to required client authentication is required.
# requested This means client authentication is optional. unlike requested , if this option is set client can choose not to provide authentication information about itself
# none This means client authentication is not needed.
# string none [required, requested, none] medium
{{SSL_CLIENT_AUTH_}}ssl.client.auth={{SSL_CLIENT_AUTH}}

# The list of protocols enabled for SSL connections.
# list TLSv1.2,TLSv1.1,TLSv1 "" medium
{{SSL_ENABLED_PROTOCOLS_}}ssl.enabled.protocols={{SSL_ENABLED_PROTOCOLS}}

# The password of the private key in the key store file. This is optional for client.
# password null "" medium
{{SSL_KEY_PASSWORD_}}ssl.key.password={{SSL_KEY_PASSWORD}}

# The algorithm used by key manager factory for SSL connections. Default value is the key manager factory algorithm configured for the Java Virtual Machine.
# string SunX509 "" medium
{{SSL_KEYMANAGER_ALGORITHM_}}ssl.keymanager.algorithm={{SSL_KEYMANAGER_ALGORITHM}}

# The location of the key store file. This is optional for client and can be used for two-way authentication for client.
# string null "" medium
{{SSL_KEYSTORE_LOCATION_}}ssl.keystore.location={{SSL_KEYSTORE_LOCATION}}

# The store password for the key store file. This is optional for client and only needed if ssl.keystore.location is configured.
# password null "" medium
{{SSL_KEYSTORE_PASSWORD_}}ssl.keystore.password={{SSL_KEYSTORE_PASSWORD}}

# The file format of the key store file. This is optional for client.
# string JKS "" medium
{{SSL_KEYSTORE_TYPE_}}ssl.keystore.type={{SSL_KEYSTORE_TYPE}}

# The SSL protocol used to generate the SSLContext. Default setting is TLS, which is fine for most cases. Allowed values in recent JVMs are TLS, TLSv1.1 and TLSv1.2. SSL, SSLv2 and SSLv3 may be supported in older JVMs, but their usage is discouraged due to known security vulnerabilities.
# string TLS "" medium
{{SSL_PROTOCOL_}}ssl.protocol={{SSL_PROTOCOL}}

# The name of the security provider used for SSL connections. Default value is the default security provider of the JVM.
# string null medium
{{SSL_PROVIDER_}}ssl.provider={{SSL_PROVIDER}}

# The algorithm used by trust manager factory for SSL connections. Default value is the trust manager factory algorithm configured for the Java Virtual Machine.
# string PKIX "" medium
{{SSL_TRUSTMANAGER_ALGORITHM_}}ssl.trustmanager.algorithm={{SSL_TRUSTMANAGER_ALGORITHM}}

# The location of the trust store file.
# string null "" medium
{{SSL_TRUSTSTORE_LOCATION_}}ssl.truststore.location={{SSL_TRUSTSTORE_LOCATION}}

# The password for the trust store file.
# string "" "" low
{{SSL_TRUSTSTORE_PASSWORD_}}ssl.truststore.password={{SSL_TRUSTSTORE_PASSWORD}}

# The file format of the trust store file.
# string JKS "" medium
{{SSL_TRUSTSTORE_TYPE_}}ssl.truststore.type={{SSL_TRUSTSTORE_TYPE}}

# The authorizer class that should be used for authorization
# string "" "" low
{{AUTHORIZER_CLASS_NAME_}}authorizer.class.name={{AUTHORIZER_CLASS_NAME}}

# The create topic policy class that should be used for validation. The class should implement the org.apache.kafka.server.policy.CreateTopicPolicy interface.
# class null "" low
{{CREATE_TOPIC_POLICY_CLASS_NAME_}}create.topic.policy.class.name={{CREATE_TOPIC_POLICY_CLASS_NAME}}

# Map between listener names and security protocols. This must be defined for the same security protocol to be usable in more than one port or IP. For example, we can separate internal and external traffic even if SSL is required for both. Concretely, we could define listeners with names INTERNAL and EXTERNAL and this property as: `INTERNAL:SSL,EXTERNAL:SSL`. As shown, key and value are separated by a colon and map entries are separated by commas. Each listener name should only appear once in the map.
# string SSL:SSL,SASL_PLAINTEXT:SASL_PLAINTEXT,TRACE:TRACE,SASL_SSL:SASL_SSL,PLAINTEXT:PLAINTEXT "" low
{{LISTENER_SECURITY_PROTOCOL_MAP_}}listener.security.protocol.map={{LISTENER_SECURITY_PROTOCOL_MAP}}

# A list of classes to use as metrics reporters. Implementing the MetricReporter interface allows plugging in classes that will be notified of new metric creation. The JmxReporter is always included to register JMX statistics.
# list "" "" low
{{METRIC_REPORTERS_}}metric.reporters={{METRIC_REPORTERS}}

# The number of samples maintained to compute metrics.
# int 2 [1,...] low
{{METRICS_NUM_SAMPLES_}}metrics.num.samples={{METRICS_NUM_SAMPLES}}

# The highest recording level for metrics.
# string INFO "" low
{{METRICS_RECORDING_LEVEL_}}metrics.recording.level={{METRICS_RECORDING_LEVEL}}

# The window of time a metrics sample is computed over.
# long 30000 [1,...] "" low
{{METRICS_SAMPLE_WINDOW_MS_}}metrics.sample.window.ms={{METRICS_SAMPLE_WINDOW_MS}}

# The number of samples to retain in memory for client quotas
# int 11 [1,...] "" low
{{QUOTA_WINDOW_NUM_}}quota.window.num={{QUOTA_WINDOW_NUM}}

# The time span of each sample for client quotas
# int 1 [1,...] "" low
{{QUOTA_WINDOW_SIZE_SECONDS_}}quota.window.size.seconds={{QUOTA_WINDOW_SIZE_SECONDS}}

# The number of samples to retain in memory for replication quotas
# int 11 [1,...] low
{{REPLICATION_QUOTA_WINDOW_NUM_}}replication.quota.window.num={{REPLICATION_QUOTA_WINDOW_NUM}}

# The time span of each sample for replication quotas
# int 1 [1,...] low
{{REPLICATION_QUOTA_WINDOW_SIZE_SECONDS_}}replication.quota.window.size.seconds={{REPLICATION_QUOTA_WINDOW_SIZE_SECONDS}}

# The endpoint identification algorithm to validate server hostname using server certificate.
# string null "" low
{{SSL_ENDPOINT_IDENTIFICATION_ALGORITHM_}}ssl.endpoint.identification.algorithm={{SSL_ENDPOINT_IDENTIFICATION_ALGORITHM}}

# The SecureRandom PRNG implementation to use for SSL cryptography operations.
# string null "" low
{{SSL_SECURE_RANDOM_IMPLEMENTATION_}}ssl.secure.random.implementation={{SSL_SECURE_RANDOM_IMPLEMENTATION}}

# How far a ZK follower can be behind a ZK leader
# int 2000 "" low
{{ZOOKEEPER_SYNC_TIME_MS_}}zookeeper.sync.time.ms={{ZOOKEEPER_SYNC_TIME_MS}}

# DEPRECATED
# ============================================================
# only used when `advertised.listeners` or `listeners` are not set. Use `advertised.listeners` instead. Hostname to publish to ZooKeeper for clients to use. In IaaS environments, this may need to be different from the interface to which the broker binds. If this is not set, it will use the value for `host.name` if configured. Otherwise it will use the value returned from java.net.InetAddress.getCanonicalHostName().
# advertised.host.name={{ADVERTISED_HOST_NAME}}

# only used when `advertised.listeners` or `listeners` are not set. Use `advertised.listeners` instead. The port to publish to ZooKeeper for clients to use. In IaaS environments, this may need to be different from the port to which the broker binds. If this is not set, it will publish the same port that the broker binds to.
# advertised.port={{ADVERTISED_PORT}}

# only used when `listeners` is not set. Use `listeners` instead. hostname of broker. If this is set, it will only bind to this address. If this is not set, it will bind to all interfaces
# host.name={{HOST_NAME}}

# only used when `listeners` is not set. Use `listeners` instead. the port to listen and accept connections on
# port={{PORT}}

# Used only when dynamic default quotas are not configured for or in Zookeeper. Any consumer distinguished by clientId/consumer group will get throttled if it fetches more bytes than this value per-second
# quota.consumer.default={{QUOTA_CONSUMER_DEFAULT}}

# Used only when dynamic default quotas are not configured for , or in Zookeeper. Any producer distinguished by clientId will get throttled if it produces more bytes than this value per-second
# quota.producer.default={{QUOTA_PRODUCER_DEFAULT}}
