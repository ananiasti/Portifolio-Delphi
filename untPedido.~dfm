inherited frmPedido: TfrmPedido
  Left = 316
  Top = 256
  Caption = 'Emiss'#227'o de Pedido'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDados: TPanel
    inherited GroupBox1: TGroupBox
      object dbgrdCliente: TDBGrid
        Left = 2
        Top = 15
        Width = 906
        Height = 272
        Align = alClient
        DataSource = dsGrid
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrdClienteDrawColumnCell
        OnDblClick = dbgrdClienteDblClick
        OnMouseUp = dbgrdClienteMouseUp
        Columns = <
          item
            Expanded = False
            FieldName = 'Pedido'
            Title.Caption = 'Nr Pedido'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cliente_nome'
            ImeName = 'cliente_nome'
            Title.Caption = 'Cliente'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Emissao'
            Title.Caption = 'Emiss'#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 180
            Visible = True
          end>
      end
    end
    inherited GroupBox2: TGroupBox
      object lbl1: TLabel
        Left = 8
        Top = 30
        Width = 46
        Height = 13
        Caption = 'Nr pedido'
      end
      object Label1: TLabel
        Left = 82
        Top = 30
        Width = 78
        Height = 13
        Caption = 'Nome do Cliente'
      end
      object Label2: TLabel
        Left = 381
        Top = 30
        Width = 80
        Height = 13
        Caption = 'Data de Emiss'#227'o'
      end
      object Label4: TLabel
        Left = 8
        Top = 70
        Width = 233
        Height = 13
        Caption = '* Preencha o(s) campo(s) para efetuar a pesquisa'
      end
      object Label3: TLabel
        Left = 8
        Top = 86
        Width = 192
        Height = 13
        Caption = '* Clique 2x no pedido para ver seus itens'
      end
      object edtID: TEdit
        Left = 8
        Top = 48
        Width = 65
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object cbbCliente: TComboBox
        Left = 88
        Top = 48
        Width = 281
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
      end
      object dpkEmissao: TDateTimePicker
        Left = 381
        Top = 48
        Width = 137
        Height = 21
        Date = 0.497648379627207800
        Time = 0.497648379627207800
        TabOrder = 2
        OnClick = dpkEmissaoClick
        OnEnter = dpkEmissaoEnter
      end
      object btnPesquisar: TButton
        Left = 528
        Top = 45
        Width = 75
        Height = 25
        Caption = 'Pesquisar'
        Enabled = False
        TabOrder = 3
        OnClick = btnPesquisarClick
      end
    end
  end
  inherited Panel1: TPanel
    inherited Panel8: TPanel
      inherited SpeedButton9: TSpeedButton
        OnClick = SpeedButton9Click
      end
    end
    inherited Panel2: TPanel
      inherited spbCadastro: TSpeedButton
        OnClick = spbCadastroClick
      end
    end
    inherited Panel3: TPanel
      Left = 257
      Enabled = False
    end
    inherited Panel4: TPanel
      Left = 341
      Enabled = False
    end
    object Panel5: TPanel
      Left = 174
      Top = 2
      Width = 84
      Height = 42
      TabOrder = 5
      object SpeedButton1: TSpeedButton
        Left = 7
        Top = 2
        Width = 70
        Height = 38
        Caption = 'Itens'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton1Click
      end
    end
  end
  inherited zqryGeral: TZQuery
    Left = 585
    Top = 15
  end
  object dsGrid: TDataSource
    DataSet = zqryGeral
    Left = 513
    Top = 23
  end
end
