unit untConsultaProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untConsultaPadrao, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids;

type
  TfrmConsultaProduto = class(TfrmConsultaPadrao)
    lbl1: TLabel;
    edtID: TEdit;
    Label1: TLabel;
    edtNome: TEdit;
    btnPesquisar: TButton;
    dsGrid: TDataSource;
    dbgrdProduto: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure MostraDados;
    procedure dbgrdProdutoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgrdProdutoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgrdProdutoDblClick(Sender: TObject);
    procedure spbCadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaProduto: TfrmConsultaProduto;

implementation

uses untCadastroProduto;

{$R *.dfm}

procedure TfrmConsultaProduto.FormShow(Sender: TObject);
begin
  inherited;
  zqryGeral.SQL.Clear;
  zqryGeral.Close;
  zqryGeral.SQL.Add('select produto_id, produto_nome, produto_preco from tb_produto order by produto_nome');
  zqryGeral.Open;
  TNumericField(zqryGeral.FieldByName('produto_preco')).DisplayFormat := ',0.00;-,0.00';
  MostraDados;
end;

procedure TfrmConsultaProduto.MostraDados;
begin
  edtID.Text   := zqryGeral.FieldByName('produto_id'  ).AsString;
  EdtNome.Text := zqryGeral.FieldByName('produto_nome').AsString;
end;

procedure TfrmConsultaProduto.dbgrdProdutoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  MostraDados;
end;

procedure TfrmConsultaProduto.dbgrdProdutoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if not odd(zqryGeral.RecNo) then
    if not (gdSelected in State) then
      begin
        dbgrdProduto.Canvas.Brush.Color := clMoneyGreen;
        dbgrdProduto.Canvas.FillRect(Rect);
        dbgrdProduto.DefaultDrawDataCell(rect,Column.Field,state);
      end;
end;

procedure TfrmConsultaProduto.dbgrdProdutoDblClick(Sender: TObject);
begin
  inherited;
  frmCadastroProduto := TfrmCadastroProduto.Create(Self);
  frmCadastroProduto.HabilitaBotoes(False);
  frmCadastroProduto.spbAlterarClick(Sender);
  frmCadastroProduto.edtCodigo.Text := zqryGeral.FieldByName('produto_id'   ).AsString;
  frmCadastroProduto.EdtNome.Text   := zqryGeral.FieldByName('produto_nome' ).AsString;
  frmCadastroProduto.edtPreco.Text  := FormatFloat('##,###,##0.00', StrToFloat(zqryGeral.FieldByName('produto_preco').AsString));
  frmCadastroProduto.Show;

end;

procedure TfrmConsultaProduto.spbCadastroClick(Sender: TObject);
begin
  inherited;
  frmCadastroProduto := TfrmCadastroProduto.Create(Self);
  frmCadastroProduto.HabilitaBotoes(true);
  frmCadastroProduto.LimpaCampos;
  frmCadastroProduto.Show;
end;

end.
