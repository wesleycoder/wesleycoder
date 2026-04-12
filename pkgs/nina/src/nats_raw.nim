
{.warning[UnusedImport]: off.}
{.hint[XDeclaredButNotUsed]: off.}
from macros import hint, warning, newLit, getSize

from os import parentDir

when not declared(ownSizeOf):
  macro ownSizeof(x: typed): untyped =
    newLit(x.getSize)

type
  enum_natsConnStatus_536871370* {.size: sizeof(cuint).} = enum
    NATS_CONN_STATUS_DISCONNECTED = 0, NATS_CONN_STATUS_CONNECTING = 1,
    NATS_CONN_STATUS_CONNECTED = 2, NATS_CONN_STATUS_CLOSED = 3,
    NATS_CONN_STATUS_RECONNECTING = 4, NATS_CONN_STATUS_DRAINING_SUBS = 5,
    NATS_CONN_STATUS_DRAINING_PUBS = 6
type
  enum_natsStatus_536871375* {.size: sizeof(cuint).} = enum
    NATS_OK = 0, NATS_ERR = 1, NATS_PROTOCOL_ERROR = 2, NATS_IO_ERROR = 3,
    NATS_LINE_TOO_LONG = 4, NATS_CONNECTION_CLOSED = 5, NATS_NO_SERVER = 6,
    NATS_STALE_CONNECTION = 7, NATS_SECURE_CONNECTION_WANTED = 8,
    NATS_SECURE_CONNECTION_REQUIRED = 9, NATS_CONNECTION_DISCONNECTED = 10,
    NATS_CONNECTION_AUTH_FAILED = 11, NATS_NOT_PERMITTED = 12,
    NATS_NOT_FOUND = 13, NATS_ADDRESS_MISSING = 14, NATS_INVALID_SUBJECT = 15,
    NATS_INVALID_ARG = 16, NATS_INVALID_SUBSCRIPTION = 17,
    NATS_INVALID_TIMEOUT = 18, NATS_ILLEGAL_STATE = 19, NATS_SLOW_CONSUMER = 20,
    NATS_MAX_PAYLOAD = 21, NATS_MAX_DELIVERED_MSGS = 22,
    NATS_INSUFFICIENT_BUFFER = 23, NATS_NO_MEMORY = 24, NATS_SYS_ERROR = 25,
    NATS_TIMEOUT = 26, NATS_FAILED_TO_INITIALIZE = 27,
    NATS_NOT_INITIALIZED = 28, NATS_SSL_ERROR = 29, NATS_NO_SERVER_SUPPORT = 30,
    NATS_NOT_YET_CONNECTED = 31, NATS_DRAINING = 32,
    NATS_INVALID_QUEUE_NAME = 33, NATS_NO_RESPONDERS = 34, NATS_MISMATCH = 35,
    NATS_MISSED_HEARTBEAT = 36, NATS_LIMIT_REACHED = 37,
    NATS_PIN_ID_MISMATCH = 38, NATS_MAX_STATUS_VALUE = 39
type
  enum_jsErrCode_536871379* {.size: sizeof(cuint).} = enum
    JSAccountResourcesExceededErr = 10002, JSBadRequestErr = 10003,
    JSClusterIncompleteErr = 10004, JSClusterNoPeersErr = 10005,
    JSClusterNotActiveErr = 10006, JSClusterNotAssignedErr = 10007,
    JSClusterNotAvailErr = 10008, JSClusterNotLeaderErr = 10009,
    JSClusterRequiredErr = 10010, JSClusterTagsErr = 10011,
    JSConsumerCreateErr = 10012, JSConsumerNameExistErr = 10013,
    JSConsumerNotFoundErr = 10014, JSSnapshotDeliverSubjectInvalidErr = 10015,
    JSConsumerDurableNameNotInSubjectErr = 10016,
    JSConsumerDurableNameNotMatchSubjectErr = 10017,
    JSConsumerDurableNameNotSetErr = 10018,
    JSConsumerEphemeralWithDurableInSubjectErr = 10019,
    JSConsumerEphemeralWithDurableNameErr = 10020,
    JSStreamExternalApiOverlapErr = 10021,
    JSStreamExternalDelPrefixOverlapsErr = 10022,
    JSInsufficientResourcesErr = 10023,
    JSStreamInvalidExternalDeliverySubjErr = 10024, JSInvalidJSONErr = 10025,
    JSMaximumConsumersLimitErr = 10026, JSMaximumStreamsLimitErr = 10027,
    JSMemoryResourcesExceededErr = 10028,
    JSMirrorConsumerSetupFailedErr = 10029,
    JSMirrorMaxMessageSizeTooBigErr = 10030, JSMirrorWithSourcesErr = 10031,
    JSMirrorWithStartSeqAndTimeErr = 10032,
    JSMirrorWithSubjectFiltersErr = 10033, JSMirrorWithSubjectsErr = 10034,
    JSNoAccountErr = 10035, JSClusterUnSupportFeatureErr = 10036,
    JSNoMessageFoundErr = 10037, JSNotEmptyRequestErr = 10038,
    JSNotEnabledForAccountErr = 10039, JSClusterPeerNotMemberErr = 10040,
    JSRaftGeneralErr = 10041, JSRestoreSubscribeFailedErr = 10042,
    JSSequenceNotFoundErr = 10043, JSClusterServerNotMemberErr = 10044,
    JSSourceConsumerSetupFailedErr = 10045,
    JSSourceMaxMessageSizeTooBigErr = 10046,
    JSStorageResourcesExceededErr = 10047, JSStreamAssignmentErr = 10048,
    JSStreamCreateErr = 10049, JSStreamDeleteErr = 10050,
    JSStreamGeneralError = 10051, JSStreamInvalidConfig = 10052,
    JSStreamLimitsErr = 10053, JSStreamMessageExceedsMaximumErr = 10054,
    JSStreamMirrorNotUpdatableErr = 10055, JSStreamMismatchErr = 10056,
    JSStreamMsgDeleteFailed = 10057, JSStreamNameExistErr = 10058,
    JSStreamNotFoundErr = 10059, JSStreamNotMatchErr = 10060,
    JSStreamReplicasNotUpdatableErr = 10061, JSStreamRestoreErr = 10062,
    JSStreamSequenceNotMatchErr = 10063, JSStreamSnapshotErr = 10064,
    JSStreamSubjectOverlapErr = 10065, JSStreamTemplateCreateErr = 10066,
    JSStreamTemplateDeleteErr = 10067, JSStreamTemplateNotFoundErr = 10068,
    JSStreamUpdateErr = 10069, JSStreamWrongLastMsgIDErr = 10070,
    JSStreamWrongLastSequenceErr = 10071, JSTempStorageFailedErr = 10072,
    JSTemplateNameNotMatchSubjectErr = 10073,
    JSStreamReplicasNotSupportedErr = 10074, JSPeerRemapErr = 10075,
    JSNotEnabledErr = 10076, JSStreamStoreFailedErr = 10077,
    JSConsumerConfigRequiredErr = 10078,
    JSConsumerDeliverToWildcardsErr = 10079,
    JSConsumerPushMaxWaitingErr = 10080, JSConsumerDeliverCycleErr = 10081,
    JSConsumerMaxPendingAckPolicyRequiredErr = 10082,
    JSConsumerSmallHeartbeatErr = 10083, JSConsumerPullRequiresAckErr = 10084,
    JSConsumerPullNotDurableErr = 10085, JSConsumerPullWithRateLimitErr = 10086,
    JSConsumerMaxWaitingNegativeErr = 10087,
    JSConsumerHBRequiresPushErr = 10088, JSConsumerFCRequiresPushErr = 10089,
    JSConsumerDirectRequiresPushErr = 10090,
    JSConsumerDirectRequiresEphemeralErr = 10091, JSConsumerOnMappedErr = 10092,
    JSConsumerFilterNotSubsetErr = 10093, JSConsumerInvalidPolicyErr = 10094,
    JSConsumerInvalidSamplingErr = 10095, JSStreamInvalidErr = 10096,
    JSConsumerWQRequiresExplicitAckErr = 10098,
    JSConsumerWQMultipleUnfilteredErr = 10099,
    JSConsumerWQConsumerNotUniqueErr = 10100,
    JSConsumerWQConsumerNotDeliverAllErr = 10101,
    JSConsumerNameTooLongErr = 10102, JSConsumerBadDurableNameErr = 10103,
    JSConsumerStoreFailedErr = 10104, JSConsumerExistingActiveErr = 10105,
    JSConsumerReplacementWithDifferentNameErr = 10106,
    JSConsumerDescriptionTooLongErr = 10107,
    JSConsumerWithFlowControlNeedsHeartbeatsErr = 10108,
    JSStreamSealedErr = 10109, JSStreamPurgeFailedErr = 10110,
    JSStreamRollupFailedErr = 10111, JSConsumerInvalidDeliverSubjectErr = 10112,
    JSStreamMaxBytesRequiredErr = 10113,
    JSConsumerMaxRequestBatchNegativeErr = 10114,
    JSConsumerMaxRequestExpiresToSmallErr = 10115,
    JSConsumerMaxDeliverBackoffErr = 10116, JSStreamInfoMaxSubjectsErr = 10117,
    JSStreamOfflineErr = 10118, JSConsumerOfflineErr = 10119,
    JSNoLimitsErr = 10120, JSConsumerMaxPendingAckExcessErr = 10121,
    JSStreamMaxStreamBytesExceededErr = 10122, JSStreamMoveAndScaleErr = 10123,
    JSStreamMoveInProgressErr = 10124,
    JSConsumerMaxRequestBatchExceededErr = 10125,
    JSConsumerReplicasExceedsStreamErr = 10126,
    JSConsumerNameContainsPathSeparatorsErr = 10127,
    JSStreamNameContainsPathSeparatorsErr = 10128,
    JSStreamMoveNotInProgressErr = 10129,
    JSStreamNameExistRestoreFailedErr = 10130,
    JSConsumerCreateFilterSubjectMismatchErr = 10131,
    JSConsumerCreateDurableAndNameMismatchErr = 10132,
    JSReplicasCountCannotBeNegativeErr = 10133,
    JSConsumerReplicasShouldMatchStreamErr = 10134,
    JSConsumerMetadataLengthErr = 10135,
    JSConsumerDuplicateFilterSubjectsErr = 10136,
    JSConsumerMultipleFiltersNotAllowedErr = 10137,
    JSConsumerOverlappingSubjectFiltersErr = 10138,
    JSConsumerEmptyFilterErr = 10139, JSSourceDuplicateDetectedErr = 10140,
    JSSourceInvalidStreamNameErr = 10141, JSMirrorInvalidStreamNameErr = 10142,
    JSSourceMultipleFiltersNotAllowedErr = 10144,
    JSSourceInvalidSubjectFilterErr = 10145,
    JSSourceInvalidTransformDestinationErr = 10146,
    JSSourceOverlappingSubjectFiltersErr = 10147,
    JSConsumerAlreadyExistsErr = 10148, JSConsumerDoesNotExistErr = 10149,
    JSMirrorMultipleFiltersNotAllowedErr = 10150,
    JSMirrorInvalidSubjectFilterErr = 10151,
    JSMirrorOverlappingSubjectFiltersErr = 10152,
    JSConsumerInactiveThresholdExcessErr = 10153,
    JSMirrorInvalidTransformDestinationErr = 10154,
    JSStreamTransformInvalidSourceErr = 10155,
    JSStreamTransformInvalidDestinationErr = 10156, JSPedanticErr = 10157,
    JSStreamDuplicateMessageConflictErr = 10158,
    JSConsumerPriorityPolicyWithoutGroupErr = 10159,
    JSConsumerInvalidPriorityGroupErr = 10160,
    JSConsumerEmptyGroupNameErr = 10161, JSConsumerInvalidGroupNameErr = 10162,
    JSStreamExpectedLastSeqPerSubjectNotReadyErr = 10163,
    JSStreamWrongLastSequenceConstantErr = 10164,
    JSMessageTTLInvalidErr = 10165, JSMessageTTLDisabledErr = 10166,
    JSStreamTooManyRequestsErr = 10167, JSBatchPublishNotEnabledErr = 10174,
    JSBatchPublishSequenceMissingErr = 10175,
    JSBatchPublishIncompleteErr = 10176,
    JSBatchPublishUnsupportedHeaderErr = 10177,
    JSBatchPublishInvalidIDErr = 10179,
    JSBatchPublishSequenceExceedsLimitErr = 10199,
    JSBatchPublishDuplicateMessageIDErr = 10201
type
  enum_jsRetentionPolicy_536871421* {.size: sizeof(cuint).} = enum
    js_LimitsPolicy = 0, js_InterestPolicy = 1, js_WorkQueuePolicy = 2
type
  enum_jsDiscardPolicy_536871425* {.size: sizeof(cuint).} = enum
    js_DiscardOld = 0, js_DiscardNew = 1
type
  enum_jsStorageType_536871429* {.size: sizeof(cuint).} = enum
    js_FileStorage = 0, js_MemoryStorage = 1
type
  enum_jsStorageCompression_536871433* {.size: sizeof(cuint).} = enum
    js_StorageCompressionNone = 0, js_StorageCompressionS2 = 1
type
  enum_jsDeliverPolicy_536871437* {.size: sizeof(cuint).} = enum
    js_DeliverAll = 0, js_DeliverLast = 1, js_DeliverNew = 2,
    js_DeliverByStartSequence = 3, js_DeliverByStartTime = 4,
    js_DeliverLastPerSubject = 5
type
  enum_jsAckPolicy_536871441* {.size: sizeof(cuint).} = enum
    js_AckExplicit = 0, js_AckNone = 1, js_AckAll = 2
type
  enum_jsReplayPolicy_536871452* {.size: sizeof(cuint).} = enum
    js_ReplayInstant = 0, js_ReplayOriginal = 1
type
  enum_jsPersistModeType_536871456* {.size: sizeof(cuint).} = enum
    js_PersistDefault = 0, js_PersistAsync = 1
type
  enum_kvOperation_536871648* {.size: sizeof(cuint).} = enum
    kvOp_Unknown = 0, kvOp_Put = 1, kvOp_Delete = 2, kvOp_Purge = 3
when not declared(struct_for_forward_compatibility_only):
  type
    struct_for_forward_compatibility_only* = object
else:
  static :
    hint("Declaration of " & "struct_for_forward_compatibility_only" &
        " already exists, not redeclaring")
when not declared(struct_micro_endpoint_s):
  type
    struct_micro_endpoint_s* = object
else:
  static :
    hint("Declaration of " & "struct_micro_endpoint_s" &
        " already exists, not redeclaring")
when not declared(struct_natsConnection):
  type
    struct_natsConnection* = object
else:
  static :
    hint("Declaration of " & "struct_natsConnection" &
        " already exists, not redeclaring")
when not declared(struct_natsOptions):
  type
    struct_natsOptions* = object
else:
  static :
    hint("Declaration of " & "struct_natsOptions" &
        " already exists, not redeclaring")
when not declared(struct_kvEntry):
  type
    struct_kvEntry* = object
else:
  static :
    hint("Declaration of " & "struct_kvEntry" &
        " already exists, not redeclaring")
when not declared(struct_objStore):
  type
    struct_objStore* = object
else:
  static :
    hint("Declaration of " & "struct_objStore" &
        " already exists, not redeclaring")
when not declared(struct_micro_client_s):
  type
    struct_micro_client_s* = object
else:
  static :
    hint("Declaration of " & "struct_micro_client_s" &
        " already exists, not redeclaring")
when not declared(struct_natsHeader):
  type
    struct_natsHeader* = object
else:
  static :
    hint("Declaration of " & "struct_natsHeader" &
        " already exists, not redeclaring")
when not declared(struct_jsAtomicBatchCtx):
  type
    struct_jsAtomicBatchCtx* = object
else:
  static :
    hint("Declaration of " & "struct_jsAtomicBatchCtx" &
        " already exists, not redeclaring")
when not declared(struct_natsSubscription):
  type
    struct_natsSubscription* = object
else:
  static :
    hint("Declaration of " & "struct_natsSubscription" &
        " already exists, not redeclaring")
when not declared(struct_IO_marker):
  type
    struct_IO_marker* = object
else:
  static :
    hint("Declaration of " & "struct_IO_marker" &
        " already exists, not redeclaring")
when not declared(struct_kvWatcher):
  type
    struct_kvWatcher* = object
else:
  static :
    hint("Declaration of " & "struct_kvWatcher" &
        " already exists, not redeclaring")
when not declared(struct_objStoreWatcher):
  type
    struct_objStoreWatcher* = object
else:
  static :
    hint("Declaration of " & "struct_objStoreWatcher" &
        " already exists, not redeclaring")
when not declared(struct_IO_wide_data):
  type
    struct_IO_wide_data* = object
else:
  static :
    hint("Declaration of " & "struct_IO_wide_data" &
        " already exists, not redeclaring")
when not declared(struct_natsStatistics):
  type
    struct_natsStatistics* = object
else:
  static :
    hint("Declaration of " & "struct_natsStatistics" &
        " already exists, not redeclaring")
when not declared(struct_jsCtx):
  type
    struct_jsCtx* = object
else:
  static :
    hint("Declaration of " & "struct_jsCtx" & " already exists, not redeclaring")
when not declared(struct_natsMsg):
  type
    struct_natsMsg* = object
else:
  static :
    hint("Declaration of " & "struct_natsMsg" &
        " already exists, not redeclaring")
when not declared(struct_micro_error_s):
  type
    struct_micro_error_s* = object
else:
  static :
    hint("Declaration of " & "struct_micro_error_s" &
        " already exists, not redeclaring")
when not declared(struct_kvStore):
  type
    struct_kvStore* = object
else:
  static :
    hint("Declaration of " & "struct_kvStore" &
        " already exists, not redeclaring")
when not declared(struct_micro_service_s):
  type
    struct_micro_service_s* = object
else:
  static :
    hint("Declaration of " & "struct_micro_service_s" &
        " already exists, not redeclaring")
when not declared(struct_micro_request_s):
  type
    struct_micro_request_s* = object
else:
  static :
    hint("Declaration of " & "struct_micro_request_s" &
        " already exists, not redeclaring")
when not declared(struct_micro_group_s):
  type
    struct_micro_group_s* = object
else:
  static :
    hint("Declaration of " & "struct_micro_group_s" &
        " already exists, not redeclaring")
when not declared(struct_kvStatus):
  type
    struct_kvStatus* = object
else:
  static :
    hint("Declaration of " & "struct_kvStatus" &
        " already exists, not redeclaring")
when not declared(struct_objStoreGet):
  type
    struct_objStoreGet* = object
else:
  static :
    hint("Declaration of " & "struct_objStoreGet" &
        " already exists, not redeclaring")
when not declared(struct_objStorePut):
  type
    struct_objStorePut* = object
else:
  static :
    hint("Declaration of " & "struct_objStorePut" &
        " already exists, not redeclaring")
when not declared(struct_IO_codecvt):
  type
    struct_IO_codecvt* = object
else:
  static :
    hint("Declaration of " & "struct_IO_codecvt" &
        " already exists, not redeclaring")
type
  natsConnStatus_536871373 = enum_natsConnStatus_536871372 ## Generated based on /app/vendor/cnats/src/status.h:46:3
  natsStatus_536871377 = enum_natsStatus_536871376 ## Generated based on /app/vendor/cnats/src/status.h:141:3
  jsErrCode_536871381 = enum_jsErrCode_536871380 ## Generated based on /app/vendor/cnats/src/status.h:317:3
  natsSock_536871383 = cint  ## Generated based on /app/vendor/cnats/src/nats.h:50:23
  natsConnection_536871385 = struct_natsConnection ## Generated based on /app/vendor/cnats/src/nats.h:152:37
  natsStatistics_536871387 = struct_natsStatistics ## Generated based on /app/vendor/cnats/src/nats.h:159:37
  natsSubscription_536871389 = struct_natsSubscription ## Generated based on /app/vendor/cnats/src/nats.h:165:37
  natsMsg_536871391 = struct_natsMsg ## Generated based on /app/vendor/cnats/src/nats.h:172:37
  natsOptions_536871393 = struct_natsOptions ## Generated based on /app/vendor/cnats/src/nats.h:178:37
  natsInbox_536871395 = uint8 ## Generated based on /app/vendor/cnats/src/nats.h:187:37
  natsHeader_536871397 = struct_natsHeader ## Generated based on /app/vendor/cnats/src/nats.h:193:37
  natsThreadStartedHandler_536871399 = proc (a0: pointer): void {.cdecl.} ## Generated based on /app/vendor/cnats/src/nats.h:197:16
  struct_natsClientConfig_536871401 {.pure, inheritable, bycopy.} = object
    DefaultWriteDeadline*: int64 ## Generated based on /app/vendor/cnats/src/nats.h:205:16
    LockSpinCount*: int64
    DefaultToThreadPool*: bool
    ThreadPoolMax*: cint
    DefaultRepliesToThreadPool*: bool
    UseSeparatePoolForReplies*: bool
    ReplyThreadPoolMax*: cint
    ThreadStartedHandler*: natsThreadStartedHandler_536871400
    ThreadStartedHandlerClosure*: pointer
  natsClientConfig_536871403 = struct_natsClientConfig_536871402 ## Generated based on /app/vendor/cnats/src/nats.h:224:3
  struct_natsMsgList_536871405 {.pure, inheritable, bycopy.} = object
    Msgs*: ptr ptr natsMsg_536871392 ## Generated based on /app/vendor/cnats/src/nats.h:249:16
    Count*: cint
  natsMsgList_536871407 = struct_natsMsgList_536871406 ## Generated based on /app/vendor/cnats/src/nats.h:254:3
  struct_natsMetadata_536871409 {.pure, inheritable, bycopy.} = object
    List*: ptr ptr uint8     ## Generated based on /app/vendor/cnats/src/nats.h:260:16
    Count*: cint
  natsMetadata_536871411 = struct_natsMetadata_536871410 ## Generated based on /app/vendor/cnats/src/nats.h:271:3
  jsCtx_536871413 = struct_jsCtx ## Generated based on /app/vendor/cnats/src/nats.h:281:41
  jsAtomicBatchCtx_536871415 = struct_jsAtomicBatchCtx ## Generated based on /app/vendor/cnats/src/nats.h:286:41
  struct_jsPubOptions_536871417 {.pure, inheritable, bycopy.} = object
    MaxWait*: int64          ## Generated based on /app/vendor/cnats/src/nats.h:303:16
    MsgId*: ptr uint8
    ExpectStream*: ptr uint8
    ExpectLastMsgId*: ptr uint8
    ExpectLastSeq*: uint64
    ExpectLastSubjectSeq*: uint64
    ExpectLastSubjectSeqSubject*: ptr uint8
    ExpectNoMessage*: bool
    MsgTTL*: int64
  jsPubOptions_536871419 = struct_jsPubOptions_536871418 ## Generated based on /app/vendor/cnats/src/nats.h:315:3
  jsRetentionPolicy_536871423 = enum_jsRetentionPolicy_536871422 ## Generated based on /app/vendor/cnats/src/nats.h:326:3
  jsDiscardPolicy_536871427 = enum_jsDiscardPolicy_536871426 ## Generated based on /app/vendor/cnats/src/nats.h:336:3
  jsStorageType_536871431 = enum_jsStorageType_536871430 ## Generated based on /app/vendor/cnats/src/nats.h:346:3
  jsStorageCompression_536871435 = enum_jsStorageCompression_536871434 ## Generated based on /app/vendor/cnats/src/nats.h:355:3
  jsDeliverPolicy_536871439 = enum_jsDeliverPolicy_536871438 ## Generated based on /app/vendor/cnats/src/nats.h:369:3
  jsAckPolicy_536871443 = enum_jsAckPolicy_536871442 ## Generated based on /app/vendor/cnats/src/nats.h:381:3
  jsReplayPolicy_536871454 = enum_jsReplayPolicy_536871453 ## Generated based on /app/vendor/cnats/src/nats.h:391:3
  jsPersistModeType_536871458 = enum_jsPersistModeType_536871457 ## Generated based on /app/vendor/cnats/src/nats.h:400:3
  struct_jsPlacement_536871460 {.pure, inheritable, bycopy.} = object
    Cluster*: ptr uint8      ## Generated based on /app/vendor/cnats/src/nats.h:413:16
    Tags*: ptr ptr uint8
    TagsLen*: cint
  jsPlacement_536871462 = struct_jsPlacement_536871461 ## Generated based on /app/vendor/cnats/src/nats.h:419:3
  struct_jsExternalStream_536871464 {.pure, inheritable, bycopy.} = object
    APIPrefix*: ptr uint8    ## Generated based on /app/vendor/cnats/src/nats.h:430:16
    DeliverPrefix*: ptr uint8
  jsExternalStream_536871466 = struct_jsExternalStream_536871465 ## Generated based on /app/vendor/cnats/src/nats.h:435:3
  struct_jsStreamSource_536871468 {.pure, inheritable, bycopy.} = object
    Name*: ptr uint8         ## Generated based on /app/vendor/cnats/src/nats.h:449:16
    OptStartSeq*: uint64
    OptStartTime*: int64
    FilterSubject*: ptr uint8
    External*: ptr jsExternalStream_536871467
    Domain*: ptr uint8
  jsStreamSource_536871470 = struct_jsStreamSource_536871469 ## Generated based on /app/vendor/cnats/src/nats.h:461:3
  struct_jsRePublish_536871472 {.pure, inheritable, bycopy.} = object
    Source*: ptr uint8       ## Generated based on /app/vendor/cnats/src/nats.h:466:16
    Destination*: ptr uint8
    HeadersOnly*: bool
  jsRePublish_536871474 = struct_jsRePublish_536871473 ## Generated based on /app/vendor/cnats/src/nats.h:472:3
  struct_jsSubjectTransformConfig_536871476 {.pure, inheritable, bycopy.} = object
    Source*: ptr uint8       ## Generated based on /app/vendor/cnats/src/nats.h:478:16
    Destination*: ptr uint8
  jsSubjectTransformConfig_536871478 = struct_jsSubjectTransformConfig_536871477 ## Generated based on /app/vendor/cnats/src/nats.h:482:3
  struct_jsStreamConsumerLimits_536871480 {.pure, inheritable, bycopy.} = object
    InactiveThreshold*: int64 ## Generated based on /app/vendor/cnats/src/nats.h:488:16
    MaxAckPending*: cint
  jsStreamConsumerLimits_536871482 = struct_jsStreamConsumerLimits_536871481 ## Generated based on /app/vendor/cnats/src/nats.h:492:3
  struct_jsStreamConfig_536871484 {.pure, inheritable, bycopy.} = object
    Name*: ptr uint8         ## Generated based on /app/vendor/cnats/src/nats.h:573:16
    Description*: ptr uint8
    Subjects*: ptr ptr uint8
    SubjectsLen*: cint
    Retention*: jsRetentionPolicy_536871424
    MaxConsumers*: int64
    MaxMsgs*: int64
    MaxBytes*: int64
    MaxAge*: int64
    MaxMsgsPerSubject*: int64
    MaxMsgSize*: int32
    Discard*: jsDiscardPolicy_536871428
    Storage*: jsStorageType_536871432
    Replicas*: int64
    NoAck*: bool
    Template*: ptr uint8
    Duplicates*: int64
    Placement*: ptr jsPlacement_536871463
    Mirror*: ptr jsStreamSource_536871471
    Sources*: ptr ptr jsStreamSource_536871471
    SourcesLen*: cint
    Sealed*: bool
    DenyDelete*: bool
    DenyPurge*: bool
    AllowRollup*: bool
    RePublish*: ptr jsRePublish_536871475
    AllowDirect*: bool
    MirrorDirect*: bool
    DiscardNewPerSubject*: bool
    Metadata*: natsMetadata_536871412
    Compression*: jsStorageCompression_536871436
    FirstSeq*: uint64
    SubjectTransform*: jsSubjectTransformConfig_536871479
    ConsumerLimits*: jsStreamConsumerLimits_536871483
    AllowMsgTTL*: bool
    SubjectDeleteMarkerTTL*: int64
    PersistMode*: jsPersistModeType_536871459
    AllowAtomic*: bool
  jsStreamConfig_536871486 = struct_jsStreamConfig_536871485 ## Generated based on /app/vendor/cnats/src/nats.h:654:3
  struct_jsLostStreamData_536871488 {.pure, inheritable, bycopy.} = object
    Msgs*: ptr uint64        ## Generated based on /app/vendor/cnats/src/nats.h:659:16
    MsgsLen*: cint
    Bytes*: uint64
  jsLostStreamData_536871490 = struct_jsLostStreamData_536871489 ## Generated based on /app/vendor/cnats/src/nats.h:665:3
  struct_jsStreamStateSubject_536871492 {.pure, inheritable, bycopy.} = object
    Subject*: ptr uint8      ## Generated based on /app/vendor/cnats/src/nats.h:672:16
    Msgs*: uint64
  jsStreamStateSubject_536871494 = struct_jsStreamStateSubject_536871493 ## Generated based on /app/vendor/cnats/src/nats.h:677:3
  struct_jsStreamStateSubjects_536871496 {.pure, inheritable, bycopy.} = object
    List*: ptr jsStreamStateSubject_536871495 ## Generated based on /app/vendor/cnats/src/nats.h:708:16
    Count*: cint
  jsStreamStateSubjects_536871498 = struct_jsStreamStateSubjects_536871497 ## Generated based on /app/vendor/cnats/src/nats.h:713:3
  struct_jsStreamState_536871500 {.pure, inheritable, bycopy.} = object
    Msgs*: uint64            ## Generated based on /app/vendor/cnats/src/nats.h:721:16
    Bytes*: uint64
    FirstSeq*: uint64
    FirstTime*: int64
    LastSeq*: uint64
    LastTime*: int64
    NumSubjects*: int64
    Subjects*: ptr jsStreamStateSubjects_536871499
    NumDeleted*: uint64
    Deleted*: ptr uint64
    DeletedLen*: cint
    Lost*: ptr jsLostStreamData_536871491
    Consumers*: int64
  jsStreamState_536871502 = struct_jsStreamState_536871501 ## Generated based on /app/vendor/cnats/src/nats.h:737:3
  struct_jsPeerInfo_536871504 {.pure, inheritable, bycopy.} = object
    Name*: ptr uint8         ## Generated based on /app/vendor/cnats/src/nats.h:743:16
    Current*: bool
    Offline*: bool
    Active*: int64
    Lag*: uint64
  jsPeerInfo_536871506 = struct_jsPeerInfo_536871505 ## Generated based on /app/vendor/cnats/src/nats.h:751:3
  struct_jsClusterInfo_536871508 {.pure, inheritable, bycopy.} = object
    Name*: ptr uint8         ## Generated based on /app/vendor/cnats/src/nats.h:757:16
    Leader*: ptr uint8
    Replicas*: ptr ptr jsPeerInfo_536871507
    ReplicasLen*: cint
    RaftGroup*: ptr uint8
    LeaderSince*: int64
    SystemAcc*: bool
    TrafficAcc*: ptr uint8
  jsClusterInfo_536871510 = struct_jsClusterInfo_536871509 ## Generated based on /app/vendor/cnats/src/nats.h:768:3
  struct_jsStreamSourceInfo_536871512 {.pure, inheritable, bycopy.} = object
    Name*: ptr uint8         ## Generated based on /app/vendor/cnats/src/nats.h:773:16
    External*: ptr jsExternalStream_536871467
    Lag*: uint64
    Active*: int64
    FilterSubject*: ptr uint8
    SubjectTransforms*: ptr jsSubjectTransformConfig_536871479
    SubjectTransformsLen*: cint
  jsStreamSourceInfo_536871514 = struct_jsStreamSourceInfo_536871513 ## Generated based on /app/vendor/cnats/src/nats.h:783:3
  struct_jsStreamAlternate_536871516 {.pure, inheritable, bycopy.} = object
    Name*: ptr uint8         ## Generated based on /app/vendor/cnats/src/nats.h:788:16
    Domain*: ptr uint8
    Cluster*: ptr uint8
  jsStreamAlternate_536871518 = struct_jsStreamAlternate_536871517 ## Generated based on /app/vendor/cnats/src/nats.h:794:3
  struct_jsStreamInfo_536871520 {.pure, inheritable, bycopy.} = object
    Config*: ptr jsStreamConfig_536871487 ## Generated based on /app/vendor/cnats/src/nats.h:802:16
    Created*: int64
    State*: jsStreamState_536871503
    Cluster*: ptr jsClusterInfo_536871511
    Mirror*: ptr jsStreamSourceInfo_536871515
    Sources*: ptr ptr jsStreamSourceInfo_536871515
    SourcesLen*: cint
    Alternates*: ptr ptr jsStreamAlternate_536871519
    AlternatesLen*: cint
  jsStreamInfo_536871522 = struct_jsStreamInfo_536871521 ## Generated based on /app/vendor/cnats/src/nats.h:814:3
  struct_jsStreamInfoList_536871524 {.pure, inheritable, bycopy.} = object
    List*: ptr ptr jsStreamInfo_536871523 ## Generated based on /app/vendor/cnats/src/nats.h:823:16
    Count*: cint
  jsStreamInfoList_536871526 = struct_jsStreamInfoList_536871525 ## Generated based on /app/vendor/cnats/src/nats.h:828:3
  struct_jsStreamNamesList_536871528 {.pure, inheritable, bycopy.} = object
    List*: ptr ptr uint8     ## Generated based on /app/vendor/cnats/src/nats.h:837:16
    Count*: cint
  jsStreamNamesList_536871530 = struct_jsStreamNamesList_536871529 ## Generated based on /app/vendor/cnats/src/nats.h:842:3
  struct_jsConsumerConfig_536871532 {.pure, inheritable, bycopy.} = object
    Name*: ptr uint8         ## Generated based on /app/vendor/cnats/src/nats.h:887:16
    Durable*: ptr uint8
    Description*: ptr uint8
    DeliverPolicy*: jsDeliverPolicy_536871440
    OptStartSeq*: uint64
    OptStartTime*: int64
    AckPolicy*: jsAckPolicy_536871444
    AckWait*: int64
    MaxDeliver*: int64
    BackOff*: ptr int64
    BackOffLen*: cint
    FilterSubject*: ptr uint8
    ReplayPolicy*: jsReplayPolicy_536871455
    RateLimit*: uint64
    SampleFrequency*: ptr uint8
    MaxWaiting*: int64
    MaxAckPending*: int64
    FlowControl*: bool
    Heartbeat*: int64
    HeadersOnly*: bool
    MaxRequestBatch*: int64
    MaxRequestExpires*: int64
    MaxRequestMaxBytes*: int64
    DeliverSubject*: ptr uint8
    DeliverGroup*: ptr uint8
    InactiveThreshold*: int64
    Replicas*: int64
    MemoryStorage*: bool
    FilterSubjects*: ptr ptr uint8
    FilterSubjectsLen*: cint
    Metadata*: natsMetadata_536871412
    PauseUntil*: int64
    PriorityPolicy*: ptr uint8
    PinnedTTL*: int64
    PriorityGroups*: ptr ptr uint8
    PriorityGroupsLen*: cint
  jsConsumerConfig_536871534 = struct_jsConsumerConfig_536871533 ## Generated based on /app/vendor/cnats/src/nats.h:954:3
  struct_jsConsumerSequenceMismatch_536871536 {.pure, inheritable, bycopy.} = object
    Stream*: uint64          ## Generated based on /app/vendor/cnats/src/nats.h:973:16
    ConsumerClient*: uint64
    ConsumerServer*: uint64
  jsConsumerSequenceMismatch_536871538 = struct_jsConsumerSequenceMismatch_536871537 ## Generated based on /app/vendor/cnats/src/nats.h:979:3
  struct_jsSubOptions_536871540 {.pure, inheritable, bycopy.} = object
    Stream*: ptr uint8       ## Generated based on /app/vendor/cnats/src/nats.h:996:16
    Consumer*: ptr uint8
    Queue*: ptr uint8
    ManualAck*: bool
    Config*: jsConsumerConfig_536871535
    Ordered*: bool
  jsSubOptions_536871542 = struct_jsSubOptions_536871541 ## Generated based on /app/vendor/cnats/src/nats.h:1056:3
  struct_jsSequencePair_536871544 {.pure, inheritable, bycopy.} = object
    Consumer*: uint64        ## Generated based on /app/vendor/cnats/src/nats.h:1061:16
    Stream*: uint64
  jsSequencePair_536871546 = struct_jsSequencePair_536871545 ## Generated based on /app/vendor/cnats/src/nats.h:1066:3
  struct_jsSequenceInfo_536871548 {.pure, inheritable, bycopy.} = object
    Consumer*: uint64        ## Generated based on /app/vendor/cnats/src/nats.h:1071:16
    Stream*: uint64
    Last*: int64
  jsSequenceInfo_536871550 = struct_jsSequenceInfo_536871549 ## Generated based on /app/vendor/cnats/src/nats.h:1077:3
  struct_jsPriorityGroupState_536871552 {.pure, inheritable, bycopy.} = object
    Group*: ptr uint8        ## Generated based on /app/vendor/cnats/src/nats.h:1082:17
    PinnedClientID*: ptr uint8
    PinnedTS*: int64
  jsPriorityGroupState_536871554 = struct_jsPriorityGroupState_536871553 ## Generated based on /app/vendor/cnats/src/nats.h:1087:4
  struct_jsConsumerInfo_536871556 {.pure, inheritable, bycopy.} = object
    Stream*: ptr uint8       ## Generated based on /app/vendor/cnats/src/nats.h:1095:16
    Name*: ptr uint8
    Created*: int64
    Config*: ptr jsConsumerConfig_536871535
    Delivered*: jsSequenceInfo_536871551
    AckFloor*: jsSequenceInfo_536871551
    NumAckPending*: int64
    NumRedelivered*: int64
    NumWaiting*: int64
    NumPending*: uint64
    Cluster*: ptr jsClusterInfo_536871511
    PushBound*: bool
    Paused*: bool
    PauseRemaining*: int64
    PriorityGroups*: ptr jsPriorityGroupState_536871555
    PriorityGroupsLen*: cint
  jsConsumerInfo_536871558 = struct_jsConsumerInfo_536871557 ## Generated based on /app/vendor/cnats/src/nats.h:1113:3
  struct_jsConsumerInfoList_536871560 {.pure, inheritable, bycopy.} = object
    List*: ptr ptr jsConsumerInfo_536871559 ## Generated based on /app/vendor/cnats/src/nats.h:1122:16
    Count*: cint
  jsConsumerInfoList_536871562 = struct_jsConsumerInfoList_536871561 ## Generated based on /app/vendor/cnats/src/nats.h:1127:3
  struct_jsConsumerNamesList_536871564 {.pure, inheritable, bycopy.} = object
    List*: ptr ptr uint8     ## Generated based on /app/vendor/cnats/src/nats.h:1136:16
    Count*: cint
  jsConsumerNamesList_536871566 = struct_jsConsumerNamesList_536871565 ## Generated based on /app/vendor/cnats/src/nats.h:1141:3
  struct_jsConsumerPauseResponse_536871568 {.pure, inheritable, bycopy.} = object
    Paused*: bool            ## Generated based on /app/vendor/cnats/src/nats.h:1148:16
    PauseUntil*: int64
    PauseRemaining*: int64
  jsConsumerPauseResponse_536871570 = struct_jsConsumerPauseResponse_536871569 ## Generated based on /app/vendor/cnats/src/nats.h:1153:3
  struct_jsAPIStats_536871572 {.pure, inheritable, bycopy.} = object
    Total*: uint64           ## Generated based on /app/vendor/cnats/src/nats.h:1158:16
    Errors*: uint64
  jsAPIStats_536871574 = struct_jsAPIStats_536871573 ## Generated based on /app/vendor/cnats/src/nats.h:1163:3
  struct_jsAccountLimits_536871576 {.pure, inheritable, bycopy.} = object
    MaxMemory*: int64        ## Generated based on /app/vendor/cnats/src/nats.h:1168:17
    MaxStore*: int64
    MaxStreams*: int64
    MaxConsumers*: int64
    MaxAckPending*: int64
    MemoryMaxStreamBytes*: int64
    StoreMaxStreamBytes*: int64
    MaxBytesRequired*: bool
  jsAccountLimits_536871578 = struct_jsAccountLimits_536871577 ## Generated based on /app/vendor/cnats/src/nats.h:1179:3
  struct_jsTier_536871580 {.pure, inheritable, bycopy.} = object
    Name*: ptr uint8         ## Generated based on /app/vendor/cnats/src/nats.h:1181:16
    Memory*: uint64
    Store*: uint64
    Streams*: int64
    Consumers*: int64
    Limits*: jsAccountLimits_536871579
  jsTier_536871582 = struct_jsTier_536871581 ## Generated based on /app/vendor/cnats/src/nats.h:1190:3
  struct_jsAccountInfo_536871584 {.pure, inheritable, bycopy.} = object
    Memory*: uint64          ## Generated based on /app/vendor/cnats/src/nats.h:1195:16
    Store*: uint64
    Streams*: int64
    Consumers*: int64
    Domain*: ptr uint8
    API*: jsAPIStats_536871575
    Limits*: jsAccountLimits_536871579
    Tiers*: ptr ptr jsTier_536871583
    TiersLen*: cint
  jsAccountInfo_536871586 = struct_jsAccountInfo_536871585 ## Generated based on /app/vendor/cnats/src/nats.h:1207:3
  struct_jsMsgMetaData_536871588 {.pure, inheritable, bycopy.} = object
    Sequence*: jsSequencePair_536871547 ## Generated based on /app/vendor/cnats/src/nats.h:1216:16
    NumDelivered*: uint64
    NumPending*: uint64
    Timestamp*: int64
    Stream*: ptr uint8
    Consumer*: ptr uint8
    Domain*: ptr uint8
  jsMsgMetaData_536871590 = struct_jsMsgMetaData_536871589 ## Generated based on /app/vendor/cnats/src/nats.h:1226:3
  struct_jsPubAck_536871592 {.pure, inheritable, bycopy.} = object
    Stream*: ptr uint8       ## Generated based on /app/vendor/cnats/src/nats.h:1231:16
    Sequence*: uint64
    Domain*: ptr uint8
    Duplicate*: bool
    Batch*: ptr uint8
    Count*: uint64
  jsPubAck_536871594 = struct_jsPubAck_536871593 ## Generated based on /app/vendor/cnats/src/nats.h:1240:3
  struct_jsPubAckErr_536871596 {.pure, inheritable, bycopy.} = object
    Msg*: ptr natsMsg_536871392 ## Generated based on /app/vendor/cnats/src/nats.h:1246:16
    Err*: natsStatus_536871378
    ErrCode*: jsErrCode_536871382
    ErrText*: ptr uint8
  jsPubAckErr_536871598 = struct_jsPubAckErr_536871597 ## Generated based on /app/vendor/cnats/src/nats.h:1253:3
  jsPubAckErrHandler_536871600 = proc (a0: ptr jsCtx_536871414;
                                       a1: ptr jsPubAckErr_536871599;
                                       a2: pointer): void {.cdecl.} ## Generated based on /app/vendor/cnats/src/nats.h:1257:16
  jsPubAckHandler_536871602 = proc (a0: ptr jsCtx_536871414; a1: ptr natsMsg_536871392;
                                    a2: ptr jsPubAck_536871595;
                                    a3: ptr jsPubAckErr_536871599; a4: pointer): void {.
      cdecl.}                ## Generated based on /app/vendor/cnats/src/nats.h:1258:16
  struct_jsDirectGetMsgOptions_536871604 {.pure, inheritable, bycopy.} = object
    Sequence*: uint64        ## Generated based on /app/vendor/cnats/src/nats.h:1270:16
    NextBySubject*: ptr uint8
    LastBySubject*: ptr uint8
  jsDirectGetMsgOptions_536871606 = struct_jsDirectGetMsgOptions_536871605 ## Generated based on /app/vendor/cnats/src/nats.h:1276:3
  struct_jsFetchRequest_536871608 {.pure, inheritable, bycopy.} = object
    Expires*: int64          ## Generated based on /app/vendor/cnats/src/nats.h:1283:16
    Batch*: cint
    MaxBytes*: int64
    NoWait*: bool
    Heartbeat*: int64
    MinPending*: int64
    MinAckPending*: int64
    ID*: ptr uint8
    Group*: ptr uint8
    Priority*: uint8
  jsFetchRequest_536871610 = struct_jsFetchRequest_536871609 ## Generated based on /app/vendor/cnats/src/nats.h:1302:3
  jsFetchCompleteHandler_536871612 = proc (a0: ptr natsConnection_536871386;
      a1: ptr natsSubscription_536871390; a2: natsStatus_536871378; a3: pointer): void {.
      cdecl.}                ## Generated based on /app/vendor/cnats/src/nats.h:1325:16
  jsFetchNextHandler_536871614 = proc (a0: ptr cint; a1: ptr int64;
                                       a2: ptr natsSubscription_536871390;
                                       a3: pointer): bool {.cdecl.} ## Generated based on /app/vendor/cnats/src/nats.h:1337:16
  struct_jsOptionsPullSubscribeAsync_536871616 {.pure, inheritable, bycopy.} = object
    Timeout*: int64          ## Generated based on /app/vendor/cnats/src/nats.h:1344:16
    MaxMessages*: cint
    MaxBytes*: int64
    NoWait*: bool
    CompleteHandler*: jsFetchCompleteHandler_536871613
    CompleteHandlerClosure*: pointer
    Heartbeat*: int64
    Group*: ptr uint8
    MinPending*: int64
    MinAckPending*: int64
    FetchSize*: cint
    KeepAhead*: cint
    NextHandler*: jsFetchNextHandler_536871615
    NextHandlerClosure*: pointer
  jsOptionsPullSubscribeAsync_536871618 = struct_jsOptionsPullSubscribeAsync_536871617 ## Generated based on /app/vendor/cnats/src/nats.h:1410:3
  struct_jsOptionsPublishAsync_536871620 {.pure, inheritable, bycopy.} = object
    MaxPending*: int64       ## Generated based on /app/vendor/cnats/src/nats.h:1417:16
    AckHandler*: jsPubAckHandler_536871603
    AckHandlerClosure*: pointer
    ErrHandler*: jsPubAckErrHandler_536871601
    ErrHandlerClosure*: pointer
    StallWait*: int64
  jsOptionsPublishAsync_536871622 = struct_jsOptionsPublishAsync_536871621 ## Generated based on /app/vendor/cnats/src/nats.h:1438:3
  struct_jsOptionsStreamPurge_536871624 {.pure, inheritable, bycopy.} = object
    Subject*: ptr uint8      ## Generated based on /app/vendor/cnats/src/nats.h:1449:16
    Sequence*: uint64
    Keep*: uint64
  jsOptionsStreamPurge_536871626 = struct_jsOptionsStreamPurge_536871625 ## Generated based on /app/vendor/cnats/src/nats.h:1455:3
  struct_jsOptionsStreamInfo_536871628 {.pure, inheritable, bycopy.} = object
    DeletedDetails*: bool    ## Generated based on /app/vendor/cnats/src/nats.h:1460:16
    SubjectsFilter*: ptr uint8
  jsOptionsStreamInfo_536871630 = struct_jsOptionsStreamInfo_536871629 ## Generated based on /app/vendor/cnats/src/nats.h:1465:3
  struct_jsOptionsStream_536871632 {.pure, inheritable, bycopy.} = object
    Purge*: jsOptionsStreamPurge_536871627 ## Generated based on /app/vendor/cnats/src/nats.h:1473:16
    Info*: jsOptionsStreamInfo_536871631
  jsOptionsStream_536871634 = struct_jsOptionsStream_536871633 ## Generated based on /app/vendor/cnats/src/nats.h:1478:3
  struct_jsOptions_536871636 {.pure, inheritable, bycopy.} = object
    Prefix*: ptr uint8       ## Generated based on /app/vendor/cnats/src/nats.h:1485:16
    Domain*: ptr uint8
    Wait*: int64
    PublishAsync*: jsOptionsPublishAsync_536871623
    PullSubscribeAsync*: jsOptionsPullSubscribeAsync_536871619
    Stream*: jsOptionsStream_536871635
  jsOptions_536871638 = struct_jsOptions_536871637 ## Generated based on /app/vendor/cnats/src/nats.h:1494:3
  kvStore_536871640 = struct_kvStore ## Generated based on /app/vendor/cnats/src/nats.h:1499:41
  kvEntry_536871642 = struct_kvEntry ## Generated based on /app/vendor/cnats/src/nats.h:1504:41
  kvStatus_536871644 = struct_kvStatus ## Generated based on /app/vendor/cnats/src/nats.h:1509:41
  kvWatcher_536871646 = struct_kvWatcher ## Generated based on /app/vendor/cnats/src/nats.h:1514:41
  kvOperation_536871650 = enum_kvOperation_536871649 ## Generated based on /app/vendor/cnats/src/nats.h:1526:3
  struct_kvConfig_536871652 {.pure, inheritable, bycopy.} = object
    Bucket*: ptr uint8       ## Generated based on /app/vendor/cnats/src/nats.h:1533:16
    Description*: ptr uint8
    MaxValueSize*: int32
    History*: uint8
    TTL*: int64
    MaxBytes*: int64
    StorageType*: jsStorageType_536871432
    Replicas*: cint
    RePublish*: ptr jsRePublish_536871475
    Mirror*: ptr jsStreamSource_536871471
    Sources*: ptr ptr jsStreamSource_536871471
    SourcesLen*: cint
  kvConfig_536871654 = struct_kvConfig_536871653 ## Generated based on /app/vendor/cnats/src/nats.h:1548:3
  struct_kvWatchOptions_536871656 {.pure, inheritable, bycopy.} = object
    IgnoreDeletes*: bool     ## Generated based on /app/vendor/cnats/src/nats.h:1555:16
    IncludeHistory*: bool
    MetaOnly*: bool
    Timeout*: int64
    UpdatesOnly*: bool
  kvWatchOptions_536871658 = struct_kvWatchOptions_536871657 ## Generated based on /app/vendor/cnats/src/nats.h:1563:3
  struct_kvPurgeOptions_536871660 {.pure, inheritable, bycopy.} = object
    Timeout*: int64          ## Generated based on /app/vendor/cnats/src/nats.h:1570:16
    DeleteMarkersOlderThan*: int64
  kvPurgeOptions_536871662 = struct_kvPurgeOptions_536871661 ## Generated based on /app/vendor/cnats/src/nats.h:1585:3
  struct_kvEntryList_536871664 {.pure, inheritable, bycopy.} = object
    Entries*: ptr ptr kvEntry_536871643 ## Generated based on /app/vendor/cnats/src/nats.h:1604:16
    Count*: cint
  kvEntryList_536871666 = struct_kvEntryList_536871665 ## Generated based on /app/vendor/cnats/src/nats.h:1609:3
  struct_kvKeysList_536871668 {.pure, inheritable, bycopy.} = object
    Keys*: ptr ptr uint8     ## Generated based on /app/vendor/cnats/src/nats.h:1628:16
    Count*: cint
  kvKeysList_536871670 = struct_kvKeysList_536871669 ## Generated based on /app/vendor/cnats/src/nats.h:1633:3
  objStore_536871672 = struct_objStore ## Generated based on /app/vendor/cnats/src/nats.h:1638:41
  objStorePut_536871674 = struct_objStorePut ## Generated based on /app/vendor/cnats/src/nats.h:1652:41
  objStoreGet_536871676 = struct_objStoreGet ## Generated based on /app/vendor/cnats/src/nats.h:1659:41
  objStoreWatcher_536871678 = struct_objStoreWatcher ## Generated based on /app/vendor/cnats/src/nats.h:1664:41
  struct_objStoreConfig_536871680 {.pure, inheritable, bycopy.} = object
    Bucket*: ptr uint8       ## Generated based on /app/vendor/cnats/src/nats.h:1693:16
    Description*: ptr uint8
    TTL*: int64
    MaxBytes*: int64
    Storage*: jsStorageType_536871432
    Replicas*: cint
    Placement*: ptr jsPlacement_536871463
    Compression*: bool
    Metadata*: natsMetadata_536871412
  objStoreConfig_536871682 = struct_objStoreConfig_536871681 ## Generated based on /app/vendor/cnats/src/nats.h:1759:3
  struct_objStoreNamesList_536871684 {.pure, inheritable, bycopy.} = object
    List*: ptr ptr uint8     ## Generated based on /app/vendor/cnats/src/nats.h:1768:16
    Count*: cint
  objStoreNamesList_536871686 = struct_objStoreNamesList_536871685 ## Generated based on /app/vendor/cnats/src/nats.h:1773:3
  struct_objStoreStatus_536871688 {.pure, inheritable, bycopy.} = object
    Bucket*: ptr uint8       ## Generated based on /app/vendor/cnats/src/nats.h:1788:16
    Description*: ptr uint8
    TTL*: int64
    Storage*: jsStorageType_536871432
    Replicas*: cint
    Sealed*: bool
    Size*: uint64
    BackingStore*: ptr uint8
    Metadata*: natsMetadata_536871412
    StreamInfo*: ptr jsStreamInfo_536871523
    IsCompressed*: bool
  objStoreStatus_536871690 = struct_objStoreStatus_536871689 ## Generated based on /app/vendor/cnats/src/nats.h:1847:3
  struct_objStoreStatusesList_536871692 {.pure, inheritable, bycopy.} = object
    List*: ptr ptr objStoreStatus_536871691 ## Generated based on /app/vendor/cnats/src/nats.h:1856:16
    Count*: cint
  objStoreStatusesList_536871694 = struct_objStoreStatusesList_536871693 ## Generated based on /app/vendor/cnats/src/nats.h:1861:3
  struct_objStoreLink_536871696 {.pure, inheritable, bycopy.} = object
    Bucket*: ptr uint8       ## Generated based on /app/vendor/cnats/src/nats.h:1866:16
    Name*: ptr uint8
  objStoreLink_536871698 = struct_objStoreLink_536871697 ## Generated based on /app/vendor/cnats/src/nats.h:1880:3
  struct_objStoreMetaOptions_536871700 {.pure, inheritable, bycopy.} = object
    Link*: ptr objStoreLink_536871699 ## Generated based on /app/vendor/cnats/src/nats.h:1885:16
    ChunkSize*: uint32
  objStoreMetaOptions_536871702 = struct_objStoreMetaOptions_536871701 ## Generated based on /app/vendor/cnats/src/nats.h:1901:3
  struct_objStoreMeta_536871704 {.pure, inheritable, bycopy.} = object
    Name*: ptr uint8         ## Generated based on /app/vendor/cnats/src/nats.h:1906:16
    Description*: ptr uint8
    Headers*: ptr natsHeader_536871398
    Metadata*: natsMetadata_536871412
    Opts*: objStoreMetaOptions_536871703
  objStoreMeta_536871706 = struct_objStoreMeta_536871705 ## Generated based on /app/vendor/cnats/src/nats.h:1936:3
  struct_objStoreInfo_536871708 {.pure, inheritable, bycopy.} = object
    Meta*: objStoreMeta_536871707 ## Generated based on /app/vendor/cnats/src/nats.h:1941:16
    Bucket*: ptr uint8
    NUID*: ptr uint8
    Size*: uint64
    ModTime*: int64
    Chunks*: uint32
    Digest*: ptr uint8
    Deleted*: bool
  objStoreInfo_536871710 = struct_objStoreInfo_536871709 ## Generated based on /app/vendor/cnats/src/nats.h:1987:3
  struct_objStoreInfoList_536871712 {.pure, inheritable, bycopy.} = object
    List*: ptr ptr objStoreInfo_536871711 ## Generated based on /app/vendor/cnats/src/nats.h:1996:16
    Count*: cint
  objStoreInfoList_536871714 = struct_objStoreInfoList_536871713 ## Generated based on /app/vendor/cnats/src/nats.h:2001:3
  struct_objStoreOptions_536871716 {.pure, inheritable, bycopy.} = object
    ShowDeleted*: bool       ## Generated based on /app/vendor/cnats/src/nats.h:2014:16
  objStoreOptions_536871718 = struct_objStoreOptions_536871717 ## Generated based on /app/vendor/cnats/src/nats.h:2024:3
  struct_objStoreWatchOptions_536871720 {.pure, inheritable, bycopy.} = object
    IgnoreDeletes*: bool     ## Generated based on /app/vendor/cnats/src/nats.h:2031:16
    UpdatesOnly*: bool
  objStoreWatchOptions_536871722 = struct_objStoreWatchOptions_536871721 ## Generated based on /app/vendor/cnats/src/nats.h:2049:3
  natsMsgHandler_536871724 = proc (a0: ptr natsConnection_536871386;
                                   a1: ptr natsSubscription_536871390;
                                   a2: ptr natsMsg_536871392; a3: pointer): void {.
      cdecl.}                ## Generated based on /app/vendor/cnats/src/nats.h:2112:16
  natsConnectionHandler_536871726 = proc (a0: ptr natsConnection_536871386;
      a1: pointer): void {.cdecl.} ## Generated based on /app/vendor/cnats/src/nats.h:2128:16
  natsProxyConnHandler_536871728 = proc (a0: ptr natsSock_536871384;
      a1: ptr uint8; a2: cint; a3: pointer): natsStatus_536871378 {.cdecl.} ## Generated based on /app/vendor/cnats/src/nats.h:2142:22
  natsErrHandler_536871730 = proc (a0: ptr natsConnection_536871386;
                                   a1: ptr natsSubscription_536871390;
                                   a2: natsStatus_536871378; a3: pointer): void {.
      cdecl.}                ## Generated based on /app/vendor/cnats/src/nats.h:2151:16
  natsEvLoop_Attach_536871732 = proc (a0: ptr pointer; a1: pointer;
                                      a2: ptr natsConnection_536871386;
                                      a3: natsSock_536871384): natsStatus_536871378 {.
      cdecl.}                ## Generated based on /app/vendor/cnats/src/nats.h:2168:22
  natsEvLoop_ReadAddRemove_536871734 = proc (a0: pointer; a1: bool): natsStatus_536871378 {.
      cdecl.}                ## Generated based on /app/vendor/cnats/src/nats.h:2183:22
  natsEvLoop_WriteAddRemove_536871736 = proc (a0: pointer; a1: bool): natsStatus_536871378 {.
      cdecl.}                ## Generated based on /app/vendor/cnats/src/nats.h:2196:22
  natsEvLoop_Detach_536871738 = proc (a0: pointer): natsStatus_536871378 {.cdecl.} ## Generated based on /app/vendor/cnats/src/nats.h:2207:22
  natsUserJWTHandler_536871740 = proc (a0: ptr ptr uint8; a1: ptr ptr uint8;
                                       a2: pointer): natsStatus_536871378 {.
      cdecl.}                ## Generated based on /app/vendor/cnats/src/nats.h:2231:22
  natsSignatureHandler_536871742 = proc (a0: ptr ptr uint8; a1: ptr ptr uint8;
      a2: ptr cint; a3: ptr uint8; a4: pointer): natsStatus_536871378 {.cdecl.} ## Generated based on /app/vendor/cnats/src/nats.h:2262:22
  natsTokenHandler_536871744 = proc (a0: pointer): ptr uint8 {.cdecl.} ## Generated based on /app/vendor/cnats/src/nats.h:2277:23
  natsOnCompleteCB_536871746 = proc (a0: pointer): void {.cdecl.} ## Generated based on /app/vendor/cnats/src/nats.h:2287:16
  natsCustomReconnectDelayHandler_536871748 = proc (a0: ptr natsConnection_536871386;
      a1: cint; a2: pointer): int64 {.cdecl.} ## Generated based on /app/vendor/cnats/src/nats.h:2309:19
  natsSSLVerifyCb_536871750 = proc (a0: cint; a1: pointer): cint {.cdecl.} ## Generated based on /app/vendor/cnats/src/nats.h:2334:15
  FILE_536871752 = struct_IO_FILE_536871803 ## Generated based on /usr/include/aarch64-linux-gnu/bits/types/FILE.h:7:25
  microClient_536871754 = struct_micro_client_s ## Generated based on /app/vendor/cnats/src/nats.h:9680:31
  microClientConfig_536871756 = struct_for_forward_compatibility_only ## Generated based on /app/vendor/cnats/src/nats.h:9685:49
  microEndpoint_536871758 = struct_micro_endpoint_s ## Generated based on /app/vendor/cnats/src/nats.h:9696:33
  microEndpointConfig_536871760 = struct_micro_endpoint_config_s_536871763 ## Generated based on /app/vendor/cnats/src/nats.h:9705:40
  struct_micro_endpoint_config_s_536871762 {.pure, inheritable, bycopy.} = object
    Name*: ptr uint8         ## Generated based on /app/vendor/cnats/src/nats.h:9884:8
    Subject*: ptr uint8
    QueueGroup*: ptr uint8
    NoQueueGroup*: bool
    Metadata*: natsMetadata_536871412
    Handler*: microRequestHandler_536871797
    State*: pointer
  microEndpointInfo_536871764 = struct_micro_endpoint_info_s_536871767 ## Generated based on /app/vendor/cnats/src/nats.h:9716:38
  struct_micro_endpoint_info_s_536871766 {.pure, inheritable, bycopy.} = object
    Name*: ptr uint8         ## Generated based on /app/vendor/cnats/src/nats.h:9937:8
    Subject*: ptr uint8
    QueueGroup*: ptr uint8
    Metadata*: natsMetadata_536871412
  microEndpointStats_536871768 = struct_micro_endpoint_stats_s_536871771 ## Generated based on /app/vendor/cnats/src/nats.h:9726:39
  struct_micro_endpoint_stats_s_536871770 {.pure, inheritable, bycopy.} = object
    Name*: ptr uint8         ## Generated based on /app/vendor/cnats/src/nats.h:9965:8
    Subject*: ptr uint8
    QueueGroup*: ptr uint8
    NumRequests*: int64
    NumErrors*: int64
    ProcessingTimeSeconds*: int64
    ProcessingTimeNanoseconds*: int64
    AverageProcessingTimeNanoseconds*: int64
    LastErrorString*: array[2048'i64, uint8]
  microError_536871772 = struct_micro_error_s ## Generated based on /app/vendor/cnats/src/nats.h:9740:30
  microGroup_536871774 = struct_micro_group_s ## Generated based on /app/vendor/cnats/src/nats.h:9749:30
  microGroupConfig_536871776 = struct_micro_group_config_s_536871779 ## Generated based on /app/vendor/cnats/src/nats.h:9757:37
  struct_micro_group_config_s_536871778 {.pure, inheritable, bycopy.} = object
    Prefix*: ptr uint8       ## Generated based on /app/vendor/cnats/src/nats.h:10011:8
    QueueGroup*: ptr uint8
    NoQueueGroup*: bool
  microRequest_536871780 = struct_micro_request_s ## Generated based on /app/vendor/cnats/src/nats.h:9764:32
  microService_536871782 = struct_micro_service_s ## Generated based on /app/vendor/cnats/src/nats.h:9777:32
  microServiceConfig_536871784 = struct_micro_service_config_s_536871787 ## Generated based on /app/vendor/cnats/src/nats.h:9788:39
  struct_micro_service_config_s_536871786 {.pure, inheritable, bycopy.} = object
    Name*: ptr uint8         ## Generated based on /app/vendor/cnats/src/nats.h:10029:8
    Version*: ptr uint8
    Description*: ptr uint8
    QueueGroup*: ptr uint8
    NoQueueGroup*: bool
    Metadata*: natsMetadata_536871412
    Endpoint*: ptr microEndpointConfig_536871761
    StatsHandler*: microRequestHandler_536871797
    ErrHandler*: microErrorHandler_536871799
    DoneHandler*: microDoneHandler_536871801
    State*: pointer
  microServiceInfo_536871788 = struct_micro_service_info_s_536871791 ## Generated based on /app/vendor/cnats/src/nats.h:9799:37
  struct_micro_service_info_s_536871790 {.pure, inheritable, bycopy.} = object
    Type*: ptr uint8         ## Generated based on /app/vendor/cnats/src/nats.h:10118:8
    Name*: ptr uint8
    Version*: ptr uint8
    Description*: ptr uint8
    Id*: ptr uint8
    Metadata*: natsMetadata_536871412
    Endpoints*: ptr microEndpointInfo_536871765
    EndpointsLen*: cint
  microServiceStats_536871792 = struct_micro_service_stats_s_536871795 ## Generated based on /app/vendor/cnats/src/nats.h:9807:38
  struct_micro_service_stats_s_536871794 {.pure, inheritable, bycopy.} = object
    Type*: ptr uint8         ## Generated based on /app/vendor/cnats/src/nats.h:10164:8
    Name*: ptr uint8
    Version*: ptr uint8
    Id*: ptr uint8
    Started*: int64
    Endpoints*: ptr microEndpointStats_536871769
    EndpointsLen*: cint
  microRequestHandler_536871796 = proc (a0: ptr microRequest_536871781): ptr microError_536871773 {.
      cdecl.}                ## Generated based on /app/vendor/cnats/src/nats.h:9833:23
  microErrorHandler_536871798 = proc (a0: ptr microService_536871783;
                                      a1: ptr microEndpoint_536871759;
                                      a2: natsStatus_536871378): void {.cdecl.} ## Generated based on /app/vendor/cnats/src/nats.h:9857:16
  microDoneHandler_536871800 = proc (a0: ptr microService_536871783): void {.
      cdecl.}                ## Generated based on /app/vendor/cnats/src/nats.h:9870:16
  struct_IO_FILE_536871802 {.pure, inheritable, bycopy.} = object
    internal_flags*: cint    ## Generated based on /usr/include/aarch64-linux-gnu/bits/types/struct_FILE.h:49:8
    internal_IO_read_ptr*: ptr uint8
    internal_IO_read_end*: ptr uint8
    internal_IO_read_base*: ptr uint8
    internal_IO_write_base*: ptr uint8
    internal_IO_write_ptr*: ptr uint8
    internal_IO_write_end*: ptr uint8
    internal_IO_buf_base*: ptr uint8
    internal_IO_buf_end*: ptr uint8
    internal_IO_save_base*: ptr uint8
    internal_IO_backup_base*: ptr uint8
    internal_IO_save_end*: ptr uint8
    internal_markers*: ptr struct_IO_marker
    internal_chain*: ptr struct_IO_FILE_536871803
    internal_fileno*: cint
    internal_flags2*: cint
    internal_old_offset*: compiler_off_t_536871808
    internal_cur_column*: cushort
    internal_vtable_offset*: cschar
    internal_shortbuf*: array[1'i64, uint8]
    internal_lock*: pointer
    internal_offset*: compiler_off64_t_536871812
    internal_codecvt*: ptr struct_IO_codecvt
    internal_wide_data*: ptr struct_IO_wide_data
    internal_freeres_list*: ptr struct_IO_FILE_536871803
    internal_freeres_buf*: pointer
    compiler_pad5*: csize_t
    internal_mode*: cint
    internal_unused2*: array[20'i64, uint8]
  compiler_off_t_536871807 = clong ## Generated based on /usr/include/aarch64-linux-gnu/bits/types.h:152:25
  compiler_off64_t_536871811 = clong ## Generated based on /usr/include/aarch64-linux-gnu/bits/types.h:153:27
  struct_jsOptionsStreamPurge_536871625 = (when declared(
      struct_jsOptionsStreamPurge):
    when ownSizeof(struct_jsOptionsStreamPurge) !=
        ownSizeof(struct_jsOptionsStreamPurge_536871624):
      static :
        warning("Declaration of " & "struct_jsOptionsStreamPurge" &
            " exists but with different size")
    struct_jsOptionsStreamPurge
   else:
    struct_jsOptionsStreamPurge_536871624)
  objStoreMeta_536871707 = (when declared(objStoreMeta):
    when ownSizeof(objStoreMeta) != ownSizeof(objStoreMeta_536871706):
      static :
        warning("Declaration of " & "objStoreMeta" &
            " exists but with different size")
    objStoreMeta
   else:
    objStoreMeta_536871706)
  objStoreGet_536871677 = (when declared(objStoreGet):
    when ownSizeof(objStoreGet) != ownSizeof(objStoreGet_536871676):
      static :
        warning("Declaration of " & "objStoreGet" &
            " exists but with different size")
    objStoreGet
   else:
    objStoreGet_536871676)
  jsDirectGetMsgOptions_536871607 = (when declared(jsDirectGetMsgOptions):
    when ownSizeof(jsDirectGetMsgOptions) != ownSizeof(jsDirectGetMsgOptions_536871606):
      static :
        warning("Declaration of " & "jsDirectGetMsgOptions" &
            " exists but with different size")
    jsDirectGetMsgOptions
   else:
    jsDirectGetMsgOptions_536871606)
  jsConsumerInfoList_536871563 = (when declared(jsConsumerInfoList):
    when ownSizeof(jsConsumerInfoList) != ownSizeof(jsConsumerInfoList_536871562):
      static :
        warning("Declaration of " & "jsConsumerInfoList" &
            " exists but with different size")
    jsConsumerInfoList
   else:
    jsConsumerInfoList_536871562)
  enum_kvOperation_536871649 = (when declared(enum_kvOperation):
    when ownSizeof(enum_kvOperation) != ownSizeof(enum_kvOperation_536871648):
      static :
        warning("Declaration of " & "enum_kvOperation" &
            " exists but with different size")
    enum_kvOperation
   else:
    enum_kvOperation_536871648)
  struct_jsConsumerNamesList_536871565 = (when declared(
      struct_jsConsumerNamesList):
    when ownSizeof(struct_jsConsumerNamesList) !=
        ownSizeof(struct_jsConsumerNamesList_536871564):
      static :
        warning("Declaration of " & "struct_jsConsumerNamesList" &
            " exists but with different size")
    struct_jsConsumerNamesList
   else:
    struct_jsConsumerNamesList_536871564)
  enum_jsAckPolicy_536871442 = (when declared(enum_jsAckPolicy):
    when ownSizeof(enum_jsAckPolicy) != ownSizeof(enum_jsAckPolicy_536871441):
      static :
        warning("Declaration of " & "enum_jsAckPolicy" &
            " exists but with different size")
    enum_jsAckPolicy
   else:
    enum_jsAckPolicy_536871441)
  objStore_536871673 = (when declared(objStore):
    when ownSizeof(objStore) != ownSizeof(objStore_536871672):
      static :
        warning("Declaration of " & "objStore" &
            " exists but with different size")
    objStore
   else:
    objStore_536871672)
  enum_jsStorageCompression_536871434 = (when declared(enum_jsStorageCompression):
    when ownSizeof(enum_jsStorageCompression) !=
        ownSizeof(enum_jsStorageCompression_536871433):
      static :
        warning("Declaration of " & "enum_jsStorageCompression" &
            " exists but with different size")
    enum_jsStorageCompression
   else:
    enum_jsStorageCompression_536871433)
  jsFetchNextHandler_536871615 = (when declared(jsFetchNextHandler):
    when ownSizeof(jsFetchNextHandler) != ownSizeof(jsFetchNextHandler_536871614):
      static :
        warning("Declaration of " & "jsFetchNextHandler" &
            " exists but with different size")
    jsFetchNextHandler
   else:
    jsFetchNextHandler_536871614)
  microServiceConfig_536871785 = (when declared(microServiceConfig):
    when ownSizeof(microServiceConfig) != ownSizeof(microServiceConfig_536871784):
      static :
        warning("Declaration of " & "microServiceConfig" &
            " exists but with different size")
    microServiceConfig
   else:
    microServiceConfig_536871784)
  struct_natsMetadata_536871410 = (when declared(struct_natsMetadata):
    when ownSizeof(struct_natsMetadata) != ownSizeof(struct_natsMetadata_536871409):
      static :
        warning("Declaration of " & "struct_natsMetadata" &
            " exists but with different size")
    struct_natsMetadata
   else:
    struct_natsMetadata_536871409)
  struct_jsStreamSourceInfo_536871513 = (when declared(struct_jsStreamSourceInfo):
    when ownSizeof(struct_jsStreamSourceInfo) !=
        ownSizeof(struct_jsStreamSourceInfo_536871512):
      static :
        warning("Declaration of " & "struct_jsStreamSourceInfo" &
            " exists but with different size")
    struct_jsStreamSourceInfo
   else:
    struct_jsStreamSourceInfo_536871512)
  struct_jsAPIStats_536871573 = (when declared(struct_jsAPIStats):
    when ownSizeof(struct_jsAPIStats) != ownSizeof(struct_jsAPIStats_536871572):
      static :
        warning("Declaration of " & "struct_jsAPIStats" &
            " exists but with different size")
    struct_jsAPIStats
   else:
    struct_jsAPIStats_536871572)
  natsInbox_536871396 = (when declared(natsInbox):
    when ownSizeof(natsInbox) != ownSizeof(natsInbox_536871395):
      static :
        warning("Declaration of " & "natsInbox" &
            " exists but with different size")
    natsInbox
   else:
    natsInbox_536871395)
  struct_kvKeysList_536871669 = (when declared(struct_kvKeysList):
    when ownSizeof(struct_kvKeysList) != ownSizeof(struct_kvKeysList_536871668):
      static :
        warning("Declaration of " & "struct_kvKeysList" &
            " exists but with different size")
    struct_kvKeysList
   else:
    struct_kvKeysList_536871668)
  jsPubAckHandler_536871603 = (when declared(jsPubAckHandler):
    when ownSizeof(jsPubAckHandler) != ownSizeof(jsPubAckHandler_536871602):
      static :
        warning("Declaration of " & "jsPubAckHandler" &
            " exists but with different size")
    jsPubAckHandler
   else:
    jsPubAckHandler_536871602)
  struct_jsOptionsPublishAsync_536871621 = (when declared(
      struct_jsOptionsPublishAsync):
    when ownSizeof(struct_jsOptionsPublishAsync) !=
        ownSizeof(struct_jsOptionsPublishAsync_536871620):
      static :
        warning("Declaration of " & "struct_jsOptionsPublishAsync" &
            " exists but with different size")
    struct_jsOptionsPublishAsync
   else:
    struct_jsOptionsPublishAsync_536871620)
  objStoreMetaOptions_536871703 = (when declared(objStoreMetaOptions):
    when ownSizeof(objStoreMetaOptions) != ownSizeof(objStoreMetaOptions_536871702):
      static :
        warning("Declaration of " & "objStoreMetaOptions" &
            " exists but with different size")
    objStoreMetaOptions
   else:
    objStoreMetaOptions_536871702)
  struct_jsRePublish_536871473 = (when declared(struct_jsRePublish):
    when ownSizeof(struct_jsRePublish) != ownSizeof(struct_jsRePublish_536871472):
      static :
        warning("Declaration of " & "struct_jsRePublish" &
            " exists but with different size")
    struct_jsRePublish
   else:
    struct_jsRePublish_536871472)
  natsProxyConnHandler_536871729 = (when declared(natsProxyConnHandler):
    when ownSizeof(natsProxyConnHandler) != ownSizeof(natsProxyConnHandler_536871728):
      static :
        warning("Declaration of " & "natsProxyConnHandler" &
            " exists but with different size")
    natsProxyConnHandler
   else:
    natsProxyConnHandler_536871728)
  kvKeysList_536871671 = (when declared(kvKeysList):
    when ownSizeof(kvKeysList) != ownSizeof(kvKeysList_536871670):
      static :
        warning("Declaration of " & "kvKeysList" &
            " exists but with different size")
    kvKeysList
   else:
    kvKeysList_536871670)
  natsTokenHandler_536871745 = (when declared(natsTokenHandler):
    when ownSizeof(natsTokenHandler) != ownSizeof(natsTokenHandler_536871744):
      static :
        warning("Declaration of " & "natsTokenHandler" &
            " exists but with different size")
    natsTokenHandler
   else:
    natsTokenHandler_536871744)
  compiler_off64_t_536871812 = (when declared(compiler_off64_t):
    when ownSizeof(compiler_off64_t) != ownSizeof(compiler_off64_t_536871811):
      static :
        warning("Declaration of " & "compiler_off64_t" &
            " exists but with different size")
    compiler_off64_t
   else:
    compiler_off64_t_536871811)
  natsHeader_536871398 = (when declared(natsHeader):
    when ownSizeof(natsHeader) != ownSizeof(natsHeader_536871397):
      static :
        warning("Declaration of " & "natsHeader" &
            " exists but with different size")
    natsHeader
   else:
    natsHeader_536871397)
  struct_jsConsumerInfoList_536871561 = (when declared(struct_jsConsumerInfoList):
    when ownSizeof(struct_jsConsumerInfoList) !=
        ownSizeof(struct_jsConsumerInfoList_536871560):
      static :
        warning("Declaration of " & "struct_jsConsumerInfoList" &
            " exists but with different size")
    struct_jsConsumerInfoList
   else:
    struct_jsConsumerInfoList_536871560)
  struct_micro_service_config_s_536871787 = (when declared(
      struct_micro_service_config_s):
    when ownSizeof(struct_micro_service_config_s) !=
        ownSizeof(struct_micro_service_config_s_536871786):
      static :
        warning("Declaration of " & "struct_micro_service_config_s" &
            " exists but with different size")
    struct_micro_service_config_s
   else:
    struct_micro_service_config_s_536871786)
  struct_kvPurgeOptions_536871661 = (when declared(struct_kvPurgeOptions):
    when ownSizeof(struct_kvPurgeOptions) != ownSizeof(struct_kvPurgeOptions_536871660):
      static :
        warning("Declaration of " & "struct_kvPurgeOptions" &
            " exists but with different size")
    struct_kvPurgeOptions
   else:
    struct_kvPurgeOptions_536871660)
  jsSubOptions_536871543 = (when declared(jsSubOptions):
    when ownSizeof(jsSubOptions) != ownSizeof(jsSubOptions_536871542):
      static :
        warning("Declaration of " & "jsSubOptions" &
            " exists but with different size")
    jsSubOptions
   else:
    jsSubOptions_536871542)
  enum_jsDiscardPolicy_536871426 = (when declared(enum_jsDiscardPolicy):
    when ownSizeof(enum_jsDiscardPolicy) != ownSizeof(enum_jsDiscardPolicy_536871425):
      static :
        warning("Declaration of " & "enum_jsDiscardPolicy" &
            " exists but with different size")
    enum_jsDiscardPolicy
   else:
    enum_jsDiscardPolicy_536871425)
  struct_jsStreamState_536871501 = (when declared(struct_jsStreamState):
    when ownSizeof(struct_jsStreamState) != ownSizeof(struct_jsStreamState_536871500):
      static :
        warning("Declaration of " & "struct_jsStreamState" &
            " exists but with different size")
    struct_jsStreamState
   else:
    struct_jsStreamState_536871500)
  struct_jsConsumerSequenceMismatch_536871537 = (when declared(
      struct_jsConsumerSequenceMismatch):
    when ownSizeof(struct_jsConsumerSequenceMismatch) !=
        ownSizeof(struct_jsConsumerSequenceMismatch_536871536):
      static :
        warning("Declaration of " & "struct_jsConsumerSequenceMismatch" &
            " exists but with different size")
    struct_jsConsumerSequenceMismatch
   else:
    struct_jsConsumerSequenceMismatch_536871536)
  natsCustomReconnectDelayHandler_536871749 = (when declared(
      natsCustomReconnectDelayHandler):
    when ownSizeof(natsCustomReconnectDelayHandler) !=
        ownSizeof(natsCustomReconnectDelayHandler_536871748):
      static :
        warning("Declaration of " & "natsCustomReconnectDelayHandler" &
            " exists but with different size")
    natsCustomReconnectDelayHandler
   else:
    natsCustomReconnectDelayHandler_536871748)
  enum_jsErrCode_536871380 = (when declared(enum_jsErrCode):
    when ownSizeof(enum_jsErrCode) != ownSizeof(enum_jsErrCode_536871379):
      static :
        warning("Declaration of " & "enum_jsErrCode" &
            " exists but with different size")
    enum_jsErrCode
   else:
    enum_jsErrCode_536871379)
  objStoreWatcher_536871679 = (when declared(objStoreWatcher):
    when ownSizeof(objStoreWatcher) != ownSizeof(objStoreWatcher_536871678):
      static :
        warning("Declaration of " & "objStoreWatcher" &
            " exists but with different size")
    objStoreWatcher
   else:
    objStoreWatcher_536871678)
  objStoreInfo_536871711 = (when declared(objStoreInfo):
    when ownSizeof(objStoreInfo) != ownSizeof(objStoreInfo_536871710):
      static :
        warning("Declaration of " & "objStoreInfo" &
            " exists but with different size")
    objStoreInfo
   else:
    objStoreInfo_536871710)
  microRequestHandler_536871797 = (when declared(microRequestHandler):
    when ownSizeof(microRequestHandler) != ownSizeof(microRequestHandler_536871796):
      static :
        warning("Declaration of " & "microRequestHandler" &
            " exists but with different size")
    microRequestHandler
   else:
    microRequestHandler_536871796)
  jsExternalStream_536871467 = (when declared(jsExternalStream):
    when ownSizeof(jsExternalStream) != ownSizeof(jsExternalStream_536871466):
      static :
        warning("Declaration of " & "jsExternalStream" &
            " exists but with different size")
    jsExternalStream
   else:
    jsExternalStream_536871466)
  struct_jsAccountLimits_536871577 = (when declared(struct_jsAccountLimits):
    when ownSizeof(struct_jsAccountLimits) != ownSizeof(struct_jsAccountLimits_536871576):
      static :
        warning("Declaration of " & "struct_jsAccountLimits" &
            " exists but with different size")
    struct_jsAccountLimits
   else:
    struct_jsAccountLimits_536871576)
  natsConnStatus_536871374 = (when declared(natsConnStatus):
    when ownSizeof(natsConnStatus) != ownSizeof(natsConnStatus_536871373):
      static :
        warning("Declaration of " & "natsConnStatus" &
            " exists but with different size")
    natsConnStatus
   else:
    natsConnStatus_536871373)
  jsStreamState_536871503 = (when declared(jsStreamState):
    when ownSizeof(jsStreamState) != ownSizeof(jsStreamState_536871502):
      static :
        warning("Declaration of " & "jsStreamState" &
            " exists but with different size")
    jsStreamState
   else:
    jsStreamState_536871502)
  objStoreInfoList_536871715 = (when declared(objStoreInfoList):
    when ownSizeof(objStoreInfoList) != ownSizeof(objStoreInfoList_536871714):
      static :
        warning("Declaration of " & "objStoreInfoList" &
            " exists but with different size")
    objStoreInfoList
   else:
    objStoreInfoList_536871714)
  jsClusterInfo_536871511 = (when declared(jsClusterInfo):
    when ownSizeof(jsClusterInfo) != ownSizeof(jsClusterInfo_536871510):
      static :
        warning("Declaration of " & "jsClusterInfo" &
            " exists but with different size")
    jsClusterInfo
   else:
    jsClusterInfo_536871510)
  struct_jsSequencePair_536871545 = (when declared(struct_jsSequencePair):
    when ownSizeof(struct_jsSequencePair) != ownSizeof(struct_jsSequencePair_536871544):
      static :
        warning("Declaration of " & "struct_jsSequencePair" &
            " exists but with different size")
    struct_jsSequencePair
   else:
    struct_jsSequencePair_536871544)
  objStoreNamesList_536871687 = (when declared(objStoreNamesList):
    when ownSizeof(objStoreNamesList) != ownSizeof(objStoreNamesList_536871686):
      static :
        warning("Declaration of " & "objStoreNamesList" &
            " exists but with different size")
    objStoreNamesList
   else:
    objStoreNamesList_536871686)
  microServiceInfo_536871789 = (when declared(microServiceInfo):
    when ownSizeof(microServiceInfo) != ownSizeof(microServiceInfo_536871788):
      static :
        warning("Declaration of " & "microServiceInfo" &
            " exists but with different size")
    microServiceInfo
   else:
    microServiceInfo_536871788)
  natsEvLoop_Attach_536871733 = (when declared(natsEvLoop_Attach):
    when ownSizeof(natsEvLoop_Attach) != ownSizeof(natsEvLoop_Attach_536871732):
      static :
        warning("Declaration of " & "natsEvLoop_Attach" &
            " exists but with different size")
    natsEvLoop_Attach
   else:
    natsEvLoop_Attach_536871732)
  enum_jsStorageType_536871430 = (when declared(enum_jsStorageType):
    when ownSizeof(enum_jsStorageType) != ownSizeof(enum_jsStorageType_536871429):
      static :
        warning("Declaration of " & "enum_jsStorageType" &
            " exists but with different size")
    enum_jsStorageType
   else:
    enum_jsStorageType_536871429)
  objStorePut_536871675 = (when declared(objStorePut):
    when ownSizeof(objStorePut) != ownSizeof(objStorePut_536871674):
      static :
        warning("Declaration of " & "objStorePut" &
            " exists but with different size")
    objStorePut
   else:
    objStorePut_536871674)
  struct_micro_endpoint_stats_s_536871771 = (when declared(
      struct_micro_endpoint_stats_s):
    when ownSizeof(struct_micro_endpoint_stats_s) !=
        ownSizeof(struct_micro_endpoint_stats_s_536871770):
      static :
        warning("Declaration of " & "struct_micro_endpoint_stats_s" &
            " exists but with different size")
    struct_micro_endpoint_stats_s
   else:
    struct_micro_endpoint_stats_s_536871770)
  jsDeliverPolicy_536871440 = (when declared(jsDeliverPolicy):
    when ownSizeof(jsDeliverPolicy) != ownSizeof(jsDeliverPolicy_536871439):
      static :
        warning("Declaration of " & "jsDeliverPolicy" &
            " exists but with different size")
    jsDeliverPolicy
   else:
    jsDeliverPolicy_536871439)
  struct_jsConsumerInfo_536871557 = (when declared(struct_jsConsumerInfo):
    when ownSizeof(struct_jsConsumerInfo) != ownSizeof(struct_jsConsumerInfo_536871556):
      static :
        warning("Declaration of " & "struct_jsConsumerInfo" &
            " exists but with different size")
    struct_jsConsumerInfo
   else:
    struct_jsConsumerInfo_536871556)
  struct_IO_FILE_536871803 = (when declared(struct_IO_FILE):
    when ownSizeof(struct_IO_FILE) != ownSizeof(struct_IO_FILE_536871802):
      static :
        warning("Declaration of " & "struct_IO_FILE" &
            " exists but with different size")
    struct_IO_FILE
   else:
    struct_IO_FILE_536871802)
  natsConnectionHandler_536871727 = (when declared(natsConnectionHandler):
    when ownSizeof(natsConnectionHandler) != ownSizeof(natsConnectionHandler_536871726):
      static :
        warning("Declaration of " & "natsConnectionHandler" &
            " exists but with different size")
    natsConnectionHandler
   else:
    natsConnectionHandler_536871726)
  jsConsumerInfo_536871559 = (when declared(jsConsumerInfo):
    when ownSizeof(jsConsumerInfo) != ownSizeof(jsConsumerInfo_536871558):
      static :
        warning("Declaration of " & "jsConsumerInfo" &
            " exists but with different size")
    jsConsumerInfo
   else:
    jsConsumerInfo_536871558)
  struct_objStoreInfoList_536871713 = (when declared(struct_objStoreInfoList):
    when ownSizeof(struct_objStoreInfoList) !=
        ownSizeof(struct_objStoreInfoList_536871712):
      static :
        warning("Declaration of " & "struct_objStoreInfoList" &
            " exists but with different size")
    struct_objStoreInfoList
   else:
    struct_objStoreInfoList_536871712)
  jsSequencePair_536871547 = (when declared(jsSequencePair):
    when ownSizeof(jsSequencePair) != ownSizeof(jsSequencePair_536871546):
      static :
        warning("Declaration of " & "jsSequencePair" &
            " exists but with different size")
    jsSequencePair
   else:
    jsSequencePair_536871546)
  jsAckPolicy_536871444 = (when declared(jsAckPolicy):
    when ownSizeof(jsAckPolicy) != ownSizeof(jsAckPolicy_536871443):
      static :
        warning("Declaration of " & "jsAckPolicy" &
            " exists but with different size")
    jsAckPolicy
   else:
    jsAckPolicy_536871443)
  jsDiscardPolicy_536871428 = (when declared(jsDiscardPolicy):
    when ownSizeof(jsDiscardPolicy) != ownSizeof(jsDiscardPolicy_536871427):
      static :
        warning("Declaration of " & "jsDiscardPolicy" &
            " exists but with different size")
    jsDiscardPolicy
   else:
    jsDiscardPolicy_536871427)
  struct_jsStreamConfig_536871485 = (when declared(struct_jsStreamConfig):
    when ownSizeof(struct_jsStreamConfig) != ownSizeof(struct_jsStreamConfig_536871484):
      static :
        warning("Declaration of " & "struct_jsStreamConfig" &
            " exists but with different size")
    struct_jsStreamConfig
   else:
    struct_jsStreamConfig_536871484)
  kvPurgeOptions_536871663 = (when declared(kvPurgeOptions):
    when ownSizeof(kvPurgeOptions) != ownSizeof(kvPurgeOptions_536871662):
      static :
        warning("Declaration of " & "kvPurgeOptions" &
            " exists but with different size")
    kvPurgeOptions
   else:
    kvPurgeOptions_536871662)
  struct_jsStreamInfo_536871521 = (when declared(struct_jsStreamInfo):
    when ownSizeof(struct_jsStreamInfo) != ownSizeof(struct_jsStreamInfo_536871520):
      static :
        warning("Declaration of " & "struct_jsStreamInfo" &
            " exists but with different size")
    struct_jsStreamInfo
   else:
    struct_jsStreamInfo_536871520)
  objStoreWatchOptions_536871723 = (when declared(objStoreWatchOptions):
    when ownSizeof(objStoreWatchOptions) != ownSizeof(objStoreWatchOptions_536871722):
      static :
        warning("Declaration of " & "objStoreWatchOptions" &
            " exists but with different size")
    objStoreWatchOptions
   else:
    objStoreWatchOptions_536871722)
  natsMsgList_536871408 = (when declared(natsMsgList):
    when ownSizeof(natsMsgList) != ownSizeof(natsMsgList_536871407):
      static :
        warning("Declaration of " & "natsMsgList" &
            " exists but with different size")
    natsMsgList
   else:
    natsMsgList_536871407)
  struct_jsOptionsStreamInfo_536871629 = (when declared(
      struct_jsOptionsStreamInfo):
    when ownSizeof(struct_jsOptionsStreamInfo) !=
        ownSizeof(struct_jsOptionsStreamInfo_536871628):
      static :
        warning("Declaration of " & "struct_jsOptionsStreamInfo" &
            " exists but with different size")
    struct_jsOptionsStreamInfo
   else:
    struct_jsOptionsStreamInfo_536871628)
  natsMsgHandler_536871725 = (when declared(natsMsgHandler):
    when ownSizeof(natsMsgHandler) != ownSizeof(natsMsgHandler_536871724):
      static :
        warning("Declaration of " & "natsMsgHandler" &
            " exists but with different size")
    natsMsgHandler
   else:
    natsMsgHandler_536871724)
  natsUserJWTHandler_536871741 = (when declared(natsUserJWTHandler):
    when ownSizeof(natsUserJWTHandler) != ownSizeof(natsUserJWTHandler_536871740):
      static :
        warning("Declaration of " & "natsUserJWTHandler" &
            " exists but with different size")
    natsUserJWTHandler
   else:
    natsUserJWTHandler_536871740)
  jsConsumerNamesList_536871567 = (when declared(jsConsumerNamesList):
    when ownSizeof(jsConsumerNamesList) != ownSizeof(jsConsumerNamesList_536871566):
      static :
        warning("Declaration of " & "jsConsumerNamesList" &
            " exists but with different size")
    jsConsumerNamesList
   else:
    jsConsumerNamesList_536871566)
  jsOptionsPublishAsync_536871623 = (when declared(jsOptionsPublishAsync):
    when ownSizeof(jsOptionsPublishAsync) != ownSizeof(jsOptionsPublishAsync_536871622):
      static :
        warning("Declaration of " & "jsOptionsPublishAsync" &
            " exists but with different size")
    jsOptionsPublishAsync
   else:
    jsOptionsPublishAsync_536871622)
  jsLostStreamData_536871491 = (when declared(jsLostStreamData):
    when ownSizeof(jsLostStreamData) != ownSizeof(jsLostStreamData_536871490):
      static :
        warning("Declaration of " & "jsLostStreamData" &
            " exists but with different size")
    jsLostStreamData
   else:
    jsLostStreamData_536871490)
  natsOnCompleteCB_536871747 = (when declared(natsOnCompleteCB):
    when ownSizeof(natsOnCompleteCB) != ownSizeof(natsOnCompleteCB_536871746):
      static :
        warning("Declaration of " & "natsOnCompleteCB" &
            " exists but with different size")
    natsOnCompleteCB
   else:
    natsOnCompleteCB_536871746)
  jsStreamSource_536871471 = (when declared(jsStreamSource):
    when ownSizeof(jsStreamSource) != ownSizeof(jsStreamSource_536871470):
      static :
        warning("Declaration of " & "jsStreamSource" &
            " exists but with different size")
    jsStreamSource
   else:
    jsStreamSource_536871470)
  struct_jsAccountInfo_536871585 = (when declared(struct_jsAccountInfo):
    when ownSizeof(struct_jsAccountInfo) != ownSizeof(struct_jsAccountInfo_536871584):
      static :
        warning("Declaration of " & "struct_jsAccountInfo" &
            " exists but with different size")
    struct_jsAccountInfo
   else:
    struct_jsAccountInfo_536871584)
  jsSubjectTransformConfig_536871479 = (when declared(jsSubjectTransformConfig):
    when ownSizeof(jsSubjectTransformConfig) !=
        ownSizeof(jsSubjectTransformConfig_536871478):
      static :
        warning("Declaration of " & "jsSubjectTransformConfig" &
            " exists but with different size")
    jsSubjectTransformConfig
   else:
    jsSubjectTransformConfig_536871478)
  struct_objStoreMeta_536871705 = (when declared(struct_objStoreMeta):
    when ownSizeof(struct_objStoreMeta) != ownSizeof(struct_objStoreMeta_536871704):
      static :
        warning("Declaration of " & "struct_objStoreMeta" &
            " exists but with different size")
    struct_objStoreMeta
   else:
    struct_objStoreMeta_536871704)
  struct_kvEntryList_536871665 = (when declared(struct_kvEntryList):
    when ownSizeof(struct_kvEntryList) != ownSizeof(struct_kvEntryList_536871664):
      static :
        warning("Declaration of " & "struct_kvEntryList" &
            " exists but with different size")
    struct_kvEntryList
   else:
    struct_kvEntryList_536871664)
  jsReplayPolicy_536871455 = (when declared(jsReplayPolicy):
    when ownSizeof(jsReplayPolicy) != ownSizeof(jsReplayPolicy_536871454):
      static :
        warning("Declaration of " & "jsReplayPolicy" &
            " exists but with different size")
    jsReplayPolicy
   else:
    jsReplayPolicy_536871454)
  struct_micro_endpoint_info_s_536871767 = (when declared(
      struct_micro_endpoint_info_s):
    when ownSizeof(struct_micro_endpoint_info_s) !=
        ownSizeof(struct_micro_endpoint_info_s_536871766):
      static :
        warning("Declaration of " & "struct_micro_endpoint_info_s" &
            " exists but with different size")
    struct_micro_endpoint_info_s
   else:
    struct_micro_endpoint_info_s_536871766)
  objStoreConfig_536871683 = (when declared(objStoreConfig):
    when ownSizeof(objStoreConfig) != ownSizeof(objStoreConfig_536871682):
      static :
        warning("Declaration of " & "objStoreConfig" &
            " exists but with different size")
    objStoreConfig
   else:
    objStoreConfig_536871682)
  kvStore_536871641 = (when declared(kvStore):
    when ownSizeof(kvStore) != ownSizeof(kvStore_536871640):
      static :
        warning("Declaration of " & "kvStore" &
            " exists but with different size")
    kvStore
   else:
    kvStore_536871640)
  struct_jsPubOptions_536871418 = (when declared(struct_jsPubOptions):
    when ownSizeof(struct_jsPubOptions) != ownSizeof(struct_jsPubOptions_536871417):
      static :
        warning("Declaration of " & "struct_jsPubOptions" &
            " exists but with different size")
    struct_jsPubOptions
   else:
    struct_jsPubOptions_536871417)
  jsConsumerPauseResponse_536871571 = (when declared(jsConsumerPauseResponse):
    when ownSizeof(jsConsumerPauseResponse) !=
        ownSizeof(jsConsumerPauseResponse_536871570):
      static :
        warning("Declaration of " & "jsConsumerPauseResponse" &
            " exists but with different size")
    jsConsumerPauseResponse
   else:
    jsConsumerPauseResponse_536871570)
  natsSignatureHandler_536871743 = (when declared(natsSignatureHandler):
    when ownSizeof(natsSignatureHandler) != ownSizeof(natsSignatureHandler_536871742):
      static :
        warning("Declaration of " & "natsSignatureHandler" &
            " exists but with different size")
    natsSignatureHandler
   else:
    natsSignatureHandler_536871742)
  jsStorageType_536871432 = (when declared(jsStorageType):
    when ownSizeof(jsStorageType) != ownSizeof(jsStorageType_536871431):
      static :
        warning("Declaration of " & "jsStorageType" &
            " exists but with different size")
    jsStorageType
   else:
    jsStorageType_536871431)
  natsSock_536871384 = (when declared(natsSock):
    when ownSizeof(natsSock) != ownSizeof(natsSock_536871383):
      static :
        warning("Declaration of " & "natsSock" &
            " exists but with different size")
    natsSock
   else:
    natsSock_536871383)
  jsPubAck_536871595 = (when declared(jsPubAck):
    when ownSizeof(jsPubAck) != ownSizeof(jsPubAck_536871594):
      static :
        warning("Declaration of " & "jsPubAck" &
            " exists but with different size")
    jsPubAck
   else:
    jsPubAck_536871594)
  struct_jsTier_536871581 = (when declared(struct_jsTier):
    when ownSizeof(struct_jsTier) != ownSizeof(struct_jsTier_536871580):
      static :
        warning("Declaration of " & "struct_jsTier" &
            " exists but with different size")
    struct_jsTier
   else:
    struct_jsTier_536871580)
  objStoreStatusesList_536871695 = (when declared(objStoreStatusesList):
    when ownSizeof(objStoreStatusesList) != ownSizeof(objStoreStatusesList_536871694):
      static :
        warning("Declaration of " & "objStoreStatusesList" &
            " exists but with different size")
    objStoreStatusesList
   else:
    objStoreStatusesList_536871694)
  enum_natsConnStatus_536871372 = (when declared(enum_natsConnStatus):
    when ownSizeof(enum_natsConnStatus) != ownSizeof(enum_natsConnStatus_536871370):
      static :
        warning("Declaration of " & "enum_natsConnStatus" &
            " exists but with different size")
    enum_natsConnStatus
   else:
    enum_natsConnStatus_536871370)
  struct_jsStreamStateSubjects_536871497 = (when declared(
      struct_jsStreamStateSubjects):
    when ownSizeof(struct_jsStreamStateSubjects) !=
        ownSizeof(struct_jsStreamStateSubjects_536871496):
      static :
        warning("Declaration of " & "struct_jsStreamStateSubjects" &
            " exists but with different size")
    struct_jsStreamStateSubjects
   else:
    struct_jsStreamStateSubjects_536871496)
  kvWatchOptions_536871659 = (when declared(kvWatchOptions):
    when ownSizeof(kvWatchOptions) != ownSizeof(kvWatchOptions_536871658):
      static :
        warning("Declaration of " & "kvWatchOptions" &
            " exists but with different size")
    kvWatchOptions
   else:
    kvWatchOptions_536871658)
  struct_jsOptionsPullSubscribeAsync_536871617 = (when declared(
      struct_jsOptionsPullSubscribeAsync):
    when ownSizeof(struct_jsOptionsPullSubscribeAsync) !=
        ownSizeof(struct_jsOptionsPullSubscribeAsync_536871616):
      static :
        warning("Declaration of " & "struct_jsOptionsPullSubscribeAsync" &
            " exists but with different size")
    struct_jsOptionsPullSubscribeAsync
   else:
    struct_jsOptionsPullSubscribeAsync_536871616)
  microDoneHandler_536871801 = (when declared(microDoneHandler):
    when ownSizeof(microDoneHandler) != ownSizeof(microDoneHandler_536871800):
      static :
        warning("Declaration of " & "microDoneHandler" &
            " exists but with different size")
    microDoneHandler
   else:
    microDoneHandler_536871800)
  struct_jsFetchRequest_536871609 = (when declared(struct_jsFetchRequest):
    when ownSizeof(struct_jsFetchRequest) != ownSizeof(struct_jsFetchRequest_536871608):
      static :
        warning("Declaration of " & "struct_jsFetchRequest" &
            " exists but with different size")
    struct_jsFetchRequest
   else:
    struct_jsFetchRequest_536871608)
  natsThreadStartedHandler_536871400 = (when declared(natsThreadStartedHandler):
    when ownSizeof(natsThreadStartedHandler) !=
        ownSizeof(natsThreadStartedHandler_536871399):
      static :
        warning("Declaration of " & "natsThreadStartedHandler" &
            " exists but with different size")
    natsThreadStartedHandler
   else:
    natsThreadStartedHandler_536871399)
  enum_natsStatus_536871376 = (when declared(enum_natsStatus):
    when ownSizeof(enum_natsStatus) != ownSizeof(enum_natsStatus_536871375):
      static :
        warning("Declaration of " & "enum_natsStatus" &
            " exists but with different size")
    enum_natsStatus
   else:
    enum_natsStatus_536871375)
  jsPriorityGroupState_536871555 = (when declared(jsPriorityGroupState):
    when ownSizeof(jsPriorityGroupState) != ownSizeof(jsPriorityGroupState_536871554):
      static :
        warning("Declaration of " & "jsPriorityGroupState" &
            " exists but with different size")
    jsPriorityGroupState
   else:
    jsPriorityGroupState_536871554)
  jsOptionsPullSubscribeAsync_536871619 = (when declared(
      jsOptionsPullSubscribeAsync):
    when ownSizeof(jsOptionsPullSubscribeAsync) !=
        ownSizeof(jsOptionsPullSubscribeAsync_536871618):
      static :
        warning("Declaration of " & "jsOptionsPullSubscribeAsync" &
            " exists but with different size")
    jsOptionsPullSubscribeAsync
   else:
    jsOptionsPullSubscribeAsync_536871618)
  jsOptions_536871639 = (when declared(jsOptions):
    when ownSizeof(jsOptions) != ownSizeof(jsOptions_536871638):
      static :
        warning("Declaration of " & "jsOptions" &
            " exists but with different size")
    jsOptions
   else:
    jsOptions_536871638)
  jsStreamConsumerLimits_536871483 = (when declared(jsStreamConsumerLimits):
    when ownSizeof(jsStreamConsumerLimits) != ownSizeof(jsStreamConsumerLimits_536871482):
      static :
        warning("Declaration of " & "jsStreamConsumerLimits" &
            " exists but with different size")
    jsStreamConsumerLimits
   else:
    jsStreamConsumerLimits_536871482)
  jsStreamInfoList_536871527 = (when declared(jsStreamInfoList):
    when ownSizeof(jsStreamInfoList) != ownSizeof(jsStreamInfoList_536871526):
      static :
        warning("Declaration of " & "jsStreamInfoList" &
            " exists but with different size")
    jsStreamInfoList
   else:
    jsStreamInfoList_536871526)
  jsConsumerSequenceMismatch_536871539 = (when declared(
      jsConsumerSequenceMismatch):
    when ownSizeof(jsConsumerSequenceMismatch) !=
        ownSizeof(jsConsumerSequenceMismatch_536871538):
      static :
        warning("Declaration of " & "jsConsumerSequenceMismatch" &
            " exists but with different size")
    jsConsumerSequenceMismatch
   else:
    jsConsumerSequenceMismatch_536871538)
  struct_objStoreMetaOptions_536871701 = (when declared(
      struct_objStoreMetaOptions):
    when ownSizeof(struct_objStoreMetaOptions) !=
        ownSizeof(struct_objStoreMetaOptions_536871700):
      static :
        warning("Declaration of " & "struct_objStoreMetaOptions" &
            " exists but with different size")
    struct_objStoreMetaOptions
   else:
    struct_objStoreMetaOptions_536871700)
  natsSSLVerifyCb_536871751 = (when declared(natsSSLVerifyCb):
    when ownSizeof(natsSSLVerifyCb) != ownSizeof(natsSSLVerifyCb_536871750):
      static :
        warning("Declaration of " & "natsSSLVerifyCb" &
            " exists but with different size")
    natsSSLVerifyCb
   else:
    natsSSLVerifyCb_536871750)
  natsStatistics_536871388 = (when declared(natsStatistics):
    when ownSizeof(natsStatistics) != ownSizeof(natsStatistics_536871387):
      static :
        warning("Declaration of " & "natsStatistics" &
            " exists but with different size")
    natsStatistics
   else:
    natsStatistics_536871387)
  jsPeerInfo_536871507 = (when declared(jsPeerInfo):
    when ownSizeof(jsPeerInfo) != ownSizeof(jsPeerInfo_536871506):
      static :
        warning("Declaration of " & "jsPeerInfo" &
            " exists but with different size")
    jsPeerInfo
   else:
    jsPeerInfo_536871506)
  microServiceStats_536871793 = (when declared(microServiceStats):
    when ownSizeof(microServiceStats) != ownSizeof(microServiceStats_536871792):
      static :
        warning("Declaration of " & "microServiceStats" &
            " exists but with different size")
    microServiceStats
   else:
    microServiceStats_536871792)
  natsClientConfig_536871404 = (when declared(natsClientConfig):
    when ownSizeof(natsClientConfig) != ownSizeof(natsClientConfig_536871403):
      static :
        warning("Declaration of " & "natsClientConfig" &
            " exists but with different size")
    natsClientConfig
   else:
    natsClientConfig_536871403)
  jsOptionsStreamInfo_536871631 = (when declared(jsOptionsStreamInfo):
    when ownSizeof(jsOptionsStreamInfo) != ownSizeof(jsOptionsStreamInfo_536871630):
      static :
        warning("Declaration of " & "jsOptionsStreamInfo" &
            " exists but with different size")
    jsOptionsStreamInfo
   else:
    jsOptionsStreamInfo_536871630)
  struct_jsConsumerConfig_536871533 = (when declared(struct_jsConsumerConfig):
    when ownSizeof(struct_jsConsumerConfig) !=
        ownSizeof(struct_jsConsumerConfig_536871532):
      static :
        warning("Declaration of " & "struct_jsConsumerConfig" &
            " exists but with different size")
    struct_jsConsumerConfig
   else:
    struct_jsConsumerConfig_536871532)
  kvEntryList_536871667 = (when declared(kvEntryList):
    when ownSizeof(kvEntryList) != ownSizeof(kvEntryList_536871666):
      static :
        warning("Declaration of " & "kvEntryList" &
            " exists but with different size")
    kvEntryList
   else:
    kvEntryList_536871666)
  FILE_536871753 = (when declared(FILE):
    when ownSizeof(FILE) != ownSizeof(FILE_536871752):
      static :
        warning("Declaration of " & "FILE" & " exists but with different size")
    FILE
   else:
    FILE_536871752)
  jsErrCode_536871382 = (when declared(jsErrCode):
    when ownSizeof(jsErrCode) != ownSizeof(jsErrCode_536871381):
      static :
        warning("Declaration of " & "jsErrCode" &
            " exists but with different size")
    jsErrCode
   else:
    jsErrCode_536871381)
  struct_objStoreStatusesList_536871693 = (when declared(
      struct_objStoreStatusesList):
    when ownSizeof(struct_objStoreStatusesList) !=
        ownSizeof(struct_objStoreStatusesList_536871692):
      static :
        warning("Declaration of " & "struct_objStoreStatusesList" &
            " exists but with different size")
    struct_objStoreStatusesList
   else:
    struct_objStoreStatusesList_536871692)
  microErrorHandler_536871799 = (when declared(microErrorHandler):
    when ownSizeof(microErrorHandler) != ownSizeof(microErrorHandler_536871798):
      static :
        warning("Declaration of " & "microErrorHandler" &
            " exists but with different size")
    microErrorHandler
   else:
    microErrorHandler_536871798)
  struct_jsSequenceInfo_536871549 = (when declared(struct_jsSequenceInfo):
    when ownSizeof(struct_jsSequenceInfo) != ownSizeof(struct_jsSequenceInfo_536871548):
      static :
        warning("Declaration of " & "struct_jsSequenceInfo" &
            " exists but with different size")
    struct_jsSequenceInfo
   else:
    struct_jsSequenceInfo_536871548)
  struct_jsStreamConsumerLimits_536871481 = (when declared(
      struct_jsStreamConsumerLimits):
    when ownSizeof(struct_jsStreamConsumerLimits) !=
        ownSizeof(struct_jsStreamConsumerLimits_536871480):
      static :
        warning("Declaration of " & "struct_jsStreamConsumerLimits" &
            " exists but with different size")
    struct_jsStreamConsumerLimits
   else:
    struct_jsStreamConsumerLimits_536871480)
  kvEntry_536871643 = (when declared(kvEntry):
    when ownSizeof(kvEntry) != ownSizeof(kvEntry_536871642):
      static :
        warning("Declaration of " & "kvEntry" &
            " exists but with different size")
    kvEntry
   else:
    kvEntry_536871642)
  enum_jsDeliverPolicy_536871438 = (when declared(enum_jsDeliverPolicy):
    when ownSizeof(enum_jsDeliverPolicy) != ownSizeof(enum_jsDeliverPolicy_536871437):
      static :
        warning("Declaration of " & "enum_jsDeliverPolicy" &
            " exists but with different size")
    enum_jsDeliverPolicy
   else:
    enum_jsDeliverPolicy_536871437)
  enum_jsPersistModeType_536871457 = (when declared(enum_jsPersistModeType):
    when ownSizeof(enum_jsPersistModeType) != ownSizeof(enum_jsPersistModeType_536871456):
      static :
        warning("Declaration of " & "enum_jsPersistModeType" &
            " exists but with different size")
    enum_jsPersistModeType
   else:
    enum_jsPersistModeType_536871456)
  struct_kvWatchOptions_536871657 = (when declared(struct_kvWatchOptions):
    when ownSizeof(struct_kvWatchOptions) != ownSizeof(struct_kvWatchOptions_536871656):
      static :
        warning("Declaration of " & "struct_kvWatchOptions" &
            " exists but with different size")
    struct_kvWatchOptions
   else:
    struct_kvWatchOptions_536871656)
  objStoreLink_536871699 = (when declared(objStoreLink):
    when ownSizeof(objStoreLink) != ownSizeof(objStoreLink_536871698):
      static :
        warning("Declaration of " & "objStoreLink" &
            " exists but with different size")
    objStoreLink
   else:
    objStoreLink_536871698)
  natsMsg_536871392 = (when declared(natsMsg):
    when ownSizeof(natsMsg) != ownSizeof(natsMsg_536871391):
      static :
        warning("Declaration of " & "natsMsg" &
            " exists but with different size")
    natsMsg
   else:
    natsMsg_536871391)
  natsStatus_536871378 = (when declared(natsStatus):
    when ownSizeof(natsStatus) != ownSizeof(natsStatus_536871377):
      static :
        warning("Declaration of " & "natsStatus" &
            " exists but with different size")
    natsStatus
   else:
    natsStatus_536871377)
  jsFetchRequest_536871611 = (when declared(jsFetchRequest):
    when ownSizeof(jsFetchRequest) != ownSizeof(jsFetchRequest_536871610):
      static :
        warning("Declaration of " & "jsFetchRequest" &
            " exists but with different size")
    jsFetchRequest
   else:
    jsFetchRequest_536871610)
  struct_jsExternalStream_536871465 = (when declared(struct_jsExternalStream):
    when ownSizeof(struct_jsExternalStream) !=
        ownSizeof(struct_jsExternalStream_536871464):
      static :
        warning("Declaration of " & "struct_jsExternalStream" &
            " exists but with different size")
    struct_jsExternalStream
   else:
    struct_jsExternalStream_536871464)
  jsOptionsStreamPurge_536871627 = (when declared(jsOptionsStreamPurge):
    when ownSizeof(jsOptionsStreamPurge) != ownSizeof(jsOptionsStreamPurge_536871626):
      static :
        warning("Declaration of " & "jsOptionsStreamPurge" &
            " exists but with different size")
    jsOptionsStreamPurge
   else:
    jsOptionsStreamPurge_536871626)
  struct_jsSubjectTransformConfig_536871477 = (when declared(
      struct_jsSubjectTransformConfig):
    when ownSizeof(struct_jsSubjectTransformConfig) !=
        ownSizeof(struct_jsSubjectTransformConfig_536871476):
      static :
        warning("Declaration of " & "struct_jsSubjectTransformConfig" &
            " exists but with different size")
    struct_jsSubjectTransformConfig
   else:
    struct_jsSubjectTransformConfig_536871476)
  struct_jsConsumerPauseResponse_536871569 = (when declared(
      struct_jsConsumerPauseResponse):
    when ownSizeof(struct_jsConsumerPauseResponse) !=
        ownSizeof(struct_jsConsumerPauseResponse_536871568):
      static :
        warning("Declaration of " & "struct_jsConsumerPauseResponse" &
            " exists but with different size")
    struct_jsConsumerPauseResponse
   else:
    struct_jsConsumerPauseResponse_536871568)
  jsTier_536871583 = (when declared(jsTier):
    when ownSizeof(jsTier) != ownSizeof(jsTier_536871582):
      static :
        warning("Declaration of " & "jsTier" & " exists but with different size")
    jsTier
   else:
    jsTier_536871582)
  jsSequenceInfo_536871551 = (when declared(jsSequenceInfo):
    when ownSizeof(jsSequenceInfo) != ownSizeof(jsSequenceInfo_536871550):
      static :
        warning("Declaration of " & "jsSequenceInfo" &
            " exists but with different size")
    jsSequenceInfo
   else:
    jsSequenceInfo_536871550)
  struct_jsStreamAlternate_536871517 = (when declared(struct_jsStreamAlternate):
    when ownSizeof(struct_jsStreamAlternate) !=
        ownSizeof(struct_jsStreamAlternate_536871516):
      static :
        warning("Declaration of " & "struct_jsStreamAlternate" &
            " exists but with different size")
    struct_jsStreamAlternate
   else:
    struct_jsStreamAlternate_536871516)
  struct_kvConfig_536871653 = (when declared(struct_kvConfig):
    when ownSizeof(struct_kvConfig) != ownSizeof(struct_kvConfig_536871652):
      static :
        warning("Declaration of " & "struct_kvConfig" &
            " exists but with different size")
    struct_kvConfig
   else:
    struct_kvConfig_536871652)
  microEndpoint_536871759 = (when declared(microEndpoint):
    when ownSizeof(microEndpoint) != ownSizeof(microEndpoint_536871758):
      static :
        warning("Declaration of " & "microEndpoint" &
            " exists but with different size")
    microEndpoint
   else:
    microEndpoint_536871758)
  microEndpointStats_536871769 = (when declared(microEndpointStats):
    when ownSizeof(microEndpointStats) != ownSizeof(microEndpointStats_536871768):
      static :
        warning("Declaration of " & "microEndpointStats" &
            " exists but with different size")
    microEndpointStats
   else:
    microEndpointStats_536871768)
  jsPubAckErrHandler_536871601 = (when declared(jsPubAckErrHandler):
    when ownSizeof(jsPubAckErrHandler) != ownSizeof(jsPubAckErrHandler_536871600):
      static :
        warning("Declaration of " & "jsPubAckErrHandler" &
            " exists but with different size")
    jsPubAckErrHandler
   else:
    jsPubAckErrHandler_536871600)
  jsAtomicBatchCtx_536871416 = (when declared(jsAtomicBatchCtx):
    when ownSizeof(jsAtomicBatchCtx) != ownSizeof(jsAtomicBatchCtx_536871415):
      static :
        warning("Declaration of " & "jsAtomicBatchCtx" &
            " exists but with different size")
    jsAtomicBatchCtx
   else:
    jsAtomicBatchCtx_536871415)
  struct_jsPubAck_536871593 = (when declared(struct_jsPubAck):
    when ownSizeof(struct_jsPubAck) != ownSizeof(struct_jsPubAck_536871592):
      static :
        warning("Declaration of " & "struct_jsPubAck" &
            " exists but with different size")
    struct_jsPubAck
   else:
    struct_jsPubAck_536871592)
  kvWatcher_536871647 = (when declared(kvWatcher):
    when ownSizeof(kvWatcher) != ownSizeof(kvWatcher_536871646):
      static :
        warning("Declaration of " & "kvWatcher" &
            " exists but with different size")
    kvWatcher
   else:
    kvWatcher_536871646)
  microRequest_536871781 = (when declared(microRequest):
    when ownSizeof(microRequest) != ownSizeof(microRequest_536871780):
      static :
        warning("Declaration of " & "microRequest" &
            " exists but with different size")
    microRequest
   else:
    microRequest_536871780)
  natsEvLoop_WriteAddRemove_536871737 = (when declared(natsEvLoop_WriteAddRemove):
    when ownSizeof(natsEvLoop_WriteAddRemove) !=
        ownSizeof(natsEvLoop_WriteAddRemove_536871736):
      static :
        warning("Declaration of " & "natsEvLoop_WriteAddRemove" &
            " exists but with different size")
    natsEvLoop_WriteAddRemove
   else:
    natsEvLoop_WriteAddRemove_536871736)
  struct_micro_service_stats_s_536871795 = (when declared(
      struct_micro_service_stats_s):
    when ownSizeof(struct_micro_service_stats_s) !=
        ownSizeof(struct_micro_service_stats_s_536871794):
      static :
        warning("Declaration of " & "struct_micro_service_stats_s" &
            " exists but with different size")
    struct_micro_service_stats_s
   else:
    struct_micro_service_stats_s_536871794)
  jsStreamNamesList_536871531 = (when declared(jsStreamNamesList):
    when ownSizeof(jsStreamNamesList) != ownSizeof(jsStreamNamesList_536871530):
      static :
        warning("Declaration of " & "jsStreamNamesList" &
            " exists but with different size")
    jsStreamNamesList
   else:
    jsStreamNamesList_536871530)
  struct_jsLostStreamData_536871489 = (when declared(struct_jsLostStreamData):
    when ownSizeof(struct_jsLostStreamData) !=
        ownSizeof(struct_jsLostStreamData_536871488):
      static :
        warning("Declaration of " & "struct_jsLostStreamData" &
            " exists but with different size")
    struct_jsLostStreamData
   else:
    struct_jsLostStreamData_536871488)
  jsMsgMetaData_536871591 = (when declared(jsMsgMetaData):
    when ownSizeof(jsMsgMetaData) != ownSizeof(jsMsgMetaData_536871590):
      static :
        warning("Declaration of " & "jsMsgMetaData" &
            " exists but with different size")
    jsMsgMetaData
   else:
    jsMsgMetaData_536871590)
  struct_jsStreamNamesList_536871529 = (when declared(struct_jsStreamNamesList):
    when ownSizeof(struct_jsStreamNamesList) !=
        ownSizeof(struct_jsStreamNamesList_536871528):
      static :
        warning("Declaration of " & "struct_jsStreamNamesList" &
            " exists but with different size")
    struct_jsStreamNamesList
   else:
    struct_jsStreamNamesList_536871528)
  struct_objStoreInfo_536871709 = (when declared(struct_objStoreInfo):
    when ownSizeof(struct_objStoreInfo) != ownSizeof(struct_objStoreInfo_536871708):
      static :
        warning("Declaration of " & "struct_objStoreInfo" &
            " exists but with different size")
    struct_objStoreInfo
   else:
    struct_objStoreInfo_536871708)
  natsOptions_536871394 = (when declared(natsOptions):
    when ownSizeof(natsOptions) != ownSizeof(natsOptions_536871393):
      static :
        warning("Declaration of " & "natsOptions" &
            " exists but with different size")
    natsOptions
   else:
    natsOptions_536871393)
  struct_jsPriorityGroupState_536871553 = (when declared(
      struct_jsPriorityGroupState):
    when ownSizeof(struct_jsPriorityGroupState) !=
        ownSizeof(struct_jsPriorityGroupState_536871552):
      static :
        warning("Declaration of " & "struct_jsPriorityGroupState" &
            " exists but with different size")
    struct_jsPriorityGroupState
   else:
    struct_jsPriorityGroupState_536871552)
  natsEvLoop_ReadAddRemove_536871735 = (when declared(natsEvLoop_ReadAddRemove):
    when ownSizeof(natsEvLoop_ReadAddRemove) !=
        ownSizeof(natsEvLoop_ReadAddRemove_536871734):
      static :
        warning("Declaration of " & "natsEvLoop_ReadAddRemove" &
            " exists but with different size")
    natsEvLoop_ReadAddRemove
   else:
    natsEvLoop_ReadAddRemove_536871734)
  struct_objStoreStatus_536871689 = (when declared(struct_objStoreStatus):
    when ownSizeof(struct_objStoreStatus) != ownSizeof(struct_objStoreStatus_536871688):
      static :
        warning("Declaration of " & "struct_objStoreStatus" &
            " exists but with different size")
    struct_objStoreStatus
   else:
    struct_objStoreStatus_536871688)
  struct_jsSubOptions_536871541 = (when declared(struct_jsSubOptions):
    when ownSizeof(struct_jsSubOptions) != ownSizeof(struct_jsSubOptions_536871540):
      static :
        warning("Declaration of " & "struct_jsSubOptions" &
            " exists but with different size")
    struct_jsSubOptions
   else:
    struct_jsSubOptions_536871540)
  jsStorageCompression_536871436 = (when declared(jsStorageCompression):
    when ownSizeof(jsStorageCompression) != ownSizeof(jsStorageCompression_536871435):
      static :
        warning("Declaration of " & "jsStorageCompression" &
            " exists but with different size")
    jsStorageCompression
   else:
    jsStorageCompression_536871435)
  jsAccountInfo_536871587 = (when declared(jsAccountInfo):
    when ownSizeof(jsAccountInfo) != ownSizeof(jsAccountInfo_536871586):
      static :
        warning("Declaration of " & "jsAccountInfo" &
            " exists but with different size")
    jsAccountInfo
   else:
    jsAccountInfo_536871586)
  objStoreStatus_536871691 = (when declared(objStoreStatus):
    when ownSizeof(objStoreStatus) != ownSizeof(objStoreStatus_536871690):
      static :
        warning("Declaration of " & "objStoreStatus" &
            " exists but with different size")
    objStoreStatus
   else:
    objStoreStatus_536871690)
  natsEvLoop_Detach_536871739 = (when declared(natsEvLoop_Detach):
    when ownSizeof(natsEvLoop_Detach) != ownSizeof(natsEvLoop_Detach_536871738):
      static :
        warning("Declaration of " & "natsEvLoop_Detach" &
            " exists but with different size")
    natsEvLoop_Detach
   else:
    natsEvLoop_Detach_536871738)
  struct_objStoreWatchOptions_536871721 = (when declared(
      struct_objStoreWatchOptions):
    when ownSizeof(struct_objStoreWatchOptions) !=
        ownSizeof(struct_objStoreWatchOptions_536871720):
      static :
        warning("Declaration of " & "struct_objStoreWatchOptions" &
            " exists but with different size")
    struct_objStoreWatchOptions
   else:
    struct_objStoreWatchOptions_536871720)
  struct_jsPlacement_536871461 = (when declared(struct_jsPlacement):
    when ownSizeof(struct_jsPlacement) != ownSizeof(struct_jsPlacement_536871460):
      static :
        warning("Declaration of " & "struct_jsPlacement" &
            " exists but with different size")
    struct_jsPlacement
   else:
    struct_jsPlacement_536871460)
  kvOperation_536871651 = (when declared(kvOperation):
    when ownSizeof(kvOperation) != ownSizeof(kvOperation_536871650):
      static :
        warning("Declaration of " & "kvOperation" &
            " exists but with different size")
    kvOperation
   else:
    kvOperation_536871650)
  struct_objStoreConfig_536871681 = (when declared(struct_objStoreConfig):
    when ownSizeof(struct_objStoreConfig) != ownSizeof(struct_objStoreConfig_536871680):
      static :
        warning("Declaration of " & "struct_objStoreConfig" &
            " exists but with different size")
    struct_objStoreConfig
   else:
    struct_objStoreConfig_536871680)
  natsConnection_536871386 = (when declared(natsConnection):
    when ownSizeof(natsConnection) != ownSizeof(natsConnection_536871385):
      static :
        warning("Declaration of " & "natsConnection" &
            " exists but with different size")
    natsConnection
   else:
    natsConnection_536871385)
  jsStreamStateSubject_536871495 = (when declared(jsStreamStateSubject):
    when ownSizeof(jsStreamStateSubject) != ownSizeof(jsStreamStateSubject_536871494):
      static :
        warning("Declaration of " & "jsStreamStateSubject" &
            " exists but with different size")
    jsStreamStateSubject
   else:
    jsStreamStateSubject_536871494)
  struct_objStoreNamesList_536871685 = (when declared(struct_objStoreNamesList):
    when ownSizeof(struct_objStoreNamesList) !=
        ownSizeof(struct_objStoreNamesList_536871684):
      static :
        warning("Declaration of " & "struct_objStoreNamesList" &
            " exists but with different size")
    struct_objStoreNamesList
   else:
    struct_objStoreNamesList_536871684)
  jsAccountLimits_536871579 = (when declared(jsAccountLimits):
    when ownSizeof(jsAccountLimits) != ownSizeof(jsAccountLimits_536871578):
      static :
        warning("Declaration of " & "jsAccountLimits" &
            " exists but with different size")
    jsAccountLimits
   else:
    jsAccountLimits_536871578)
  jsPersistModeType_536871459 = (when declared(jsPersistModeType):
    when ownSizeof(jsPersistModeType) != ownSizeof(jsPersistModeType_536871458):
      static :
        warning("Declaration of " & "jsPersistModeType" &
            " exists but with different size")
    jsPersistModeType
   else:
    jsPersistModeType_536871458)
  jsRePublish_536871475 = (when declared(jsRePublish):
    when ownSizeof(jsRePublish) != ownSizeof(jsRePublish_536871474):
      static :
        warning("Declaration of " & "jsRePublish" &
            " exists but with different size")
    jsRePublish
   else:
    jsRePublish_536871474)
  natsMetadata_536871412 = (when declared(natsMetadata):
    when ownSizeof(natsMetadata) != ownSizeof(natsMetadata_536871411):
      static :
        warning("Declaration of " & "natsMetadata" &
            " exists but with different size")
    natsMetadata
   else:
    natsMetadata_536871411)
  struct_jsClusterInfo_536871509 = (when declared(struct_jsClusterInfo):
    when ownSizeof(struct_jsClusterInfo) != ownSizeof(struct_jsClusterInfo_536871508):
      static :
        warning("Declaration of " & "struct_jsClusterInfo" &
            " exists but with different size")
    struct_jsClusterInfo
   else:
    struct_jsClusterInfo_536871508)
  compiler_off_t_536871808 = (when declared(compiler_off_t):
    when ownSizeof(compiler_off_t) != ownSizeof(compiler_off_t_536871807):
      static :
        warning("Declaration of " & "compiler_off_t" &
            " exists but with different size")
    compiler_off_t
   else:
    compiler_off_t_536871807)
  struct_jsStreamSource_536871469 = (when declared(struct_jsStreamSource):
    when ownSizeof(struct_jsStreamSource) != ownSizeof(struct_jsStreamSource_536871468):
      static :
        warning("Declaration of " & "struct_jsStreamSource" &
            " exists but with different size")
    struct_jsStreamSource
   else:
    struct_jsStreamSource_536871468)
  microClient_536871755 = (when declared(microClient):
    when ownSizeof(microClient) != ownSizeof(microClient_536871754):
      static :
        warning("Declaration of " & "microClient" &
            " exists but with different size")
    microClient
   else:
    microClient_536871754)
  microGroup_536871775 = (when declared(microGroup):
    when ownSizeof(microGroup) != ownSizeof(microGroup_536871774):
      static :
        warning("Declaration of " & "microGroup" &
            " exists but with different size")
    microGroup
   else:
    microGroup_536871774)
  struct_micro_group_config_s_536871779 = (when declared(
      struct_micro_group_config_s):
    when ownSizeof(struct_micro_group_config_s) !=
        ownSizeof(struct_micro_group_config_s_536871778):
      static :
        warning("Declaration of " & "struct_micro_group_config_s" &
            " exists but with different size")
    struct_micro_group_config_s
   else:
    struct_micro_group_config_s_536871778)
  enum_jsRetentionPolicy_536871422 = (when declared(enum_jsRetentionPolicy):
    when ownSizeof(enum_jsRetentionPolicy) != ownSizeof(enum_jsRetentionPolicy_536871421):
      static :
        warning("Declaration of " & "enum_jsRetentionPolicy" &
            " exists but with different size")
    enum_jsRetentionPolicy
   else:
    enum_jsRetentionPolicy_536871421)
  struct_jsMsgMetaData_536871589 = (when declared(struct_jsMsgMetaData):
    when ownSizeof(struct_jsMsgMetaData) != ownSizeof(struct_jsMsgMetaData_536871588):
      static :
        warning("Declaration of " & "struct_jsMsgMetaData" &
            " exists but with different size")
    struct_jsMsgMetaData
   else:
    struct_jsMsgMetaData_536871588)
  jsPubOptions_536871420 = (when declared(jsPubOptions):
    when ownSizeof(jsPubOptions) != ownSizeof(jsPubOptions_536871419):
      static :
        warning("Declaration of " & "jsPubOptions" &
            " exists but with different size")
    jsPubOptions
   else:
    jsPubOptions_536871419)
  jsPubAckErr_536871599 = (when declared(jsPubAckErr):
    when ownSizeof(jsPubAckErr) != ownSizeof(jsPubAckErr_536871598):
      static :
        warning("Declaration of " & "jsPubAckErr" &
            " exists but with different size")
    jsPubAckErr
   else:
    jsPubAckErr_536871598)
  microClientConfig_536871757 = (when declared(microClientConfig):
    when ownSizeof(microClientConfig) != ownSizeof(microClientConfig_536871756):
      static :
        warning("Declaration of " & "microClientConfig" &
            " exists but with different size")
    microClientConfig
   else:
    microClientConfig_536871756)
  kvStatus_536871645 = (when declared(kvStatus):
    when ownSizeof(kvStatus) != ownSizeof(kvStatus_536871644):
      static :
        warning("Declaration of " & "kvStatus" &
            " exists but with different size")
    kvStatus
   else:
    kvStatus_536871644)
  jsAPIStats_536871575 = (when declared(jsAPIStats):
    when ownSizeof(jsAPIStats) != ownSizeof(jsAPIStats_536871574):
      static :
        warning("Declaration of " & "jsAPIStats" &
            " exists but with different size")
    jsAPIStats
   else:
    jsAPIStats_536871574)
  jsCtx_536871414 = (when declared(jsCtx):
    when ownSizeof(jsCtx) != ownSizeof(jsCtx_536871413):
      static :
        warning("Declaration of " & "jsCtx" & " exists but with different size")
    jsCtx
   else:
    jsCtx_536871413)
  jsStreamConfig_536871487 = (when declared(jsStreamConfig):
    when ownSizeof(jsStreamConfig) != ownSizeof(jsStreamConfig_536871486):
      static :
        warning("Declaration of " & "jsStreamConfig" &
            " exists but with different size")
    jsStreamConfig
   else:
    jsStreamConfig_536871486)
  jsStreamStateSubjects_536871499 = (when declared(jsStreamStateSubjects):
    when ownSizeof(jsStreamStateSubjects) != ownSizeof(jsStreamStateSubjects_536871498):
      static :
        warning("Declaration of " & "jsStreamStateSubjects" &
            " exists but with different size")
    jsStreamStateSubjects
   else:
    jsStreamStateSubjects_536871498)
  microEndpointInfo_536871765 = (when declared(microEndpointInfo):
    when ownSizeof(microEndpointInfo) != ownSizeof(microEndpointInfo_536871764):
      static :
        warning("Declaration of " & "microEndpointInfo" &
            " exists but with different size")
    microEndpointInfo
   else:
    microEndpointInfo_536871764)
  enum_jsReplayPolicy_536871453 = (when declared(enum_jsReplayPolicy):
    when ownSizeof(enum_jsReplayPolicy) != ownSizeof(enum_jsReplayPolicy_536871452):
      static :
        warning("Declaration of " & "enum_jsReplayPolicy" &
            " exists but with different size")
    enum_jsReplayPolicy
   else:
    enum_jsReplayPolicy_536871452)
  struct_jsStreamStateSubject_536871493 = (when declared(
      struct_jsStreamStateSubject):
    when ownSizeof(struct_jsStreamStateSubject) !=
        ownSizeof(struct_jsStreamStateSubject_536871492):
      static :
        warning("Declaration of " & "struct_jsStreamStateSubject" &
            " exists but with different size")
    struct_jsStreamStateSubject
   else:
    struct_jsStreamStateSubject_536871492)
  jsPlacement_536871463 = (when declared(jsPlacement):
    when ownSizeof(jsPlacement) != ownSizeof(jsPlacement_536871462):
      static :
        warning("Declaration of " & "jsPlacement" &
            " exists but with different size")
    jsPlacement
   else:
    jsPlacement_536871462)
  jsRetentionPolicy_536871424 = (when declared(jsRetentionPolicy):
    when ownSizeof(jsRetentionPolicy) != ownSizeof(jsRetentionPolicy_536871423):
      static :
        warning("Declaration of " & "jsRetentionPolicy" &
            " exists but with different size")
    jsRetentionPolicy
   else:
    jsRetentionPolicy_536871423)
  kvConfig_536871655 = (when declared(kvConfig):
    when ownSizeof(kvConfig) != ownSizeof(kvConfig_536871654):
      static :
        warning("Declaration of " & "kvConfig" &
            " exists but with different size")
    kvConfig
   else:
    kvConfig_536871654)
  objStoreOptions_536871719 = (when declared(objStoreOptions):
    when ownSizeof(objStoreOptions) != ownSizeof(objStoreOptions_536871718):
      static :
        warning("Declaration of " & "objStoreOptions" &
            " exists but with different size")
    objStoreOptions
   else:
    objStoreOptions_536871718)
  microEndpointConfig_536871761 = (when declared(microEndpointConfig):
    when ownSizeof(microEndpointConfig) != ownSizeof(microEndpointConfig_536871760):
      static :
        warning("Declaration of " & "microEndpointConfig" &
            " exists but with different size")
    microEndpointConfig
   else:
    microEndpointConfig_536871760)
  struct_natsClientConfig_536871402 = (when declared(struct_natsClientConfig):
    when ownSizeof(struct_natsClientConfig) !=
        ownSizeof(struct_natsClientConfig_536871401):
      static :
        warning("Declaration of " & "struct_natsClientConfig" &
            " exists but with different size")
    struct_natsClientConfig
   else:
    struct_natsClientConfig_536871401)
  struct_jsOptionsStream_536871633 = (when declared(struct_jsOptionsStream):
    when ownSizeof(struct_jsOptionsStream) != ownSizeof(struct_jsOptionsStream_536871632):
      static :
        warning("Declaration of " & "struct_jsOptionsStream" &
            " exists but with different size")
    struct_jsOptionsStream
   else:
    struct_jsOptionsStream_536871632)
  struct_jsStreamInfoList_536871525 = (when declared(struct_jsStreamInfoList):
    when ownSizeof(struct_jsStreamInfoList) !=
        ownSizeof(struct_jsStreamInfoList_536871524):
      static :
        warning("Declaration of " & "struct_jsStreamInfoList" &
            " exists but with different size")
    struct_jsStreamInfoList
   else:
    struct_jsStreamInfoList_536871524)
  jsOptionsStream_536871635 = (when declared(jsOptionsStream):
    when ownSizeof(jsOptionsStream) != ownSizeof(jsOptionsStream_536871634):
      static :
        warning("Declaration of " & "jsOptionsStream" &
            " exists but with different size")
    jsOptionsStream
   else:
    jsOptionsStream_536871634)
  struct_jsPubAckErr_536871597 = (when declared(struct_jsPubAckErr):
    when ownSizeof(struct_jsPubAckErr) != ownSizeof(struct_jsPubAckErr_536871596):
      static :
        warning("Declaration of " & "struct_jsPubAckErr" &
            " exists but with different size")
    struct_jsPubAckErr
   else:
    struct_jsPubAckErr_536871596)
  microService_536871783 = (when declared(microService):
    when ownSizeof(microService) != ownSizeof(microService_536871782):
      static :
        warning("Declaration of " & "microService" &
            " exists but with different size")
    microService
   else:
    microService_536871782)
  struct_objStoreOptions_536871717 = (when declared(struct_objStoreOptions):
    when ownSizeof(struct_objStoreOptions) != ownSizeof(struct_objStoreOptions_536871716):
      static :
        warning("Declaration of " & "struct_objStoreOptions" &
            " exists but with different size")
    struct_objStoreOptions
   else:
    struct_objStoreOptions_536871716)
  natsSubscription_536871390 = (when declared(natsSubscription):
    when ownSizeof(natsSubscription) != ownSizeof(natsSubscription_536871389):
      static :
        warning("Declaration of " & "natsSubscription" &
            " exists but with different size")
    natsSubscription
   else:
    natsSubscription_536871389)
  natsErrHandler_536871731 = (when declared(natsErrHandler):
    when ownSizeof(natsErrHandler) != ownSizeof(natsErrHandler_536871730):
      static :
        warning("Declaration of " & "natsErrHandler" &
            " exists but with different size")
    natsErrHandler
   else:
    natsErrHandler_536871730)
  jsStreamInfo_536871523 = (when declared(jsStreamInfo):
    when ownSizeof(jsStreamInfo) != ownSizeof(jsStreamInfo_536871522):
      static :
        warning("Declaration of " & "jsStreamInfo" &
            " exists but with different size")
    jsStreamInfo
   else:
    jsStreamInfo_536871522)
  struct_natsMsgList_536871406 = (when declared(struct_natsMsgList):
    when ownSizeof(struct_natsMsgList) != ownSizeof(struct_natsMsgList_536871405):
      static :
        warning("Declaration of " & "struct_natsMsgList" &
            " exists but with different size")
    struct_natsMsgList
   else:
    struct_natsMsgList_536871405)
  jsConsumerConfig_536871535 = (when declared(jsConsumerConfig):
    when ownSizeof(jsConsumerConfig) != ownSizeof(jsConsumerConfig_536871534):
      static :
        warning("Declaration of " & "jsConsumerConfig" &
            " exists but with different size")
    jsConsumerConfig
   else:
    jsConsumerConfig_536871534)
  struct_objStoreLink_536871697 = (when declared(struct_objStoreLink):
    when ownSizeof(struct_objStoreLink) != ownSizeof(struct_objStoreLink_536871696):
      static :
        warning("Declaration of " & "struct_objStoreLink" &
            " exists but with different size")
    struct_objStoreLink
   else:
    struct_objStoreLink_536871696)
  struct_micro_service_info_s_536871791 = (when declared(
      struct_micro_service_info_s):
    when ownSizeof(struct_micro_service_info_s) !=
        ownSizeof(struct_micro_service_info_s_536871790):
      static :
        warning("Declaration of " & "struct_micro_service_info_s" &
            " exists but with different size")
    struct_micro_service_info_s
   else:
    struct_micro_service_info_s_536871790)
  jsFetchCompleteHandler_536871613 = (when declared(jsFetchCompleteHandler):
    when ownSizeof(jsFetchCompleteHandler) != ownSizeof(jsFetchCompleteHandler_536871612):
      static :
        warning("Declaration of " & "jsFetchCompleteHandler" &
            " exists but with different size")
    jsFetchCompleteHandler
   else:
    jsFetchCompleteHandler_536871612)
  struct_jsPeerInfo_536871505 = (when declared(struct_jsPeerInfo):
    when ownSizeof(struct_jsPeerInfo) != ownSizeof(struct_jsPeerInfo_536871504):
      static :
        warning("Declaration of " & "struct_jsPeerInfo" &
            " exists but with different size")
    struct_jsPeerInfo
   else:
    struct_jsPeerInfo_536871504)
  jsStreamAlternate_536871519 = (when declared(jsStreamAlternate):
    when ownSizeof(jsStreamAlternate) != ownSizeof(jsStreamAlternate_536871518):
      static :
        warning("Declaration of " & "jsStreamAlternate" &
            " exists but with different size")
    jsStreamAlternate
   else:
    jsStreamAlternate_536871518)
  microError_536871773 = (when declared(microError):
    when ownSizeof(microError) != ownSizeof(microError_536871772):
      static :
        warning("Declaration of " & "microError" &
            " exists but with different size")
    microError
   else:
    microError_536871772)
  jsStreamSourceInfo_536871515 = (when declared(jsStreamSourceInfo):
    when ownSizeof(jsStreamSourceInfo) != ownSizeof(jsStreamSourceInfo_536871514):
      static :
        warning("Declaration of " & "jsStreamSourceInfo" &
            " exists but with different size")
    jsStreamSourceInfo
   else:
    jsStreamSourceInfo_536871514)
  struct_jsDirectGetMsgOptions_536871605 = (when declared(
      struct_jsDirectGetMsgOptions):
    when ownSizeof(struct_jsDirectGetMsgOptions) !=
        ownSizeof(struct_jsDirectGetMsgOptions_536871604):
      static :
        warning("Declaration of " & "struct_jsDirectGetMsgOptions" &
            " exists but with different size")
    struct_jsDirectGetMsgOptions
   else:
    struct_jsDirectGetMsgOptions_536871604)
  struct_jsOptions_536871637 = (when declared(struct_jsOptions):
    when ownSizeof(struct_jsOptions) != ownSizeof(struct_jsOptions_536871636):
      static :
        warning("Declaration of " & "struct_jsOptions" &
            " exists but with different size")
    struct_jsOptions
   else:
    struct_jsOptions_536871636)
  struct_micro_endpoint_config_s_536871763 = (when declared(
      struct_micro_endpoint_config_s):
    when ownSizeof(struct_micro_endpoint_config_s) !=
        ownSizeof(struct_micro_endpoint_config_s_536871762):
      static :
        warning("Declaration of " & "struct_micro_endpoint_config_s" &
            " exists but with different size")
    struct_micro_endpoint_config_s
   else:
    struct_micro_endpoint_config_s_536871762)
  microGroupConfig_536871777 = (when declared(microGroupConfig):
    when ownSizeof(microGroupConfig) != ownSizeof(microGroupConfig_536871776):
      static :
        warning("Declaration of " & "microGroupConfig" &
            " exists but with different size")
    microGroupConfig
   else:
    microGroupConfig_536871776)
when not declared(struct_jsOptionsStreamPurge):
  type
    struct_jsOptionsStreamPurge* = struct_jsOptionsStreamPurge_536871624
else:
  static :
    hint("Declaration of " & "struct_jsOptionsStreamPurge" &
        " already exists, not redeclaring")
when not declared(objStoreMeta):
  type
    objStoreMeta* = objStoreMeta_536871706
else:
  static :
    hint("Declaration of " & "objStoreMeta" & " already exists, not redeclaring")
when not declared(objStoreGet):
  type
    objStoreGet* = objStoreGet_536871676
else:
  static :
    hint("Declaration of " & "objStoreGet" & " already exists, not redeclaring")
when not declared(jsDirectGetMsgOptions):
  type
    jsDirectGetMsgOptions* = jsDirectGetMsgOptions_536871606
else:
  static :
    hint("Declaration of " & "jsDirectGetMsgOptions" &
        " already exists, not redeclaring")
when not declared(jsConsumerInfoList):
  type
    jsConsumerInfoList* = jsConsumerInfoList_536871562
else:
  static :
    hint("Declaration of " & "jsConsumerInfoList" &
        " already exists, not redeclaring")
when not declared(enum_kvOperation):
  type
    enum_kvOperation* = enum_kvOperation_536871648
else:
  static :
    hint("Declaration of " & "enum_kvOperation" &
        " already exists, not redeclaring")
when not declared(struct_jsConsumerNamesList):
  type
    struct_jsConsumerNamesList* = struct_jsConsumerNamesList_536871564
else:
  static :
    hint("Declaration of " & "struct_jsConsumerNamesList" &
        " already exists, not redeclaring")
when not declared(enum_jsAckPolicy):
  type
    enum_jsAckPolicy* = enum_jsAckPolicy_536871441
else:
  static :
    hint("Declaration of " & "enum_jsAckPolicy" &
        " already exists, not redeclaring")
when not declared(objStore):
  type
    objStore* = objStore_536871672
else:
  static :
    hint("Declaration of " & "objStore" & " already exists, not redeclaring")
when not declared(enum_jsStorageCompression):
  type
    enum_jsStorageCompression* = enum_jsStorageCompression_536871433
else:
  static :
    hint("Declaration of " & "enum_jsStorageCompression" &
        " already exists, not redeclaring")
when not declared(jsFetchNextHandler):
  type
    jsFetchNextHandler* = jsFetchNextHandler_536871614
else:
  static :
    hint("Declaration of " & "jsFetchNextHandler" &
        " already exists, not redeclaring")
when not declared(microServiceConfig):
  type
    microServiceConfig* = microServiceConfig_536871784
else:
  static :
    hint("Declaration of " & "microServiceConfig" &
        " already exists, not redeclaring")
when not declared(struct_natsMetadata):
  type
    struct_natsMetadata* = struct_natsMetadata_536871409
else:
  static :
    hint("Declaration of " & "struct_natsMetadata" &
        " already exists, not redeclaring")
when not declared(struct_jsStreamSourceInfo):
  type
    struct_jsStreamSourceInfo* = struct_jsStreamSourceInfo_536871512
else:
  static :
    hint("Declaration of " & "struct_jsStreamSourceInfo" &
        " already exists, not redeclaring")
when not declared(struct_jsAPIStats):
  type
    struct_jsAPIStats* = struct_jsAPIStats_536871572
else:
  static :
    hint("Declaration of " & "struct_jsAPIStats" &
        " already exists, not redeclaring")
when not declared(natsInbox):
  type
    natsInbox* = natsInbox_536871395
else:
  static :
    hint("Declaration of " & "natsInbox" & " already exists, not redeclaring")
when not declared(struct_kvKeysList):
  type
    struct_kvKeysList* = struct_kvKeysList_536871668
else:
  static :
    hint("Declaration of " & "struct_kvKeysList" &
        " already exists, not redeclaring")
when not declared(jsPubAckHandler):
  type
    jsPubAckHandler* = jsPubAckHandler_536871602
else:
  static :
    hint("Declaration of " & "jsPubAckHandler" &
        " already exists, not redeclaring")
when not declared(struct_jsOptionsPublishAsync):
  type
    struct_jsOptionsPublishAsync* = struct_jsOptionsPublishAsync_536871620
else:
  static :
    hint("Declaration of " & "struct_jsOptionsPublishAsync" &
        " already exists, not redeclaring")
when not declared(objStoreMetaOptions):
  type
    objStoreMetaOptions* = objStoreMetaOptions_536871702
else:
  static :
    hint("Declaration of " & "objStoreMetaOptions" &
        " already exists, not redeclaring")
when not declared(struct_jsRePublish):
  type
    struct_jsRePublish* = struct_jsRePublish_536871472
else:
  static :
    hint("Declaration of " & "struct_jsRePublish" &
        " already exists, not redeclaring")
when not declared(natsProxyConnHandler):
  type
    natsProxyConnHandler* = natsProxyConnHandler_536871728
else:
  static :
    hint("Declaration of " & "natsProxyConnHandler" &
        " already exists, not redeclaring")
when not declared(kvKeysList):
  type
    kvKeysList* = kvKeysList_536871670
else:
  static :
    hint("Declaration of " & "kvKeysList" & " already exists, not redeclaring")
when not declared(natsTokenHandler):
  type
    natsTokenHandler* = natsTokenHandler_536871744
else:
  static :
    hint("Declaration of " & "natsTokenHandler" &
        " already exists, not redeclaring")
when not declared(compiler_off64_t):
  type
    compiler_off64_t* = compiler_off64_t_536871811
else:
  static :
    hint("Declaration of " & "compiler_off64_t" &
        " already exists, not redeclaring")
when not declared(natsHeader):
  type
    natsHeader* = natsHeader_536871397
else:
  static :
    hint("Declaration of " & "natsHeader" & " already exists, not redeclaring")
when not declared(struct_jsConsumerInfoList):
  type
    struct_jsConsumerInfoList* = struct_jsConsumerInfoList_536871560
else:
  static :
    hint("Declaration of " & "struct_jsConsumerInfoList" &
        " already exists, not redeclaring")
when not declared(struct_micro_service_config_s):
  type
    struct_micro_service_config_s* = struct_micro_service_config_s_536871786
else:
  static :
    hint("Declaration of " & "struct_micro_service_config_s" &
        " already exists, not redeclaring")
when not declared(struct_kvPurgeOptions):
  type
    struct_kvPurgeOptions* = struct_kvPurgeOptions_536871660
else:
  static :
    hint("Declaration of " & "struct_kvPurgeOptions" &
        " already exists, not redeclaring")
when not declared(jsSubOptions):
  type
    jsSubOptions* = jsSubOptions_536871542
else:
  static :
    hint("Declaration of " & "jsSubOptions" & " already exists, not redeclaring")
when not declared(enum_jsDiscardPolicy):
  type
    enum_jsDiscardPolicy* = enum_jsDiscardPolicy_536871425
else:
  static :
    hint("Declaration of " & "enum_jsDiscardPolicy" &
        " already exists, not redeclaring")
when not declared(struct_jsStreamState):
  type
    struct_jsStreamState* = struct_jsStreamState_536871500
else:
  static :
    hint("Declaration of " & "struct_jsStreamState" &
        " already exists, not redeclaring")
when not declared(struct_jsConsumerSequenceMismatch):
  type
    struct_jsConsumerSequenceMismatch* = struct_jsConsumerSequenceMismatch_536871536
else:
  static :
    hint("Declaration of " & "struct_jsConsumerSequenceMismatch" &
        " already exists, not redeclaring")
when not declared(natsCustomReconnectDelayHandler):
  type
    natsCustomReconnectDelayHandler* = natsCustomReconnectDelayHandler_536871748
else:
  static :
    hint("Declaration of " & "natsCustomReconnectDelayHandler" &
        " already exists, not redeclaring")
when not declared(enum_jsErrCode):
  type
    enum_jsErrCode* = enum_jsErrCode_536871379
else:
  static :
    hint("Declaration of " & "enum_jsErrCode" &
        " already exists, not redeclaring")
when not declared(objStoreWatcher):
  type
    objStoreWatcher* = objStoreWatcher_536871678
else:
  static :
    hint("Declaration of " & "objStoreWatcher" &
        " already exists, not redeclaring")
when not declared(objStoreInfo):
  type
    objStoreInfo* = objStoreInfo_536871710
else:
  static :
    hint("Declaration of " & "objStoreInfo" & " already exists, not redeclaring")
when not declared(microRequestHandler):
  type
    microRequestHandler* = microRequestHandler_536871796
else:
  static :
    hint("Declaration of " & "microRequestHandler" &
        " already exists, not redeclaring")
when not declared(jsExternalStream):
  type
    jsExternalStream* = jsExternalStream_536871466
else:
  static :
    hint("Declaration of " & "jsExternalStream" &
        " already exists, not redeclaring")
when not declared(struct_jsAccountLimits):
  type
    struct_jsAccountLimits* = struct_jsAccountLimits_536871576
else:
  static :
    hint("Declaration of " & "struct_jsAccountLimits" &
        " already exists, not redeclaring")
when not declared(natsConnStatus):
  type
    natsConnStatus* = natsConnStatus_536871373
else:
  static :
    hint("Declaration of " & "natsConnStatus" &
        " already exists, not redeclaring")
when not declared(jsStreamState):
  type
    jsStreamState* = jsStreamState_536871502
else:
  static :
    hint("Declaration of " & "jsStreamState" &
        " already exists, not redeclaring")
when not declared(objStoreInfoList):
  type
    objStoreInfoList* = objStoreInfoList_536871714
else:
  static :
    hint("Declaration of " & "objStoreInfoList" &
        " already exists, not redeclaring")
when not declared(jsClusterInfo):
  type
    jsClusterInfo* = jsClusterInfo_536871510
else:
  static :
    hint("Declaration of " & "jsClusterInfo" &
        " already exists, not redeclaring")
when not declared(struct_jsSequencePair):
  type
    struct_jsSequencePair* = struct_jsSequencePair_536871544
else:
  static :
    hint("Declaration of " & "struct_jsSequencePair" &
        " already exists, not redeclaring")
when not declared(objStoreNamesList):
  type
    objStoreNamesList* = objStoreNamesList_536871686
else:
  static :
    hint("Declaration of " & "objStoreNamesList" &
        " already exists, not redeclaring")
when not declared(microServiceInfo):
  type
    microServiceInfo* = microServiceInfo_536871788
else:
  static :
    hint("Declaration of " & "microServiceInfo" &
        " already exists, not redeclaring")
when not declared(natsEvLoop_Attach):
  type
    natsEvLoop_Attach* = natsEvLoop_Attach_536871732
else:
  static :
    hint("Declaration of " & "natsEvLoop_Attach" &
        " already exists, not redeclaring")
when not declared(enum_jsStorageType):
  type
    enum_jsStorageType* = enum_jsStorageType_536871429
else:
  static :
    hint("Declaration of " & "enum_jsStorageType" &
        " already exists, not redeclaring")
when not declared(objStorePut):
  type
    objStorePut* = objStorePut_536871674
else:
  static :
    hint("Declaration of " & "objStorePut" & " already exists, not redeclaring")
when not declared(struct_micro_endpoint_stats_s):
  type
    struct_micro_endpoint_stats_s* = struct_micro_endpoint_stats_s_536871770
else:
  static :
    hint("Declaration of " & "struct_micro_endpoint_stats_s" &
        " already exists, not redeclaring")
when not declared(jsDeliverPolicy):
  type
    jsDeliverPolicy* = jsDeliverPolicy_536871439
else:
  static :
    hint("Declaration of " & "jsDeliverPolicy" &
        " already exists, not redeclaring")
when not declared(struct_jsConsumerInfo):
  type
    struct_jsConsumerInfo* = struct_jsConsumerInfo_536871556
else:
  static :
    hint("Declaration of " & "struct_jsConsumerInfo" &
        " already exists, not redeclaring")
when not declared(struct_IO_FILE):
  type
    struct_IO_FILE* = struct_IO_FILE_536871802
else:
  static :
    hint("Declaration of " & "struct_IO_FILE" &
        " already exists, not redeclaring")
when not declared(natsConnectionHandler):
  type
    natsConnectionHandler* = natsConnectionHandler_536871726
else:
  static :
    hint("Declaration of " & "natsConnectionHandler" &
        " already exists, not redeclaring")
when not declared(jsConsumerInfo):
  type
    jsConsumerInfo* = jsConsumerInfo_536871558
else:
  static :
    hint("Declaration of " & "jsConsumerInfo" &
        " already exists, not redeclaring")
when not declared(struct_objStoreInfoList):
  type
    struct_objStoreInfoList* = struct_objStoreInfoList_536871712
else:
  static :
    hint("Declaration of " & "struct_objStoreInfoList" &
        " already exists, not redeclaring")
when not declared(jsSequencePair):
  type
    jsSequencePair* = jsSequencePair_536871546
else:
  static :
    hint("Declaration of " & "jsSequencePair" &
        " already exists, not redeclaring")
when not declared(jsAckPolicy):
  type
    jsAckPolicy* = jsAckPolicy_536871443
else:
  static :
    hint("Declaration of " & "jsAckPolicy" & " already exists, not redeclaring")
when not declared(jsDiscardPolicy):
  type
    jsDiscardPolicy* = jsDiscardPolicy_536871427
else:
  static :
    hint("Declaration of " & "jsDiscardPolicy" &
        " already exists, not redeclaring")
when not declared(struct_jsStreamConfig):
  type
    struct_jsStreamConfig* = struct_jsStreamConfig_536871484
else:
  static :
    hint("Declaration of " & "struct_jsStreamConfig" &
        " already exists, not redeclaring")
when not declared(kvPurgeOptions):
  type
    kvPurgeOptions* = kvPurgeOptions_536871662
else:
  static :
    hint("Declaration of " & "kvPurgeOptions" &
        " already exists, not redeclaring")
when not declared(struct_jsStreamInfo):
  type
    struct_jsStreamInfo* = struct_jsStreamInfo_536871520
else:
  static :
    hint("Declaration of " & "struct_jsStreamInfo" &
        " already exists, not redeclaring")
when not declared(objStoreWatchOptions):
  type
    objStoreWatchOptions* = objStoreWatchOptions_536871722
else:
  static :
    hint("Declaration of " & "objStoreWatchOptions" &
        " already exists, not redeclaring")
when not declared(natsMsgList):
  type
    natsMsgList* = natsMsgList_536871407
else:
  static :
    hint("Declaration of " & "natsMsgList" & " already exists, not redeclaring")
when not declared(struct_jsOptionsStreamInfo):
  type
    struct_jsOptionsStreamInfo* = struct_jsOptionsStreamInfo_536871628
else:
  static :
    hint("Declaration of " & "struct_jsOptionsStreamInfo" &
        " already exists, not redeclaring")
when not declared(natsMsgHandler):
  type
    natsMsgHandler* = natsMsgHandler_536871724
else:
  static :
    hint("Declaration of " & "natsMsgHandler" &
        " already exists, not redeclaring")
when not declared(natsUserJWTHandler):
  type
    natsUserJWTHandler* = natsUserJWTHandler_536871740
else:
  static :
    hint("Declaration of " & "natsUserJWTHandler" &
        " already exists, not redeclaring")
when not declared(jsConsumerNamesList):
  type
    jsConsumerNamesList* = jsConsumerNamesList_536871566
else:
  static :
    hint("Declaration of " & "jsConsumerNamesList" &
        " already exists, not redeclaring")
when not declared(jsOptionsPublishAsync):
  type
    jsOptionsPublishAsync* = jsOptionsPublishAsync_536871622
else:
  static :
    hint("Declaration of " & "jsOptionsPublishAsync" &
        " already exists, not redeclaring")
when not declared(jsLostStreamData):
  type
    jsLostStreamData* = jsLostStreamData_536871490
else:
  static :
    hint("Declaration of " & "jsLostStreamData" &
        " already exists, not redeclaring")
when not declared(natsOnCompleteCB):
  type
    natsOnCompleteCB* = natsOnCompleteCB_536871746
else:
  static :
    hint("Declaration of " & "natsOnCompleteCB" &
        " already exists, not redeclaring")
when not declared(jsStreamSource):
  type
    jsStreamSource* = jsStreamSource_536871470
else:
  static :
    hint("Declaration of " & "jsStreamSource" &
        " already exists, not redeclaring")
when not declared(struct_jsAccountInfo):
  type
    struct_jsAccountInfo* = struct_jsAccountInfo_536871584
else:
  static :
    hint("Declaration of " & "struct_jsAccountInfo" &
        " already exists, not redeclaring")
when not declared(jsSubjectTransformConfig):
  type
    jsSubjectTransformConfig* = jsSubjectTransformConfig_536871478
else:
  static :
    hint("Declaration of " & "jsSubjectTransformConfig" &
        " already exists, not redeclaring")
when not declared(struct_objStoreMeta):
  type
    struct_objStoreMeta* = struct_objStoreMeta_536871704
else:
  static :
    hint("Declaration of " & "struct_objStoreMeta" &
        " already exists, not redeclaring")
when not declared(struct_kvEntryList):
  type
    struct_kvEntryList* = struct_kvEntryList_536871664
else:
  static :
    hint("Declaration of " & "struct_kvEntryList" &
        " already exists, not redeclaring")
when not declared(jsReplayPolicy):
  type
    jsReplayPolicy* = jsReplayPolicy_536871454
else:
  static :
    hint("Declaration of " & "jsReplayPolicy" &
        " already exists, not redeclaring")
when not declared(struct_micro_endpoint_info_s):
  type
    struct_micro_endpoint_info_s* = struct_micro_endpoint_info_s_536871766
else:
  static :
    hint("Declaration of " & "struct_micro_endpoint_info_s" &
        " already exists, not redeclaring")
when not declared(objStoreConfig):
  type
    objStoreConfig* = objStoreConfig_536871682
else:
  static :
    hint("Declaration of " & "objStoreConfig" &
        " already exists, not redeclaring")
when not declared(kvStore):
  type
    kvStore* = kvStore_536871640
else:
  static :
    hint("Declaration of " & "kvStore" & " already exists, not redeclaring")
when not declared(struct_jsPubOptions):
  type
    struct_jsPubOptions* = struct_jsPubOptions_536871417
else:
  static :
    hint("Declaration of " & "struct_jsPubOptions" &
        " already exists, not redeclaring")
when not declared(jsConsumerPauseResponse):
  type
    jsConsumerPauseResponse* = jsConsumerPauseResponse_536871570
else:
  static :
    hint("Declaration of " & "jsConsumerPauseResponse" &
        " already exists, not redeclaring")
when not declared(natsSignatureHandler):
  type
    natsSignatureHandler* = natsSignatureHandler_536871742
else:
  static :
    hint("Declaration of " & "natsSignatureHandler" &
        " already exists, not redeclaring")
when not declared(jsStorageType):
  type
    jsStorageType* = jsStorageType_536871431
else:
  static :
    hint("Declaration of " & "jsStorageType" &
        " already exists, not redeclaring")
when not declared(natsSock):
  type
    natsSock* = natsSock_536871383
else:
  static :
    hint("Declaration of " & "natsSock" & " already exists, not redeclaring")
when not declared(jsPubAck):
  type
    jsPubAck* = jsPubAck_536871594
else:
  static :
    hint("Declaration of " & "jsPubAck" & " already exists, not redeclaring")
when not declared(struct_jsTier):
  type
    struct_jsTier* = struct_jsTier_536871580
else:
  static :
    hint("Declaration of " & "struct_jsTier" &
        " already exists, not redeclaring")
when not declared(objStoreStatusesList):
  type
    objStoreStatusesList* = objStoreStatusesList_536871694
else:
  static :
    hint("Declaration of " & "objStoreStatusesList" &
        " already exists, not redeclaring")
when not declared(enum_natsConnStatus):
  type
    enum_natsConnStatus* = enum_natsConnStatus_536871370
else:
  static :
    hint("Declaration of " & "enum_natsConnStatus" &
        " already exists, not redeclaring")
when not declared(struct_jsStreamStateSubjects):
  type
    struct_jsStreamStateSubjects* = struct_jsStreamStateSubjects_536871496
else:
  static :
    hint("Declaration of " & "struct_jsStreamStateSubjects" &
        " already exists, not redeclaring")
when not declared(kvWatchOptions):
  type
    kvWatchOptions* = kvWatchOptions_536871658
else:
  static :
    hint("Declaration of " & "kvWatchOptions" &
        " already exists, not redeclaring")
when not declared(struct_jsOptionsPullSubscribeAsync):
  type
    struct_jsOptionsPullSubscribeAsync* = struct_jsOptionsPullSubscribeAsync_536871616
else:
  static :
    hint("Declaration of " & "struct_jsOptionsPullSubscribeAsync" &
        " already exists, not redeclaring")
when not declared(microDoneHandler):
  type
    microDoneHandler* = microDoneHandler_536871800
else:
  static :
    hint("Declaration of " & "microDoneHandler" &
        " already exists, not redeclaring")
when not declared(struct_jsFetchRequest):
  type
    struct_jsFetchRequest* = struct_jsFetchRequest_536871608
else:
  static :
    hint("Declaration of " & "struct_jsFetchRequest" &
        " already exists, not redeclaring")
when not declared(natsThreadStartedHandler):
  type
    natsThreadStartedHandler* = natsThreadStartedHandler_536871399
else:
  static :
    hint("Declaration of " & "natsThreadStartedHandler" &
        " already exists, not redeclaring")
when not declared(enum_natsStatus):
  type
    enum_natsStatus* = enum_natsStatus_536871375
else:
  static :
    hint("Declaration of " & "enum_natsStatus" &
        " already exists, not redeclaring")
when not declared(jsPriorityGroupState):
  type
    jsPriorityGroupState* = jsPriorityGroupState_536871554
else:
  static :
    hint("Declaration of " & "jsPriorityGroupState" &
        " already exists, not redeclaring")
when not declared(jsOptionsPullSubscribeAsync):
  type
    jsOptionsPullSubscribeAsync* = jsOptionsPullSubscribeAsync_536871618
else:
  static :
    hint("Declaration of " & "jsOptionsPullSubscribeAsync" &
        " already exists, not redeclaring")
when not declared(jsOptions):
  type
    jsOptions* = jsOptions_536871638
else:
  static :
    hint("Declaration of " & "jsOptions" & " already exists, not redeclaring")
when not declared(jsStreamConsumerLimits):
  type
    jsStreamConsumerLimits* = jsStreamConsumerLimits_536871482
else:
  static :
    hint("Declaration of " & "jsStreamConsumerLimits" &
        " already exists, not redeclaring")
when not declared(jsStreamInfoList):
  type
    jsStreamInfoList* = jsStreamInfoList_536871526
else:
  static :
    hint("Declaration of " & "jsStreamInfoList" &
        " already exists, not redeclaring")
when not declared(jsConsumerSequenceMismatch):
  type
    jsConsumerSequenceMismatch* = jsConsumerSequenceMismatch_536871538
else:
  static :
    hint("Declaration of " & "jsConsumerSequenceMismatch" &
        " already exists, not redeclaring")
when not declared(struct_objStoreMetaOptions):
  type
    struct_objStoreMetaOptions* = struct_objStoreMetaOptions_536871700
else:
  static :
    hint("Declaration of " & "struct_objStoreMetaOptions" &
        " already exists, not redeclaring")
when not declared(natsSSLVerifyCb):
  type
    natsSSLVerifyCb* = natsSSLVerifyCb_536871750
else:
  static :
    hint("Declaration of " & "natsSSLVerifyCb" &
        " already exists, not redeclaring")
when not declared(natsStatistics):
  type
    natsStatistics* = natsStatistics_536871387
else:
  static :
    hint("Declaration of " & "natsStatistics" &
        " already exists, not redeclaring")
when not declared(jsPeerInfo):
  type
    jsPeerInfo* = jsPeerInfo_536871506
else:
  static :
    hint("Declaration of " & "jsPeerInfo" & " already exists, not redeclaring")
when not declared(microServiceStats):
  type
    microServiceStats* = microServiceStats_536871792
else:
  static :
    hint("Declaration of " & "microServiceStats" &
        " already exists, not redeclaring")
when not declared(natsClientConfig):
  type
    natsClientConfig* = natsClientConfig_536871403
else:
  static :
    hint("Declaration of " & "natsClientConfig" &
        " already exists, not redeclaring")
when not declared(jsOptionsStreamInfo):
  type
    jsOptionsStreamInfo* = jsOptionsStreamInfo_536871630
else:
  static :
    hint("Declaration of " & "jsOptionsStreamInfo" &
        " already exists, not redeclaring")
when not declared(struct_jsConsumerConfig):
  type
    struct_jsConsumerConfig* = struct_jsConsumerConfig_536871532
else:
  static :
    hint("Declaration of " & "struct_jsConsumerConfig" &
        " already exists, not redeclaring")
when not declared(kvEntryList):
  type
    kvEntryList* = kvEntryList_536871666
else:
  static :
    hint("Declaration of " & "kvEntryList" & " already exists, not redeclaring")
when not declared(FILE):
  type
    FILE* = FILE_536871752
else:
  static :
    hint("Declaration of " & "FILE" & " already exists, not redeclaring")
when not declared(jsErrCode):
  type
    jsErrCode* = jsErrCode_536871381
else:
  static :
    hint("Declaration of " & "jsErrCode" & " already exists, not redeclaring")
when not declared(struct_objStoreStatusesList):
  type
    struct_objStoreStatusesList* = struct_objStoreStatusesList_536871692
else:
  static :
    hint("Declaration of " & "struct_objStoreStatusesList" &
        " already exists, not redeclaring")
when not declared(microErrorHandler):
  type
    microErrorHandler* = microErrorHandler_536871798
else:
  static :
    hint("Declaration of " & "microErrorHandler" &
        " already exists, not redeclaring")
when not declared(struct_jsSequenceInfo):
  type
    struct_jsSequenceInfo* = struct_jsSequenceInfo_536871548
else:
  static :
    hint("Declaration of " & "struct_jsSequenceInfo" &
        " already exists, not redeclaring")
when not declared(struct_jsStreamConsumerLimits):
  type
    struct_jsStreamConsumerLimits* = struct_jsStreamConsumerLimits_536871480
else:
  static :
    hint("Declaration of " & "struct_jsStreamConsumerLimits" &
        " already exists, not redeclaring")
when not declared(kvEntry):
  type
    kvEntry* = kvEntry_536871642
else:
  static :
    hint("Declaration of " & "kvEntry" & " already exists, not redeclaring")
when not declared(enum_jsDeliverPolicy):
  type
    enum_jsDeliverPolicy* = enum_jsDeliverPolicy_536871437
else:
  static :
    hint("Declaration of " & "enum_jsDeliverPolicy" &
        " already exists, not redeclaring")
when not declared(enum_jsPersistModeType):
  type
    enum_jsPersistModeType* = enum_jsPersistModeType_536871456
else:
  static :
    hint("Declaration of " & "enum_jsPersistModeType" &
        " already exists, not redeclaring")
when not declared(struct_kvWatchOptions):
  type
    struct_kvWatchOptions* = struct_kvWatchOptions_536871656
else:
  static :
    hint("Declaration of " & "struct_kvWatchOptions" &
        " already exists, not redeclaring")
when not declared(objStoreLink):
  type
    objStoreLink* = objStoreLink_536871698
else:
  static :
    hint("Declaration of " & "objStoreLink" & " already exists, not redeclaring")
when not declared(natsMsg):
  type
    natsMsg* = natsMsg_536871391
else:
  static :
    hint("Declaration of " & "natsMsg" & " already exists, not redeclaring")
when not declared(natsStatus):
  type
    natsStatus* = natsStatus_536871377
else:
  static :
    hint("Declaration of " & "natsStatus" & " already exists, not redeclaring")
when not declared(jsFetchRequest):
  type
    jsFetchRequest* = jsFetchRequest_536871610
else:
  static :
    hint("Declaration of " & "jsFetchRequest" &
        " already exists, not redeclaring")
when not declared(struct_jsExternalStream):
  type
    struct_jsExternalStream* = struct_jsExternalStream_536871464
else:
  static :
    hint("Declaration of " & "struct_jsExternalStream" &
        " already exists, not redeclaring")
when not declared(jsOptionsStreamPurge):
  type
    jsOptionsStreamPurge* = jsOptionsStreamPurge_536871626
else:
  static :
    hint("Declaration of " & "jsOptionsStreamPurge" &
        " already exists, not redeclaring")
when not declared(struct_jsSubjectTransformConfig):
  type
    struct_jsSubjectTransformConfig* = struct_jsSubjectTransformConfig_536871476
else:
  static :
    hint("Declaration of " & "struct_jsSubjectTransformConfig" &
        " already exists, not redeclaring")
when not declared(struct_jsConsumerPauseResponse):
  type
    struct_jsConsumerPauseResponse* = struct_jsConsumerPauseResponse_536871568
else:
  static :
    hint("Declaration of " & "struct_jsConsumerPauseResponse" &
        " already exists, not redeclaring")
when not declared(jsTier):
  type
    jsTier* = jsTier_536871582
else:
  static :
    hint("Declaration of " & "jsTier" & " already exists, not redeclaring")
when not declared(jsSequenceInfo):
  type
    jsSequenceInfo* = jsSequenceInfo_536871550
else:
  static :
    hint("Declaration of " & "jsSequenceInfo" &
        " already exists, not redeclaring")
when not declared(struct_jsStreamAlternate):
  type
    struct_jsStreamAlternate* = struct_jsStreamAlternate_536871516
else:
  static :
    hint("Declaration of " & "struct_jsStreamAlternate" &
        " already exists, not redeclaring")
when not declared(struct_kvConfig):
  type
    struct_kvConfig* = struct_kvConfig_536871652
else:
  static :
    hint("Declaration of " & "struct_kvConfig" &
        " already exists, not redeclaring")
when not declared(microEndpoint):
  type
    microEndpoint* = microEndpoint_536871758
else:
  static :
    hint("Declaration of " & "microEndpoint" &
        " already exists, not redeclaring")
when not declared(microEndpointStats):
  type
    microEndpointStats* = microEndpointStats_536871768
else:
  static :
    hint("Declaration of " & "microEndpointStats" &
        " already exists, not redeclaring")
when not declared(jsPubAckErrHandler):
  type
    jsPubAckErrHandler* = jsPubAckErrHandler_536871600
else:
  static :
    hint("Declaration of " & "jsPubAckErrHandler" &
        " already exists, not redeclaring")
when not declared(jsAtomicBatchCtx):
  type
    jsAtomicBatchCtx* = jsAtomicBatchCtx_536871415
else:
  static :
    hint("Declaration of " & "jsAtomicBatchCtx" &
        " already exists, not redeclaring")
when not declared(struct_jsPubAck):
  type
    struct_jsPubAck* = struct_jsPubAck_536871592
else:
  static :
    hint("Declaration of " & "struct_jsPubAck" &
        " already exists, not redeclaring")
when not declared(kvWatcher):
  type
    kvWatcher* = kvWatcher_536871646
else:
  static :
    hint("Declaration of " & "kvWatcher" & " already exists, not redeclaring")
when not declared(microRequest):
  type
    microRequest* = microRequest_536871780
else:
  static :
    hint("Declaration of " & "microRequest" & " already exists, not redeclaring")
when not declared(natsEvLoop_WriteAddRemove):
  type
    natsEvLoop_WriteAddRemove* = natsEvLoop_WriteAddRemove_536871736
else:
  static :
    hint("Declaration of " & "natsEvLoop_WriteAddRemove" &
        " already exists, not redeclaring")
when not declared(struct_micro_service_stats_s):
  type
    struct_micro_service_stats_s* = struct_micro_service_stats_s_536871794
else:
  static :
    hint("Declaration of " & "struct_micro_service_stats_s" &
        " already exists, not redeclaring")
when not declared(jsStreamNamesList):
  type
    jsStreamNamesList* = jsStreamNamesList_536871530
else:
  static :
    hint("Declaration of " & "jsStreamNamesList" &
        " already exists, not redeclaring")
when not declared(struct_jsLostStreamData):
  type
    struct_jsLostStreamData* = struct_jsLostStreamData_536871488
else:
  static :
    hint("Declaration of " & "struct_jsLostStreamData" &
        " already exists, not redeclaring")
when not declared(jsMsgMetaData):
  type
    jsMsgMetaData* = jsMsgMetaData_536871590
else:
  static :
    hint("Declaration of " & "jsMsgMetaData" &
        " already exists, not redeclaring")
when not declared(struct_jsStreamNamesList):
  type
    struct_jsStreamNamesList* = struct_jsStreamNamesList_536871528
else:
  static :
    hint("Declaration of " & "struct_jsStreamNamesList" &
        " already exists, not redeclaring")
when not declared(struct_objStoreInfo):
  type
    struct_objStoreInfo* = struct_objStoreInfo_536871708
else:
  static :
    hint("Declaration of " & "struct_objStoreInfo" &
        " already exists, not redeclaring")
when not declared(natsOptions):
  type
    natsOptions* = natsOptions_536871393
else:
  static :
    hint("Declaration of " & "natsOptions" & " already exists, not redeclaring")
when not declared(struct_jsPriorityGroupState):
  type
    struct_jsPriorityGroupState* = struct_jsPriorityGroupState_536871552
else:
  static :
    hint("Declaration of " & "struct_jsPriorityGroupState" &
        " already exists, not redeclaring")
when not declared(natsEvLoop_ReadAddRemove):
  type
    natsEvLoop_ReadAddRemove* = natsEvLoop_ReadAddRemove_536871734
else:
  static :
    hint("Declaration of " & "natsEvLoop_ReadAddRemove" &
        " already exists, not redeclaring")
when not declared(struct_objStoreStatus):
  type
    struct_objStoreStatus* = struct_objStoreStatus_536871688
else:
  static :
    hint("Declaration of " & "struct_objStoreStatus" &
        " already exists, not redeclaring")
when not declared(struct_jsSubOptions):
  type
    struct_jsSubOptions* = struct_jsSubOptions_536871540
else:
  static :
    hint("Declaration of " & "struct_jsSubOptions" &
        " already exists, not redeclaring")
when not declared(jsStorageCompression):
  type
    jsStorageCompression* = jsStorageCompression_536871435
else:
  static :
    hint("Declaration of " & "jsStorageCompression" &
        " already exists, not redeclaring")
when not declared(jsAccountInfo):
  type
    jsAccountInfo* = jsAccountInfo_536871586
else:
  static :
    hint("Declaration of " & "jsAccountInfo" &
        " already exists, not redeclaring")
when not declared(objStoreStatus):
  type
    objStoreStatus* = objStoreStatus_536871690
else:
  static :
    hint("Declaration of " & "objStoreStatus" &
        " already exists, not redeclaring")
when not declared(natsEvLoop_Detach):
  type
    natsEvLoop_Detach* = natsEvLoop_Detach_536871738
else:
  static :
    hint("Declaration of " & "natsEvLoop_Detach" &
        " already exists, not redeclaring")
when not declared(struct_objStoreWatchOptions):
  type
    struct_objStoreWatchOptions* = struct_objStoreWatchOptions_536871720
else:
  static :
    hint("Declaration of " & "struct_objStoreWatchOptions" &
        " already exists, not redeclaring")
when not declared(struct_jsPlacement):
  type
    struct_jsPlacement* = struct_jsPlacement_536871460
else:
  static :
    hint("Declaration of " & "struct_jsPlacement" &
        " already exists, not redeclaring")
when not declared(kvOperation):
  type
    kvOperation* = kvOperation_536871650
else:
  static :
    hint("Declaration of " & "kvOperation" & " already exists, not redeclaring")
when not declared(struct_objStoreConfig):
  type
    struct_objStoreConfig* = struct_objStoreConfig_536871680
else:
  static :
    hint("Declaration of " & "struct_objStoreConfig" &
        " already exists, not redeclaring")
when not declared(natsConnection):
  type
    natsConnection* = natsConnection_536871385
else:
  static :
    hint("Declaration of " & "natsConnection" &
        " already exists, not redeclaring")
when not declared(jsStreamStateSubject):
  type
    jsStreamStateSubject* = jsStreamStateSubject_536871494
else:
  static :
    hint("Declaration of " & "jsStreamStateSubject" &
        " already exists, not redeclaring")
when not declared(struct_objStoreNamesList):
  type
    struct_objStoreNamesList* = struct_objStoreNamesList_536871684
else:
  static :
    hint("Declaration of " & "struct_objStoreNamesList" &
        " already exists, not redeclaring")
when not declared(jsAccountLimits):
  type
    jsAccountLimits* = jsAccountLimits_536871578
else:
  static :
    hint("Declaration of " & "jsAccountLimits" &
        " already exists, not redeclaring")
when not declared(jsPersistModeType):
  type
    jsPersistModeType* = jsPersistModeType_536871458
else:
  static :
    hint("Declaration of " & "jsPersistModeType" &
        " already exists, not redeclaring")
when not declared(jsRePublish):
  type
    jsRePublish* = jsRePublish_536871474
else:
  static :
    hint("Declaration of " & "jsRePublish" & " already exists, not redeclaring")
when not declared(natsMetadata):
  type
    natsMetadata* = natsMetadata_536871411
else:
  static :
    hint("Declaration of " & "natsMetadata" & " already exists, not redeclaring")
when not declared(struct_jsClusterInfo):
  type
    struct_jsClusterInfo* = struct_jsClusterInfo_536871508
else:
  static :
    hint("Declaration of " & "struct_jsClusterInfo" &
        " already exists, not redeclaring")
when not declared(compiler_off_t):
  type
    compiler_off_t* = compiler_off_t_536871807
else:
  static :
    hint("Declaration of " & "compiler_off_t" &
        " already exists, not redeclaring")
when not declared(struct_jsStreamSource):
  type
    struct_jsStreamSource* = struct_jsStreamSource_536871468
else:
  static :
    hint("Declaration of " & "struct_jsStreamSource" &
        " already exists, not redeclaring")
when not declared(microClient):
  type
    microClient* = microClient_536871754
else:
  static :
    hint("Declaration of " & "microClient" & " already exists, not redeclaring")
when not declared(microGroup):
  type
    microGroup* = microGroup_536871774
else:
  static :
    hint("Declaration of " & "microGroup" & " already exists, not redeclaring")
when not declared(struct_micro_group_config_s):
  type
    struct_micro_group_config_s* = struct_micro_group_config_s_536871778
else:
  static :
    hint("Declaration of " & "struct_micro_group_config_s" &
        " already exists, not redeclaring")
when not declared(enum_jsRetentionPolicy):
  type
    enum_jsRetentionPolicy* = enum_jsRetentionPolicy_536871421
else:
  static :
    hint("Declaration of " & "enum_jsRetentionPolicy" &
        " already exists, not redeclaring")
when not declared(struct_jsMsgMetaData):
  type
    struct_jsMsgMetaData* = struct_jsMsgMetaData_536871588
else:
  static :
    hint("Declaration of " & "struct_jsMsgMetaData" &
        " already exists, not redeclaring")
when not declared(jsPubOptions):
  type
    jsPubOptions* = jsPubOptions_536871419
else:
  static :
    hint("Declaration of " & "jsPubOptions" & " already exists, not redeclaring")
when not declared(jsPubAckErr):
  type
    jsPubAckErr* = jsPubAckErr_536871598
else:
  static :
    hint("Declaration of " & "jsPubAckErr" & " already exists, not redeclaring")
when not declared(microClientConfig):
  type
    microClientConfig* = microClientConfig_536871756
else:
  static :
    hint("Declaration of " & "microClientConfig" &
        " already exists, not redeclaring")
when not declared(kvStatus):
  type
    kvStatus* = kvStatus_536871644
else:
  static :
    hint("Declaration of " & "kvStatus" & " already exists, not redeclaring")
when not declared(jsAPIStats):
  type
    jsAPIStats* = jsAPIStats_536871574
else:
  static :
    hint("Declaration of " & "jsAPIStats" & " already exists, not redeclaring")
when not declared(jsCtx):
  type
    jsCtx* = jsCtx_536871413
else:
  static :
    hint("Declaration of " & "jsCtx" & " already exists, not redeclaring")
when not declared(jsStreamConfig):
  type
    jsStreamConfig* = jsStreamConfig_536871486
else:
  static :
    hint("Declaration of " & "jsStreamConfig" &
        " already exists, not redeclaring")
when not declared(jsStreamStateSubjects):
  type
    jsStreamStateSubjects* = jsStreamStateSubjects_536871498
else:
  static :
    hint("Declaration of " & "jsStreamStateSubjects" &
        " already exists, not redeclaring")
when not declared(microEndpointInfo):
  type
    microEndpointInfo* = microEndpointInfo_536871764
else:
  static :
    hint("Declaration of " & "microEndpointInfo" &
        " already exists, not redeclaring")
when not declared(enum_jsReplayPolicy):
  type
    enum_jsReplayPolicy* = enum_jsReplayPolicy_536871452
else:
  static :
    hint("Declaration of " & "enum_jsReplayPolicy" &
        " already exists, not redeclaring")
when not declared(struct_jsStreamStateSubject):
  type
    struct_jsStreamStateSubject* = struct_jsStreamStateSubject_536871492
else:
  static :
    hint("Declaration of " & "struct_jsStreamStateSubject" &
        " already exists, not redeclaring")
when not declared(jsPlacement):
  type
    jsPlacement* = jsPlacement_536871462
else:
  static :
    hint("Declaration of " & "jsPlacement" & " already exists, not redeclaring")
when not declared(jsRetentionPolicy):
  type
    jsRetentionPolicy* = jsRetentionPolicy_536871423
else:
  static :
    hint("Declaration of " & "jsRetentionPolicy" &
        " already exists, not redeclaring")
when not declared(kvConfig):
  type
    kvConfig* = kvConfig_536871654
else:
  static :
    hint("Declaration of " & "kvConfig" & " already exists, not redeclaring")
when not declared(objStoreOptions):
  type
    objStoreOptions* = objStoreOptions_536871718
else:
  static :
    hint("Declaration of " & "objStoreOptions" &
        " already exists, not redeclaring")
when not declared(microEndpointConfig):
  type
    microEndpointConfig* = microEndpointConfig_536871760
else:
  static :
    hint("Declaration of " & "microEndpointConfig" &
        " already exists, not redeclaring")
when not declared(struct_natsClientConfig):
  type
    struct_natsClientConfig* = struct_natsClientConfig_536871401
else:
  static :
    hint("Declaration of " & "struct_natsClientConfig" &
        " already exists, not redeclaring")
when not declared(struct_jsOptionsStream):
  type
    struct_jsOptionsStream* = struct_jsOptionsStream_536871632
else:
  static :
    hint("Declaration of " & "struct_jsOptionsStream" &
        " already exists, not redeclaring")
when not declared(struct_jsStreamInfoList):
  type
    struct_jsStreamInfoList* = struct_jsStreamInfoList_536871524
else:
  static :
    hint("Declaration of " & "struct_jsStreamInfoList" &
        " already exists, not redeclaring")
when not declared(jsOptionsStream):
  type
    jsOptionsStream* = jsOptionsStream_536871634
else:
  static :
    hint("Declaration of " & "jsOptionsStream" &
        " already exists, not redeclaring")
when not declared(struct_jsPubAckErr):
  type
    struct_jsPubAckErr* = struct_jsPubAckErr_536871596
else:
  static :
    hint("Declaration of " & "struct_jsPubAckErr" &
        " already exists, not redeclaring")
when not declared(microService):
  type
    microService* = microService_536871782
else:
  static :
    hint("Declaration of " & "microService" & " already exists, not redeclaring")
when not declared(struct_objStoreOptions):
  type
    struct_objStoreOptions* = struct_objStoreOptions_536871716
else:
  static :
    hint("Declaration of " & "struct_objStoreOptions" &
        " already exists, not redeclaring")
when not declared(natsSubscription):
  type
    natsSubscription* = natsSubscription_536871389
else:
  static :
    hint("Declaration of " & "natsSubscription" &
        " already exists, not redeclaring")
when not declared(natsErrHandler):
  type
    natsErrHandler* = natsErrHandler_536871730
else:
  static :
    hint("Declaration of " & "natsErrHandler" &
        " already exists, not redeclaring")
when not declared(jsStreamInfo):
  type
    jsStreamInfo* = jsStreamInfo_536871522
else:
  static :
    hint("Declaration of " & "jsStreamInfo" & " already exists, not redeclaring")
when not declared(struct_natsMsgList):
  type
    struct_natsMsgList* = struct_natsMsgList_536871405
else:
  static :
    hint("Declaration of " & "struct_natsMsgList" &
        " already exists, not redeclaring")
when not declared(jsConsumerConfig):
  type
    jsConsumerConfig* = jsConsumerConfig_536871534
else:
  static :
    hint("Declaration of " & "jsConsumerConfig" &
        " already exists, not redeclaring")
when not declared(struct_objStoreLink):
  type
    struct_objStoreLink* = struct_objStoreLink_536871696
else:
  static :
    hint("Declaration of " & "struct_objStoreLink" &
        " already exists, not redeclaring")
when not declared(struct_micro_service_info_s):
  type
    struct_micro_service_info_s* = struct_micro_service_info_s_536871790
else:
  static :
    hint("Declaration of " & "struct_micro_service_info_s" &
        " already exists, not redeclaring")
when not declared(jsFetchCompleteHandler):
  type
    jsFetchCompleteHandler* = jsFetchCompleteHandler_536871612
else:
  static :
    hint("Declaration of " & "jsFetchCompleteHandler" &
        " already exists, not redeclaring")
when not declared(struct_jsPeerInfo):
  type
    struct_jsPeerInfo* = struct_jsPeerInfo_536871504
else:
  static :
    hint("Declaration of " & "struct_jsPeerInfo" &
        " already exists, not redeclaring")
when not declared(jsStreamAlternate):
  type
    jsStreamAlternate* = jsStreamAlternate_536871518
else:
  static :
    hint("Declaration of " & "jsStreamAlternate" &
        " already exists, not redeclaring")
when not declared(microError):
  type
    microError* = microError_536871772
else:
  static :
    hint("Declaration of " & "microError" & " already exists, not redeclaring")
when not declared(jsStreamSourceInfo):
  type
    jsStreamSourceInfo* = jsStreamSourceInfo_536871514
else:
  static :
    hint("Declaration of " & "jsStreamSourceInfo" &
        " already exists, not redeclaring")
when not declared(struct_jsDirectGetMsgOptions):
  type
    struct_jsDirectGetMsgOptions* = struct_jsDirectGetMsgOptions_536871604
else:
  static :
    hint("Declaration of " & "struct_jsDirectGetMsgOptions" &
        " already exists, not redeclaring")
when not declared(struct_jsOptions):
  type
    struct_jsOptions* = struct_jsOptions_536871636
else:
  static :
    hint("Declaration of " & "struct_jsOptions" &
        " already exists, not redeclaring")
when not declared(struct_micro_endpoint_config_s):
  type
    struct_micro_endpoint_config_s* = struct_micro_endpoint_config_s_536871762
else:
  static :
    hint("Declaration of " & "struct_micro_endpoint_config_s" &
        " already exists, not redeclaring")
when not declared(microGroupConfig):
  type
    microGroupConfig* = microGroupConfig_536871776
else:
  static :
    hint("Declaration of " & "microGroupConfig" &
        " already exists, not redeclaring")
when not declared(NATS_VERSION_MAJOR):
  when 3 is static:
    const
      NATS_VERSION_MAJOR* = 3 ## Generated based on /app/vendor/cnats/src/version.h:24:9
  else:
    let NATS_VERSION_MAJOR* = 3 ## Generated based on /app/vendor/cnats/src/version.h:24:9
else:
  static :
    hint("Declaration of " & "NATS_VERSION_MAJOR" &
        " already exists, not redeclaring")
when not declared(NATS_VERSION_MINOR):
  when 13 is static:
    const
      NATS_VERSION_MINOR* = 13 ## Generated based on /app/vendor/cnats/src/version.h:25:9
  else:
    let NATS_VERSION_MINOR* = 13 ## Generated based on /app/vendor/cnats/src/version.h:25:9
else:
  static :
    hint("Declaration of " & "NATS_VERSION_MINOR" &
        " already exists, not redeclaring")
when not declared(NATS_VERSION_PATCH):
  when 0 is static:
    const
      NATS_VERSION_PATCH* = 0 ## Generated based on /app/vendor/cnats/src/version.h:26:9
  else:
    let NATS_VERSION_PATCH* = 0 ## Generated based on /app/vendor/cnats/src/version.h:26:9
else:
  static :
    hint("Declaration of " & "NATS_VERSION_PATCH" &
        " already exists, not redeclaring")
when not declared(NATS_VERSION_STRING):
  when "3.13.0-beta" is static:
    const
      NATS_VERSION_STRING* = "3.13.0-beta" ## Generated based on /app/vendor/cnats/src/version.h:28:9
  else:
    let NATS_VERSION_STRING* = "3.13.0-beta" ## Generated based on /app/vendor/cnats/src/version.h:28:9
else:
  static :
    hint("Declaration of " & "NATS_VERSION_STRING" &
        " already exists, not redeclaring")
when not declared(NATS_VERSION_REQUIRED_NUMBER):
  when 199424 is static:
    const
      NATS_VERSION_REQUIRED_NUMBER* = 199424 ## Generated based on /app/vendor/cnats/src/version.h:34:9
  else:
    let NATS_VERSION_REQUIRED_NUMBER* = 199424 ## Generated based on /app/vendor/cnats/src/version.h:34:9
else:
  static :
    hint("Declaration of " & "NATS_VERSION_REQUIRED_NUMBER" &
        " already exists, not redeclaring")
when not declared(NATS_DEFAULT_URL):
  when "nats://localhost:4222" is static:
    const
      NATS_DEFAULT_URL* = "nats://localhost:4222" ## Generated based on /app/vendor/cnats/src/nats.h:86:9
  else:
    let NATS_DEFAULT_URL* = "nats://localhost:4222" ## Generated based on /app/vendor/cnats/src/nats.h:86:9
else:
  static :
    hint("Declaration of " & "NATS_DEFAULT_URL" &
        " already exists, not redeclaring")
when not declared(JSMsgSize):
  when "Nats-Msg-Size" is static:
    const
      JSMsgSize* = "Nats-Msg-Size" ## Generated based on /app/vendor/cnats/src/nats.h:97:10
  else:
    let JSMsgSize* = "Nats-Msg-Size" ## Generated based on /app/vendor/cnats/src/nats.h:97:10
else:
  static :
    hint("Declaration of " & "JSMsgSize" & " already exists, not redeclaring")
when not declared(JSMsgRollup):
  when "Nats-Rollup" is static:
    const
      JSMsgRollup* = "Nats-Rollup" ## Generated based on /app/vendor/cnats/src/nats.h:111:10
  else:
    let JSMsgRollup* = "Nats-Rollup" ## Generated based on /app/vendor/cnats/src/nats.h:111:10
else:
  static :
    hint("Declaration of " & "JSMsgRollup" & " already exists, not redeclaring")
when not declared(JSMsgRollupSubject):
  when "sub" is static:
    const
      JSMsgRollupSubject* = "sub" ## Generated based on /app/vendor/cnats/src/nats.h:120:10
  else:
    let JSMsgRollupSubject* = "sub" ## Generated based on /app/vendor/cnats/src/nats.h:120:10
else:
  static :
    hint("Declaration of " & "JSMsgRollupSubject" &
        " already exists, not redeclaring")
when not declared(JSMsgRollupAll):
  when "all" is static:
    const
      JSMsgRollupAll* = "all" ## Generated based on /app/vendor/cnats/src/nats.h:129:10
  else:
    let JSMsgRollupAll* = "all" ## Generated based on /app/vendor/cnats/src/nats.h:129:10
else:
  static :
    hint("Declaration of " & "JSMsgRollupAll" &
        " already exists, not redeclaring")
when not declared(JSStream):
  when "Nats-Stream" is static:
    const
      JSStream* = "Nats-Stream" ## Generated based on /app/vendor/cnats/src/nats.h:132:10
  else:
    let JSStream* = "Nats-Stream" ## Generated based on /app/vendor/cnats/src/nats.h:132:10
else:
  static :
    hint("Declaration of " & "JSStream" & " already exists, not redeclaring")
when not declared(JSSequence):
  when "Nats-Sequence" is static:
    const
      JSSequence* = "Nats-Sequence" ## Generated based on /app/vendor/cnats/src/nats.h:133:10
  else:
    let JSSequence* = "Nats-Sequence" ## Generated based on /app/vendor/cnats/src/nats.h:133:10
else:
  static :
    hint("Declaration of " & "JSSequence" & " already exists, not redeclaring")
when not declared(JSLastSequence):
  when "Nats-Last-Sequence" is static:
    const
      JSLastSequence* = "Nats-Last-Sequence" ## Generated based on /app/vendor/cnats/src/nats.h:134:10
  else:
    let JSLastSequence* = "Nats-Last-Sequence" ## Generated based on /app/vendor/cnats/src/nats.h:134:10
else:
  static :
    hint("Declaration of " & "JSLastSequence" &
        " already exists, not redeclaring")
when not declared(JSTimeStamp):
  when "Nats-Time-Stamp" is static:
    const
      JSTimeStamp* = "Nats-Time-Stamp" ## Generated based on /app/vendor/cnats/src/nats.h:135:10
  else:
    let JSTimeStamp* = "Nats-Time-Stamp" ## Generated based on /app/vendor/cnats/src/nats.h:135:10
else:
  static :
    hint("Declaration of " & "JSTimeStamp" & " already exists, not redeclaring")
when not declared(JSSubject):
  when "Nats-Subject" is static:
    const
      JSSubject* = "Nats-Subject" ## Generated based on /app/vendor/cnats/src/nats.h:136:10
  else:
    let JSSubject* = "Nats-Subject" ## Generated based on /app/vendor/cnats/src/nats.h:136:10
else:
  static :
    hint("Declaration of " & "JSSubject" & " already exists, not redeclaring")
when not declared(MICRO_API_PREFIX):
  when "$SRV" is static:
    const
      MICRO_API_PREFIX* = "$SRV" ## Generated based on /app/vendor/cnats/src/nats.h:10215:9
  else:
    let MICRO_API_PREFIX* = "$SRV" ## Generated based on /app/vendor/cnats/src/nats.h:10215:9
else:
  static :
    hint("Declaration of " & "MICRO_API_PREFIX" &
        " already exists, not redeclaring")
when not declared(MICRO_INFO_RESPONSE_TYPE):
  when "io.nats.micro.v1.info_response" is static:
    const
      MICRO_INFO_RESPONSE_TYPE* = "io.nats.micro.v1.info_response" ## Generated based on /app/vendor/cnats/src/nats.h:10220:9
  else:
    let MICRO_INFO_RESPONSE_TYPE* = "io.nats.micro.v1.info_response" ## Generated based on /app/vendor/cnats/src/nats.h:10220:9
else:
  static :
    hint("Declaration of " & "MICRO_INFO_RESPONSE_TYPE" &
        " already exists, not redeclaring")
when not declared(MICRO_INFO_VERB):
  when "INFO" is static:
    const
      MICRO_INFO_VERB* = "INFO" ## Generated based on /app/vendor/cnats/src/nats.h:10225:9
  else:
    let MICRO_INFO_VERB* = "INFO" ## Generated based on /app/vendor/cnats/src/nats.h:10225:9
else:
  static :
    hint("Declaration of " & "MICRO_INFO_VERB" &
        " already exists, not redeclaring")
when not declared(MICRO_PING_RESPONSE_TYPE):
  when "io.nats.micro.v1.ping_response" is static:
    const
      MICRO_PING_RESPONSE_TYPE* = "io.nats.micro.v1.ping_response" ## Generated based on /app/vendor/cnats/src/nats.h:10230:9
  else:
    let MICRO_PING_RESPONSE_TYPE* = "io.nats.micro.v1.ping_response" ## Generated based on /app/vendor/cnats/src/nats.h:10230:9
else:
  static :
    hint("Declaration of " & "MICRO_PING_RESPONSE_TYPE" &
        " already exists, not redeclaring")
when not declared(MICRO_PING_VERB):
  when "PING" is static:
    const
      MICRO_PING_VERB* = "PING" ## Generated based on /app/vendor/cnats/src/nats.h:10235:9
  else:
    let MICRO_PING_VERB* = "PING" ## Generated based on /app/vendor/cnats/src/nats.h:10235:9
else:
  static :
    hint("Declaration of " & "MICRO_PING_VERB" &
        " already exists, not redeclaring")
when not declared(MICRO_STATS_RESPONSE_TYPE):
  when "io.nats.micro.v1.stats_response" is static:
    const
      MICRO_STATS_RESPONSE_TYPE* = "io.nats.micro.v1.stats_response" ## Generated based on /app/vendor/cnats/src/nats.h:10240:9
  else:
    let MICRO_STATS_RESPONSE_TYPE* = "io.nats.micro.v1.stats_response" ## Generated based on /app/vendor/cnats/src/nats.h:10240:9
else:
  static :
    hint("Declaration of " & "MICRO_STATS_RESPONSE_TYPE" &
        " already exists, not redeclaring")
when not declared(MICRO_STATS_VERB):
  when "STATS" is static:
    const
      MICRO_STATS_VERB* = "STATS" ## Generated based on /app/vendor/cnats/src/nats.h:10245:9
  else:
    let MICRO_STATS_VERB* = "STATS" ## Generated based on /app/vendor/cnats/src/nats.h:10245:9
else:
  static :
    hint("Declaration of " & "MICRO_STATS_VERB" &
        " already exists, not redeclaring")
when not declared(MICRO_STATUS_HDR):
  when "Nats-Status" is static:
    const
      MICRO_STATUS_HDR* = "Nats-Status" ## Generated based on /app/vendor/cnats/src/nats.h:10251:9
  else:
    let MICRO_STATUS_HDR* = "Nats-Status" ## Generated based on /app/vendor/cnats/src/nats.h:10251:9
else:
  static :
    hint("Declaration of " & "MICRO_STATUS_HDR" &
        " already exists, not redeclaring")
when not declared(MICRO_ERROR_HDR):
  when "Nats-Service-Error" is static:
    const
      MICRO_ERROR_HDR* = "Nats-Service-Error" ## Generated based on /app/vendor/cnats/src/nats.h:10257:9
  else:
    let MICRO_ERROR_HDR* = "Nats-Service-Error" ## Generated based on /app/vendor/cnats/src/nats.h:10257:9
else:
  static :
    hint("Declaration of " & "MICRO_ERROR_HDR" &
        " already exists, not redeclaring")
when not declared(MICRO_ERROR_CODE_HDR):
  when "Nats-Service-Error-Code" is static:
    const
      MICRO_ERROR_CODE_HDR* = "Nats-Service-Error-Code" ## Generated based on /app/vendor/cnats/src/nats.h:10263:9
  else:
    let MICRO_ERROR_CODE_HDR* = "Nats-Service-Error-Code" ## Generated based on /app/vendor/cnats/src/nats.h:10263:9
else:
  static :
    hint("Declaration of " & "MICRO_ERROR_CODE_HDR" &
        " already exists, not redeclaring")
when not declared(nats_OpenWithConfig):
  proc nats_OpenWithConfig*(config: ptr natsClientConfig_536871404): natsStatus_536871378 {.
      cdecl, importc: "nats_OpenWithConfig".}
else:
  static :
    hint("Declaration of " & "nats_OpenWithConfig" &
        " already exists, not redeclaring")
when not declared(nats_Open):
  proc nats_Open*(lockSpinCount: int64): natsStatus_536871378 {.cdecl,
      importc: "nats_Open".}
else:
  static :
    hint("Declaration of " & "nats_Open" & " already exists, not redeclaring")
when not declared(nats_GetVersion):
  proc nats_GetVersion*(): ptr uint8 {.cdecl, importc: "nats_GetVersion".}
else:
  static :
    hint("Declaration of " & "nats_GetVersion" &
        " already exists, not redeclaring")
when not declared(nats_GetVersionNumber):
  proc nats_GetVersionNumber*(): uint32 {.cdecl,
      importc: "nats_GetVersionNumber".}
else:
  static :
    hint("Declaration of " & "nats_GetVersionNumber" &
        " already exists, not redeclaring")
when not declared(nats_CheckCompatibilityImpl):
  proc nats_CheckCompatibilityImpl*(reqVerNumber: uint32; verNumber: uint32;
                                    verString: ptr uint8): bool {.cdecl,
      importc: "nats_CheckCompatibilityImpl".}
else:
  static :
    hint("Declaration of " & "nats_CheckCompatibilityImpl" &
        " already exists, not redeclaring")
when not declared(nats_Now):
  proc nats_Now*(): int64 {.cdecl, importc: "nats_Now".}
else:
  static :
    hint("Declaration of " & "nats_Now" & " already exists, not redeclaring")
when not declared(nats_NowInNanoSeconds):
  proc nats_NowInNanoSeconds*(): int64 {.cdecl, importc: "nats_NowInNanoSeconds".}
else:
  static :
    hint("Declaration of " & "nats_NowInNanoSeconds" &
        " already exists, not redeclaring")
when not declared(nats_NowMonotonicInNanoSeconds):
  proc nats_NowMonotonicInNanoSeconds*(): int64 {.cdecl,
      importc: "nats_NowMonotonicInNanoSeconds".}
else:
  static :
    hint("Declaration of " & "nats_NowMonotonicInNanoSeconds" &
        " already exists, not redeclaring")
when not declared(nats_Sleep):
  proc nats_Sleep*(sleepTime: int64): void {.cdecl, importc: "nats_Sleep".}
else:
  static :
    hint("Declaration of " & "nats_Sleep" & " already exists, not redeclaring")
when not declared(nats_GetLastError):
  proc nats_GetLastError*(status: ptr natsStatus_536871378): ptr uint8 {.cdecl,
      importc: "nats_GetLastError".}
else:
  static :
    hint("Declaration of " & "nats_GetLastError" &
        " already exists, not redeclaring")
when not declared(nats_GetLastErrorStack):
  proc nats_GetLastErrorStack*(buffer: ptr uint8; bufLen: csize_t): natsStatus_536871378 {.
      cdecl, importc: "nats_GetLastErrorStack".}
else:
  static :
    hint("Declaration of " & "nats_GetLastErrorStack" &
        " already exists, not redeclaring")
when not declared(nats_PrintLastErrorStack):
  proc nats_PrintLastErrorStack*(file: ptr FILE_536871753): void {.cdecl,
      importc: "nats_PrintLastErrorStack".}
else:
  static :
    hint("Declaration of " & "nats_PrintLastErrorStack" &
        " already exists, not redeclaring")
when not declared(nats_SetMessageDeliveryPoolSize):
  proc nats_SetMessageDeliveryPoolSize*(max: cint): natsStatus_536871378 {.
      cdecl, importc: "nats_SetMessageDeliveryPoolSize".}
else:
  static :
    hint("Declaration of " & "nats_SetMessageDeliveryPoolSize" &
        " already exists, not redeclaring")
when not declared(nats_ReleaseThreadMemory):
  proc nats_ReleaseThreadMemory*(): void {.cdecl,
      importc: "nats_ReleaseThreadMemory".}
else:
  static :
    hint("Declaration of " & "nats_ReleaseThreadMemory" &
        " already exists, not redeclaring")
when not declared(nats_Sign):
  proc nats_Sign*(encodedSeed: ptr uint8; input: ptr uint8;
                  signature: ptr ptr uint8; signatureLength: ptr cint): natsStatus_536871378 {.
      cdecl, importc: "nats_Sign".}
else:
  static :
    hint("Declaration of " & "nats_Sign" & " already exists, not redeclaring")
when not declared(nats_Close):
  proc nats_Close*(): void {.cdecl, importc: "nats_Close".}
else:
  static :
    hint("Declaration of " & "nats_Close" & " already exists, not redeclaring")
when not declared(nats_CloseAndWait):
  proc nats_CloseAndWait*(timeout: int64): natsStatus_536871378 {.cdecl,
      importc: "nats_CloseAndWait".}
else:
  static :
    hint("Declaration of " & "nats_CloseAndWait" &
        " already exists, not redeclaring")
when not declared(natsStatus_GetText):
  proc natsStatus_GetText*(s: natsStatus_536871378): ptr uint8 {.cdecl,
      importc: "natsStatus_GetText".}
else:
  static :
    hint("Declaration of " & "natsStatus_GetText" &
        " already exists, not redeclaring")
when not declared(natsStatistics_Create):
  proc natsStatistics_Create*(newStats: ptr ptr natsStatistics_536871388): natsStatus_536871378 {.
      cdecl, importc: "natsStatistics_Create".}
else:
  static :
    hint("Declaration of " & "natsStatistics_Create" &
        " already exists, not redeclaring")
when not declared(natsStatistics_GetCounts):
  proc natsStatistics_GetCounts*(stats: ptr natsStatistics_536871388;
                                 inMsgs: ptr uint64; inBytes: ptr uint64;
                                 outMsgs: ptr uint64; outBytes: ptr uint64;
                                 reconnects: ptr uint64): natsStatus_536871378 {.
      cdecl, importc: "natsStatistics_GetCounts".}
else:
  static :
    hint("Declaration of " & "natsStatistics_GetCounts" &
        " already exists, not redeclaring")
when not declared(natsStatistics_Destroy):
  proc natsStatistics_Destroy*(stats: ptr natsStatistics_536871388): void {.
      cdecl, importc: "natsStatistics_Destroy".}
else:
  static :
    hint("Declaration of " & "natsStatistics_Destroy" &
        " already exists, not redeclaring")
when not declared(natsOptions_Create):
  proc natsOptions_Create*(newOpts: ptr ptr natsOptions_536871394): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_Create".}
else:
  static :
    hint("Declaration of " & "natsOptions_Create" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetURL):
  proc natsOptions_SetURL*(opts: ptr natsOptions_536871394; url: ptr uint8): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetURL".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetURL" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetServers):
  proc natsOptions_SetServers*(opts: ptr natsOptions_536871394;
                               servers: ptr ptr uint8; serversCount: cint): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetServers".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetServers" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetUserInfo):
  proc natsOptions_SetUserInfo*(opts: ptr natsOptions_536871394;
                                user: ptr uint8; password: ptr uint8): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetUserInfo".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetUserInfo" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetToken):
  proc natsOptions_SetToken*(opts: ptr natsOptions_536871394; token: ptr uint8): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetToken".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetToken" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetTokenHandler):
  proc natsOptions_SetTokenHandler*(opts: ptr natsOptions_536871394;
                                    tokenCb: natsTokenHandler_536871745;
                                    closure: pointer): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetTokenHandler".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetTokenHandler" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetNoRandomize):
  proc natsOptions_SetNoRandomize*(opts: ptr natsOptions_536871394;
                                   noRandomize: bool): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetNoRandomize".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetNoRandomize" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetTimeout):
  proc natsOptions_SetTimeout*(opts: ptr natsOptions_536871394; timeout: int64): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetTimeout".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetTimeout" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetName):
  proc natsOptions_SetName*(opts: ptr natsOptions_536871394; name: ptr uint8): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetName".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetName" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetSecure):
  proc natsOptions_SetSecure*(opts: ptr natsOptions_536871394; secure: bool): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetSecure".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetSecure" &
        " already exists, not redeclaring")
when not declared(natsOptions_TLSHandshakeFirst):
  proc natsOptions_TLSHandshakeFirst*(opts: ptr natsOptions_536871394): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_TLSHandshakeFirst".}
else:
  static :
    hint("Declaration of " & "natsOptions_TLSHandshakeFirst" &
        " already exists, not redeclaring")
when not declared(natsOptions_AllowConcurrentTLSHandshakes):
  proc natsOptions_AllowConcurrentTLSHandshakes*(opts: ptr natsOptions_536871394): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_AllowConcurrentTLSHandshakes".}
else:
  static :
    hint("Declaration of " & "natsOptions_AllowConcurrentTLSHandshakes" &
        " already exists, not redeclaring")
when not declared(natsOptions_LoadCATrustedCertificates):
  proc natsOptions_LoadCATrustedCertificates*(opts: ptr natsOptions_536871394;
      fileName: ptr uint8): natsStatus_536871378 {.cdecl,
      importc: "natsOptions_LoadCATrustedCertificates".}
else:
  static :
    hint("Declaration of " & "natsOptions_LoadCATrustedCertificates" &
        " already exists, not redeclaring")
when not declared(natsOptions_LoadCATrustedCertificatesPath):
  proc natsOptions_LoadCATrustedCertificatesPath*(opts: ptr natsOptions_536871394;
      path: ptr uint8): natsStatus_536871378 {.cdecl,
      importc: "natsOptions_LoadCATrustedCertificatesPath".}
else:
  static :
    hint("Declaration of " & "natsOptions_LoadCATrustedCertificatesPath" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetCATrustedCertificates):
  proc natsOptions_SetCATrustedCertificates*(opts: ptr natsOptions_536871394;
      certificates: ptr uint8): natsStatus_536871378 {.cdecl,
      importc: "natsOptions_SetCATrustedCertificates".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetCATrustedCertificates" &
        " already exists, not redeclaring")
when not declared(natsOptions_LoadCertificatesChain):
  proc natsOptions_LoadCertificatesChain*(opts: ptr natsOptions_536871394;
      certsFileName: ptr uint8; keyFileName: ptr uint8): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_LoadCertificatesChain".}
else:
  static :
    hint("Declaration of " & "natsOptions_LoadCertificatesChain" &
        " already exists, not redeclaring")
when not declared(natsOptions_LoadCertificatesChainDynamic):
  proc natsOptions_LoadCertificatesChainDynamic*(opts: ptr natsOptions_536871394;
      certsFileName: ptr uint8; keyFileName: ptr uint8): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_LoadCertificatesChainDynamic".}
else:
  static :
    hint("Declaration of " & "natsOptions_LoadCertificatesChainDynamic" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetCertificatesChain):
  proc natsOptions_SetCertificatesChain*(opts: ptr natsOptions_536871394;
      cert: ptr uint8; key: ptr uint8): natsStatus_536871378 {.cdecl,
      importc: "natsOptions_SetCertificatesChain".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetCertificatesChain" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetCiphers):
  proc natsOptions_SetCiphers*(opts: ptr natsOptions_536871394;
                               ciphers: ptr uint8): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetCiphers".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetCiphers" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetCipherSuites):
  proc natsOptions_SetCipherSuites*(opts: ptr natsOptions_536871394;
                                    ciphers: ptr uint8): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetCipherSuites".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetCipherSuites" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetExpectedHostname):
  proc natsOptions_SetExpectedHostname*(opts: ptr natsOptions_536871394;
                                        hostname: ptr uint8): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetExpectedHostname".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetExpectedHostname" &
        " already exists, not redeclaring")
when not declared(natsOptions_SkipServerVerification):
  proc natsOptions_SkipServerVerification*(opts: ptr natsOptions_536871394;
      skip: bool): natsStatus_536871378 {.cdecl,
      importc: "natsOptions_SkipServerVerification".}
else:
  static :
    hint("Declaration of " & "natsOptions_SkipServerVerification" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetSSLVerificationCallback):
  proc natsOptions_SetSSLVerificationCallback*(opts: ptr natsOptions_536871394;
      callback: natsSSLVerifyCb_536871751): natsStatus_536871378 {.cdecl,
      importc: "natsOptions_SetSSLVerificationCallback".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetSSLVerificationCallback" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetVerbose):
  proc natsOptions_SetVerbose*(opts: ptr natsOptions_536871394; verbose: bool): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetVerbose".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetVerbose" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetPedantic):
  proc natsOptions_SetPedantic*(opts: ptr natsOptions_536871394; pedantic: bool): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetPedantic".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetPedantic" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetPingInterval):
  proc natsOptions_SetPingInterval*(opts: ptr natsOptions_536871394;
                                    interval: int64): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetPingInterval".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetPingInterval" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetMaxPingsOut):
  proc natsOptions_SetMaxPingsOut*(opts: ptr natsOptions_536871394;
                                   maxPingsOut: cint): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetMaxPingsOut".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetMaxPingsOut" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetIgnoreAuthErrorAbort):
  proc natsOptions_SetIgnoreAuthErrorAbort*(opts: ptr natsOptions_536871394;
      ignore: bool): natsStatus_536871378 {.cdecl,
      importc: "natsOptions_SetIgnoreAuthErrorAbort".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetIgnoreAuthErrorAbort" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetIOBufSize):
  proc natsOptions_SetIOBufSize*(opts: ptr natsOptions_536871394;
                                 ioBufSize: cint): natsStatus_536871378 {.cdecl,
      importc: "natsOptions_SetIOBufSize".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetIOBufSize" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetAllowReconnect):
  proc natsOptions_SetAllowReconnect*(opts: ptr natsOptions_536871394;
                                      allow: bool): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetAllowReconnect".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetAllowReconnect" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetMaxReconnect):
  proc natsOptions_SetMaxReconnect*(opts: ptr natsOptions_536871394;
                                    maxReconnect: cint): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetMaxReconnect".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetMaxReconnect" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetReconnectWait):
  proc natsOptions_SetReconnectWait*(opts: ptr natsOptions_536871394;
                                     reconnectWait: int64): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetReconnectWait".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetReconnectWait" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetReconnectJitter):
  proc natsOptions_SetReconnectJitter*(opts: ptr natsOptions_536871394;
                                       jitter: int64; jitterTLS: int64): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetReconnectJitter".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetReconnectJitter" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetCustomReconnectDelay):
  proc natsOptions_SetCustomReconnectDelay*(opts: ptr natsOptions_536871394;
      cb: natsCustomReconnectDelayHandler_536871749; closure: pointer): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetCustomReconnectDelay".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetCustomReconnectDelay" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetReconnectBufSize):
  proc natsOptions_SetReconnectBufSize*(opts: ptr natsOptions_536871394;
                                        reconnectBufSize: cint): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetReconnectBufSize".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetReconnectBufSize" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetMaxPendingMsgs):
  proc natsOptions_SetMaxPendingMsgs*(opts: ptr natsOptions_536871394;
                                      maxPending: cint): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetMaxPendingMsgs".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetMaxPendingMsgs" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetMaxPendingBytes):
  proc natsOptions_SetMaxPendingBytes*(opts: ptr natsOptions_536871394;
                                       maxPending: int64): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetMaxPendingBytes".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetMaxPendingBytes" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetProxyConnHandler):
  proc natsOptions_SetProxyConnHandler*(opts: ptr natsOptions_536871394;
                                        proxyConnHandler: natsProxyConnHandler_536871729;
                                        closure: pointer): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetProxyConnHandler".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetProxyConnHandler" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetErrorHandler):
  proc natsOptions_SetErrorHandler*(opts: ptr natsOptions_536871394;
                                    errHandler: natsErrHandler_536871731;
                                    closure: pointer): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetErrorHandler".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetErrorHandler" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetClosedCB):
  proc natsOptions_SetClosedCB*(opts: ptr natsOptions_536871394;
                                closedCb: natsConnectionHandler_536871727;
                                closure: pointer): natsStatus_536871378 {.cdecl,
      importc: "natsOptions_SetClosedCB".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetClosedCB" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetDisconnectedCB):
  proc natsOptions_SetDisconnectedCB*(opts: ptr natsOptions_536871394;
                                      disconnectedCb: natsConnectionHandler_536871727;
                                      closure: pointer): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetDisconnectedCB".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetDisconnectedCB" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetReconnectedCB):
  proc natsOptions_SetReconnectedCB*(opts: ptr natsOptions_536871394;
                                     reconnectedCb: natsConnectionHandler_536871727;
                                     closure: pointer): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetReconnectedCB".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetReconnectedCB" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetDiscoveredServersCB):
  proc natsOptions_SetDiscoveredServersCB*(opts: ptr natsOptions_536871394;
      discoveredServersCb: natsConnectionHandler_536871727; closure: pointer): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetDiscoveredServersCB".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetDiscoveredServersCB" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetIgnoreDiscoveredServers):
  proc natsOptions_SetIgnoreDiscoveredServers*(opts: ptr natsOptions_536871394;
      ignore: bool): natsStatus_536871378 {.cdecl,
      importc: "natsOptions_SetIgnoreDiscoveredServers".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetIgnoreDiscoveredServers" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetLameDuckModeCB):
  proc natsOptions_SetLameDuckModeCB*(opts: ptr natsOptions_536871394;
                                      lameDuckCb: natsConnectionHandler_536871727;
                                      closure: pointer): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetLameDuckModeCB".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetLameDuckModeCB" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetEventLoop):
  proc natsOptions_SetEventLoop*(opts: ptr natsOptions_536871394; loop: pointer;
                                 attachCb: natsEvLoop_Attach_536871733;
                                 readCb: natsEvLoop_ReadAddRemove_536871735;
                                 writeCb: natsEvLoop_WriteAddRemove_536871737;
                                 detachCb: natsEvLoop_Detach_536871739): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetEventLoop".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetEventLoop" &
        " already exists, not redeclaring")
when not declared(natsOptions_UseGlobalMessageDelivery):
  proc natsOptions_UseGlobalMessageDelivery*(opts: ptr natsOptions_536871394;
      global: bool): natsStatus_536871378 {.cdecl,
      importc: "natsOptions_UseGlobalMessageDelivery".}
else:
  static :
    hint("Declaration of " & "natsOptions_UseGlobalMessageDelivery" &
        " already exists, not redeclaring")
when not declared(natsOptions_IPResolutionOrder):
  proc natsOptions_IPResolutionOrder*(opts: ptr natsOptions_536871394;
                                      order: cint): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_IPResolutionOrder".}
else:
  static :
    hint("Declaration of " & "natsOptions_IPResolutionOrder" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetSendAsap):
  proc natsOptions_SetSendAsap*(opts: ptr natsOptions_536871394; sendAsap: bool): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetSendAsap".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetSendAsap" &
        " already exists, not redeclaring")
when not declared(natsOptions_UseOldRequestStyle):
  proc natsOptions_UseOldRequestStyle*(opts: ptr natsOptions_536871394;
                                       useOldStyle: bool): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_UseOldRequestStyle".}
else:
  static :
    hint("Declaration of " & "natsOptions_UseOldRequestStyle" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetFailRequestsOnDisconnect):
  proc natsOptions_SetFailRequestsOnDisconnect*(opts: ptr natsOptions_536871394;
      failRequests: bool): natsStatus_536871378 {.cdecl,
      importc: "natsOptions_SetFailRequestsOnDisconnect".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetFailRequestsOnDisconnect" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetNoEcho):
  proc natsOptions_SetNoEcho*(opts: ptr natsOptions_536871394; noEcho: bool): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetNoEcho".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetNoEcho" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetRetryOnFailedConnect):
  proc natsOptions_SetRetryOnFailedConnect*(opts: ptr natsOptions_536871394;
      retry: bool; connectedCb: natsConnectionHandler_536871727;
      closure: pointer): natsStatus_536871378 {.cdecl,
      importc: "natsOptions_SetRetryOnFailedConnect".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetRetryOnFailedConnect" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetUserCredentialsCallbacks):
  proc natsOptions_SetUserCredentialsCallbacks*(opts: ptr natsOptions_536871394;
      ujwtCB: natsUserJWTHandler_536871741; ujwtClosure: pointer;
      sigCB: natsSignatureHandler_536871743; sigClosure: pointer): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetUserCredentialsCallbacks".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetUserCredentialsCallbacks" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetUserCredentialsFromFiles):
  proc natsOptions_SetUserCredentialsFromFiles*(opts: ptr natsOptions_536871394;
      userOrChainedFile: ptr uint8; seedFile: ptr uint8): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetUserCredentialsFromFiles".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetUserCredentialsFromFiles" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetUserCredentialsFromMemory):
  proc natsOptions_SetUserCredentialsFromMemory*(opts: ptr natsOptions_536871394;
      jwtAndSeedContent: ptr uint8): natsStatus_536871378 {.cdecl,
      importc: "natsOptions_SetUserCredentialsFromMemory".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetUserCredentialsFromMemory" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetNKey):
  proc natsOptions_SetNKey*(opts: ptr natsOptions_536871394; pubKey: ptr uint8;
                            sigCB: natsSignatureHandler_536871743;
                            sigClosure: pointer): natsStatus_536871378 {.cdecl,
      importc: "natsOptions_SetNKey".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetNKey" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetNKeyFromSeed):
  proc natsOptions_SetNKeyFromSeed*(opts: ptr natsOptions_536871394;
                                    pubKey: ptr uint8; seedFile: ptr uint8): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetNKeyFromSeed".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetNKeyFromSeed" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetWriteDeadline):
  proc natsOptions_SetWriteDeadline*(opts: ptr natsOptions_536871394;
                                     deadline: int64): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_SetWriteDeadline".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetWriteDeadline" &
        " already exists, not redeclaring")
when not declared(natsOptions_DisableNoResponders):
  proc natsOptions_DisableNoResponders*(opts: ptr natsOptions_536871394;
                                        disabled: bool): natsStatus_536871378 {.
      cdecl, importc: "natsOptions_DisableNoResponders".}
else:
  static :
    hint("Declaration of " & "natsOptions_DisableNoResponders" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetCustomInboxPrefix):
  proc natsOptions_SetCustomInboxPrefix*(opts: ptr natsOptions_536871394;
      inboxPrefix: ptr uint8): natsStatus_536871378 {.cdecl,
      importc: "natsOptions_SetCustomInboxPrefix".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetCustomInboxPrefix" &
        " already exists, not redeclaring")
when not declared(natsOptions_SetMessageBufferPadding):
  proc natsOptions_SetMessageBufferPadding*(opts: ptr natsOptions_536871394;
      paddingSize: cint): natsStatus_536871378 {.cdecl,
      importc: "natsOptions_SetMessageBufferPadding".}
else:
  static :
    hint("Declaration of " & "natsOptions_SetMessageBufferPadding" &
        " already exists, not redeclaring")
when not declared(natsOptions_Destroy):
  proc natsOptions_Destroy*(opts: ptr natsOptions_536871394): void {.cdecl,
      importc: "natsOptions_Destroy".}
else:
  static :
    hint("Declaration of " & "natsOptions_Destroy" &
        " already exists, not redeclaring")
when not declared(natsInbox_Create):
  proc natsInbox_Create*(newInbox: ptr ptr natsInbox_536871396): natsStatus_536871378 {.
      cdecl, importc: "natsInbox_Create".}
else:
  static :
    hint("Declaration of " & "natsInbox_Create" &
        " already exists, not redeclaring")
when not declared(natsInbox_Destroy):
  proc natsInbox_Destroy*(inbox: ptr natsInbox_536871396): void {.cdecl,
      importc: "natsInbox_Destroy".}
else:
  static :
    hint("Declaration of " & "natsInbox_Destroy" &
        " already exists, not redeclaring")
when not declared(natsHeader_New):
  proc natsHeader_New*(new_header: ptr ptr natsHeader_536871398): natsStatus_536871378 {.
      cdecl, importc: "natsHeader_New".}
else:
  static :
    hint("Declaration of " & "natsHeader_New" &
        " already exists, not redeclaring")
when not declared(natsHeader_Set):
  proc natsHeader_Set*(h: ptr natsHeader_536871398; key: ptr uint8;
                       value: ptr uint8): natsStatus_536871378 {.cdecl,
      importc: "natsHeader_Set".}
else:
  static :
    hint("Declaration of " & "natsHeader_Set" &
        " already exists, not redeclaring")
when not declared(natsHeader_Add):
  proc natsHeader_Add*(h: ptr natsHeader_536871398; key: ptr uint8;
                       value: ptr uint8): natsStatus_536871378 {.cdecl,
      importc: "natsHeader_Add".}
else:
  static :
    hint("Declaration of " & "natsHeader_Add" &
        " already exists, not redeclaring")
when not declared(natsHeader_Get):
  proc natsHeader_Get*(h: ptr natsHeader_536871398; key: ptr uint8;
                       value: ptr ptr uint8): natsStatus_536871378 {.cdecl,
      importc: "natsHeader_Get".}
else:
  static :
    hint("Declaration of " & "natsHeader_Get" &
        " already exists, not redeclaring")
when not declared(natsHeader_Values):
  proc natsHeader_Values*(h: ptr natsHeader_536871398; key: ptr uint8;
                          values: ptr ptr ptr uint8; count: ptr cint): natsStatus_536871378 {.
      cdecl, importc: "natsHeader_Values".}
else:
  static :
    hint("Declaration of " & "natsHeader_Values" &
        " already exists, not redeclaring")
when not declared(natsHeader_Keys):
  proc natsHeader_Keys*(h: ptr natsHeader_536871398; keys: ptr ptr ptr uint8;
                        count: ptr cint): natsStatus_536871378 {.cdecl,
      importc: "natsHeader_Keys".}
else:
  static :
    hint("Declaration of " & "natsHeader_Keys" &
        " already exists, not redeclaring")
when not declared(natsHeader_KeysCount):
  proc natsHeader_KeysCount*(h: ptr natsHeader_536871398): cint {.cdecl,
      importc: "natsHeader_KeysCount".}
else:
  static :
    hint("Declaration of " & "natsHeader_KeysCount" &
        " already exists, not redeclaring")
when not declared(natsHeader_Delete):
  proc natsHeader_Delete*(h: ptr natsHeader_536871398; key: ptr uint8): natsStatus_536871378 {.
      cdecl, importc: "natsHeader_Delete".}
else:
  static :
    hint("Declaration of " & "natsHeader_Delete" &
        " already exists, not redeclaring")
when not declared(natsHeader_Destroy):
  proc natsHeader_Destroy*(h: ptr natsHeader_536871398): void {.cdecl,
      importc: "natsHeader_Destroy".}
else:
  static :
    hint("Declaration of " & "natsHeader_Destroy" &
        " already exists, not redeclaring")
when not declared(natsMsgList_Destroy):
  proc natsMsgList_Destroy*(list: ptr natsMsgList_536871408): void {.cdecl,
      importc: "natsMsgList_Destroy".}
else:
  static :
    hint("Declaration of " & "natsMsgList_Destroy" &
        " already exists, not redeclaring")
when not declared(natsMsg_Create):
  proc natsMsg_Create*(newMsg: ptr ptr natsMsg_536871392; subj: ptr uint8;
                       reply: ptr uint8; data: ptr uint8; dataLen: cint): natsStatus_536871378 {.
      cdecl, importc: "natsMsg_Create".}
else:
  static :
    hint("Declaration of " & "natsMsg_Create" &
        " already exists, not redeclaring")
when not declared(natsMsg_GetSubject):
  proc natsMsg_GetSubject*(msg: ptr natsMsg_536871392): ptr uint8 {.cdecl,
      importc: "natsMsg_GetSubject".}
else:
  static :
    hint("Declaration of " & "natsMsg_GetSubject" &
        " already exists, not redeclaring")
when not declared(natsMsg_GetReply):
  proc natsMsg_GetReply*(msg: ptr natsMsg_536871392): ptr uint8 {.cdecl,
      importc: "natsMsg_GetReply".}
else:
  static :
    hint("Declaration of " & "natsMsg_GetReply" &
        " already exists, not redeclaring")
when not declared(natsMsg_GetData):
  proc natsMsg_GetData*(msg: ptr natsMsg_536871392): ptr uint8 {.cdecl,
      importc: "natsMsg_GetData".}
else:
  static :
    hint("Declaration of " & "natsMsg_GetData" &
        " already exists, not redeclaring")
when not declared(natsMsg_GetDataLength):
  proc natsMsg_GetDataLength*(msg: ptr natsMsg_536871392): cint {.cdecl,
      importc: "natsMsg_GetDataLength".}
else:
  static :
    hint("Declaration of " & "natsMsg_GetDataLength" &
        " already exists, not redeclaring")
when not declared(natsMsgHeader_Set):
  proc natsMsgHeader_Set*(msg: ptr natsMsg_536871392; key: ptr uint8;
                          value: ptr uint8): natsStatus_536871378 {.cdecl,
      importc: "natsMsgHeader_Set".}
else:
  static :
    hint("Declaration of " & "natsMsgHeader_Set" &
        " already exists, not redeclaring")
when not declared(natsMsgHeader_Add):
  proc natsMsgHeader_Add*(msg: ptr natsMsg_536871392; key: ptr uint8;
                          value: ptr uint8): natsStatus_536871378 {.cdecl,
      importc: "natsMsgHeader_Add".}
else:
  static :
    hint("Declaration of " & "natsMsgHeader_Add" &
        " already exists, not redeclaring")
when not declared(natsMsgHeader_Get):
  proc natsMsgHeader_Get*(msg: ptr natsMsg_536871392; key: ptr uint8;
                          value: ptr ptr uint8): natsStatus_536871378 {.cdecl,
      importc: "natsMsgHeader_Get".}
else:
  static :
    hint("Declaration of " & "natsMsgHeader_Get" &
        " already exists, not redeclaring")
when not declared(natsMsgHeader_Values):
  proc natsMsgHeader_Values*(msg: ptr natsMsg_536871392; key: ptr uint8;
                             values: ptr ptr ptr uint8; count: ptr cint): natsStatus_536871378 {.
      cdecl, importc: "natsMsgHeader_Values".}
else:
  static :
    hint("Declaration of " & "natsMsgHeader_Values" &
        " already exists, not redeclaring")
when not declared(natsMsgHeader_Keys):
  proc natsMsgHeader_Keys*(msg: ptr natsMsg_536871392; keys: ptr ptr ptr uint8;
                           count: ptr cint): natsStatus_536871378 {.cdecl,
      importc: "natsMsgHeader_Keys".}
else:
  static :
    hint("Declaration of " & "natsMsgHeader_Keys" &
        " already exists, not redeclaring")
when not declared(natsMsgHeader_Delete):
  proc natsMsgHeader_Delete*(msg: ptr natsMsg_536871392; key: ptr uint8): natsStatus_536871378 {.
      cdecl, importc: "natsMsgHeader_Delete".}
else:
  static :
    hint("Declaration of " & "natsMsgHeader_Delete" &
        " already exists, not redeclaring")
when not declared(natsMsg_IsNoResponders):
  proc natsMsg_IsNoResponders*(msg: ptr natsMsg_536871392): bool {.cdecl,
      importc: "natsMsg_IsNoResponders".}
else:
  static :
    hint("Declaration of " & "natsMsg_IsNoResponders" &
        " already exists, not redeclaring")
when not declared(natsMsg_Destroy):
  proc natsMsg_Destroy*(msg: ptr natsMsg_536871392): void {.cdecl,
      importc: "natsMsg_Destroy".}
else:
  static :
    hint("Declaration of " & "natsMsg_Destroy" &
        " already exists, not redeclaring")
when not declared(natsConnection_Connect):
  proc natsConnection_Connect*(nc: ptr ptr natsConnection_536871386;
                               options: ptr natsOptions_536871394): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_Connect".}
else:
  static :
    hint("Declaration of " & "natsConnection_Connect" &
        " already exists, not redeclaring")
when not declared(natsConnection_Reconnect):
  proc natsConnection_Reconnect*(nc: ptr natsConnection_536871386): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_Reconnect".}
else:
  static :
    hint("Declaration of " & "natsConnection_Reconnect" &
        " already exists, not redeclaring")
when not declared(natsConnection_ProcessReadEvent):
  proc natsConnection_ProcessReadEvent*(nc: ptr natsConnection_536871386): void {.
      cdecl, importc: "natsConnection_ProcessReadEvent".}
else:
  static :
    hint("Declaration of " & "natsConnection_ProcessReadEvent" &
        " already exists, not redeclaring")
when not declared(natsConnection_ProcessCloseEvent):
  proc natsConnection_ProcessCloseEvent*(socket: ptr natsSock_536871384): void {.
      cdecl, importc: "natsConnection_ProcessCloseEvent".}
else:
  static :
    hint("Declaration of " & "natsConnection_ProcessCloseEvent" &
        " already exists, not redeclaring")
when not declared(natsConnection_ProcessWriteEvent):
  proc natsConnection_ProcessWriteEvent*(nc: ptr natsConnection_536871386): void {.
      cdecl, importc: "natsConnection_ProcessWriteEvent".}
else:
  static :
    hint("Declaration of " & "natsConnection_ProcessWriteEvent" &
        " already exists, not redeclaring")
when not declared(natsConnection_ProcessDetachedEvent):
  proc natsConnection_ProcessDetachedEvent*(nc: ptr natsConnection_536871386): void {.
      cdecl, importc: "natsConnection_ProcessDetachedEvent".}
else:
  static :
    hint("Declaration of " & "natsConnection_ProcessDetachedEvent" &
        " already exists, not redeclaring")
when not declared(natsConnection_ConnectTo):
  proc natsConnection_ConnectTo*(nc: ptr ptr natsConnection_536871386;
                                 urls: ptr uint8): natsStatus_536871378 {.cdecl,
      importc: "natsConnection_ConnectTo".}
else:
  static :
    hint("Declaration of " & "natsConnection_ConnectTo" &
        " already exists, not redeclaring")
when not declared(natsConnection_IsClosed):
  proc natsConnection_IsClosed*(nc: ptr natsConnection_536871386): bool {.cdecl,
      importc: "natsConnection_IsClosed".}
else:
  static :
    hint("Declaration of " & "natsConnection_IsClosed" &
        " already exists, not redeclaring")
when not declared(natsConnection_IsReconnecting):
  proc natsConnection_IsReconnecting*(nc: ptr natsConnection_536871386): bool {.
      cdecl, importc: "natsConnection_IsReconnecting".}
else:
  static :
    hint("Declaration of " & "natsConnection_IsReconnecting" &
        " already exists, not redeclaring")
when not declared(natsConnection_IsDraining):
  proc natsConnection_IsDraining*(nc: ptr natsConnection_536871386): bool {.
      cdecl, importc: "natsConnection_IsDraining".}
else:
  static :
    hint("Declaration of " & "natsConnection_IsDraining" &
        " already exists, not redeclaring")
when not declared(natsConnection_Status):
  proc natsConnection_Status*(nc: ptr natsConnection_536871386): natsConnStatus_536871374 {.
      cdecl, importc: "natsConnection_Status".}
else:
  static :
    hint("Declaration of " & "natsConnection_Status" &
        " already exists, not redeclaring")
when not declared(natsConnection_Buffered):
  proc natsConnection_Buffered*(nc: ptr natsConnection_536871386): cint {.cdecl,
      importc: "natsConnection_Buffered".}
else:
  static :
    hint("Declaration of " & "natsConnection_Buffered" &
        " already exists, not redeclaring")
when not declared(natsConnection_Flush):
  proc natsConnection_Flush*(nc: ptr natsConnection_536871386): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_Flush".}
else:
  static :
    hint("Declaration of " & "natsConnection_Flush" &
        " already exists, not redeclaring")
when not declared(natsConnection_FlushTimeout):
  proc natsConnection_FlushTimeout*(nc: ptr natsConnection_536871386;
                                    timeout: int64): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_FlushTimeout".}
else:
  static :
    hint("Declaration of " & "natsConnection_FlushTimeout" &
        " already exists, not redeclaring")
when not declared(natsConnection_GetMaxPayload):
  proc natsConnection_GetMaxPayload*(nc: ptr natsConnection_536871386): int64 {.
      cdecl, importc: "natsConnection_GetMaxPayload".}
else:
  static :
    hint("Declaration of " & "natsConnection_GetMaxPayload" &
        " already exists, not redeclaring")
when not declared(natsConnection_GetStats):
  proc natsConnection_GetStats*(nc: ptr natsConnection_536871386;
                                stats: ptr natsStatistics_536871388): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_GetStats".}
else:
  static :
    hint("Declaration of " & "natsConnection_GetStats" &
        " already exists, not redeclaring")
when not declared(natsConnection_GetConnectedUrl):
  proc natsConnection_GetConnectedUrl*(nc: ptr natsConnection_536871386;
                                       buffer: ptr uint8; bufferSize: csize_t): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_GetConnectedUrl".}
else:
  static :
    hint("Declaration of " & "natsConnection_GetConnectedUrl" &
        " already exists, not redeclaring")
when not declared(natsConnection_GetConnectedServerId):
  proc natsConnection_GetConnectedServerId*(nc: ptr natsConnection_536871386;
      buffer: ptr uint8; bufferSize: csize_t): natsStatus_536871378 {.cdecl,
      importc: "natsConnection_GetConnectedServerId".}
else:
  static :
    hint("Declaration of " & "natsConnection_GetConnectedServerId" &
        " already exists, not redeclaring")
when not declared(natsConnection_GetServers):
  proc natsConnection_GetServers*(nc: ptr natsConnection_536871386;
                                  servers: ptr ptr ptr uint8; count: ptr cint): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_GetServers".}
else:
  static :
    hint("Declaration of " & "natsConnection_GetServers" &
        " already exists, not redeclaring")
when not declared(natsConnection_GetDiscoveredServers):
  proc natsConnection_GetDiscoveredServers*(nc: ptr natsConnection_536871386;
      servers: ptr ptr ptr uint8; count: ptr cint): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_GetDiscoveredServers".}
else:
  static :
    hint("Declaration of " & "natsConnection_GetDiscoveredServers" &
        " already exists, not redeclaring")
when not declared(natsConnection_GetLastError):
  proc natsConnection_GetLastError*(nc: ptr natsConnection_536871386;
                                    lastError: ptr ptr uint8): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_GetLastError".}
else:
  static :
    hint("Declaration of " & "natsConnection_GetLastError" &
        " already exists, not redeclaring")
when not declared(natsConnection_ReadLastError):
  proc natsConnection_ReadLastError*(nc: ptr natsConnection_536871386;
                                     buf: ptr uint8; n: csize_t): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_ReadLastError".}
else:
  static :
    hint("Declaration of " & "natsConnection_ReadLastError" &
        " already exists, not redeclaring")
when not declared(natsConnection_GetClientID):
  proc natsConnection_GetClientID*(nc: ptr natsConnection_536871386;
                                   cid: ptr uint64): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_GetClientID".}
else:
  static :
    hint("Declaration of " & "natsConnection_GetClientID" &
        " already exists, not redeclaring")
when not declared(natsConnection_Drain):
  proc natsConnection_Drain*(nc: ptr natsConnection_536871386): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_Drain".}
else:
  static :
    hint("Declaration of " & "natsConnection_Drain" &
        " already exists, not redeclaring")
when not declared(natsConnection_DrainTimeout):
  proc natsConnection_DrainTimeout*(nc: ptr natsConnection_536871386;
                                    timeout: int64): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_DrainTimeout".}
else:
  static :
    hint("Declaration of " & "natsConnection_DrainTimeout" &
        " already exists, not redeclaring")
when not declared(natsConnection_Sign):
  proc natsConnection_Sign*(nc: ptr natsConnection_536871386;
                            message: ptr uint8; messageLen: cint;
                            sig: array[64'i64, uint8]): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_Sign".}
else:
  static :
    hint("Declaration of " & "natsConnection_Sign" &
        " already exists, not redeclaring")
when not declared(natsConnection_GetClientIP):
  proc natsConnection_GetClientIP*(nc: ptr natsConnection_536871386;
                                   ip: ptr ptr uint8): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_GetClientIP".}
else:
  static :
    hint("Declaration of " & "natsConnection_GetClientIP" &
        " already exists, not redeclaring")
when not declared(natsConnection_GetName):
  proc natsConnection_GetName*(nc: ptr natsConnection_536871386): ptr uint8 {.
      cdecl, importc: "natsConnection_GetName".}
else:
  static :
    hint("Declaration of " & "natsConnection_GetName" &
        " already exists, not redeclaring")
when not declared(natsConnection_GetRTT):
  proc natsConnection_GetRTT*(nc: ptr natsConnection_536871386; rtt: ptr int64): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_GetRTT".}
else:
  static :
    hint("Declaration of " & "natsConnection_GetRTT" &
        " already exists, not redeclaring")
when not declared(natsConnection_HasHeaderSupport):
  proc natsConnection_HasHeaderSupport*(nc: ptr natsConnection_536871386): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_HasHeaderSupport".}
else:
  static :
    hint("Declaration of " & "natsConnection_HasHeaderSupport" &
        " already exists, not redeclaring")
when not declared(natsConnection_GetLocalIPAndPort):
  proc natsConnection_GetLocalIPAndPort*(nc: ptr natsConnection_536871386;
      ip: ptr ptr uint8; port: ptr cint): natsStatus_536871378 {.cdecl,
      importc: "natsConnection_GetLocalIPAndPort".}
else:
  static :
    hint("Declaration of " & "natsConnection_GetLocalIPAndPort" &
        " already exists, not redeclaring")
when not declared(natsConnection_Close):
  proc natsConnection_Close*(nc: ptr natsConnection_536871386): void {.cdecl,
      importc: "natsConnection_Close".}
else:
  static :
    hint("Declaration of " & "natsConnection_Close" &
        " already exists, not redeclaring")
when not declared(natsConnection_Destroy):
  proc natsConnection_Destroy*(nc: ptr natsConnection_536871386): void {.cdecl,
      importc: "natsConnection_Destroy".}
else:
  static :
    hint("Declaration of " & "natsConnection_Destroy" &
        " already exists, not redeclaring")
when not declared(natsConnection_Publish):
  proc natsConnection_Publish*(nc: ptr natsConnection_536871386;
                               subj: ptr uint8; data: pointer; dataLen: cint): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_Publish".}
else:
  static :
    hint("Declaration of " & "natsConnection_Publish" &
        " already exists, not redeclaring")
when not declared(natsConnection_PublishString):
  proc natsConnection_PublishString*(nc: ptr natsConnection_536871386;
                                     subj: ptr uint8; str: ptr uint8): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_PublishString".}
else:
  static :
    hint("Declaration of " & "natsConnection_PublishString" &
        " already exists, not redeclaring")
when not declared(natsConnection_PublishMsg):
  proc natsConnection_PublishMsg*(nc: ptr natsConnection_536871386;
                                  msg: ptr natsMsg_536871392): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_PublishMsg".}
else:
  static :
    hint("Declaration of " & "natsConnection_PublishMsg" &
        " already exists, not redeclaring")
when not declared(natsConnection_PublishRequest):
  proc natsConnection_PublishRequest*(nc: ptr natsConnection_536871386;
                                      subj: ptr uint8; reply: ptr uint8;
                                      data: pointer; dataLen: cint): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_PublishRequest".}
else:
  static :
    hint("Declaration of " & "natsConnection_PublishRequest" &
        " already exists, not redeclaring")
when not declared(natsConnection_PublishRequestString):
  proc natsConnection_PublishRequestString*(nc: ptr natsConnection_536871386;
      subj: ptr uint8; reply: ptr uint8; str: ptr uint8): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_PublishRequestString".}
else:
  static :
    hint("Declaration of " & "natsConnection_PublishRequestString" &
        " already exists, not redeclaring")
when not declared(natsConnection_Request):
  proc natsConnection_Request*(replyMsg: ptr ptr natsMsg_536871392;
                               nc: ptr natsConnection_536871386;
                               subj: ptr uint8; data: pointer; dataLen: cint;
                               timeout: int64): natsStatus_536871378 {.cdecl,
      importc: "natsConnection_Request".}
else:
  static :
    hint("Declaration of " & "natsConnection_Request" &
        " already exists, not redeclaring")
when not declared(natsConnection_RequestString):
  proc natsConnection_RequestString*(replyMsg: ptr ptr natsMsg_536871392;
                                     nc: ptr natsConnection_536871386;
                                     subj: ptr uint8; str: ptr uint8;
                                     timeout: int64): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_RequestString".}
else:
  static :
    hint("Declaration of " & "natsConnection_RequestString" &
        " already exists, not redeclaring")
when not declared(natsConnection_RequestMsg):
  proc natsConnection_RequestMsg*(replyMsg: ptr ptr natsMsg_536871392;
                                  nc: ptr natsConnection_536871386;
                                  requestMsg: ptr natsMsg_536871392;
                                  timeout: int64): natsStatus_536871378 {.cdecl,
      importc: "natsConnection_RequestMsg".}
else:
  static :
    hint("Declaration of " & "natsConnection_RequestMsg" &
        " already exists, not redeclaring")
when not declared(natsConnection_Send):
  proc natsConnection_Send*(nc: ptr natsConnection_536871386; subj: ptr uint8;
                            data: pointer; dataLen: cint): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_Send".}
else:
  static :
    hint("Declaration of " & "natsConnection_Send" &
        " already exists, not redeclaring")
when not declared(natsConnection_SendMsg):
  proc natsConnection_SendMsg*(nc: ptr natsConnection_536871386;
                               msg: ptr natsMsg_536871392): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_SendMsg".}
else:
  static :
    hint("Declaration of " & "natsConnection_SendMsg" &
        " already exists, not redeclaring")
when not declared(natsConnection_SendRequest):
  proc natsConnection_SendRequest*(nc: ptr natsConnection_536871386;
                                   subj: ptr uint8; reply: ptr uint8;
                                   data: pointer; dataLen: cint): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_SendRequest".}
else:
  static :
    hint("Declaration of " & "natsConnection_SendRequest" &
        " already exists, not redeclaring")
when not declared(natsConnection_Subscribe):
  proc natsConnection_Subscribe*(sub: ptr ptr natsSubscription_536871390;
                                 nc: ptr natsConnection_536871386;
                                 subject: ptr uint8; cb: natsMsgHandler_536871725;
                                 cbClosure: pointer): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_Subscribe".}
else:
  static :
    hint("Declaration of " & "natsConnection_Subscribe" &
        " already exists, not redeclaring")
when not declared(natsConnection_SubscribeTimeout):
  proc natsConnection_SubscribeTimeout*(sub: ptr ptr natsSubscription_536871390;
                                        nc: ptr natsConnection_536871386;
                                        subject: ptr uint8; timeout: int64;
                                        cb: natsMsgHandler_536871725;
                                        cbClosure: pointer): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_SubscribeTimeout".}
else:
  static :
    hint("Declaration of " & "natsConnection_SubscribeTimeout" &
        " already exists, not redeclaring")
when not declared(natsConnection_SubscribeSync):
  proc natsConnection_SubscribeSync*(sub: ptr ptr natsSubscription_536871390;
                                     nc: ptr natsConnection_536871386;
                                     subject: ptr uint8): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_SubscribeSync".}
else:
  static :
    hint("Declaration of " & "natsConnection_SubscribeSync" &
        " already exists, not redeclaring")
when not declared(natsConnection_QueueSubscribe):
  proc natsConnection_QueueSubscribe*(sub: ptr ptr natsSubscription_536871390;
                                      nc: ptr natsConnection_536871386;
                                      subject: ptr uint8; queueGroup: ptr uint8;
                                      cb: natsMsgHandler_536871725;
                                      cbClosure: pointer): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_QueueSubscribe".}
else:
  static :
    hint("Declaration of " & "natsConnection_QueueSubscribe" &
        " already exists, not redeclaring")
when not declared(natsConnection_QueueSubscribeTimeout):
  proc natsConnection_QueueSubscribeTimeout*(sub: ptr ptr natsSubscription_536871390;
      nc: ptr natsConnection_536871386; subject: ptr uint8;
      queueGroup: ptr uint8; timeout: int64; cb: natsMsgHandler_536871725;
      cbClosure: pointer): natsStatus_536871378 {.cdecl,
      importc: "natsConnection_QueueSubscribeTimeout".}
else:
  static :
    hint("Declaration of " & "natsConnection_QueueSubscribeTimeout" &
        " already exists, not redeclaring")
when not declared(natsConnection_QueueSubscribeSync):
  proc natsConnection_QueueSubscribeSync*(sub: ptr ptr natsSubscription_536871390;
      nc: ptr natsConnection_536871386; subject: ptr uint8;
      queueGroup: ptr uint8): natsStatus_536871378 {.cdecl,
      importc: "natsConnection_QueueSubscribeSync".}
else:
  static :
    hint("Declaration of " & "natsConnection_QueueSubscribeSync" &
        " already exists, not redeclaring")
when not declared(natsSubscription_NoDeliveryDelay):
  proc natsSubscription_NoDeliveryDelay*(sub: ptr natsSubscription_536871390): natsStatus_536871378 {.
      cdecl, importc: "natsSubscription_NoDeliveryDelay".}
else:
  static :
    hint("Declaration of " & "natsSubscription_NoDeliveryDelay" &
        " already exists, not redeclaring")
when not declared(natsSubscription_NextMsg):
  proc natsSubscription_NextMsg*(nextMsg: ptr ptr natsMsg_536871392;
                                 sub: ptr natsSubscription_536871390;
                                 timeout: int64): natsStatus_536871378 {.cdecl,
      importc: "natsSubscription_NextMsg".}
else:
  static :
    hint("Declaration of " & "natsSubscription_NextMsg" &
        " already exists, not redeclaring")
when not declared(natsSubscription_Unsubscribe):
  proc natsSubscription_Unsubscribe*(sub: ptr natsSubscription_536871390): natsStatus_536871378 {.
      cdecl, importc: "natsSubscription_Unsubscribe".}
else:
  static :
    hint("Declaration of " & "natsSubscription_Unsubscribe" &
        " already exists, not redeclaring")
when not declared(natsSubscription_AutoUnsubscribe):
  proc natsSubscription_AutoUnsubscribe*(sub: ptr natsSubscription_536871390;
      max: cint): natsStatus_536871378 {.cdecl,
      importc: "natsSubscription_AutoUnsubscribe".}
else:
  static :
    hint("Declaration of " & "natsSubscription_AutoUnsubscribe" &
        " already exists, not redeclaring")
when not declared(natsSubscription_QueuedMsgs):
  proc natsSubscription_QueuedMsgs*(sub: ptr natsSubscription_536871390;
                                    queuedMsgs: ptr uint64): natsStatus_536871378 {.
      cdecl, importc: "natsSubscription_QueuedMsgs".}
else:
  static :
    hint("Declaration of " & "natsSubscription_QueuedMsgs" &
        " already exists, not redeclaring")
when not declared(natsSubscription_GetConnection):
  proc natsSubscription_GetConnection*(sub: ptr natsSubscription_536871390): ptr natsConnection_536871386 {.
      cdecl, importc: "natsSubscription_GetConnection".}
else:
  static :
    hint("Declaration of " & "natsSubscription_GetConnection" &
        " already exists, not redeclaring")
when not declared(natsSubscription_GetID):
  proc natsSubscription_GetID*(sub: ptr natsSubscription_536871390): int64 {.
      cdecl, importc: "natsSubscription_GetID".}
else:
  static :
    hint("Declaration of " & "natsSubscription_GetID" &
        " already exists, not redeclaring")
when not declared(natsSubscription_GetSubject):
  proc natsSubscription_GetSubject*(sub: ptr natsSubscription_536871390): ptr uint8 {.
      cdecl, importc: "natsSubscription_GetSubject".}
else:
  static :
    hint("Declaration of " & "natsSubscription_GetSubject" &
        " already exists, not redeclaring")
when not declared(natsSubscription_SetPendingLimits):
  proc natsSubscription_SetPendingLimits*(sub: ptr natsSubscription_536871390;
      msgLimit: cint; bytesLimit: cint): natsStatus_536871378 {.cdecl,
      importc: "natsSubscription_SetPendingLimits".}
else:
  static :
    hint("Declaration of " & "natsSubscription_SetPendingLimits" &
        " already exists, not redeclaring")
when not declared(natsSubscription_GetPendingLimits):
  proc natsSubscription_GetPendingLimits*(sub: ptr natsSubscription_536871390;
      msgLimit: ptr cint; bytesLimit: ptr cint): natsStatus_536871378 {.cdecl,
      importc: "natsSubscription_GetPendingLimits".}
else:
  static :
    hint("Declaration of " & "natsSubscription_GetPendingLimits" &
        " already exists, not redeclaring")
when not declared(natsSubscription_GetPending):
  proc natsSubscription_GetPending*(sub: ptr natsSubscription_536871390;
                                    msgs: ptr cint; bytes: ptr cint): natsStatus_536871378 {.
      cdecl, importc: "natsSubscription_GetPending".}
else:
  static :
    hint("Declaration of " & "natsSubscription_GetPending" &
        " already exists, not redeclaring")
when not declared(natsSubscription_GetDelivered):
  proc natsSubscription_GetDelivered*(sub: ptr natsSubscription_536871390;
                                      msgs: ptr int64): natsStatus_536871378 {.
      cdecl, importc: "natsSubscription_GetDelivered".}
else:
  static :
    hint("Declaration of " & "natsSubscription_GetDelivered" &
        " already exists, not redeclaring")
when not declared(natsSubscription_GetDropped):
  proc natsSubscription_GetDropped*(sub: ptr natsSubscription_536871390;
                                    msgs: ptr int64): natsStatus_536871378 {.
      cdecl, importc: "natsSubscription_GetDropped".}
else:
  static :
    hint("Declaration of " & "natsSubscription_GetDropped" &
        " already exists, not redeclaring")
when not declared(natsSubscription_GetMaxPending):
  proc natsSubscription_GetMaxPending*(sub: ptr natsSubscription_536871390;
                                       msgs: ptr cint; bytes: ptr cint): natsStatus_536871378 {.
      cdecl, importc: "natsSubscription_GetMaxPending".}
else:
  static :
    hint("Declaration of " & "natsSubscription_GetMaxPending" &
        " already exists, not redeclaring")
when not declared(natsSubscription_ClearMaxPending):
  proc natsSubscription_ClearMaxPending*(sub: ptr natsSubscription_536871390): natsStatus_536871378 {.
      cdecl, importc: "natsSubscription_ClearMaxPending".}
else:
  static :
    hint("Declaration of " & "natsSubscription_ClearMaxPending" &
        " already exists, not redeclaring")
when not declared(natsSubscription_GetStats):
  proc natsSubscription_GetStats*(sub: ptr natsSubscription_536871390;
                                  pendingMsgs: ptr cint; pendingBytes: ptr cint;
                                  maxPendingMsgs: ptr cint;
                                  maxPendingBytes: ptr cint;
                                  deliveredMsgs: ptr int64;
                                  droppedMsgs: ptr int64): natsStatus_536871378 {.
      cdecl, importc: "natsSubscription_GetStats".}
else:
  static :
    hint("Declaration of " & "natsSubscription_GetStats" &
        " already exists, not redeclaring")
when not declared(natsSubscription_IsValid):
  proc natsSubscription_IsValid*(sub: ptr natsSubscription_536871390): bool {.
      cdecl, importc: "natsSubscription_IsValid".}
else:
  static :
    hint("Declaration of " & "natsSubscription_IsValid" &
        " already exists, not redeclaring")
when not declared(natsSubscription_Drain):
  proc natsSubscription_Drain*(sub: ptr natsSubscription_536871390): natsStatus_536871378 {.
      cdecl, importc: "natsSubscription_Drain".}
else:
  static :
    hint("Declaration of " & "natsSubscription_Drain" &
        " already exists, not redeclaring")
when not declared(natsSubscription_DrainTimeout):
  proc natsSubscription_DrainTimeout*(sub: ptr natsSubscription_536871390;
                                      timeout: int64): natsStatus_536871378 {.
      cdecl, importc: "natsSubscription_DrainTimeout".}
else:
  static :
    hint("Declaration of " & "natsSubscription_DrainTimeout" &
        " already exists, not redeclaring")
when not declared(natsSubscription_WaitForDrainCompletion):
  proc natsSubscription_WaitForDrainCompletion*(sub: ptr natsSubscription_536871390;
      timeout: int64): natsStatus_536871378 {.cdecl,
      importc: "natsSubscription_WaitForDrainCompletion".}
else:
  static :
    hint("Declaration of " & "natsSubscription_WaitForDrainCompletion" &
        " already exists, not redeclaring")
when not declared(natsSubscription_DrainCompletionStatus):
  proc natsSubscription_DrainCompletionStatus*(sub: ptr natsSubscription_536871390): natsStatus_536871378 {.
      cdecl, importc: "natsSubscription_DrainCompletionStatus".}
else:
  static :
    hint("Declaration of " & "natsSubscription_DrainCompletionStatus" &
        " already exists, not redeclaring")
when not declared(natsSubscription_SetOnCompleteCB):
  proc natsSubscription_SetOnCompleteCB*(sub: ptr natsSubscription_536871390;
      cb: natsOnCompleteCB_536871747; closure: pointer): natsStatus_536871378 {.
      cdecl, importc: "natsSubscription_SetOnCompleteCB".}
else:
  static :
    hint("Declaration of " & "natsSubscription_SetOnCompleteCB" &
        " already exists, not redeclaring")
when not declared(natsSubscription_Destroy):
  proc natsSubscription_Destroy*(sub: ptr natsSubscription_536871390): void {.
      cdecl, importc: "natsSubscription_Destroy".}
else:
  static :
    hint("Declaration of " & "natsSubscription_Destroy" &
        " already exists, not redeclaring")
when not declared(jsOptions_Init):
  proc jsOptions_Init*(opts: ptr jsOptions_536871639): natsStatus_536871378 {.
      cdecl, importc: "jsOptions_Init".}
else:
  static :
    hint("Declaration of " & "jsOptions_Init" &
        " already exists, not redeclaring")
when not declared(natsConnection_JetStream):
  proc natsConnection_JetStream*(js: ptr ptr jsCtx_536871414;
                                 nc: ptr natsConnection_536871386;
                                 opts: ptr jsOptions_536871639): natsStatus_536871378 {.
      cdecl, importc: "natsConnection_JetStream".}
else:
  static :
    hint("Declaration of " & "natsConnection_JetStream" &
        " already exists, not redeclaring")
when not declared(jsCtx_Destroy):
  proc jsCtx_Destroy*(js: ptr jsCtx_536871414): void {.cdecl,
      importc: "jsCtx_Destroy".}
else:
  static :
    hint("Declaration of " & "jsCtx_Destroy" &
        " already exists, not redeclaring")
when not declared(jsStreamConfig_Init):
  proc jsStreamConfig_Init*(cfg: ptr jsStreamConfig_536871487): natsStatus_536871378 {.
      cdecl, importc: "jsStreamConfig_Init".}
else:
  static :
    hint("Declaration of " & "jsStreamConfig_Init" &
        " already exists, not redeclaring")
when not declared(jsPlacement_Init):
  proc jsPlacement_Init*(placement: ptr jsPlacement_536871463): natsStatus_536871378 {.
      cdecl, importc: "jsPlacement_Init".}
else:
  static :
    hint("Declaration of " & "jsPlacement_Init" &
        " already exists, not redeclaring")
when not declared(jsStreamSource_Init):
  proc jsStreamSource_Init*(source: ptr jsStreamSource_536871471): natsStatus_536871378 {.
      cdecl, importc: "jsStreamSource_Init".}
else:
  static :
    hint("Declaration of " & "jsStreamSource_Init" &
        " already exists, not redeclaring")
when not declared(jsExternalStream_Init):
  proc jsExternalStream_Init*(external: ptr jsExternalStream_536871467): natsStatus_536871378 {.
      cdecl, importc: "jsExternalStream_Init".}
else:
  static :
    hint("Declaration of " & "jsExternalStream_Init" &
        " already exists, not redeclaring")
when not declared(jsRePublish_Init):
  proc jsRePublish_Init*(rp: ptr jsRePublish_536871475): natsStatus_536871378 {.
      cdecl, importc: "jsRePublish_Init".}
else:
  static :
    hint("Declaration of " & "jsRePublish_Init" &
        " already exists, not redeclaring")
when not declared(js_AddStream):
  proc js_AddStream*(si: ptr ptr jsStreamInfo_536871523; js: ptr jsCtx_536871414;
                     cfg: ptr jsStreamConfig_536871487; opts: ptr jsOptions_536871639;
                     errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_AddStream".}
else:
  static :
    hint("Declaration of " & "js_AddStream" & " already exists, not redeclaring")
when not declared(js_UpdateStream):
  proc js_UpdateStream*(si: ptr ptr jsStreamInfo_536871523; js: ptr jsCtx_536871414;
                        cfg: ptr jsStreamConfig_536871487; opts: ptr jsOptions_536871639;
                        errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_UpdateStream".}
else:
  static :
    hint("Declaration of " & "js_UpdateStream" &
        " already exists, not redeclaring")
when not declared(js_PurgeStream):
  proc js_PurgeStream*(js: ptr jsCtx_536871414; stream: ptr uint8;
                       opts: ptr jsOptions_536871639; errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_PurgeStream".}
else:
  static :
    hint("Declaration of " & "js_PurgeStream" &
        " already exists, not redeclaring")
when not declared(js_DeleteStream):
  proc js_DeleteStream*(js: ptr jsCtx_536871414; stream: ptr uint8;
                        opts: ptr jsOptions_536871639; errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_DeleteStream".}
else:
  static :
    hint("Declaration of " & "js_DeleteStream" &
        " already exists, not redeclaring")
when not declared(js_GetMsg):
  proc js_GetMsg*(msg: ptr ptr natsMsg_536871392; js: ptr jsCtx_536871414;
                  stream: ptr uint8; seq: uint64; opts: ptr jsOptions_536871639;
                  errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_GetMsg".}
else:
  static :
    hint("Declaration of " & "js_GetMsg" & " already exists, not redeclaring")
when not declared(js_GetLastMsg):
  proc js_GetLastMsg*(msg: ptr ptr natsMsg_536871392; js: ptr jsCtx_536871414;
                      stream: ptr uint8; subject: ptr uint8;
                      opts: ptr jsOptions_536871639; errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_GetLastMsg".}
else:
  static :
    hint("Declaration of " & "js_GetLastMsg" &
        " already exists, not redeclaring")
when not declared(jsDirectGetMsgOptions_Init):
  proc jsDirectGetMsgOptions_Init*(opts: ptr jsDirectGetMsgOptions_536871607): natsStatus_536871378 {.
      cdecl, importc: "jsDirectGetMsgOptions_Init".}
else:
  static :
    hint("Declaration of " & "jsDirectGetMsgOptions_Init" &
        " already exists, not redeclaring")
when not declared(js_DirectGetMsg):
  proc js_DirectGetMsg*(msg: ptr ptr natsMsg_536871392; js: ptr jsCtx_536871414;
                        stream: ptr uint8; opts: ptr jsOptions_536871639;
                        dgOpts: ptr jsDirectGetMsgOptions_536871607): natsStatus_536871378 {.
      cdecl, importc: "js_DirectGetMsg".}
else:
  static :
    hint("Declaration of " & "js_DirectGetMsg" &
        " already exists, not redeclaring")
when not declared(js_DeleteMsg):
  proc js_DeleteMsg*(js: ptr jsCtx_536871414; stream: ptr uint8; seq: uint64;
                     opts: ptr jsOptions_536871639; errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_DeleteMsg".}
else:
  static :
    hint("Declaration of " & "js_DeleteMsg" & " already exists, not redeclaring")
when not declared(js_EraseMsg):
  proc js_EraseMsg*(js: ptr jsCtx_536871414; stream: ptr uint8; seq: uint64;
                    opts: ptr jsOptions_536871639; errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_EraseMsg".}
else:
  static :
    hint("Declaration of " & "js_EraseMsg" & " already exists, not redeclaring")
when not declared(js_GetStreamInfo):
  proc js_GetStreamInfo*(si: ptr ptr jsStreamInfo_536871523; js: ptr jsCtx_536871414;
                         stream: ptr uint8; opts: ptr jsOptions_536871639;
                         errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_GetStreamInfo".}
else:
  static :
    hint("Declaration of " & "js_GetStreamInfo" &
        " already exists, not redeclaring")
when not declared(jsStreamInfo_Destroy):
  proc jsStreamInfo_Destroy*(si: ptr jsStreamInfo_536871523): void {.cdecl,
      importc: "jsStreamInfo_Destroy".}
else:
  static :
    hint("Declaration of " & "jsStreamInfo_Destroy" &
        " already exists, not redeclaring")
when not declared(js_Streams):
  proc js_Streams*(list: ptr ptr jsStreamInfoList_536871527; js: ptr jsCtx_536871414;
                   opts: ptr jsOptions_536871639; errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_Streams".}
else:
  static :
    hint("Declaration of " & "js_Streams" & " already exists, not redeclaring")
when not declared(jsStreamInfoList_Destroy):
  proc jsStreamInfoList_Destroy*(list: ptr jsStreamInfoList_536871527): void {.
      cdecl, importc: "jsStreamInfoList_Destroy".}
else:
  static :
    hint("Declaration of " & "jsStreamInfoList_Destroy" &
        " already exists, not redeclaring")
when not declared(js_StreamNames):
  proc js_StreamNames*(list: ptr ptr jsStreamNamesList_536871531; js: ptr jsCtx_536871414;
                       opts: ptr jsOptions_536871639; errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_StreamNames".}
else:
  static :
    hint("Declaration of " & "js_StreamNames" &
        " already exists, not redeclaring")
when not declared(jsStreamNamesList_Destroy):
  proc jsStreamNamesList_Destroy*(list: ptr jsStreamNamesList_536871531): void {.
      cdecl, importc: "jsStreamNamesList_Destroy".}
else:
  static :
    hint("Declaration of " & "jsStreamNamesList_Destroy" &
        " already exists, not redeclaring")
when not declared(jsConsumerConfig_Init):
  proc jsConsumerConfig_Init*(cc: ptr jsConsumerConfig_536871535): natsStatus_536871378 {.
      cdecl, importc: "jsConsumerConfig_Init".}
else:
  static :
    hint("Declaration of " & "jsConsumerConfig_Init" &
        " already exists, not redeclaring")
when not declared(js_AddConsumer):
  proc js_AddConsumer*(ci: ptr ptr jsConsumerInfo_536871559; js: ptr jsCtx_536871414;
                       stream: ptr uint8; cfg: ptr jsConsumerConfig_536871535;
                       opts: ptr jsOptions_536871639; errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_AddConsumer".}
else:
  static :
    hint("Declaration of " & "js_AddConsumer" &
        " already exists, not redeclaring")
when not declared(js_UpdateConsumer):
  proc js_UpdateConsumer*(ci: ptr ptr jsConsumerInfo_536871559; js: ptr jsCtx_536871414;
                          stream: ptr uint8; cfg: ptr jsConsumerConfig_536871535;
                          opts: ptr jsOptions_536871639; errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_UpdateConsumer".}
else:
  static :
    hint("Declaration of " & "js_UpdateConsumer" &
        " already exists, not redeclaring")
when not declared(js_GetConsumerInfo):
  proc js_GetConsumerInfo*(ci: ptr ptr jsConsumerInfo_536871559; js: ptr jsCtx_536871414;
                           stream: ptr uint8; consumer: ptr uint8;
                           opts: ptr jsOptions_536871639; errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_GetConsumerInfo".}
else:
  static :
    hint("Declaration of " & "js_GetConsumerInfo" &
        " already exists, not redeclaring")
when not declared(js_DeleteConsumer):
  proc js_DeleteConsumer*(js: ptr jsCtx_536871414; stream: ptr uint8;
                          consumer: ptr uint8; opts: ptr jsOptions_536871639;
                          errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_DeleteConsumer".}
else:
  static :
    hint("Declaration of " & "js_DeleteConsumer" &
        " already exists, not redeclaring")
when not declared(js_PauseConsumer):
  proc js_PauseConsumer*(new_cpr: ptr ptr jsConsumerPauseResponse_536871571;
                         js: ptr jsCtx_536871414; stream: ptr uint8;
                         consumer: ptr uint8; pauseUntil: uint64;
                         opts: ptr jsOptions_536871639; errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_PauseConsumer".}
else:
  static :
    hint("Declaration of " & "js_PauseConsumer" &
        " already exists, not redeclaring")
when not declared(jsConsumerPauseResponse_Destroy):
  proc jsConsumerPauseResponse_Destroy*(cpr: ptr jsConsumerPauseResponse_536871571): void {.
      cdecl, importc: "jsConsumerPauseResponse_Destroy".}
else:
  static :
    hint("Declaration of " & "jsConsumerPauseResponse_Destroy" &
        " already exists, not redeclaring")
when not declared(jsConsumerInfo_Destroy):
  proc jsConsumerInfo_Destroy*(ci: ptr jsConsumerInfo_536871559): void {.cdecl,
      importc: "jsConsumerInfo_Destroy".}
else:
  static :
    hint("Declaration of " & "jsConsumerInfo_Destroy" &
        " already exists, not redeclaring")
when not declared(js_Consumers):
  proc js_Consumers*(list: ptr ptr jsConsumerInfoList_536871563; js: ptr jsCtx_536871414;
                     stream: ptr uint8; opts: ptr jsOptions_536871639;
                     errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_Consumers".}
else:
  static :
    hint("Declaration of " & "js_Consumers" & " already exists, not redeclaring")
when not declared(jsConsumerInfoList_Destroy):
  proc jsConsumerInfoList_Destroy*(list: ptr jsConsumerInfoList_536871563): void {.
      cdecl, importc: "jsConsumerInfoList_Destroy".}
else:
  static :
    hint("Declaration of " & "jsConsumerInfoList_Destroy" &
        " already exists, not redeclaring")
when not declared(js_ConsumerNames):
  proc js_ConsumerNames*(list: ptr ptr jsConsumerNamesList_536871567;
                         js: ptr jsCtx_536871414; stream: ptr uint8;
                         opts: ptr jsOptions_536871639; errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_ConsumerNames".}
else:
  static :
    hint("Declaration of " & "js_ConsumerNames" &
        " already exists, not redeclaring")
when not declared(jsConsumerNamesList_Destroy):
  proc jsConsumerNamesList_Destroy*(list: ptr jsConsumerNamesList_536871567): void {.
      cdecl, importc: "jsConsumerNamesList_Destroy".}
else:
  static :
    hint("Declaration of " & "jsConsumerNamesList_Destroy" &
        " already exists, not redeclaring")
when not declared(js_GetAccountInfo):
  proc js_GetAccountInfo*(ai: ptr ptr jsAccountInfo_536871587; js: ptr jsCtx_536871414;
                          opts: ptr jsOptions_536871639; errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_GetAccountInfo".}
else:
  static :
    hint("Declaration of " & "js_GetAccountInfo" &
        " already exists, not redeclaring")
when not declared(jsAccountInfo_Destroy):
  proc jsAccountInfo_Destroy*(ai: ptr jsAccountInfo_536871587): void {.cdecl,
      importc: "jsAccountInfo_Destroy".}
else:
  static :
    hint("Declaration of " & "jsAccountInfo_Destroy" &
        " already exists, not redeclaring")
when not declared(jsPubOptions_Init):
  proc jsPubOptions_Init*(opts: ptr jsPubOptions_536871420): natsStatus_536871378 {.
      cdecl, importc: "jsPubOptions_Init".}
else:
  static :
    hint("Declaration of " & "jsPubOptions_Init" &
        " already exists, not redeclaring")
when not declared(js_Publish):
  proc js_Publish*(pubAck: ptr ptr jsPubAck_536871595; js: ptr jsCtx_536871414;
                   subj: ptr uint8; data: pointer; dataLen: cint;
                   opts: ptr jsPubOptions_536871420; errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_Publish".}
else:
  static :
    hint("Declaration of " & "js_Publish" & " already exists, not redeclaring")
when not declared(js_PublishMsg):
  proc js_PublishMsg*(pubAck: ptr ptr jsPubAck_536871595; js: ptr jsCtx_536871414;
                      msg: ptr natsMsg_536871392; opts: ptr jsPubOptions_536871420;
                      errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_PublishMsg".}
else:
  static :
    hint("Declaration of " & "js_PublishMsg" &
        " already exists, not redeclaring")
when not declared(jsPubAck_Destroy):
  proc jsPubAck_Destroy*(pubAck: ptr jsPubAck_536871595): void {.cdecl,
      importc: "jsPubAck_Destroy".}
else:
  static :
    hint("Declaration of " & "jsPubAck_Destroy" &
        " already exists, not redeclaring")
when not declared(js_PublishAsync):
  proc js_PublishAsync*(js: ptr jsCtx_536871414; subj: ptr uint8; data: pointer;
                        dataLen: cint; opts: ptr jsPubOptions_536871420): natsStatus_536871378 {.
      cdecl, importc: "js_PublishAsync".}
else:
  static :
    hint("Declaration of " & "js_PublishAsync" &
        " already exists, not redeclaring")
when not declared(js_PublishMsgAsync):
  proc js_PublishMsgAsync*(js: ptr jsCtx_536871414; msg: ptr ptr natsMsg_536871392;
                           opts: ptr jsPubOptions_536871420): natsStatus_536871378 {.
      cdecl, importc: "js_PublishMsgAsync".}
else:
  static :
    hint("Declaration of " & "js_PublishMsgAsync" &
        " already exists, not redeclaring")
when not declared(js_PublishAsyncComplete):
  proc js_PublishAsyncComplete*(js: ptr jsCtx_536871414; opts: ptr jsPubOptions_536871420): natsStatus_536871378 {.
      cdecl, importc: "js_PublishAsyncComplete".}
else:
  static :
    hint("Declaration of " & "js_PublishAsyncComplete" &
        " already exists, not redeclaring")
when not declared(js_PublishAsyncGetPendingList):
  proc js_PublishAsyncGetPendingList*(pending: ptr natsMsgList_536871408;
                                      js: ptr jsCtx_536871414): natsStatus_536871378 {.
      cdecl, importc: "js_PublishAsyncGetPendingList".}
else:
  static :
    hint("Declaration of " & "js_PublishAsyncGetPendingList" &
        " already exists, not redeclaring")
when not declared(js_BatchPublishStart):
  proc js_BatchPublishStart*(ctx: ptr ptr jsAtomicBatchCtx_536871416;
                             new_puback: ptr ptr jsPubAck_536871595;
                             js: ptr jsCtx_536871414; msg: ptr natsMsg_536871392;
                             opts: ptr jsPubOptions_536871420;
                             errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_BatchPublishStart".}
else:
  static :
    hint("Declaration of " & "js_BatchPublishStart" &
        " already exists, not redeclaring")
when not declared(js_BatchPublishAdd):
  proc js_BatchPublishAdd*(new_puback: ptr ptr jsPubAck_536871595;
                           ctx: ptr jsAtomicBatchCtx_536871416;
                           msg: ptr natsMsg_536871392; opts: ptr jsPubOptions_536871420;
                           errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_BatchPublishAdd".}
else:
  static :
    hint("Declaration of " & "js_BatchPublishAdd" &
        " already exists, not redeclaring")
when not declared(js_BatchPublishCommit):
  proc js_BatchPublishCommit*(new_puback: ptr ptr jsPubAck_536871595;
                              ctx: ptr jsAtomicBatchCtx_536871416;
                              msg: ptr natsMsg_536871392;
                              opts: ptr jsPubOptions_536871420;
                              errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_BatchPublishCommit".}
else:
  static :
    hint("Declaration of " & "js_BatchPublishCommit" &
        " already exists, not redeclaring")
when not declared(jsAtomicBatchCtx_Destroy):
  proc jsAtomicBatchCtx_Destroy*(ctx: ptr jsAtomicBatchCtx_536871416): void {.
      cdecl, importc: "jsAtomicBatchCtx_Destroy".}
else:
  static :
    hint("Declaration of " & "jsAtomicBatchCtx_Destroy" &
        " already exists, not redeclaring")
when not declared(jsSubOptions_Init):
  proc jsSubOptions_Init*(opts: ptr jsSubOptions_536871543): natsStatus_536871378 {.
      cdecl, importc: "jsSubOptions_Init".}
else:
  static :
    hint("Declaration of " & "jsSubOptions_Init" &
        " already exists, not redeclaring")
when not declared(js_Subscribe):
  proc js_Subscribe*(sub: ptr ptr natsSubscription_536871390; js: ptr jsCtx_536871414;
                     subject: ptr uint8; cb: natsMsgHandler_536871725;
                     cbClosure: pointer; opts: ptr jsOptions_536871639;
                     subOpts: ptr jsSubOptions_536871543; errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_Subscribe".}
else:
  static :
    hint("Declaration of " & "js_Subscribe" & " already exists, not redeclaring")
when not declared(js_SubscribeMulti):
  proc js_SubscribeMulti*(sub: ptr ptr natsSubscription_536871390;
                          js: ptr jsCtx_536871414; subjects: ptr ptr uint8;
                          numSubjects: cint; cb: natsMsgHandler_536871725;
                          cbClosure: pointer; opts: ptr jsOptions_536871639;
                          subOpts: ptr jsSubOptions_536871543;
                          errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_SubscribeMulti".}
else:
  static :
    hint("Declaration of " & "js_SubscribeMulti" &
        " already exists, not redeclaring")
when not declared(js_SubscribeSync):
  proc js_SubscribeSync*(sub: ptr ptr natsSubscription_536871390; js: ptr jsCtx_536871414;
                         subject: ptr uint8; opts: ptr jsOptions_536871639;
                         subOpts: ptr jsSubOptions_536871543;
                         errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_SubscribeSync".}
else:
  static :
    hint("Declaration of " & "js_SubscribeSync" &
        " already exists, not redeclaring")
when not declared(js_SubscribeSyncMulti):
  proc js_SubscribeSyncMulti*(sub: ptr ptr natsSubscription_536871390;
                              js: ptr jsCtx_536871414; subjects: ptr ptr uint8;
                              numSubjects: cint; opts: ptr jsOptions_536871639;
                              subOpts: ptr jsSubOptions_536871543;
                              errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_SubscribeSyncMulti".}
else:
  static :
    hint("Declaration of " & "js_SubscribeSyncMulti" &
        " already exists, not redeclaring")
when not declared(js_PullSubscribe):
  proc js_PullSubscribe*(sub: ptr ptr natsSubscription_536871390; js: ptr jsCtx_536871414;
                         subject: ptr uint8; durable: ptr uint8;
                         opts: ptr jsOptions_536871639;
                         subOpts: ptr jsSubOptions_536871543;
                         errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_PullSubscribe".}
else:
  static :
    hint("Declaration of " & "js_PullSubscribe" &
        " already exists, not redeclaring")
when not declared(natsSubscription_Fetch):
  proc natsSubscription_Fetch*(list: ptr natsMsgList_536871408;
                               sub: ptr natsSubscription_536871390; batch: cint;
                               timeout: int64; errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "natsSubscription_Fetch".}
else:
  static :
    hint("Declaration of " & "natsSubscription_Fetch" &
        " already exists, not redeclaring")
when not declared(jsFetchRequest_Init):
  proc jsFetchRequest_Init*(request: ptr jsFetchRequest_536871611): natsStatus_536871378 {.
      cdecl, importc: "jsFetchRequest_Init".}
else:
  static :
    hint("Declaration of " & "jsFetchRequest_Init" &
        " already exists, not redeclaring")
when not declared(js_PullSubscribeAsync):
  proc js_PullSubscribeAsync*(newsub: ptr ptr natsSubscription_536871390;
                              js: ptr jsCtx_536871414; subject: ptr uint8;
                              durable: ptr uint8; msgCB: natsMsgHandler_536871725;
                              msgCBClosure: pointer; jsOpts: ptr jsOptions_536871639;
                              opts: ptr jsSubOptions_536871543;
                              errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_PullSubscribeAsync".}
else:
  static :
    hint("Declaration of " & "js_PullSubscribeAsync" &
        " already exists, not redeclaring")
when not declared(natsSubscription_FetchRequest):
  proc natsSubscription_FetchRequest*(list: ptr natsMsgList_536871408;
                                      sub: ptr natsSubscription_536871390;
                                      request: ptr jsFetchRequest_536871611): natsStatus_536871378 {.
      cdecl, importc: "natsSubscription_FetchRequest".}
else:
  static :
    hint("Declaration of " & "natsSubscription_FetchRequest" &
        " already exists, not redeclaring")
when not declared(js_UnpinConsumer):
  proc js_UnpinConsumer*(js: ptr jsCtx_536871414; stream: ptr uint8;
                         consumer: ptr uint8; group: ptr uint8;
                         opts: ptr jsOptions_536871639; errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "js_UnpinConsumer".}
else:
  static :
    hint("Declaration of " & "js_UnpinConsumer" &
        " already exists, not redeclaring")
when not declared(natsSubscription_GetConsumerInfo):
  proc natsSubscription_GetConsumerInfo*(ci: ptr ptr jsConsumerInfo_536871559;
      sub: ptr natsSubscription_536871390; opts: ptr jsOptions_536871639;
      errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.cdecl,
      importc: "natsSubscription_GetConsumerInfo".}
else:
  static :
    hint("Declaration of " & "natsSubscription_GetConsumerInfo" &
        " already exists, not redeclaring")
when not declared(natsSubscription_GetSequenceMismatch):
  proc natsSubscription_GetSequenceMismatch*(
      csm: ptr jsConsumerSequenceMismatch_536871539; sub: ptr natsSubscription_536871390): natsStatus_536871378 {.
      cdecl, importc: "natsSubscription_GetSequenceMismatch".}
else:
  static :
    hint("Declaration of " & "natsSubscription_GetSequenceMismatch" &
        " already exists, not redeclaring")
when not declared(natsMsg_GetMetaData):
  proc natsMsg_GetMetaData*(new_meta: ptr ptr jsMsgMetaData_536871591;
                            msg: ptr natsMsg_536871392): natsStatus_536871378 {.
      cdecl, importc: "natsMsg_GetMetaData".}
else:
  static :
    hint("Declaration of " & "natsMsg_GetMetaData" &
        " already exists, not redeclaring")
when not declared(jsMsgMetaData_Destroy):
  proc jsMsgMetaData_Destroy*(meta: ptr jsMsgMetaData_536871591): void {.cdecl,
      importc: "jsMsgMetaData_Destroy".}
else:
  static :
    hint("Declaration of " & "jsMsgMetaData_Destroy" &
        " already exists, not redeclaring")
when not declared(natsMsg_Ack):
  proc natsMsg_Ack*(msg: ptr natsMsg_536871392; opts: ptr jsOptions_536871639): natsStatus_536871378 {.
      cdecl, importc: "natsMsg_Ack".}
else:
  static :
    hint("Declaration of " & "natsMsg_Ack" & " already exists, not redeclaring")
when not declared(natsMsg_AckSync):
  proc natsMsg_AckSync*(msg: ptr natsMsg_536871392; opts: ptr jsOptions_536871639;
                        errCode: ptr jsErrCode_536871382): natsStatus_536871378 {.
      cdecl, importc: "natsMsg_AckSync".}
else:
  static :
    hint("Declaration of " & "natsMsg_AckSync" &
        " already exists, not redeclaring")
when not declared(natsMsg_Nak):
  proc natsMsg_Nak*(msg: ptr natsMsg_536871392; opts: ptr jsOptions_536871639): natsStatus_536871378 {.
      cdecl, importc: "natsMsg_Nak".}
else:
  static :
    hint("Declaration of " & "natsMsg_Nak" & " already exists, not redeclaring")
when not declared(natsMsg_NakWithDelay):
  proc natsMsg_NakWithDelay*(msg: ptr natsMsg_536871392; delay: int64;
                             opts: ptr jsOptions_536871639): natsStatus_536871378 {.
      cdecl, importc: "natsMsg_NakWithDelay".}
else:
  static :
    hint("Declaration of " & "natsMsg_NakWithDelay" &
        " already exists, not redeclaring")
when not declared(natsMsg_InProgress):
  proc natsMsg_InProgress*(msg: ptr natsMsg_536871392; opts: ptr jsOptions_536871639): natsStatus_536871378 {.
      cdecl, importc: "natsMsg_InProgress".}
else:
  static :
    hint("Declaration of " & "natsMsg_InProgress" &
        " already exists, not redeclaring")
when not declared(natsMsg_Term):
  proc natsMsg_Term*(msg: ptr natsMsg_536871392; opts: ptr jsOptions_536871639): natsStatus_536871378 {.
      cdecl, importc: "natsMsg_Term".}
else:
  static :
    hint("Declaration of " & "natsMsg_Term" & " already exists, not redeclaring")
when not declared(natsMsg_GetSequence):
  proc natsMsg_GetSequence*(msg: ptr natsMsg_536871392): uint64 {.cdecl,
      importc: "natsMsg_GetSequence".}
else:
  static :
    hint("Declaration of " & "natsMsg_GetSequence" &
        " already exists, not redeclaring")
when not declared(natsMsg_GetTime):
  proc natsMsg_GetTime*(msg: ptr natsMsg_536871392): int64 {.cdecl,
      importc: "natsMsg_GetTime".}
else:
  static :
    hint("Declaration of " & "natsMsg_GetTime" &
        " already exists, not redeclaring")
when not declared(kvConfig_Init):
  proc kvConfig_Init*(cfg: ptr kvConfig_536871655): natsStatus_536871378 {.
      cdecl, importc: "kvConfig_Init".}
else:
  static :
    hint("Declaration of " & "kvConfig_Init" &
        " already exists, not redeclaring")
when not declared(js_CreateKeyValue):
  proc js_CreateKeyValue*(new_kv: ptr ptr kvStore_536871641; js: ptr jsCtx_536871414;
                          cfg: ptr kvConfig_536871655): natsStatus_536871378 {.
      cdecl, importc: "js_CreateKeyValue".}
else:
  static :
    hint("Declaration of " & "js_CreateKeyValue" &
        " already exists, not redeclaring")
when not declared(js_KeyValue):
  proc js_KeyValue*(new_kv: ptr ptr kvStore_536871641; js: ptr jsCtx_536871414;
                    bucket: ptr uint8): natsStatus_536871378 {.cdecl,
      importc: "js_KeyValue".}
else:
  static :
    hint("Declaration of " & "js_KeyValue" & " already exists, not redeclaring")
when not declared(js_DeleteKeyValue):
  proc js_DeleteKeyValue*(js: ptr jsCtx_536871414; bucket: ptr uint8): natsStatus_536871378 {.
      cdecl, importc: "js_DeleteKeyValue".}
else:
  static :
    hint("Declaration of " & "js_DeleteKeyValue" &
        " already exists, not redeclaring")
when not declared(kvStore_Destroy):
  proc kvStore_Destroy*(kv: ptr kvStore_536871641): void {.cdecl,
      importc: "kvStore_Destroy".}
else:
  static :
    hint("Declaration of " & "kvStore_Destroy" &
        " already exists, not redeclaring")
when not declared(kvEntry_Bucket):
  proc kvEntry_Bucket*(e: ptr kvEntry_536871643): ptr uint8 {.cdecl,
      importc: "kvEntry_Bucket".}
else:
  static :
    hint("Declaration of " & "kvEntry_Bucket" &
        " already exists, not redeclaring")
when not declared(kvEntry_Key):
  proc kvEntry_Key*(e: ptr kvEntry_536871643): ptr uint8 {.cdecl,
      importc: "kvEntry_Key".}
else:
  static :
    hint("Declaration of " & "kvEntry_Key" & " already exists, not redeclaring")
when not declared(kvEntry_Value):
  proc kvEntry_Value*(e: ptr kvEntry_536871643): pointer {.cdecl,
      importc: "kvEntry_Value".}
else:
  static :
    hint("Declaration of " & "kvEntry_Value" &
        " already exists, not redeclaring")
when not declared(kvEntry_ValueLen):
  proc kvEntry_ValueLen*(e: ptr kvEntry_536871643): cint {.cdecl,
      importc: "kvEntry_ValueLen".}
else:
  static :
    hint("Declaration of " & "kvEntry_ValueLen" &
        " already exists, not redeclaring")
when not declared(kvEntry_ValueString):
  proc kvEntry_ValueString*(e: ptr kvEntry_536871643): ptr uint8 {.cdecl,
      importc: "kvEntry_ValueString".}
else:
  static :
    hint("Declaration of " & "kvEntry_ValueString" &
        " already exists, not redeclaring")
when not declared(kvEntry_Revision):
  proc kvEntry_Revision*(e: ptr kvEntry_536871643): uint64 {.cdecl,
      importc: "kvEntry_Revision".}
else:
  static :
    hint("Declaration of " & "kvEntry_Revision" &
        " already exists, not redeclaring")
when not declared(kvEntry_Created):
  proc kvEntry_Created*(e: ptr kvEntry_536871643): int64 {.cdecl,
      importc: "kvEntry_Created".}
else:
  static :
    hint("Declaration of " & "kvEntry_Created" &
        " already exists, not redeclaring")
when not declared(kvEntry_Delta):
  proc kvEntry_Delta*(e: ptr kvEntry_536871643): uint64 {.cdecl,
      importc: "kvEntry_Delta".}
else:
  static :
    hint("Declaration of " & "kvEntry_Delta" &
        " already exists, not redeclaring")
when not declared(kvEntry_Operation):
  proc kvEntry_Operation*(e: ptr kvEntry_536871643): kvOperation_536871651 {.
      cdecl, importc: "kvEntry_Operation".}
else:
  static :
    hint("Declaration of " & "kvEntry_Operation" &
        " already exists, not redeclaring")
when not declared(kvEntry_Destroy):
  proc kvEntry_Destroy*(e: ptr kvEntry_536871643): void {.cdecl,
      importc: "kvEntry_Destroy".}
else:
  static :
    hint("Declaration of " & "kvEntry_Destroy" &
        " already exists, not redeclaring")
when not declared(kvStore_Get):
  proc kvStore_Get*(new_entry: ptr ptr kvEntry_536871643; kv: ptr kvStore_536871641;
                    key: ptr uint8): natsStatus_536871378 {.cdecl,
      importc: "kvStore_Get".}
else:
  static :
    hint("Declaration of " & "kvStore_Get" & " already exists, not redeclaring")
when not declared(kvStore_GetRevision):
  proc kvStore_GetRevision*(new_entry: ptr ptr kvEntry_536871643;
                            kv: ptr kvStore_536871641; key: ptr uint8;
                            revision: uint64): natsStatus_536871378 {.cdecl,
      importc: "kvStore_GetRevision".}
else:
  static :
    hint("Declaration of " & "kvStore_GetRevision" &
        " already exists, not redeclaring")
when not declared(kvStore_Put):
  proc kvStore_Put*(rev: ptr uint64; kv: ptr kvStore_536871641; key: ptr uint8;
                    data: pointer; len: cint): natsStatus_536871378 {.cdecl,
      importc: "kvStore_Put".}
else:
  static :
    hint("Declaration of " & "kvStore_Put" & " already exists, not redeclaring")
when not declared(kvStore_PutString):
  proc kvStore_PutString*(rev: ptr uint64; kv: ptr kvStore_536871641;
                          key: ptr uint8; data: ptr uint8): natsStatus_536871378 {.
      cdecl, importc: "kvStore_PutString".}
else:
  static :
    hint("Declaration of " & "kvStore_PutString" &
        " already exists, not redeclaring")
when not declared(kvStore_Create):
  proc kvStore_Create*(rev: ptr uint64; kv: ptr kvStore_536871641;
                       key: ptr uint8; data: pointer; len: cint): natsStatus_536871378 {.
      cdecl, importc: "kvStore_Create".}
else:
  static :
    hint("Declaration of " & "kvStore_Create" &
        " already exists, not redeclaring")
when not declared(kvStore_CreateString):
  proc kvStore_CreateString*(rev: ptr uint64; kv: ptr kvStore_536871641;
                             key: ptr uint8; data: ptr uint8): natsStatus_536871378 {.
      cdecl, importc: "kvStore_CreateString".}
else:
  static :
    hint("Declaration of " & "kvStore_CreateString" &
        " already exists, not redeclaring")
when not declared(kvStore_Update):
  proc kvStore_Update*(rev: ptr uint64; kv: ptr kvStore_536871641;
                       key: ptr uint8; data: pointer; len: cint; last: uint64): natsStatus_536871378 {.
      cdecl, importc: "kvStore_Update".}
else:
  static :
    hint("Declaration of " & "kvStore_Update" &
        " already exists, not redeclaring")
when not declared(kvStore_UpdateString):
  proc kvStore_UpdateString*(rev: ptr uint64; kv: ptr kvStore_536871641;
                             key: ptr uint8; data: ptr uint8; last: uint64): natsStatus_536871378 {.
      cdecl, importc: "kvStore_UpdateString".}
else:
  static :
    hint("Declaration of " & "kvStore_UpdateString" &
        " already exists, not redeclaring")
when not declared(kvStore_Delete):
  proc kvStore_Delete*(kv: ptr kvStore_536871641; key: ptr uint8): natsStatus_536871378 {.
      cdecl, importc: "kvStore_Delete".}
else:
  static :
    hint("Declaration of " & "kvStore_Delete" &
        " already exists, not redeclaring")
when not declared(kvStore_Purge):
  proc kvStore_Purge*(kv: ptr kvStore_536871641; key: ptr uint8;
                      opts: ptr kvPurgeOptions_536871663): natsStatus_536871378 {.
      cdecl, importc: "kvStore_Purge".}
else:
  static :
    hint("Declaration of " & "kvStore_Purge" &
        " already exists, not redeclaring")
when not declared(kvWatchOptions_Init):
  proc kvWatchOptions_Init*(opts: ptr kvWatchOptions_536871659): natsStatus_536871378 {.
      cdecl, importc: "kvWatchOptions_Init".}
else:
  static :
    hint("Declaration of " & "kvWatchOptions_Init" &
        " already exists, not redeclaring")
when not declared(kvPurgeOptions_Init):
  proc kvPurgeOptions_Init*(opts: ptr kvPurgeOptions_536871663): natsStatus_536871378 {.
      cdecl, importc: "kvPurgeOptions_Init".}
else:
  static :
    hint("Declaration of " & "kvPurgeOptions_Init" &
        " already exists, not redeclaring")
when not declared(kvStore_PurgeDeletes):
  proc kvStore_PurgeDeletes*(kv: ptr kvStore_536871641; opts: ptr kvPurgeOptions_536871663): natsStatus_536871378 {.
      cdecl, importc: "kvStore_PurgeDeletes".}
else:
  static :
    hint("Declaration of " & "kvStore_PurgeDeletes" &
        " already exists, not redeclaring")
when not declared(kvStore_Watch):
  proc kvStore_Watch*(new_watcher: ptr ptr kvWatcher_536871647; kv: ptr kvStore_536871641;
                      keys: ptr uint8; opts: ptr kvWatchOptions_536871659): natsStatus_536871378 {.
      cdecl, importc: "kvStore_Watch".}
else:
  static :
    hint("Declaration of " & "kvStore_Watch" &
        " already exists, not redeclaring")
when not declared(kvStore_WatchMulti):
  proc kvStore_WatchMulti*(new_watcher: ptr ptr kvWatcher_536871647;
                           kv: ptr kvStore_536871641; keys: ptr ptr uint8;
                           numKeys: cint; opts: ptr kvWatchOptions_536871659): natsStatus_536871378 {.
      cdecl, importc: "kvStore_WatchMulti".}
else:
  static :
    hint("Declaration of " & "kvStore_WatchMulti" &
        " already exists, not redeclaring")
when not declared(kvStore_WatchAll):
  proc kvStore_WatchAll*(new_watcher: ptr ptr kvWatcher_536871647;
                         kv: ptr kvStore_536871641; opts: ptr kvWatchOptions_536871659): natsStatus_536871378 {.
      cdecl, importc: "kvStore_WatchAll".}
else:
  static :
    hint("Declaration of " & "kvStore_WatchAll" &
        " already exists, not redeclaring")
when not declared(kvStore_Keys):
  proc kvStore_Keys*(list: ptr kvKeysList_536871671; kv: ptr kvStore_536871641;
                     opts: ptr kvWatchOptions_536871659): natsStatus_536871378 {.
      cdecl, importc: "kvStore_Keys".}
else:
  static :
    hint("Declaration of " & "kvStore_Keys" & " already exists, not redeclaring")
when not declared(kvStore_KeysWithFilters):
  proc kvStore_KeysWithFilters*(list: ptr kvKeysList_536871671; kv: ptr kvStore_536871641;
                                filters: ptr ptr uint8; numFilters: cint;
                                opts: ptr kvWatchOptions_536871659): natsStatus_536871378 {.
      cdecl, importc: "kvStore_KeysWithFilters".}
else:
  static :
    hint("Declaration of " & "kvStore_KeysWithFilters" &
        " already exists, not redeclaring")
when not declared(kvKeysList_Destroy):
  proc kvKeysList_Destroy*(list: ptr kvKeysList_536871671): void {.cdecl,
      importc: "kvKeysList_Destroy".}
else:
  static :
    hint("Declaration of " & "kvKeysList_Destroy" &
        " already exists, not redeclaring")
when not declared(kvStore_History):
  proc kvStore_History*(list: ptr kvEntryList_536871667; kv: ptr kvStore_536871641;
                        key: ptr uint8; opts: ptr kvWatchOptions_536871659): natsStatus_536871378 {.
      cdecl, importc: "kvStore_History".}
else:
  static :
    hint("Declaration of " & "kvStore_History" &
        " already exists, not redeclaring")
when not declared(kvEntryList_Destroy):
  proc kvEntryList_Destroy*(list: ptr kvEntryList_536871667): void {.cdecl,
      importc: "kvEntryList_Destroy".}
else:
  static :
    hint("Declaration of " & "kvEntryList_Destroy" &
        " already exists, not redeclaring")
when not declared(kvStore_Bucket):
  proc kvStore_Bucket*(kv: ptr kvStore_536871641): ptr uint8 {.cdecl,
      importc: "kvStore_Bucket".}
else:
  static :
    hint("Declaration of " & "kvStore_Bucket" &
        " already exists, not redeclaring")
when not declared(kvStore_Status):
  proc kvStore_Status*(new_status: ptr ptr kvStatus_536871645; kv: ptr kvStore_536871641): natsStatus_536871378 {.
      cdecl, importc: "kvStore_Status".}
else:
  static :
    hint("Declaration of " & "kvStore_Status" &
        " already exists, not redeclaring")
when not declared(kvWatcher_Next):
  proc kvWatcher_Next*(new_entry: ptr ptr kvEntry_536871643; w: ptr kvWatcher_536871647;
                       timeout: int64): natsStatus_536871378 {.cdecl,
      importc: "kvWatcher_Next".}
else:
  static :
    hint("Declaration of " & "kvWatcher_Next" &
        " already exists, not redeclaring")
when not declared(kvWatcher_Stop):
  proc kvWatcher_Stop*(w: ptr kvWatcher_536871647): natsStatus_536871378 {.
      cdecl, importc: "kvWatcher_Stop".}
else:
  static :
    hint("Declaration of " & "kvWatcher_Stop" &
        " already exists, not redeclaring")
when not declared(kvWatcher_Destroy):
  proc kvWatcher_Destroy*(w: ptr kvWatcher_536871647): void {.cdecl,
      importc: "kvWatcher_Destroy".}
else:
  static :
    hint("Declaration of " & "kvWatcher_Destroy" &
        " already exists, not redeclaring")
when not declared(kvStatus_Bucket):
  proc kvStatus_Bucket*(sts: ptr kvStatus_536871645): ptr uint8 {.cdecl,
      importc: "kvStatus_Bucket".}
else:
  static :
    hint("Declaration of " & "kvStatus_Bucket" &
        " already exists, not redeclaring")
when not declared(kvStatus_Values):
  proc kvStatus_Values*(sts: ptr kvStatus_536871645): uint64 {.cdecl,
      importc: "kvStatus_Values".}
else:
  static :
    hint("Declaration of " & "kvStatus_Values" &
        " already exists, not redeclaring")
when not declared(kvStatus_History):
  proc kvStatus_History*(sts: ptr kvStatus_536871645): int64 {.cdecl,
      importc: "kvStatus_History".}
else:
  static :
    hint("Declaration of " & "kvStatus_History" &
        " already exists, not redeclaring")
when not declared(kvStatus_TTL):
  proc kvStatus_TTL*(sts: ptr kvStatus_536871645): int64 {.cdecl,
      importc: "kvStatus_TTL".}
else:
  static :
    hint("Declaration of " & "kvStatus_TTL" & " already exists, not redeclaring")
when not declared(kvStatus_Replicas):
  proc kvStatus_Replicas*(sts: ptr kvStatus_536871645): int64 {.cdecl,
      importc: "kvStatus_Replicas".}
else:
  static :
    hint("Declaration of " & "kvStatus_Replicas" &
        " already exists, not redeclaring")
when not declared(kvStatus_Bytes):
  proc kvStatus_Bytes*(sts: ptr kvStatus_536871645): uint64 {.cdecl,
      importc: "kvStatus_Bytes".}
else:
  static :
    hint("Declaration of " & "kvStatus_Bytes" &
        " already exists, not redeclaring")
when not declared(kvStatus_Destroy):
  proc kvStatus_Destroy*(sts: ptr kvStatus_536871645): void {.cdecl,
      importc: "kvStatus_Destroy".}
else:
  static :
    hint("Declaration of " & "kvStatus_Destroy" &
        " already exists, not redeclaring")
when not declared(objStoreConfig_Init):
  proc objStoreConfig_Init*(cfg: ptr objStoreConfig_536871683): natsStatus_536871378 {.
      cdecl, importc: "objStoreConfig_Init".}
else:
  static :
    hint("Declaration of " & "objStoreConfig_Init" &
        " already exists, not redeclaring")
when not declared(js_CreateObjectStore):
  proc js_CreateObjectStore*(new_obs: ptr ptr objStore_536871673; js: ptr jsCtx_536871414;
                             cfg: ptr objStoreConfig_536871683): natsStatus_536871378 {.
      cdecl, importc: "js_CreateObjectStore".}
else:
  static :
    hint("Declaration of " & "js_CreateObjectStore" &
        " already exists, not redeclaring")
when not declared(js_UpdateObjectStore):
  proc js_UpdateObjectStore*(new_obs: ptr ptr objStore_536871673; js: ptr jsCtx_536871414;
                             cfg: ptr objStoreConfig_536871683): natsStatus_536871378 {.
      cdecl, importc: "js_UpdateObjectStore".}
else:
  static :
    hint("Declaration of " & "js_UpdateObjectStore" &
        " already exists, not redeclaring")
when not declared(js_ObjectStore):
  proc js_ObjectStore*(new_obs: ptr ptr objStore_536871673; js: ptr jsCtx_536871414;
                       bucket: ptr uint8): natsStatus_536871378 {.cdecl,
      importc: "js_ObjectStore".}
else:
  static :
    hint("Declaration of " & "js_ObjectStore" &
        " already exists, not redeclaring")
when not declared(js_ObjectStoreNames):
  proc js_ObjectStoreNames*(new_list: ptr ptr objStoreNamesList_536871687;
                            js: ptr jsCtx_536871414): natsStatus_536871378 {.
      cdecl, importc: "js_ObjectStoreNames".}
else:
  static :
    hint("Declaration of " & "js_ObjectStoreNames" &
        " already exists, not redeclaring")
when not declared(objStoreNamesList_Destroy):
  proc objStoreNamesList_Destroy*(list: ptr objStoreNamesList_536871687): void {.
      cdecl, importc: "objStoreNamesList_Destroy".}
else:
  static :
    hint("Declaration of " & "objStoreNamesList_Destroy" &
        " already exists, not redeclaring")
when not declared(js_ObjectStoreStatuses):
  proc js_ObjectStoreStatuses*(new_list: ptr ptr objStoreStatusesList_536871695;
                               js: ptr jsCtx_536871414): natsStatus_536871378 {.
      cdecl, importc: "js_ObjectStoreStatuses".}
else:
  static :
    hint("Declaration of " & "js_ObjectStoreStatuses" &
        " already exists, not redeclaring")
when not declared(objStoreStatusesList_Destroy):
  proc objStoreStatusesList_Destroy*(list: ptr objStoreStatusesList_536871695): void {.
      cdecl, importc: "objStoreStatusesList_Destroy".}
else:
  static :
    hint("Declaration of " & "objStoreStatusesList_Destroy" &
        " already exists, not redeclaring")
when not declared(js_DeleteObjectStore):
  proc js_DeleteObjectStore*(js: ptr jsCtx_536871414; bucket: ptr uint8): natsStatus_536871378 {.
      cdecl, importc: "js_DeleteObjectStore".}
else:
  static :
    hint("Declaration of " & "js_DeleteObjectStore" &
        " already exists, not redeclaring")
when not declared(objStoreOptions_Init):
  proc objStoreOptions_Init*(opts: ptr objStoreOptions_536871719): natsStatus_536871378 {.
      cdecl, importc: "objStoreOptions_Init".}
else:
  static :
    hint("Declaration of " & "objStoreOptions_Init" &
        " already exists, not redeclaring")
when not declared(objStore_GetInfo):
  proc objStore_GetInfo*(new_info: ptr ptr objStoreInfo_536871711;
                         obs: ptr objStore_536871673; name: ptr uint8;
                         opts: ptr objStoreOptions_536871719): natsStatus_536871378 {.
      cdecl, importc: "objStore_GetInfo".}
else:
  static :
    hint("Declaration of " & "objStore_GetInfo" &
        " already exists, not redeclaring")
when not declared(objStoreInfo_Destroy):
  proc objStoreInfo_Destroy*(info: ptr objStoreInfo_536871711): void {.cdecl,
      importc: "objStoreInfo_Destroy".}
else:
  static :
    hint("Declaration of " & "objStoreInfo_Destroy" &
        " already exists, not redeclaring")
when not declared(objStore_UpdateMeta):
  proc objStore_UpdateMeta*(obs: ptr objStore_536871673; name: ptr uint8;
                            meta: ptr objStoreMeta_536871707): natsStatus_536871378 {.
      cdecl, importc: "objStore_UpdateMeta".}
else:
  static :
    hint("Declaration of " & "objStore_UpdateMeta" &
        " already exists, not redeclaring")
when not declared(objStore_Delete):
  proc objStore_Delete*(obs: ptr objStore_536871673; name: ptr uint8): natsStatus_536871378 {.
      cdecl, importc: "objStore_Delete".}
else:
  static :
    hint("Declaration of " & "objStore_Delete" &
        " already exists, not redeclaring")
when not declared(objStore_AddLink):
  proc objStore_AddLink*(new_info: ptr ptr objStoreInfo_536871711;
                         obs: ptr objStore_536871673; name: ptr uint8;
                         obj: ptr objStoreInfo_536871711): natsStatus_536871378 {.
      cdecl, importc: "objStore_AddLink".}
else:
  static :
    hint("Declaration of " & "objStore_AddLink" &
        " already exists, not redeclaring")
when not declared(objStore_AddBucketLink):
  proc objStore_AddBucketLink*(new_info: ptr ptr objStoreInfo_536871711;
                               obs: ptr objStore_536871673; name: ptr uint8;
                               bucket: ptr objStore_536871673): natsStatus_536871378 {.
      cdecl, importc: "objStore_AddBucketLink".}
else:
  static :
    hint("Declaration of " & "objStore_AddBucketLink" &
        " already exists, not redeclaring")
when not declared(objStore_Seal):
  proc objStore_Seal*(obs: ptr objStore_536871673): natsStatus_536871378 {.
      cdecl, importc: "objStore_Seal".}
else:
  static :
    hint("Declaration of " & "objStore_Seal" &
        " already exists, not redeclaring")
when not declared(objStoreWatchOptions_Init):
  proc objStoreWatchOptions_Init*(opts: ptr objStoreWatchOptions_536871723): natsStatus_536871378 {.
      cdecl, importc: "objStoreWatchOptions_Init".}
else:
  static :
    hint("Declaration of " & "objStoreWatchOptions_Init" &
        " already exists, not redeclaring")
when not declared(objStore_Watch):
  proc objStore_Watch*(new_watcher: ptr ptr objStoreWatcher_536871679;
                       obs: ptr objStore_536871673;
                       opts: ptr objStoreWatchOptions_536871723): natsStatus_536871378 {.
      cdecl, importc: "objStore_Watch".}
else:
  static :
    hint("Declaration of " & "objStore_Watch" &
        " already exists, not redeclaring")
when not declared(objStoreWatcher_Next):
  proc objStoreWatcher_Next*(new_info: ptr ptr objStoreInfo_536871711;
                             watcher: ptr objStoreWatcher_536871679;
                             timeout: int64): natsStatus_536871378 {.cdecl,
      importc: "objStoreWatcher_Next".}
else:
  static :
    hint("Declaration of " & "objStoreWatcher_Next" &
        " already exists, not redeclaring")
when not declared(objStoreWatcher_Stop):
  proc objStoreWatcher_Stop*(watcher: ptr objStoreWatcher_536871679): natsStatus_536871378 {.
      cdecl, importc: "objStoreWatcher_Stop".}
else:
  static :
    hint("Declaration of " & "objStoreWatcher_Stop" &
        " already exists, not redeclaring")
when not declared(objStoreWatcher_Destroy):
  proc objStoreWatcher_Destroy*(watcher: ptr objStoreWatcher_536871679): void {.
      cdecl, importc: "objStoreWatcher_Destroy".}
else:
  static :
    hint("Declaration of " & "objStoreWatcher_Destroy" &
        " already exists, not redeclaring")
when not declared(objStore_List):
  proc objStore_List*(new_list: ptr ptr objStoreInfoList_536871715;
                      obs: ptr objStore_536871673; opts: ptr objStoreOptions_536871719): natsStatus_536871378 {.
      cdecl, importc: "objStore_List".}
else:
  static :
    hint("Declaration of " & "objStore_List" &
        " already exists, not redeclaring")
when not declared(objStoreInfoList_Destroy):
  proc objStoreInfoList_Destroy*(list: ptr objStoreInfoList_536871715): void {.
      cdecl, importc: "objStoreInfoList_Destroy".}
else:
  static :
    hint("Declaration of " & "objStoreInfoList_Destroy" &
        " already exists, not redeclaring")
when not declared(objStore_Status_proc):
  proc objStore_Status_proc*(new_status: ptr ptr objStoreStatus_536871691;
                             obs: ptr objStore_536871673): natsStatus_536871378 {.
      cdecl, importc: "objStore_Status".}
else:
  static :
    hint("Declaration of " & "objStore_Status_proc" &
        " already exists, not redeclaring")
when not declared(objStoreStatus_Destroy):
  proc objStoreStatus_Destroy*(status: ptr objStoreStatus_536871691): void {.
      cdecl, importc: "objStoreStatus_Destroy".}
else:
  static :
    hint("Declaration of " & "objStoreStatus_Destroy" &
        " already exists, not redeclaring")
when not declared(objStore_Destroy):
  proc objStore_Destroy*(obs: ptr objStore_536871673): void {.cdecl,
      importc: "objStore_Destroy".}
else:
  static :
    hint("Declaration of " & "objStore_Destroy" &
        " already exists, not redeclaring")
when not declared(objStoreMeta_Init):
  proc objStoreMeta_Init*(meta: ptr objStoreMeta_536871707): natsStatus_536871378 {.
      cdecl, importc: "objStoreMeta_Init".}
else:
  static :
    hint("Declaration of " & "objStoreMeta_Init" &
        " already exists, not redeclaring")
when not declared(objStore_Put_proc):
  proc objStore_Put_proc*(new_put: ptr ptr objStorePut_536871675;
                          obs: ptr objStore_536871673; meta: ptr objStoreMeta_536871707): natsStatus_536871378 {.
      cdecl, importc: "objStore_Put".}
else:
  static :
    hint("Declaration of " & "objStore_Put_proc" &
        " already exists, not redeclaring")
when not declared(objStorePut_Add):
  proc objStorePut_Add*(put: ptr objStorePut_536871675; data: pointer;
                        dataLen: cint): natsStatus_536871378 {.cdecl,
      importc: "objStorePut_Add".}
else:
  static :
    hint("Declaration of " & "objStorePut_Add" &
        " already exists, not redeclaring")
when not declared(objStorePut_Complete):
  proc objStorePut_Complete*(new_info: ptr ptr objStoreInfo_536871711;
                             put: ptr objStorePut_536871675; timeout: int64): natsStatus_536871378 {.
      cdecl, importc: "objStorePut_Complete".}
else:
  static :
    hint("Declaration of " & "objStorePut_Complete" &
        " already exists, not redeclaring")
when not declared(objStorePut_Destroy):
  proc objStorePut_Destroy*(put: ptr objStorePut_536871675): void {.cdecl,
      importc: "objStorePut_Destroy".}
else:
  static :
    hint("Declaration of " & "objStorePut_Destroy" &
        " already exists, not redeclaring")
when not declared(objStore_PutString):
  proc objStore_PutString*(new_info: ptr ptr objStoreInfo_536871711;
                           obs: ptr objStore_536871673; name: ptr uint8;
                           data: ptr uint8): natsStatus_536871378 {.cdecl,
      importc: "objStore_PutString".}
else:
  static :
    hint("Declaration of " & "objStore_PutString" &
        " already exists, not redeclaring")
when not declared(objStore_PutBytes):
  proc objStore_PutBytes*(new_info: ptr ptr objStoreInfo_536871711;
                          obs: ptr objStore_536871673; name: ptr uint8;
                          data: pointer; dataLen: cint): natsStatus_536871378 {.
      cdecl, importc: "objStore_PutBytes".}
else:
  static :
    hint("Declaration of " & "objStore_PutBytes" &
        " already exists, not redeclaring")
when not declared(objStore_PutFile):
  proc objStore_PutFile*(new_info: ptr ptr objStoreInfo_536871711;
                         obs: ptr objStore_536871673; fileName: ptr uint8): natsStatus_536871378 {.
      cdecl, importc: "objStore_PutFile".}
else:
  static :
    hint("Declaration of " & "objStore_PutFile" &
        " already exists, not redeclaring")
when not declared(objStore_Get_proc):
  proc objStore_Get_proc*(new_get: ptr ptr objStoreGet_536871677;
                          obs: ptr objStore_536871673; name: ptr uint8;
                          opts: ptr objStoreOptions_536871719): natsStatus_536871378 {.
      cdecl, importc: "objStore_Get".}
else:
  static :
    hint("Declaration of " & "objStore_Get_proc" &
        " already exists, not redeclaring")
when not declared(objStoreGet_Info_proc):
  proc objStoreGet_Info_proc*(new_info: ptr ptr objStoreInfo_536871711;
                              get: ptr objStoreGet_536871677): natsStatus_536871378 {.
      cdecl, importc: "objStoreGet_Info".}
else:
  static :
    hint("Declaration of " & "objStoreGet_Info_proc" &
        " already exists, not redeclaring")
when not declared(objStoreGet_Read):
  proc objStoreGet_Read*(done: ptr bool; new_data: ptr pointer;
                         dataLen: ptr cint; get: ptr objStoreGet_536871677;
                         timeout: int64): natsStatus_536871378 {.cdecl,
      importc: "objStoreGet_Read".}
else:
  static :
    hint("Declaration of " & "objStoreGet_Read" &
        " already exists, not redeclaring")
when not declared(objStoreGet_ReadAll):
  proc objStoreGet_ReadAll*(new_data: ptr pointer; dataLen: ptr cint;
                            get: ptr objStoreGet_536871677; timeout: int64): natsStatus_536871378 {.
      cdecl, importc: "objStoreGet_ReadAll".}
else:
  static :
    hint("Declaration of " & "objStoreGet_ReadAll" &
        " already exists, not redeclaring")
when not declared(objStoreGet_Destroy):
  proc objStoreGet_Destroy*(get: ptr objStoreGet_536871677): void {.cdecl,
      importc: "objStoreGet_Destroy".}
else:
  static :
    hint("Declaration of " & "objStoreGet_Destroy" &
        " already exists, not redeclaring")
when not declared(objStore_GetString):
  proc objStore_GetString*(new_str: ptr ptr uint8; obs: ptr objStore_536871673;
                           name: ptr uint8; opts: ptr objStoreOptions_536871719): natsStatus_536871378 {.
      cdecl, importc: "objStore_GetString".}
else:
  static :
    hint("Declaration of " & "objStore_GetString" &
        " already exists, not redeclaring")
when not declared(objStore_GetBytes):
  proc objStore_GetBytes*(new_data: ptr pointer; dataLen: ptr cint;
                          obs: ptr objStore_536871673; name: ptr uint8;
                          opts: ptr objStoreOptions_536871719): natsStatus_536871378 {.
      cdecl, importc: "objStore_GetBytes".}
else:
  static :
    hint("Declaration of " & "objStore_GetBytes" &
        " already exists, not redeclaring")
when not declared(objStore_GetFile):
  proc objStore_GetFile*(obs: ptr objStore_536871673; name: ptr uint8;
                         fileName: ptr uint8; opts: ptr objStoreOptions_536871719): natsStatus_536871378 {.
      cdecl, importc: "objStore_GetFile".}
else:
  static :
    hint("Declaration of " & "objStore_GetFile" &
        " already exists, not redeclaring")
when not declared(micro_ErrorOutOfMemory):
  var micro_ErrorOutOfMemory* {.importc: "micro_ErrorOutOfMemory".}: ptr microError_536871773
else:
  static :
    hint("Declaration of " & "micro_ErrorOutOfMemory" &
        " already exists, not redeclaring")
when not declared(micro_ErrorInvalidArg):
  var micro_ErrorInvalidArg* {.importc: "micro_ErrorInvalidArg".}: ptr microError_536871773
else:
  static :
    hint("Declaration of " & "micro_ErrorInvalidArg" &
        " already exists, not redeclaring")
when not declared(micro_AddService):
  proc micro_AddService*(new_microservice: ptr ptr microService_536871783;
                         nc: ptr natsConnection_536871386;
                         config: ptr microServiceConfig_536871785): ptr microError_536871773 {.
      cdecl, importc: "micro_AddService".}
else:
  static :
    hint("Declaration of " & "micro_AddService" &
        " already exists, not redeclaring")
when not declared(microService_AddEndpoint):
  proc microService_AddEndpoint*(m: ptr microService_536871783;
                                 config: ptr microEndpointConfig_536871761): ptr microError_536871773 {.
      cdecl, importc: "microService_AddEndpoint".}
else:
  static :
    hint("Declaration of " & "microService_AddEndpoint" &
        " already exists, not redeclaring")
when not declared(microService_AddGroup):
  proc microService_AddGroup*(new_group: ptr ptr microGroup_536871775;
                              m: ptr microService_536871783;
                              config: ptr microGroupConfig_536871777): ptr microError_536871773 {.
      cdecl, importc: "microService_AddGroup".}
else:
  static :
    hint("Declaration of " & "microService_AddGroup" &
        " already exists, not redeclaring")
when not declared(microService_Destroy):
  proc microService_Destroy*(m: ptr microService_536871783): ptr microError_536871773 {.
      cdecl, importc: "microService_Destroy".}
else:
  static :
    hint("Declaration of " & "microService_Destroy" &
        " already exists, not redeclaring")
when not declared(microService_GetConnection):
  proc microService_GetConnection*(m: ptr microService_536871783): ptr natsConnection_536871386 {.
      cdecl, importc: "microService_GetConnection".}
else:
  static :
    hint("Declaration of " & "microService_GetConnection" &
        " already exists, not redeclaring")
when not declared(microService_GetInfo):
  proc microService_GetInfo*(new_info: ptr ptr microServiceInfo_536871789;
                             m: ptr microService_536871783): ptr microError_536871773 {.
      cdecl, importc: "microService_GetInfo".}
else:
  static :
    hint("Declaration of " & "microService_GetInfo" &
        " already exists, not redeclaring")
when not declared(microService_GetState):
  proc microService_GetState*(m: ptr microService_536871783): pointer {.cdecl,
      importc: "microService_GetState".}
else:
  static :
    hint("Declaration of " & "microService_GetState" &
        " already exists, not redeclaring")
when not declared(microService_GetStats):
  proc microService_GetStats*(new_stats: ptr ptr microServiceStats_536871793;
                              m: ptr microService_536871783): ptr microError_536871773 {.
      cdecl, importc: "microService_GetStats".}
else:
  static :
    hint("Declaration of " & "microService_GetStats" &
        " already exists, not redeclaring")
when not declared(microService_IsStopped):
  proc microService_IsStopped*(m: ptr microService_536871783): bool {.cdecl,
      importc: "microService_IsStopped".}
else:
  static :
    hint("Declaration of " & "microService_IsStopped" &
        " already exists, not redeclaring")
when not declared(microService_Run):
  proc microService_Run*(m: ptr microService_536871783): ptr microError_536871773 {.
      cdecl, importc: "microService_Run".}
else:
  static :
    hint("Declaration of " & "microService_Run" &
        " already exists, not redeclaring")
when not declared(microService_Stop):
  proc microService_Stop*(m: ptr microService_536871783): ptr microError_536871773 {.
      cdecl, importc: "microService_Stop".}
else:
  static :
    hint("Declaration of " & "microService_Stop" &
        " already exists, not redeclaring")
when not declared(microGroup_AddGroup):
  proc microGroup_AddGroup*(new_group: ptr ptr microGroup_536871775;
                            parent: ptr microGroup_536871775;
                            config: ptr microGroupConfig_536871777): ptr microError_536871773 {.
      cdecl, importc: "microGroup_AddGroup".}
else:
  static :
    hint("Declaration of " & "microGroup_AddGroup" &
        " already exists, not redeclaring")
when not declared(microGroup_AddEndpoint):
  proc microGroup_AddEndpoint*(g: ptr microGroup_536871775;
                               config: ptr microEndpointConfig_536871761): ptr microError_536871773 {.
      cdecl, importc: "microGroup_AddEndpoint".}
else:
  static :
    hint("Declaration of " & "microGroup_AddEndpoint" &
        " already exists, not redeclaring")
when not declared(microRequest_AddHeader):
  proc microRequest_AddHeader*(req: ptr microRequest_536871781; key: ptr uint8;
                               value: ptr uint8): ptr microError_536871773 {.
      cdecl, importc: "microRequest_AddHeader".}
else:
  static :
    hint("Declaration of " & "microRequest_AddHeader" &
        " already exists, not redeclaring")
when not declared(microRequest_DeleteHeader):
  proc microRequest_DeleteHeader*(req: ptr microRequest_536871781;
                                  key: ptr uint8): ptr microError_536871773 {.
      cdecl, importc: "microRequest_DeleteHeader".}
else:
  static :
    hint("Declaration of " & "microRequest_DeleteHeader" &
        " already exists, not redeclaring")
when not declared(microRequest_GetConnection):
  proc microRequest_GetConnection*(req: ptr microRequest_536871781): ptr natsConnection_536871386 {.
      cdecl, importc: "microRequest_GetConnection".}
else:
  static :
    hint("Declaration of " & "microRequest_GetConnection" &
        " already exists, not redeclaring")
when not declared(microRequest_GetData):
  proc microRequest_GetData*(req: ptr microRequest_536871781): ptr uint8 {.
      cdecl, importc: "microRequest_GetData".}
else:
  static :
    hint("Declaration of " & "microRequest_GetData" &
        " already exists, not redeclaring")
when not declared(microRequest_GetDataLength):
  proc microRequest_GetDataLength*(req: ptr microRequest_536871781): cint {.
      cdecl, importc: "microRequest_GetDataLength".}
else:
  static :
    hint("Declaration of " & "microRequest_GetDataLength" &
        " already exists, not redeclaring")
when not declared(microRequest_GetEndpointState):
  proc microRequest_GetEndpointState*(req: ptr microRequest_536871781): pointer {.
      cdecl, importc: "microRequest_GetEndpointState".}
else:
  static :
    hint("Declaration of " & "microRequest_GetEndpointState" &
        " already exists, not redeclaring")
when not declared(microRequest_GetHeaderKeys):
  proc microRequest_GetHeaderKeys*(req: ptr microRequest_536871781;
                                   keys: ptr ptr ptr uint8; count: ptr cint): ptr microError_536871773 {.
      cdecl, importc: "microRequest_GetHeaderKeys".}
else:
  static :
    hint("Declaration of " & "microRequest_GetHeaderKeys" &
        " already exists, not redeclaring")
when not declared(microRequest_GetHeaderValue):
  proc microRequest_GetHeaderValue*(req: ptr microRequest_536871781;
                                    key: ptr uint8; value: ptr ptr uint8): ptr microError_536871773 {.
      cdecl, importc: "microRequest_GetHeaderValue".}
else:
  static :
    hint("Declaration of " & "microRequest_GetHeaderValue" &
        " already exists, not redeclaring")
when not declared(microRequest_GetHeaderValues):
  proc microRequest_GetHeaderValues*(req: ptr microRequest_536871781;
                                     key: ptr uint8; values: ptr ptr ptr uint8;
                                     count: ptr cint): ptr microError_536871773 {.
      cdecl, importc: "microRequest_GetHeaderValues".}
else:
  static :
    hint("Declaration of " & "microRequest_GetHeaderValues" &
        " already exists, not redeclaring")
when not declared(microRequest_GetMsg):
  proc microRequest_GetMsg*(req: ptr microRequest_536871781): ptr natsMsg_536871392 {.
      cdecl, importc: "microRequest_GetMsg".}
else:
  static :
    hint("Declaration of " & "microRequest_GetMsg" &
        " already exists, not redeclaring")
when not declared(microRequest_GetReply):
  proc microRequest_GetReply*(req: ptr microRequest_536871781): ptr uint8 {.
      cdecl, importc: "microRequest_GetReply".}
else:
  static :
    hint("Declaration of " & "microRequest_GetReply" &
        " already exists, not redeclaring")
when not declared(microRequest_GetService):
  proc microRequest_GetService*(req: ptr microRequest_536871781): ptr microService_536871783 {.
      cdecl, importc: "microRequest_GetService".}
else:
  static :
    hint("Declaration of " & "microRequest_GetService" &
        " already exists, not redeclaring")
when not declared(microRequest_GetServiceState):
  proc microRequest_GetServiceState*(req: ptr microRequest_536871781): pointer {.
      cdecl, importc: "microRequest_GetServiceState".}
else:
  static :
    hint("Declaration of " & "microRequest_GetServiceState" &
        " already exists, not redeclaring")
when not declared(microRequest_GetSubject):
  proc microRequest_GetSubject*(req: ptr microRequest_536871781): ptr uint8 {.
      cdecl, importc: "microRequest_GetSubject".}
else:
  static :
    hint("Declaration of " & "microRequest_GetSubject" &
        " already exists, not redeclaring")
when not declared(microRequest_Respond):
  proc microRequest_Respond*(req: ptr microRequest_536871781; data: ptr uint8;
                             len: csize_t): ptr microError_536871773 {.cdecl,
      importc: "microRequest_Respond".}
else:
  static :
    hint("Declaration of " & "microRequest_Respond" &
        " already exists, not redeclaring")
when not declared(microRequest_RespondError):
  proc microRequest_RespondError*(req: ptr microRequest_536871781;
                                  err: ptr microError_536871773): ptr microError_536871773 {.
      cdecl, importc: "microRequest_RespondError".}
else:
  static :
    hint("Declaration of " & "microRequest_RespondError" &
        " already exists, not redeclaring")
when not declared(microRequest_RespondCustom):
  proc microRequest_RespondCustom*(req: ptr microRequest_536871781;
                                   err: ptr microError_536871773;
                                   data: ptr uint8; len: csize_t): ptr microError_536871773 {.
      cdecl, importc: "microRequest_RespondCustom".}
else:
  static :
    hint("Declaration of " & "microRequest_RespondCustom" &
        " already exists, not redeclaring")
when not declared(microRequest_SetHeader):
  proc microRequest_SetHeader*(req: ptr microRequest_536871781; key: ptr uint8;
                               value: ptr uint8): ptr microError_536871773 {.
      cdecl, importc: "microRequest_SetHeader".}
else:
  static :
    hint("Declaration of " & "microRequest_SetHeader" &
        " already exists, not redeclaring")
when not declared(micro_Errorf):
  proc micro_Errorf*(format: ptr uint8): ptr microError_536871773 {.cdecl,
      varargs, importc: "micro_Errorf".}
else:
  static :
    hint("Declaration of " & "micro_Errorf" & " already exists, not redeclaring")
when not declared(micro_ErrorfCode):
  proc micro_ErrorfCode*(code: cint; format: ptr uint8): ptr microError_536871773 {.
      cdecl, varargs, importc: "micro_ErrorfCode".}
else:
  static :
    hint("Declaration of " & "micro_ErrorfCode" &
        " already exists, not redeclaring")
when not declared(micro_ErrorFromStatus):
  proc micro_ErrorFromStatus*(s: natsStatus_536871378): ptr microError_536871773 {.
      cdecl, importc: "micro_ErrorFromStatus".}
else:
  static :
    hint("Declaration of " & "micro_ErrorFromStatus" &
        " already exists, not redeclaring")
when not declared(microError_Code):
  proc microError_Code*(err: ptr microError_536871773): cint {.cdecl,
      importc: "microError_Code".}
else:
  static :
    hint("Declaration of " & "microError_Code" &
        " already exists, not redeclaring")
when not declared(microError_Destroy):
  proc microError_Destroy*(err: ptr microError_536871773): void {.cdecl,
      importc: "microError_Destroy".}
else:
  static :
    hint("Declaration of " & "microError_Destroy" &
        " already exists, not redeclaring")
when not declared(microError_Status):
  proc microError_Status*(err: ptr microError_536871773): natsStatus_536871378 {.
      cdecl, importc: "microError_Status".}
else:
  static :
    hint("Declaration of " & "microError_Status" &
        " already exists, not redeclaring")
when not declared(microError_String):
  proc microError_String*(err: ptr microError_536871773; buf: ptr uint8;
                          len: csize_t): ptr uint8 {.cdecl,
      importc: "microError_String".}
else:
  static :
    hint("Declaration of " & "microError_String" &
        " already exists, not redeclaring")
when not declared(microError_Wrapf):
  proc microError_Wrapf*(err: ptr microError_536871773; format: ptr uint8): ptr microError_536871773 {.
      cdecl, varargs, importc: "microError_Wrapf".}
else:
  static :
    hint("Declaration of " & "microError_Wrapf" &
        " already exists, not redeclaring")
when not declared(micro_NewClient):
  proc micro_NewClient*(new_client: ptr ptr microClient_536871755;
                        nc: ptr natsConnection_536871386;
                        cfg: ptr microClientConfig_536871757): ptr microError_536871773 {.
      cdecl, importc: "micro_NewClient".}
else:
  static :
    hint("Declaration of " & "micro_NewClient" &
        " already exists, not redeclaring")
when not declared(microClient_Destroy):
  proc microClient_Destroy*(client: ptr microClient_536871755): void {.cdecl,
      importc: "microClient_Destroy".}
else:
  static :
    hint("Declaration of " & "microClient_Destroy" &
        " already exists, not redeclaring")
when not declared(microClient_DoRequest):
  proc microClient_DoRequest*(reply: ptr ptr natsMsg_536871392;
                              client: ptr microClient_536871755;
                              subject: ptr uint8; data: ptr uint8;
                              data_len: cint): ptr microError_536871773 {.cdecl,
      importc: "microClient_DoRequest".}
else:
  static :
    hint("Declaration of " & "microClient_DoRequest" &
        " already exists, not redeclaring")
when not declared(microServiceInfo_Destroy):
  proc microServiceInfo_Destroy*(info: ptr microServiceInfo_536871789): void {.
      cdecl, importc: "microServiceInfo_Destroy".}
else:
  static :
    hint("Declaration of " & "microServiceInfo_Destroy" &
        " already exists, not redeclaring")
when not declared(microServiceStats_Destroy):
  proc microServiceStats_Destroy*(stats: ptr microServiceStats_536871793): void {.
      cdecl, importc: "microServiceStats_Destroy".}
else:
  static :
    hint("Declaration of " & "microServiceStats_Destroy" &
        " already exists, not redeclaring")