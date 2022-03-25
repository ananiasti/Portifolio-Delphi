unit untItensPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untConsultaPadrao, StdCtrls, DB, Grids, DBGrids,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Buttons, ExtCtrls;

type
  TfrmItensPedido = class(TfrmConsultaPadrao)
    lbl1: TLabel;
    Label1: TLabel;
    edtID: TEdit;
    dsGrid: TDataSource;
    cbbProduto: TComboBox;
    zqryPreco: TZQuery;
    edtValor: TEdit;
    Label2: TLabel;
    strngrdProduto: TStringGrid;
    Label3: TLabel;
    lblTotalPedido: TLabel;
    Label4: TLabel;
    lblCliente: TLabel;
    Panel7: TPanel;
    SpeedButton2: TSpeedButton;
    edtQtd: TEdit;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure cbbProdutoChange(Sender: TObject);
    procedure LimparCampos;
    procedure GravaPedido;
    procedure spbCadastroClick(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edtQtdKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmItensPedido: TfrmItensPedido;
  totalPedido : Double;
implementation

uses uFuncoes, untPedido;

{$R *.dfm}

procedure TfrmItensPedido.FormShow(Sender: TObject);
begin
  inherited;
  CarregaCombo(cbbProduto,'produto_id','produto_nome','public.tb_produto','');

  strngrdProduto.ColWidths[0] := 80;
  strngrdProduto.ColWidths[1] := 80;
  strngrdProduto.ColWidths[2] := 500;
  strngrdProduto.ColWidths[3] := 100;
  strngrdProduto.ColWidths[4] := 80;

  strngrdProduto.Cells[0,0] := 'Código ';
  strngrdProduto.Cells[1,0] := 'Quantidade ';
  strngrdProduto.Cells[2,0] := 'Descrição ';
  strngrdProduto.Cells[3,0] := 'Valor ';
  strngrdProduto.Cells[4,0] := 'Total ';
  totalPedido               := 0;
  LimparCampos;
end;

procedure TfrmItensPedido.cbbProdutoChange(Sender: TObject);
begin
  inherited;
  zqryPreco.SQL.Clear;
  zqryPreco.SQL.Add('SELECT produto_id, produto_nome, produto_preco FROM  public.tb_produto ');
  zqryPreco.SQL.Add(' WHERE produto_id = ' + IntToStr(Integer(cbbProduto.Items.Objects[cbbProduto.ItemIndex])));
  zqryPreco.Open;
  edtValor.Text := FormatFloat('##,###,##0.00', StrToFloat(zqryPreco.FieldByName('produto_preco').AsString));
  edtID.Text    := zqryPreco.FieldByName('produto_id').AsString;
end;

procedure TfrmItensPedido.LimparCampos;
begin
  edtID.Text           := EmptyStr;
  cbbProduto.ItemIndex := -1;
  edtValor.Text        := '0,00';
  edtQtd.Text          := EmptyStr;
end;

procedure TfrmItensPedido.spbCadastroClick(Sender: TObject);
begin
  inherited;
  LimparCampos;
end;

procedure TfrmItensPedido.SpeedButton9Click(Sender: TObject);
var total : Double;
begin
  inherited;
  total       := 0;
  if cbbProduto.ItemIndex < 0 then
  begin
    MessageDlg('O campo "Nome do Produto" é obrigatório!',mtWarning,[mbOK],0);
    cbbProduto.SetFocus;
    Exit;
  end;

  if (edtValor.Text = EmptyStr) or (StrToFloat(FormatFloat('##,###,##0.00', StrToFloat(edtValor.Text))) <= 0) then
  begin
    MessageDlg('O campo "Valor do Produto" é obrigatório!',mtWarning,[mbOK],0);
    edtValor.SetFocus;
    Exit;
  end;

  if (edtQtd.Text = EmptyStr) or (StrToFloat(FormatFloat('##,###,##0.00', StrToFloat(edtQtd.Text))) <= 0) then
  begin
    MessageDlg('O campo "Quantidade do Produto" é obrigatório!',mtWarning,[mbOK],0);
    edtQtd.SetFocus;
    Exit;
  end;
  strngrdProduto.Cells[0,strngrdProduto.RowCount-1] := edtID.Text;
  strngrdProduto.Cells[1,strngrdProduto.RowCount-1] := edtQtd.Text;
  strngrdProduto.Cells[2,strngrdProduto.RowCount-1] := cbbProduto.Text;
  strngrdProduto.Cells[3,strngrdProduto.RowCount-1] := edtValor.Text;

  total       := StrToFloat(edtValor.Text)*StrToFloat(edtQtd.Text);
  totalPedido := totalPedido + total;

  strngrdProduto.Cells[4,strngrdProduto.RowCount-1] := FloatToStr(StrToFloat(FormatFloat('##,###,##0.00', total)));
  strngrdProduto.RowCount := strngrdProduto.RowCount+1;

  lblTotalPedido.Caption := FormatFloat('##,###,##0.00',totalPedido);
  LimparCampos;
end;

procedure TfrmItensPedido.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) and (Key <> ',')then
    key := #0;
