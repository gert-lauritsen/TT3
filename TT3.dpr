program TT3;

uses
  Vcl.Forms,
  MqttClient1 in 'MqttClient1.pas' {FMqtt},
  Mqtt in 'Mqtt.pas' {Mqttmodule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMqtt, FMqtt);
  Application.Run;
end.
