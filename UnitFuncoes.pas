unit UnitFuncoes;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untConsultaPadrao, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Excel2000, ComObj,dbTables;

procedure GerarExcel(Consulta:TzQuery);

implementation

procedure GerarExcel(Consulta:TzQuery);
var coluna, linha: integer;
    sheet: variant;
    valor: string;
begin
  try
    sheet := CreateOleObject('Excel.Application\');
   // excel.Workbooks.add(1);
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
        sheet.cells[linha+2,coluna] := valor;
      end;
      Consulta.Next;
    end;
    for coluna := 1 to Consulta.FieldCount do
    begin
      valor := Consulta.Fields[coluna-1].DisplayLabel;
      sheet.cells[1,coluna] := valor;
    end;
    sheet.columns.AutoFit;
    sheet.visible := true;
  except
    Application.MessageBox ('Erro ao exportar dados para o MS-Excel','Erro\',MB_OK+MB_ICONEXCLAMATION);
  end;
end;

end.
 