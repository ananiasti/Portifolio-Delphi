unit uFuncoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untConsultaPadrao, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Excel2000, ComObj;

  procedure CarregaCombo(Combo: TComboBox; chave, descricao, tabela, where: string);
  procedure GerarExcel(Consulta:TZQuery);

implementation

uses UnitDM;

procedure CarregaCombo(Combo: TComboBox; chave,
  descricao, tabela, where: string);
var qryCombo : TZQuery;
begin
  qryCombo := TZQuery.Create(nil);
  qryCombo.Connection := DM.conZeos;

  if Trim(where) <> '' then
     where := ' where '+where ;

  qryCombo.SQL.Clear;
  qryCombo.SQL.Add('Select '+chave+','+descricao+' from '+tabela);
  qryCombo.SQL.Add(' '+where+' order by 2');
  qryCombo.Open;
  qryCombo.First;
  Combo.Items.Clear;
  while not qryCombo.Eof do
  begin
    combo.Items.AddObject(qryCombo.FieldByName(descricao).AsString, TObject(qryCombo.FieldByName(chave).AsInteger));
    qryCombo.Next;
  end;
end;

procedure GerarExcel(Consulta:TzQuery);
var coluna, linha: integer;
    excel: variant;
    valor: string;
begin
  try
    excel:=CreateOleObject('Excel.Application\');
    excel.Workbooks.add(1);
  except
    Application.MessageBox ('Erro ao abrir o MS-Excel','Erro\',MB_OK+MB_ICONEXCLAMATION);
  end;
  Consulta.First;
  try
    for linha := 0 to Consulta.RecordCount-1 do
    begin
      for coluna := 1 to Consulta.FieldCount do
      begin
        valor := Consulta.Fields[coluna-1].AsString;
        excel.cells[linha+2,coluna] := valor;
      end;
      Consulta.Next;
    end;
    for coluna := 1 to Consulta.FieldCount do
    begin
      valor := Consulta.Fields[coluna-1].DisplayLabel;
      excel.cells[1,coluna] := valor;
    end;
    excel.columns.AutoFit;
    excel.visible := true;
  except
    Application.MessageBox ('Erro ao exportar dados para o MS-Excel','Erro\',MB_OK+MB_ICONEXCLAMATION);
  end;
end;

end.
