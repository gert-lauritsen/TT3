object Mqttmodule: TMqttmodule
  OldCreateOrder = False
  Height = 150
  Width = 215
  object WSClient: TsgcWebSocketClient
    Port = 80
    ConnectTimeout = 0
    ReadTimeout = -1
    WriteTimeout = 0
    TLS = False
    Proxy.Enabled = False
    Proxy.Port = 8080
    Proxy.ProxyType = pxyHTTP
    HeartBeat.Enabled = False
    HeartBeat.Interval = 300
    HeartBeat.Timeout = 0
    IPVersion = Id_IPv4
    Authentication.Enabled = False
    Authentication.URL.Enabled = True
    Authentication.Session.Enabled = False
    Authentication.Basic.Enabled = True
    Authentication.Token.Enabled = False
    Authentication.Token.AuthName = 'Bearer'
    Extensions.DeflateFrame.Enabled = False
    Extensions.DeflateFrame.WindowBits = 15
    Extensions.PerMessage_Deflate.Enabled = False
    Extensions.PerMessage_Deflate.ClientMaxWindowBits = 15
    Extensions.PerMessage_Deflate.ClientNoContextTakeOver = False
    Extensions.PerMessage_Deflate.MemLevel = 9
    Extensions.PerMessage_Deflate.ServerMaxWindowBits = 15
    Extensions.PerMessage_Deflate.ServerNoContextTakeOver = False
    Options.CleanDisconnect = False
    Options.FragmentedMessages = frgOnlyBuffer
    Options.Parameters = '/'
    Options.RaiseDisconnectExceptions = True
    Options.ValidateUTF8 = False
    Specifications.Drafts.Hixie76 = False
    Specifications.RFC6455 = False
    NotifyEvents = neAsynchronous
    LogFile.Enabled = False
    QueueOptions.Binary.Level = qmNone
    QueueOptions.Ping.Level = qmNone
    QueueOptions.Text.Level = qmNone
    WatchDog.Attempts = 0
    WatchDog.Enabled = False
    WatchDog.Interval = 10
    Throttle.BitsPerSec = 0
    Throttle.Enabled = False
    LoadBalancer.Enabled = False
    LoadBalancer.Port = 0
    TLSOptions.VerifyCertificate = False
    TLSOptions.VerifyDepth = 0
    TLSOptions.Version = tlsUndefined
    TLSOptions.IOHandler = iohOpenSSL
    TLSOptions.OpenSSL_Options.APIVersion = oslAPI_1_0
    Left = 16
    Top = 14
  end
  object MQTT: TsgcWSPClient_MQTT
    OnMQTTConnect = MQTTMQTTConnect
    OnMQTTPublish = MQTTMQTTPublish
    OnMQTTSubscribe = MQTTMQTTSubscribe
    OnMQTTUnSubscribe = MQTTMQTTUnSubscribe
    OnMQTTDisconnect = MQTTMQTTDisconnect
    Client = WSClient
    Authentication.Enabled = False
    HeartBeat.Enabled = True
    HeartBeat.Interval = 300
    LastWillTestament.Enabled = False
    LastWillTestament.QoS = mtqsAtMostOnce
    LastWillTestament.Retain = False
    LastWillTestament.WillProperties.MessageExpiryInterval = 0
    LastWillTestament.WillProperties.PayloadFormat = mqpfUnspecified
    LastWillTestament.WillProperties.WillDelayInterval = 0
    QoS.Level = mtqsAtMostOnce
    QoS.Interval = 60
    QoS.Timeout = 300
    ConnectProperties.Enabled = False
    ConnectProperties.MaximumPacketSize = 2147483647
    ConnectProperties.ReceiveMaximum = 65535
    ConnectProperties.RequestProblemInformation = True
    ConnectProperties.RequestResponseInformation = False
    ConnectProperties.SessionExpiryInterval = 0
    ConnectProperties.TopicAliasMaximum = 0
    MQTTVersion = mqtt311
    Left = 64
    Top = 14
  end
end
