object DM: TDM
  Left = 280
  Top = 136
  Width = 928
  Height = 480
  Caption = 'DataModule'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object conZeos: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    HostName = 'localhost'
    Port = 5432
    Database = 'postgres'
    User = 'postgres'
    Password = 'postgres'
    Protocol = 'postgresql-8'
    Left = 24
    Top = 16
  end
end
