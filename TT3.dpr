program TT3;

uses
  Vcl.Forms,
  MqttClient1 in 'MqttClient1.pas' {Form1},
  Mqtt in 'Mqtt.pas' {Mqttmodule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
