unit untConsultaCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untConsultaPadrao, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Excel2000, ComObj;

type
  TfrmConsultaCliente = class(TfrmConsultaPadrao)
    dbgrdCliente: TDBGrid;
    lbl1: TLabel;
    edtID: TEdit;
    Label1: TLabel;
    edtNome: TEdit;
    Label2: TLabel;
    edtEndereco: TEdit;
    Label3: TLabel;
    edtCidade: TEdit;
    dsGrid: TDataSource;
    btnPesquisar: TButton;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure dbgrdClienteDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgrdClienteDblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MostraDados;
    procedure dbgrdClienteMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton9Click(Sender: TObject);
    procedure LimpaCampos;
    procedure btnPesquisarClick(Sender: TObject);
    procedure spbExcelClick(Sender: TObject);
    procedure spbRelatorioClick(Sender: TObject);
    procedure spbCadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaCliente: TfrmConsultaCliente;

implementation

uses UnitDM, untCliente, UnitRepCliente, uFuncoes;

{$R *.dfm}

procedure TfrmConsultaCliente.FormShow(Sender: TObject);
begin
  inherited;
  zqryGeral.SQL.Clear;
  zqryGeral.Close;
  zqryGeral.SQL.Add('select cliente_id, cliente_nome, cliente_endereco, cliente_cidade from tb_cliente order by cliente_nome');
  zqryGeral.Open;
  MostraDados;
end;

procedure TfrmConsultaCliente.dbgrdClienteDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if not odd(zqryGeral.RecNo) then
    if not (gdSelected in State) then
      begin
        dbgrdCliente.Canvas.Brush.Color := clMoneyGreen;
        dbgrdCliente.Canvas.FillRect(Rect);
        dbgrdCliente.DefaultDrawDataCell(rect,Column.Field,state);
      end;
end;

procedure TfrmConsultaCliente.dbgrdClienteDblClick(Sender: TObject);
begin
  inherited;
  frmCadCliente := TfrmCadCliente.Create(Self);
  frmCadCliente.HabilitaBotoes(False);
  frmCadCliente.spbAlterarClick(Sender);
  frmCadCliente.edtCodigo.Text   := zqryGeral.FieldByName('cliente_id'      ).AsString;
  frmCadCliente.EdtNome.Text     := zqryGeral.FieldByName('cliente_nome'    ).AsString;
  frmCadCliente.edtEndereco.Text := zqryGeral.FieldByName('cliente_endereco').AsString;
  frmCadCliente.edtCidade.Text   := zqryGeral.FieldByName('cliente_cidade'  ).AsString;
  frmCadCliente.Show;
end;

procedure TfrmConsultaCliente.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  frmCadCliente := TfrmCadCliente.Create(Self);
  frmCadCliente.HabilitaBotoes(true);
  frmCadCliente.LimpaCampos;
  frmCadCliente.Show;
end;

procedure TfrmConsultaCliente.MostraDados;
begin
  edtID.Text       := zqryGeral.FieldByName('cliente_id'      ).AsString;
  EdtNome.Text     := zqryGeral.FieldByName('cliente_nome'    ).AsString;
  edtEndereco.Text := zqryGeral.FieldByName('cliente_endereco').AsString;
  edtCidade.Text   := zqryGeral.FieldByName('cliente_cidade'  ).AsString;
end;

procedure TfrmConsultaCliente.dbgrdClienteMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  MostraDados;
end;

procedure TfrmConsultaCliente.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  LimpaCampos;
  btnPesquisar.Enabled := True;
end;

procedure TfrmConsultaCliente.LimpaCampos;
begin
  edtID.Text       := EmptyStr;
  EdtNome.Text     := EmptyStr;
  edtEndereco.Text := EmptyStr;
  edtCidade.Text   := EmptyStr;
end;

procedure TfrmConsultaCliente.btnPesquisarClick(Sender: TObject);
begin
  inherited;

  zqryGeral.SQL.Clear;
  zqryGeral.Close;
  zqryGeral.SQL.Add('select cliente_id, cliente_nome, cliente_endereco, cliente_cidade from tb_cliente where 1 = 1');

  if edtNome.Text <> EmptyStr then
    zqryGeral.SQL.Add('and upper(cliente_nome)     like '+QuotedStr('%'+UpperCase(edtNome.Text    )+'%'));

  if edtEndereco.Text <> EmptyStr then
    zqryGeral.SQL.Add('and upper(cliente_endereco) like '+QuotedStr('%'+UpperCase(edtEndereco.Text)+'%'));

  if edtCidade.Text <> EmptyStr then
    zqryGeral.SQL.Add('and upper(cliente_cidade)   like '+QuotedStr('%'+UpperCase(edtCidade.Text  )+'%'));

  zqryGeral.Open;
  btnPesquisar.Enabled := False;
end;

procedure TfrmConsultaCliente.spbExcelClick(Sender: TObject);
begin
  inherited;
  GerarExcel(zqryGeral);
end;

procedure TfrmConsultaCliente.spbRelatorioClick(Sender: TObject);
begin
  inherited;
   frmRelCliente.qrpCliente.Preview;
end;

procedure TfrmConsultaCliente.spbCadastroClick(Sender: TObject);
begin
  inherited;
  frmCadCliente := TfrmCadCliente.Create(Self);
  frmCadCliente.HabilitaBotoes(true);
  frmCadCliente.LimpaCampos;
  frmCadCliente.Show;
end;

end.
