unit MqttClient1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls, inifiles;

type
  TFMqtt = class(TForm)
    Panel2: TPanel;
    cbTopic: TComboBox;
    EMsg: TEdit;
    Label1: TLabel;
    Bsub: TButton;
    Bunsub: TButton;
    Bpublish: TButton;
    sg: TStringGrid;
    Panel1: TPanel;
    EUrl: TEdit;
    EPort: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    BConnect: TButton;
    Memo1: TMemo;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BConnectClick(Sender: TObject);
    procedure BsubClick(Sender: TObject);
    procedure BunsubClick(Sender: TObject);
    procedure BpublishClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    inif: Tinifile;
    Connected: boolean;
    Procedure Event(Topic,Param: String);
    Procedure Log(Param: String);
    procedure InsertRows(RowIndex, RCount: LongInt);
  public
    { Public declarations }
  end;

var
  FMqtt: TFMqtt;

implementation

{$R *.dfm}

uses Mqtt;

procedure TFMqtt.BpublishClick(Sender: TObject);
begin
  Mqttmodule.Publish(cbtopic.Text,Emsg.Text);
end;

procedure TFMqtt.BsubClick(Sender: TObject);
begin
  Mqttmodule.Subscripe(cbtopic.Text);
end;

procedure TFMqtt.BunsubClick(Sender: TObject);
begin
  Mqttmodule.UnSubscripe(cbtopic.Text);
end;

procedure TFMqtt.Button1Click(Sender: TObject);
var i: integer;
begin
  sg.RowCount:=1;
  sg.Cells[0,0]:='#';
  sg.Cells[1,0]:='Time';
  sg.Cells[2,0]:='Topic';
  sg.Cells[3,0]:='Message';
end;

procedure TFMqtt.BConnectClick(Sender: TObject);
begin
 if not Connected then begin
  Mqttmodule.Connect(Eurl.Text,strtoint(Eport.Text));
  inif.WriteString('General','URL',Eurl.Text);
 end
 else begin
  Mqttmodule.Disconnect;
 end;
end;


procedure TFMqtt.InsertRows(RowIndex, RCount : LongInt);
var
  i: LongInt;
begin
  sg.RowCount := sg.RowCount + RCount;
  for i := sg.RowCount - 1 downto RowIndex do sg.Rows[i] := sg.Rows[i - RCount];
end;

procedure TFMqtt.Event(Topic, Param: String);
var row,i: integer;
    fundettopic: boolean;
begin
  row:=sg.RowCount;
  InsertRows(row,1);
  //sg.RowCount:=row+1;
  fundettopic:=false;
  sg.Cells[0,row]:=inttostr(sg.RowCount-1);
  sg.Cells[1,row]:=formatdatetime('hh:nn:ss.zzz',now);
  sg.Cells[2,row]:=topic;
  sg.Cells[3,row]:=param;
  for I := 0 to cbtopic.Items.Count-1 do begin
    if topic=cbtopic.Items.strings[i] then fundettopic:=true;
  end;
  if not fundettopic then cbtopic.Items.Add(Topic);

end;

procedure TFMqtt.FormCreate(Sender: TObject);

begin
  inif:= TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  Eurl.Text:=inif.ReadString('General','URL','');
  sg.Cells[0,0]:='#';
  sg.Cells[1,0]:='Time';
  sg.Cells[2,0]:='Topic';
  sg.Cells[3,0]:='Message';
  Mqttmodule:= TMqttmodule.Create(self);
  Mqttmodule.OnEvent:=Event;
  Mqttmodule.OnLog:=Log;
end;

procedure TFMqtt.FormResize(Sender: TObject);
var row,i, SGwidth: integer;
begin
  for i := 0 to 2 do SGwidth:=SGwidth+sg.ColWidths[i];
  if (SGwidth+sg.ColWidths[3])<FMqtt.Width then begin
    sg.ColWidths[3]:=FMqtt.Width-SGwidth;
  end;
end;

procedure TFMqtt.Log(Param: String);
begin
 memo1.Lines.Add(param);
 if pos('Connected',Param)>0 then begin
   Connected:=true;
   BConnect.Caption:='Disconnect';
 end;

 if pos('Disconnect',Param)>0 then begin
   Connected:=False;
   BConnect.Caption:='Connect';
 end;

end;

end.
