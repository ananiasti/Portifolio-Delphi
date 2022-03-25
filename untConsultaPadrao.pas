unit untConsultaPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TfrmConsultaPadrao = class(TForm)
    pnlDados: TPanel;
    Panel1: TPanel;
    Panel6: TPanel;
    spbSair: TSpeedButton;
    Panel8: TPanel;
    SpeedButton9: TSpeedButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    zqryGeral: TZQuery;
    Panel2: TPanel;
    spbCadastro: TSpeedButton;
    Panel3: TPanel;
    spbRelatorio: TSpeedButton;
    Panel4: TPanel;
    spbExcel: TSpeedButton;
    procedure spbSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaPadrao: TfrmConsultaPadrao;

implementation

uses UnitDM, uFuncoes, untCadastroProduto;

{$R *.dfm}

procedure TfrmConsultaPadrao.spbSairClick(Sender: TObject);
begin
  close;
end;

end.
