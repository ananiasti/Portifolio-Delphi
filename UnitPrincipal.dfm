object FormPrincipal: TFormPrincipal
  Left = 300
  Top = 68
  Align = alClient
  AutoScroll = False
  BorderIcons = []
  Caption = 'Sistema de Vendas'
  ClientHeight = 561
  ClientWidth = 930
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mnPrincipal
  OldCreateOrder = False
  Position = poScreenCenter
  ScreenSnap = True
  WindowState = wsMaximized
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel
    Left = 8
    Top = 497
    Width = 151
    Height = 13
    Caption = 'Autor:  Ananias Caetano Delfino'
  end
  object Label1: TLabel
    Left = 8
    Top = 459
    Width = 707
    Height = 26
    Caption = 
      '- Obs: O objetivo deste sistema '#233' apenas demonstrar o conhecimen' +
      'to nas tecnologias empregadas, por isso n'#227'o foi empregado quest'#245 +
      'es como leiaute'#13#10'- Algumas telas est'#227'o incompletas, por'#233'm a tel ' +
      'de cliente '#233' a mais completa.'
  end
  object Label2: TLabel
    Left = 8
    Top = 138
    Width = 84
    Height = 39
    Caption = '- Delphi 7;'#13#10'- PostgreSQL 9.6;'#13#10'- Zeos 7;'
  end
  object Label3: TLabel
    Left = 8
    Top = 227
    Width = 67
    Height = 26
    Caption = '- Heran'#231'a;'#13#10'- Polimorfismo;'
  end
  object Label4: TLabel
    Left = 8
    Top = 297
    Width = 284
    Height = 143
    Caption = 
      '- CRUD completo;'#13#10'- Navega'#231#227'o de formul'#225'rios criados em tempo de' +
      ' execu'#231#227'o;'#13#10'- Tradu'#231#227'o dos bot'#245'es de mensagens do Delphi;'#13#10'- DBG' +
      'rid zebrado;'#13#10'- StringGrid din'#226'mico;'#13#10'- Try/Catch - Try/Except;'#13 +
      #10'- Formata'#231#227'o de valores e datas;'#13#10'- Relat'#243'rios com QuickReport;' +
      #13#10'- Exporta'#231#227'o de dados para o Excel;'#13#10'- Consultas SQL usando PK' +
      ' e FK;'#13#10'- Consultas SQL usando JOINS.'
  end
  object lbl3: TLabel
    Left = 8
    Top = 196
    Width = 254
    Height = 20
    Caption = 'Principais t'#233'cincas empregadas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 107
    Width = 289
    Height = 20
    Caption = 'Principais tecnologias empregadas :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 265
    Width = 266
    Height = 20
    Caption = 'Principais recursos empregados :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 459
    Top = 57
    Width = 198
    Height = 48
    Alignment = taCenter
    Caption = 'Aten'#231#227'o !!!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object stat1: TStatusBar
    Left = 0
    Top = 542
    Width = 930
    Height = 19
    Panels = <
      item
        Text = 'Sistema de Vendas'
        Width = 150
      end
      item
        Text = 'Vers'#227'o 1.0.0.0'
        Width = 600
      end
      item
        Alignment = taRightJustify
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 930
    Height = 44
    Align = alTop
    TabOrder = 1
    object lblNomeTela: TLabel
      Left = 352
      Top = 10
      Width = 6
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnSair: TBitBtn
      Left = 1265
      Top = 3
      Width = 75
      Height = 38
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnSairClick
    end
  end
  object mnPrincipal: TMainMenu
    Left = 8
    Top = 48
    object Cadastros1: TMenuItem
      Caption = '&Cadastros'
      object mnOpcClientes: TMenuItem
        Caption = 'Clientes'
        OnClick = mnOpcClientesClick
      end
      object mnOpcProdutos: TMenuItem
        Caption = 'Produtos'
        OnClick = mnOpcProdutosClick
      end
    end
    object Vendas1: TMenuItem
      Caption = '&Vendas'
      object mnOpcPedido: TMenuItem
        Caption = 'Pedido'
        OnClick = mnOpcPedidoClick
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
    end
  end
end
