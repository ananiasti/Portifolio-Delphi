unit untPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untConsultaPadrao, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids, Mask, ComCtrls;

type
  TfrmPedido = class(TfrmConsultaPadrao)
    edtID: TEdit;
    lbl1: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    dbgrdCliente: TDBGrid;
    Panel5: TPanel;
    SpeedButton1: TSpeedButton;
    cbbCliente: TComboBox;
    dsGrid: TDataSource;
    dpkEmissao: TDateTimePicker;
    btnPesquisar: TButton;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CarregaPedido(Where : string);
    procedure MostraDados;
    procedure SpeedButton9Click(Sender: TObject);
    procedure LimpaCampos;
    procedure spbCadastroClick(Sender: TObject);
    procedure dpkEmissaoClick(Sender: TObject);
    procedure dpkEmissaoEnter(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure dbgrdClienteDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgrdClienteDblClick(Sender: TObject);
    procedure dbgrdClienteMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedido: TfrmPedido;
  totalped : Double;
implementation

uses uFuncoes, untItensPedido, UnitDM;

{$R *.dfm}

procedure TfrmPedido.FormShow(Sender: TObject);
begin
  inherited;
  CarregaCombo(cbbCliente,'cliente_id','cliente_nome','public.tb_cliente','');
  dpkEmissao.Format := '''';
  CarregaPedido('and 1 = 1');
end;

procedure TfrmPedido.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if cbbCliente.ItemIndex < 0 then
  begin
    MessageDlg('O campo "Nome do Cliente" ? obrigat?rio!',mtWarning,[mbOK],0);
    cbbCliente.SetFocus;
    Exit;
  end;

  try
    dpkEmissao.date
  except
    begin
      MessageDlg('O campo "Data de Emiss?o" ? obrigat?rio!',mtWarning,[mbOK],0);
      dpkEmissao.SetFocus;
      Exit;
    end;
  end;
  frmItensPedido.lblCliente.Caption := cbbCliente.Text;
  frmItensPedido.strngrdProduto.RowCount  := 2;
  frmItensPedido.strngrdProduto.FixedRows := 1;
  frmItensPedido.Show;
end;

procedure TfrmPedido.CarregaPedido(where : string);
begin
  zqryGeral.SQL.Clear;
  zqryGeral.SQL.Add('select pe.pedido_id Pedido, pe.pedido_dt_emissao Emissao,       ');
  zqryGeral.SQL.Add('  cl.cliente_nome cliente_nome,sum(pi.itens_pedido_valor) valor,');
  zqryGeral.SQL.Add('  cl.cliente_id                                                 ');
  zqryGeral.SQL.Add('from public.tb_pedido pe                                        ');
  zqryGeral.SQL.Add('left join public.tb_cliente      cl on cl.cliente_id             = pe.pedido_cliente');
  zqryGeral.SQL.Add('left join public.tb_itens_pedido pi on pi.itens_pedido_pedido_id = pe.pedido_id'     );
  zqryGeral.SQL.Add('where 1 = 1'   );
  zqryGeral.SQL.Add(where);
  zqryGeral.SQL.Add('group by pe.pedido_id, pe.pedido_dt_emissao, cl.cliente_nome, cl.cliente_id');
  zqryGeral.SQL.Add('order by Emissao');
  zqryGeral.Open;
  TNumericField(zqryGeral.FieldByName('valor')).DisplayFormat := ',0.00;-,0.00';
end;

procedure TfrmPedido.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  LimpaCampos;
  btnPesquisar.Enabled := True;
end;

procedure TfrmPedido.LimpaCampos;
begin
  edtID.Text           := EmptyStr;
  cbbCliente.ItemIndex := -1;
  dpkEmissao.Format := '''';
end;

procedure TfrmPedido.spbCadastroClick(Sender: TObject);
begin
  inherited;
  LimpaCampos;
  dpkEmissao.Format    := '';
  dpkEmissao.Date      := Now;
end;

procedure TfrmPedido.dpkEmissaoClick(Sender: TObject);
begin
  inherited;
  dpkEmissao.Format := '';
  dpkEmissao.Date   := Now;
end;

procedure TfrmPedido.dpkEmissaoEnter(Sender: TObject);
begin
  inherited;
  dpkEmissao.Format := '';
  dpkEmissao.Date   := Now;
end;

procedure TfrmPedido.btnPesquisarClick(Sender: TObject);
var SQL : string;
begin
  inherited;
  if cbbCliente.Text <> EmptyStr then
    SQL := 'and cliente_nome = '+ QuotedStr(cbbCliente.Text);

  if dpkEmissao.Format <> '''' then
    SQL := 'and pedido_dt_emissao = '+ QuotedStr(DateToStr(dpkEmissao.Date));

  CarregaPedido(SQL);
  btnPesquisar.Enabled := false;
end;

procedure TfrmPedido.dbgrdClienteDrawColumnCell(Sender: TObject;
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

procedure TfrmPedido.dbgrdClienteDblClick(Sender: TObject);
var linha     : Integer;
    zqryItens : TZQuery;
begin
  inherited;
  totalped := 0;
  zqryItens := TZQuery.Create(nil);
  zqryItens.Connection := dm.conZeos;
  zqryItens.SQL.Clear;
  zqryItens.SQL.Add('select itens_pedido_pedido_id pedido, itens_pedido_produto_id,              ');
  zqryItens.SQL.Add('  itens_pedido_qtd_prod qtd, itens_pedido_valor valor, pr.produto_nome,     ');
  zqryItens.SQL.Add('  (itens_pedido_qtd_prod * itens_pedido_valor) total                        ');
  zqryItens.SQL.Add('from public.tb_itens_pedido pi                                              ');
  zqryItens.SQL.Add('left join public.tb_produto pr on pr.produto_id = pi.itens_pedido_produto_id');
  zqryItens.SQL.Add('where itens_pedido_pedido_id = '+QuotedStr(edtID.Text));
  zqryItens.Open;

  frmItensPedido.strngrdProduto.RowCount  := zqryItens.RecordCount + 1;
  frmItensPedido.strngrdProduto.FixedRows := 1;
  linha := 1;

  while not zqryItens.Eof do
  begin
    frmItensPedido.strngrdProduto.Cells[0,linha] := zqryItens.FieldByName('pedido'      ).AsString;
    frmItensPedido.strngrdProduto.Cells[1,linha] := zqryItens.FieldByName('qtd'         ).AsString;
    frmItensPedido.strngrdProduto.Cells[2,linha] := zqryItens.FieldByName('produto_nome').AsString;
    frmItensPedido.strngrdProduto.Cells[3,linha] := zqryItens.FieldByName('valor'       ).AsString;
    frmItensPedido.strngrdProduto.Cells[4,linha] := FloatToStr(StrToFloat(FormatFloat('##,###,##0.00',
                                                                  zqryItens.FieldByName('total').AsFloat)));
    linha := linha + 1;
    totalped  := totalped + zqryItens.FieldByName('total').AsFloat;
    frmItensPedido.lblTotalPedido.Caption := FormatFloat('##,###,##0.00',totalPed);
    zqryItens.Next;
  end;
  frmItensPedido.lblCliente.Caption := zqryGeral.FieldByName('cliente_nome').AsString;;
  frmItensPedido.Show;
end;

procedure TfrmPedido.MostraDados;
begin
  edtID.Text           := zqryGeral.FieldByName('pedido'    ).AsString;
  cbbCliente.ItemIndex := zqryGeral.FieldByName('cliente_id').AsInteger;
  dpkEmissao.Format    := '';
  dpkEmissao.Date      := zqryGeral.FieldByName('emissao'   ).AsDateTime;
end;

procedure TfrmPedido.dbgrdClienteMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  MostraDados;
end;

end.
