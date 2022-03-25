unit UnitRepCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ExtCtrls;

type
  TfrmRelCliente = class(TForm)
    qrpCliente: TQuickRep;
    dsGrid: TDataSource;
    zqryGeral: TZQuery;
    qrbnd: TQRBand;
    QRLabel1: TQRLabel;
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    qrlbl1: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCliente: TfrmRelCliente;

implementation

uses untConsultaCliente;

{$R *.dfm}

end.
