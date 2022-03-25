inherited frmConsultaProduto: TfrmConsultaProduto
  Caption = 'frmConsultaProduto'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDados: TPanel
    inherited GroupBox1: TGroupBox
      object dbgrdProduto: TDBGrid
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
        OnDrawColumnCell = dbgrdProdutoDrawColumnCell
        OnDblClick = dbgrdProdutoDblClick
        OnMouseUp = dbgrdProdutoMouseUp
        Columns = <
          item
            Expanded = False
            FieldName = 'produto_id'
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
            FieldName = 'produto_nome'
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
            FieldName = 'produto_preco'
            Title.Caption = 'Pre'#231'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 250
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
      object btnPesquisar: TButton
        Left = 380
        Top = 43
        Width = 63
        Height = 25
        Caption = 'Pesquisar'
        Enabled = False
        TabOrder = 2
      end
    end
  end
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      inherited spbCadastro: TSpeedButton
        Caption = 'Cadastro'
        OnClick = spbCadastroClick
      end
    end
  end
  object dsGrid: TDataSource
    DataSet = zqryGeral
    Left = 513
    Top = 23
  end
end
