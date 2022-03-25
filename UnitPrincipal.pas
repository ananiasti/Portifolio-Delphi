unit UnitPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, jpeg, ExtCtrls, ComCtrls, StdCtrls, Buttons, UnitDM;

type
  TFormPrincipal = class(TForm)
    mnPrincipal: TMainMenu;
    Cadastros1: TMenuItem;
    Vendas1: TMenuItem;
    mnOpcClientes: TMenuItem;
    mnOpcProdutos: TMenuItem;
    mnOpcPedido: TMenuItem;
    Relatrios1: TMenuItem;
    stat1: TStatusBar;
    Panel1: TPanel;
    btnSair: TBitBtn;
    lbl2: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbl3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbl1: TLabel;
    lblNomeTela: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure mnOpcClientesClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure mnOpcProdutosClick(Sender: TObject);
    procedure mnOpcPedidoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form : TForm;
  FormPrincipal: TFormPrincipal;

implementation

uses  UnitCadastroPadrao, untCliente, untConsultaCliente,
  untConsultaProduto, untPedido;

{$R *.dfm}

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
  lblNomeTela.Caption := 'Cadastro de clientes';
  stat1.Panels[2].Text := DateToStr(now)+'   '+TimeToStr(Now);
  DM.Conectar;
end;

procedure TFormPrincipal.btnSairClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente sair do sistema ?', mtConfirmation,[mbYes,mbNo],0)= mryes then
    Application.Terminate;
end;

procedure TFormPrincipal.mnOpcClientesClick(Sender: TObject);
begin
  lblNomeTela.Caption := 'Consulta de Clientes';
  frmConsultaCliente := TfrmConsultaCliente.Create(Self);
  frmConsultaCliente.Show;
end;

procedure TFormPrincipal.FormResize(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TFormPrincipal.mnOpcProdutosClick(Sender: TObject);
begin
  lblNomeTela.Caption := 'Consulta de Produtos';
  frmConsultaProduto  := TfrmConsultaProduto.Create(Self);
  frmConsultaProduto.Show;
end;

procedure TFormPrincipal.mnOpcPedidoClick(Sender: TObject);
begin
  lblNomeTela.Caption := 'Emissão de Pedidos';
  frmPedido := TfrmPedido.Create(Self);
  frmPedido.Show;
end;

end.
