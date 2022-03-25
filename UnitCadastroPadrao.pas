unit UnitCadastroPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Buttons, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, StdCtrls;

type
  TfrmCadastroPadrao = class(TForm)
    pnlGeral: TPanel;
    Panel1: TPanel;
    pnlDados: TPanel;
    Panel6: TPanel;
    spbSair: TSpeedButton;
    Panel8: TPanel;
    spbConsultar: TSpeedButton;
    Panel2: TPanel;
    spbNovo: TSpeedButton;
    Panel3: TPanel;
    spbExcluir: TSpeedButton;
    Panel4: TPanel;
    spbAlterar: TSpeedButton;
    Panel5: TPanel;
    spbCancelar: TSpeedButton;
    Panel7: TPanel;
    spbGravar: TSpeedButton;
    zqryGeral: TZQuery;
    procedure spbSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure HabilitaBotoes(Status: Boolean);
    procedure spbNovoClick(Sender: TObject);
    procedure spbAlterarClick(Sender: TObject);
    procedure spbCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroPadrao: TfrmCadastroPadrao;
  operacao         : string;
implementation

uses UnitDM, UnitPrincipal;

{$R *.dfm}

procedure TfrmCadastroPadrao.spbSairClick(Sender: TObject);
begin
  operacao := EmptyStr;
  Close;
end;

procedure TfrmCadastroPadrao.FormShow(Sender: TObject);
begin
 //
end;

procedure TfrmCadastroPadrao.HabilitaBotoes(Status: Boolean);
begin
  spbNovo.Enabled      := Status;
  spbConsultar.Enabled := Status;
  spbExcluir.Enabled   := status;
  spbAlterar.Enabled   := Status;
  spbCancelar.Enabled  := not Status;
  spbGravar.Enabled    := not Status;
end;

procedure TfrmCadastroPadrao.spbNovoClick(Sender: TObject);
begin
  operacao := 'INCLUIR';
  HabilitaBotoes(false);
end;

procedure TfrmCadastroPadrao.spbAlterarClick(Sender: TObject);
begin
  operacao := 'ALTERAR';
  HabilitaBotoes(False);
end;

procedure TfrmCadastroPadrao.spbCancelarClick(Sender: TObject);
begin
  operacao := EmptyStr;
  HabilitaBotoes(True);
end;

end.