end;

procedure TfrmItensPedido.GravaPedido;
var ChavePedido,Linha : Integer;
begin
  zqryGeral.SQL.Clear;
  zqryGeral.SQL.Add('insert into public.tb_pedido');
  zqryGeral.SQL.Add('(pedido_cliente, pedido_dt_emissao)');
  zqryGeral.SQL.Add('Values');
  zqryGeral.SQL.Add('('+ QuotedStr(IntToStr(Integer(frmPedido.cbbCliente.Items.Objects[frmPedido.cbbCliente.ItemIndex])))+','+
              QuotedStr(DateToStr(frmPedido.dpkEmissao.Date))+')');
  try
    zqryGeral.ExecSQL;
  Except
    on E: Exception do
    begin
      MessageDlg('Erro ao incluir Pedido', mtError, [mbok], 0);
     // ShowMessage('Erro ao incluir cliente !'+e.message);
     Exit;
    end;
  end;

  zqryGeral.SQL.Clear;
  zqryGeral.SQL.Add('select max(pedido_id) chave from public.tb_pedido ');
  zqryGeral.Open;
  ChavePedido := zqryGeral.FieldByName('chave').AsInteger;

  linha := 1;
  while strngrdProduto.RowCount >= Linha  do
  begin
    if strngrdProduto.Cells[0,linha] <> EmptyStr then
    begin
      zqryGeral.SQL.Clear;
      zqryGeral.SQL.Add('insert into public.tb_itens_pedido');
      zqryGeral.SQL.Add('(itens_pedido_pedido_id, itens_pedido_produto_id, itens_pedido_valor,');
      zqryGeral.SQL.Add(' itens_pedido_qtd_prod)');
      zqryGeral.SQL.Add('Values');
      zqryGeral.SQL.Add('('+ IntToStr(ChavePedido)   +',');
      zqryGeral.SQL.Add(QuotedStr(strngrdProduto.Cells[0,linha])+',');
      zqryGeral.SQL.Add(StringReplace(strngrdProduto.Cells[3,linha],',','.',[rfReplaceAll, rfIgnoreCase])+',');
      zqryGeral.SQL.Add(StringReplace(strngrdProduto.Cells[1,linha],',','.',[rfReplaceAll, rfIgnoreCase])+')');

      //zqryGeral.SQL.Add(StringReplace(strngrdProduto.Cells[4,linha],',','.',[rfReplaceAll, rfIgnoreCase])+')');
      try
        zqryGeral.ExecSQL;
      Except
        on E: Exception do
        begin
          MessageDlg('Erro ao incluir Itens de Pedido', mtError, [mbok], 0);
         // ShowMessage('Erro ao incluir cliente !'+e.message);
         Exit;
        end;
      end;
    end;
    Linha := Linha + 1;
  end;
  MessageDlg('Pedido incluído com sucesso!',mtWarning,[mbOK],0)
end;

procedure TfrmItensPedido.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if strngrdProduto.Cells[0,1] = EmptyStr then
  begin
    MessageDlg('Este pedido não contém itens!',mtWarning,[mbOK],0);
    cbbProduto.SetFocus;
    Exit;
  end;
  GravaPedido;
end;

procedure TfrmItensPedido.edtQtdKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) and (Key <> ',')then
    key := #0;
end;

end.
