object frmCadastroPadrao: TfrmCadastroPadrao
  Left = 331
  Top = 263
  Width = 928
  Height = 480
  Color = 14675913
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlGeral: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 442
    Align = alClient
    Color = 14675913
    TabOrder = 0
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 910
      Height = 46
      Align = alTop
      TabOrder = 0
      object Panel6: TPanel
        Left = 1263
        Top = 1
        Width = 67
        Height = 44
        TabOrder = 0
        object spbSair: TSpeedButton
          Left = 3
          Top = 2
          Width = 61
          Height = 40
          Caption = 'Fechar'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = spbSairClick
        end
      end
      object Panel8: TPanel
        Left = 414
        Top = 2
        Width = 84
        Height = 42
        TabOrder = 1
        object spbConsultar: TSpeedButton
          Left = 7
          Top = 2
          Width = 70
          Height = 38
          Caption = 'Consultar'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
      end
      object Panel2: TPanel
        Left = 1
        Top = 2
        Width = 84
        Height = 42
        TabOrder = 2
        object spbNovo: TSpeedButton
          Left = 7
          Top = 2
          Width = 70
          Height = 38
          Caption = 'Novo'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = spbNovoClick
        end
      end
      object Panel3: TPanel
        Left = 78
        Top = 2
        Width = 84
        Height = 42
        TabOrder = 3
        object spbExcluir: TSpeedButton
          Left = 7
          Top = 2
          Width = 70
          Height = 38
          Caption = 'Excluir'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
      end
      object Panel4: TPanel
        Left = 163
        Top = 2
        Width = 84
        Height = 42
        TabOrder = 4
        object spbAlterar: TSpeedButton
          Left = 7
          Top = 2
          Width = 70
          Height = 38
          Caption = 'Alterar'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = spbAlterarClick
        end
      end
      object Panel5: TPanel
        Left = 247
        Top = 2
        Width = 84
        Height = 42
        TabOrder = 5
        object spbCancelar: TSpeedButton
          Left = 7
          Top = 2
          Width = 70
          Height = 38
          Caption = 'Cancelar'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = spbCancelarClick
        end
      end
      object Panel7: TPanel
        Left = 331
        Top = 2
        Width = 84
        Height = 42
        TabOrder = 6
        object spbGravar: TSpeedButton
          Left = 7
          Top = 2
          Width = 70
          Height = 38
          Caption = 'Gravar'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object pnlDados: TPanel
      Left = 1
      Top = 47
      Width = 910
      Height = 394
      Align = alClient
      TabOrder = 1
    end
  end
  object zqryGeral: TZQuery
    Connection = DM.conZeos
    Params = <>
    Left = 137
    Top = 103
  end
end
