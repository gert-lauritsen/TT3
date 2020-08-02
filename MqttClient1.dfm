object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 660
  ClientWidth = 1313
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 516
    Width = 1313
    Height = 144
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 329
    ExplicitWidth = 1285
    object Label1: TLabel
      Left = 16
      Top = 6
      Width = 25
      Height = 13
      Caption = 'Topic'
    end
    object cbTopic: TComboBox
      Left = 16
      Top = 24
      Width = 255
      Height = 21
      TabOrder = 0
      Text = '#'
    end
    object EMsg: TEdit
      Left = 277
      Top = 24
      Width = 729
      Height = 21
      TabOrder = 1
    end
    object Bsub: TButton
      Left = 16
      Top = 80
      Width = 75
      Height = 25
      Caption = 'Subscripe'
      TabOrder = 2
      OnClick = BsubClick
    end
    object Bunsub: TButton
      Left = 16
      Top = 111
      Width = 75
      Height = 25
      Caption = 'Unsubscripe'
      TabOrder = 3
      OnClick = BunsubClick
    end
    object Bpublish: TButton
      Left = 16
      Top = 51
      Width = 75
      Height = 25
      Caption = 'Publish'
      TabOrder = 4
      OnClick = BpublishClick
    end
    object Panel1: TPanel
      Left = 1012
      Top = 1
      Width = 300
      Height = 142
      Align = alRight
      TabOrder = 5
      ExplicitLeft = 984
      object Label2: TLabel
        Left = 8
        Top = 16
        Width = 19
        Height = 13
        Caption = 'URL'
      end
      object Label3: TLabel
        Left = 8
        Top = 43
        Width = 20
        Height = 13
        Caption = 'Port'
      end
      object EUrl: TEdit
        Left = 42
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 0
        Text = '10.160.0.29'
      end
      object EPort: TEdit
        Left = 42
        Top = 43
        Width = 121
        Height = 21
        TabOrder = 1
        Text = '1883'
      end
      object Button1: TButton
        Left = 169
        Top = 16
        Width = 120
        Height = 65
        Caption = 'Connect'
        TabOrder = 2
        OnClick = Button1Click
      end
    end
  end
  object sg: TStringGrid
    Left = 0
    Top = 0
    Width = 1313
    Height = 516
    Align = alClient
    ColCount = 4
    RowCount = 1
    FixedRows = 0
    ScrollBars = ssVertical
    TabOrder = 1
    ExplicitLeft = 32
    ExplicitTop = 72
    ExplicitWidth = 1410
    ExplicitHeight = 385
    ColWidths = (
      64
      76
      108
      1045)
  end
end
