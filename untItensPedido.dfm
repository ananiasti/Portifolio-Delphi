inherited frmItensPedido: TfrmItensPedido
  Left = 255
  Top = 133
  Height = 573
  Caption = 'Itens de Pedido'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDados: TPanel
    Height = 489
    inherited GroupBox1: TGroupBox
      Height = 382
      object strngrdProduto: TStringGrid
        Left = 8
        Top = 16
        Width = 881
        Height = 345
        FixedCols = 0
        RowCount = 2
        TabOrder = 0
      end
    end
    inherited GroupBox2: TGroupBox
      Caption = 'Itens de Pedido'
      object lbl1: TLabel
        Left = 8
        Top = 30
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label1: TLabel
        Left = 82
        Top = 30
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object Label2: TLabel
        Left = 378
        Top = 30
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object Label3: TLabel
        Left = 612
        Top = 46
        Width = 141
        Height = 20
        Caption = 'Total do Pedido : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTotalPedido: TLabel
        Left = 763
        Top = 46
        Width = 6
        Height = 20
        Caption = ' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 514
        Top = 30
        Width = 55
        Height = 13
        Caption = 'Quantidade'
      end
      object edtID: TEdit
        Left = 8
        Top = 48
        Width = 65
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object cbbProduto: TComboBox
        Left = 82
        Top = 48
        Width = 281
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = cbbProdutoChange
      end
      object edtValor: TEdit
        Left = 378
        Top = 48
        Width = 121
        Height = 21
        TabOrder = 2
        OnKeyPress = edtValorKeyPress
      end
      object edtQtd: TEdit
        Left = 516
        Top = 48
        Width = 61
        Height = 21
        TabOrder = 3
        OnKeyPress = edtQtdKeyPress
      end
    end
  end
  inherited Panel1: TPanel
    object Label4: TLabel [0]
      Left = 520
      Top = 19
      Width = 72
      Height = 20
      Caption = 'Cliente : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCliente: TLabel [1]
      Left = 626
      Top = 19
      Width = 343
      Height = 20
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited Panel8: TPanel
      inherited SpeedButton9: TSpeedButton
        Caption = 'Gravar'
        OnClick = SpeedButton9Click
      end
    end
    inherited Panel2: TPanel
      inherited spbCadastro: TSpeedButton
        OnClick = spbCadastroClick
      end
    end
    inherited Panel3: TPanel
      Enabled = False
    end
    inherited Panel4: TPanel
      Enabled = False
    end
    object Panel7: TPanel
      Left = 373
      Top = 2
      Width = 140
      Height = 42
      TabOrder = 5
      object SpeedButton2: TSpeedButton
        Left = 5
        Top = 2
        Width = 130
        Height = 38
        Caption = 'Finalizar Pedido'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton2Click
      end
    end
  end
  inherited zqryGeral: TZQuery
    Left = 417
    Top = 351
  end
  object dsGrid: TDataSource
    DataSet = zqryGeral
    Left = 353
    Top = 351
  end
  object zqryPreco: TZQuery
    Connection = DM.conZeos
    Params = <>
    Left = 481
    Top = 351
  end
end
