unit untCadastroProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitCadastroPadrao, StdCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Buttons, ExtCtrls;

type
  TfrmCadastroProduto = class(TfrmCadastroPadrao)
    edtCodigo: TEdit;
    EdtNome: TEdit;
    edtPreco: TEdit;
    lbl1: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Panel9: TPanel;
    SpeedButton1: TSpeedButton;
    procedure spbGravarClick(Sender: TObject);
    function ValidaCampos: Boolean;
    procedure IncluirProduto;
    procedure AlterarProduto;
    procedure spbExcluirClick(Sender: TObject);
    procedure LimpaCampos;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroProduto: TfrmCadastroProduto;

implementation

uses untConsultaProduto;

{$R *.dfm}

procedure TfrmCadastroProduto.AlterarProduto;
begin
  zqryGeral.SQL.Clear;
  zqryGeral.SQL.Add('update public.tb_produto set '                    );
  zqryGeral.SQL.Add('produto_nome     = '+QuotedStr(EdtNome.Text)  +',');
  zqryGeral.SQL.Add('produto_preco    = '+QuotedStr(StringReplace(edtPreco.Text,',','.',[rfReplaceAll, rfIgnoreCase])));
  zqryGeral.SQL.Add('where produto_id = '+edtCodigo.Text               );
  try
    zqryGeral.ExecSQL;
  Except
    on E: Exception do
    begin
      MessageDlg('Erro ao alterar Produto', mtError, [mbok], 0);
     // ShowMessage('Erro ao incluir cliente !'+e.message);
     Exit;
    end;
  end;
  HabilitaBotoes(true);
  MessageDlg('Produto alterado com sucesso!',mtWarning,[mbOK],0)
end;

procedure TfrmCadastroProduto.IncluirProduto;
begin
  zqryGeral.SQL.Clear;
  zqryGeral.SQL.Add('insert into public.tb_produto');
  zqryGeral.SQL.Add('(produto_nome, produto_preco)');
  zqryGeral.SQL.Add('Values');
  zqryGeral.SQL.Add('('+ QuotedStr(edtNome.Text)+','+QuotedStr(StringReplace(edtPreco.Text,',','.',[rfReplaceAll, rfIgnoreCase]))+')');
  try
    zqryGeral.ExecSQL;
  Except
    on E: Exception do
    begin
      MessageDlg('Erro ao incluir Produto', mtError, [mbok], 0);
     // ShowMessage('Erro ao incluir cliente !'+e.message);
     Exit;
    end;
  end;
  HabilitaBotoes(true);
  MessageDlg('Produto inclu?do com sucesso!',mtWarning,[mbOK],0)
end;

procedure TfrmCadastroProduto.spbGravarClick(Sender: TObject);
begin
  inherited;
  if not ValidaCampos then
    Exit;

  if operacao = 'INCLUIR' then
    IncluirProduto;

  if operacao = 'ALTERAR' then
    AlterarProduto;

  operacao := EmptyStr;
  HabilitaBotoes(True);
end;

function TfrmCadastroProduto.ValidaCampos: Boolean;
begin
  if EdtNome.Text = EmptyStr then
  begin
    MessageDlg('O campo "Nome do Produto" ? obrigat?rio!',mtWarning,[mbOK],0);
    EdtNome.SetFocus;
    Result := False;
    Exit;
  end;
  if edtPreco.Text = EmptyStr then
  begin
    MessageDlg('O campo "Pre?o do produto" ? obrigat?rio!',mtWarning,[mbOK],0);
    edtPreco.SetFocus;
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TfrmCadastroProduto.spbExcluirClick(Sender: TObject);
begin
  inherited;
  inherited;
  if MessageDlg('Tem certeza que deseja excluir este produto ?', mtConfirmation,[mbYes,mbNo],0)= mryes then
  Begin
    zqryGeral.SQL.Clear;
    zqryGeral.Close;
    zqryGeral.SQL.Add('Delete from tb_produto where produto_id = '+QuotedStr(edtCodigo.Text));
    zqryGeral.ExecSQL;
  end
end;

procedure TfrmCadastroProduto.LimpaCampos;
begin
  edtCodigo.Text := EmptyStr;
  EdtNome.Text   := EmptyStr;
  edtPreco.Text  := EmptyStr;
end;

procedure TfrmCadastroProduto.FormShow(Sender: TObject);
begin
  inherited;
  zqryGeral.SQL.Clear;
  zqryGeral.Close;
  zqryGeral.SQL.Add('select produto_id, produto_nome, produto_preco from tb_produto');
  zqryGeral.Open;
  operacao       := '';
  edtCodigo.Text := zqryGeral.FieldByName('produto_id'  ).AsString;
  EdtNome.Text   := zqryGeral.FieldByName('produto_nome').AsString;
  edtPreco.Text  := FormatFloat('##,###,##0.00', StrToFloat(zqryGeral.FieldByName('produto_preco').AsString));
end;

procedure TfrmCadastroProduto.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  frmConsultaProduto.zqryGeral.Close;
  frmConsultaProduto.zqryGeral.Open;
  frmConsultaProduto.Show;
  frmCadastroProduto.Close;
end;

end.
