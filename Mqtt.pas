unit Mqtt;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation,
  sgcWebSocket_Classes, sgcWebSocket_Protocol_Base_Client,
  sgcWebSocket_Protocol_MQTT_Client, sgcWebSocket_Protocols, sgcBase_Classes,
  sgcTCP_Classes, sgcWebSocket_Classes_Indy, sgcWebSocket_Client, sgcWebSocket,
  sgcWebSocket_Protocol_MQTT_Message;

type
  TLogFunction = procedure(Param: String) of object;
  TEventFunction = procedure(Topic,Param: String) of object;

  TMqttmodule = class(TDataModule)
    WSClient: TsgcWebSocketClient;
    MQTT: TsgcWSPClient_MQTT;
    procedure MQTTMQTTConnect(Connection: TsgcWSConnection;
      const Session: Boolean; const ReasonCode: Integer;
      const ReasonName: string;
      const ConnectProperties: TsgcWSMQTTCONNACKProperties);
    procedure MQTTMQTTDisconnect(Connection: TsgcWSConnection;
      ReasonCode: Integer; const ReasonName: string;
      DisconnectProperties: TsgcWSMQTTDISCONNECTProperties);
    procedure MQTTMQTTPublish(Connection: TsgcWSConnection; aTopic,
      aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
    procedure MQTTMQTTSubscribe(Connection: TsgcWSConnection;
      aPacketIdentifier: Word; aCodes: TsgcWSSUBACKS;
      SubscribeProperties: TsgcWSMQTTSUBACKProperties);
    procedure MQTTMQTTUnSubscribe(Connection: TsgcWSConnection;
      aPacketIdentifier: Word; aCodes: TsgcWSUNSUBACKS;
      UnsubscribeProperties: TsgcWSMQTTUNSUBACKProperties);

  private
     FLog : TLogFunction;
     FEvent: TEventFunction;
  public
     property OnEvent: TEventFunction write FEvent;
     property OnLog : TLogFunction write FLog;
     Procedure Disconnect;
     Procedure Connect(host: string; Port: integer);
     Procedure Publish(topic, msg: string);
     Procedure Subscripe(topic: string);
     Procedure UnSubscripe(topic: string);
  end;

var
  Mqttmodule: TMqttmodule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TMqttmodule.Connect(host: string; Port: integer);
begin
  WSClient.Host :=host;
  WSClient.Port :=port;
  WSClient.Active:=true;
end;

procedure TMqttmodule.Disconnect;
begin
   WSClient.Active:=false;
end;

procedure TMqttmodule.MQTTMQTTConnect(Connection: TsgcWSConnection;
  const Session: Boolean; const ReasonCode: Integer; const ReasonName: string;
  const ConnectProperties: TsgcWSMQTTCONNACKProperties);
begin
  if assigned(Flog) then Flog('Connected');
end;

procedure TMqttmodule.MQTTMQTTDisconnect(Connection: TsgcWSConnection;
  ReasonCode: Integer; const ReasonName: string;
  DisconnectProperties: TsgcWSMQTTDISCONNECTProperties);
begin
   if assigned(Flog) then Flog('Disconnect');
end;

procedure TMqttmodule.MQTTMQTTPublish(Connection: TsgcWSConnection; aTopic,
  aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
begin
  if assigned(FEvent) then FEvent(aTopic,aText);
end;

procedure TMqttmodule.MQTTMQTTSubscribe(Connection: TsgcWSConnection;
  aPacketIdentifier: Word; aCodes: TsgcWSSUBACKS;
  SubscribeProperties: TsgcWSMQTTSUBACKProperties);
begin
   if assigned(Flog) then Flog('#subscribed: ' + IntToStr(aPacketIdentifier));
end;

procedure TMqttmodule.MQTTMQTTUnSubscribe(Connection: TsgcWSConnection;
  aPacketIdentifier: Word; aCodes: TsgcWSUNSUBACKS;
  UnsubscribeProperties: TsgcWSMQTTUNSUBACKProperties);
begin
   if assigned(Flog) then Flog('#unsubscribed: ' + IntToStr(aPacketIdentifier));
end;

procedure TMqttmodule.Publish(topic, msg: string);
begin
  MQTT.Publish(topic,msg);
end;

procedure TMqttmodule.Subscripe(topic: string);
begin
  MQTT.Subscribe(Topic);
end;

procedure TMqttmodule.UnSubscripe(topic: string);
begin
  MQTT.UnSubscribe(Topic);
end;

end.
