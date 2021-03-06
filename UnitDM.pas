unit UnitDM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZAbstractConnection, ZConnection;

type
  TDM = class(TForm)
  conZeos: TZConnection;
  private
    { Private declarations }
  public
    { Public declarations }
    conexao: TZConnection;
    conectado : Boolean;
    procedure Conectar;


  end;

var
  DM: TDM;

implementation

{$R *.dfm}

{ TDM }

procedure TDM.Conectar;
var
  lista : TStringList;
begin
  lista := TStringList.Create;

  conZeos.Database := 'db_vendas';
  conZeos.HostName := '127.0.0.1';
  conZeos.User     := 'postgres';
  conZeos.Password := 'postgres';


  conZeos.Connect;
  if conZeos.Connected then
    Conectado := True;

end;

end.
