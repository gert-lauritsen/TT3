unit MqttClient1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
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
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BsubClick(Sender: TObject);
    procedure BunsubClick(Sender: TObject);
    procedure BpublishClick(Sender: TObject);
  private
    Procedure Event(Topic,Param: String);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Mqtt;

procedure TForm1.BpublishClick(Sender: TObject);
begin
 Mqttmodule.Publish(cbtopic.Text,Emsg.Text);
end;

procedure TForm1.BsubClick(Sender: TObject);
begin
  Mqttmodule.Subscripe(cbtopic.Text);
end;

procedure TForm1.BunsubClick(Sender: TObject);
begin
  Mqttmodule.UnSubscripe(cbtopic.Text);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 Mqttmodule.Connect(Eurl.Text,strtoint(Eport.Text));
end;

procedure TForm1.Event(Topic, Param: String);
var row,i: integer;
    fundettopic: boolean;
begin
  row:=sg.RowCount;   fundettopic:=false;
  sg.RowCount:=row+1;
  //sg.row
  sg.Cells[0,row]:=inttostr(sg.RowCount);
  sg.Cells[1,row]:=formatdatetime('hh:nn:ss.zzz',now);
  sg.Cells[2,row]:=topic;
  sg.Cells[3,row]:=param;
  for I := 0 to cbtopic.Items.Count-1 do begin
    if topic=cbtopic.Items.strings[i] then fundettopic:=true;
  end;
  if not fundettopic then cbtopic.Items.Add(Topic);

end;

procedure TForm1.FormCreate(Sender: TObject);

begin
  sg.Cells[0,0]:='#';
  sg.Cells[1,0]:='Time';
  sg.Cells[2,0]:='Topic';
  sg.Cells[3,0]:='Message';
  Mqttmodule:= TMqttmodule.Create(self);
  Mqttmodule.OnEvent:=Event;
end;

end.
