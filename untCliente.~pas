unit untCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitCadastroPadrao, DB, ZAbstractRODataset, ZDataset, Buttons,
  ExtCtrls, ZAbstractDataset, StdCtrls;

type
  TfrmCadCliente = class(TfrmCadastroPadrao)
    edtCodigo: TEdit;
    edtEndereco: TEdit;
    edtCidade: TEdit;
    lbl1: TLabel;
    Label1: TLabel;
    EdtNome: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Panel9: TPanel;
    SpeedButton1: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure spbGravarClick(Sender: TObject);
    procedure LimpaCampos;
    function ValidaCampos: Boolean;
    procedure IncluirCliente;
    procedure AlterarCliente;
    procedure spbExcluirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

uses UnitDM, UnitPrincipal, untConsultaCliente;

{$R *.dfm}

procedure TfrmCadCliente.AlterarCliente;
begin
  zqryGeral.SQL.Clear;
  zqryGeral.SQL.Add('update public.tb_cliente set '                      );
  zqryGeral.SQL.Add('cliente_nome     = '+QuotedStr(EdtNome.Text)    +',');
  zqryGeral.SQL.Add('cliente_endereco = '+QuotedStr(edtEndereco.Text)+',');
  zqryGeral.SQL.Add('cliente_cidade   = '+QuotedStr(edtCidade.Text)      );
  zqryGeral.SQL.Add('where cliente_id   = '+edtCodigo.Text               );
  try
    zqryGeral.ExecSQL;
  Except
    on E: Exception do
    begin
      MessageDlg('Erro ao alterar Cliente', mtError, [mbok], 0);
     // ShowMessage('Erro ao incluir cliente !'+e.message);
     Exit;
    end;
  end;
  HabilitaBotoes(true);
  MessageDlg('Cliente alterado com sucrsso!',mtWarning,[mbOK],0)

end;

procedure TfrmCadCliente.FormShow(Sender: TObject);
begin
  inherited;
  zqryGeral.SQL.Clear;
  zqryGeral.Close;
  zqryGeral.SQL.Add('select cliente_nome, cliente_endereco, cliente_cidade from tb_cliente');
  zqryGeral.Open;
  operacao         := '';
  edtNome.Text     := zqryGeral.FieldByName('cliente_nome'    ).AsString;
  edtEndereco.Text := zqryGeral.FieldByName('cliente_endereco').AsString;
  edtCidade.Text   := zqryGeral.FieldByName('cliente_cidade'  ).AsString;
end;

procedure TfrmCadCliente.IncluirCliente;
begin
  zqryGeral.SQL.Clear;
  zqryGeral.SQL.Add('insert into public.tb_cliente');
  zqryGeral.SQL.Add('(cliente_nome, cliente_endereco,cliente_cidade)');
  zqryGeral.SQL.Add('Values');
  zqryGeral.SQL.Add('('+ QuotedStr(edtNome.Text)+','+QuotedStr(edtEndereco.Text)+','+QuotedStr(edtCidade.Text)+')');
  try
    zqryGeral.ExecSQL;
  Except
    on E: Exception do
    begin
      MessageDlg('Erro ao incluir Cliente', mtError, [mbok], 0);
     // ShowMessage('Erro ao incluir cliente !'+e.message);
     Exit;
    end;
  end;
  HabilitaBotoes(true);
  MessageDlg('Cliente incluído com sucrsso!',mtWarning,[mbOK],0)
end;

procedure TfrmCadCliente.LimpaCampos;
begin
  edtCodigo.Text   := EmptyStr;
  EdtNome.Text     := EmptyStr;
  edtEndereco.Text := EmptyStr;
  edtCidade.Text   := EmptyStr;
  operacao         := EmptyStr;
end;

procedure TfrmCadCliente.spbGravarClick(Sender: TObject);
begin
  inherited;
  if not ValidaCampos then
    Exit;

  if operacao = 'INCLUIR' then
    IncluirCliente;

  if operacao = 'ALTERAR' then
    AlterarCliente;

  operacao := EmptyStr;
  HabilitaBotoes(True);
end;

function TfrmCadCliente.ValidaCampos: Boolean;
begin
  if EdtNome.Text = EmptyStr then
  begin
    MessageDlg('O campo "Nome do Cliente" é obrigatório!',mtWarning,[mbOK],0);
    EdtNome.SetFocus;
    Result := False;
    Exit;
  end;
  if edtEndereco.Text = EmptyStr then
  begin
    MessageDlg('O campo "Endereço do Cliente" é obrigatório!',mtWarning,[mbOK],0);
    edtEndereco.SetFocus;
    Result := False;
    Exit;
  end;
  if edtCidade.Text = EmptyStr then
  begin
    MessageDlg('O campo "Cidade do Cliente" é obrigatório!',mtWarning,[mbOK],0);
    edtCidade.SetFocus;
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TfrmCadCliente.spbExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Tem certeza que deseja excluir este cliente ?', mtConfirmation,[mbYes,mbNo],0)= mryes then
  Begin
    zqryGeral.SQL.Clear;
    zqryGeral.Close;
    zqryGeral.SQL.Add('Delete from tb_cliente where cliente_id = '+QuotedStr(edtCodigo.Text));
    zqryGeral.ExecSQL;
  end
end;

procedure TfrmCadCliente.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  frmConsultaCliente.zqryGeral.Close;
  frmConsultaCliente.zqryGeral.Open;
  frmConsultaCliente.Show;
  frmCadCliente.Close;
end;

end.
