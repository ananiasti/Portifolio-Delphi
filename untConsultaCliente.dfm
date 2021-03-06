inherited frmConsultaCliente: TfrmConsultaCliente
  Left = 298
  Top = 214
  Caption = 'Consulta de Cliente'
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
            FieldName = 'cliente_id'
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cliente_nome'
            ImeName = 'cliente_nome'
            Title.Caption = 'Nome'
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
            FieldName = 'cliente_endereco'
            Title.Caption = 'Endere'#231'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cliente_cidade'
            Title.Caption = 'Cidade'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 200
            Visible = True
          end>
      end
    end
    inherited GroupBox2: TGroupBox
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
        Left = 381
        Top = 30
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label3: TLabel
        Left = 612
        Top = 30
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label4: TLabel
        Left = 8
        Top = 80
        Width = 233
        Height = 13
        Caption = '* Preencha o(s) campo(s) para efetuar a pesquisa'
      end
      object edtID: TEdit
        Left = 8
        Top = 48
        Width = 65
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object edtNome: TEdit
        Left = 82
        Top = 48
        Width = 289
        Height = 21
        TabOrder = 1
      end
      object edtEndereco: TEdit
        Left = 381
        Top = 48
        Width = 220
        Height = 21
        TabOrder = 2
      end
      object edtCidade: TEdit
        Left = 612
        Top = 48
        Width = 209
        Height = 21
        TabOrder = 3
      end
      object btnPesquisar: TButton
        Left = 828
        Top = 43
        Width = 63
        Height = 25
        Caption = 'Pesquisar'
        Enabled = False
        TabOrder = 4
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
        Caption = 'Cadastro'
        OnClick = spbCadastroClick
      end
    end
    inherited Panel3: TPanel
      Left = 174
      inherited spbRelatorio: TSpeedButton
        OnClick = spbRelatorioClick
      end
    end
    inherited Panel4: TPanel
      Left = 259
      inherited spbExcel: TSpeedButton
        OnClick = spbExcelClick
      end
    end
  end
  inherited zqryGeral: TZQuery
    Left = 577
    Top = 15
  end
  object dsGrid: TDataSource
    DataSet = zqryGeral
    Left = 513
    Top = 23
  end
end
