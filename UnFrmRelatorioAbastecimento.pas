unit UnFrmRelatorioAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Imaging.pngimage;

type
  TfrmRelatorioAbastecimento = class(TForm)
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    RLReport1: TRLReport;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLGroup2: TRLGroup;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLBand3: TRLBand;
    RLDBText4: TRLDBText;
    RLBand4: TRLBand;
    RLLabel2: TRLLabel;
    RLDBResult1: TRLDBResult;
    FDQuery1ABA_CODIGO: TIntegerField;
    FDQuery1ABA_TIPOCOMBUSTIVEL: TStringField;
    FDQuery1ABA_BOMBA_UTILIZADA: TIntegerField;
    FDQuery1ABA_DATA: TDateField;
    FDQuery1ABA_VALOR_BRUTO: TSingleField;
    FDQuery1ABA_VALOR_LIQUIDO: TSingleField;
    RLBand5: TRLBand;
    RLImage1: TRLImage;
    RLPanel1: TRLPanel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLGroup3: TRLGroup;
    RLDraw1: TRLDraw;
    RLLabel6: TRLLabel;
    RLPanel2: TRLPanel;
    RLDBText3: TRLDBText;
    RLLabel1: TRLLabel;
    RLBand6: TRLBand;
    RLLabel5: TRLLabel;
    RLDBText5: TRLDBText;
    procedure FDQuery1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
//    procedure ImprimiRelatorio;
  end;

var
  frmRelatorioAbastecimento: TfrmRelatorioAbastecimento;

implementation

{$R *.dfm}

uses UnDataModule;

{ TForm1 }

//procedure TfrmRelatorioAbastecimento.ImprimiRelatorio;

//begin
//
//with
//
//RLReport1.Preview;
//end;

procedure TfrmRelatorioAbastecimento.FDQuery1CalcFields(DataSet: TDataSet);
begin
// FDQuery1ABA_VALOR.ascurrency:=FDQuery1ABA_VALOR_LIQUIDO.AsCurrency;
end;

end.
