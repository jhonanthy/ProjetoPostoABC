unit UnfrmRelatorioAbastecimento2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Vcl.Imaging.pngimage,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmRelatorioAbastecimento2 = class(TForm)
    RLReport1: TRLReport;
    RLBand5: TRLBand;
    RLImage1: TRLImage;
    RLPanel1: TRLPanel;
    RLLbTitulo: TRLLabel;
    RLGroup1: TRLGroup;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDQuery1ABA_CODIGO: TIntegerField;
    FDQuery1ABA_TIPOCOMBUSTIVEL: TStringField;
    FDQuery1ABA_BOMBA_UTILIZADA: TIntegerField;
    FDQuery1ABA_DATA: TDateField;
    FDQuery1ABA_VALOR_BRUTO: TSingleField;
    FDQuery1ABA_VALOR_LIQUIDO: TSingleField;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand7: TRLBand;
    RLPanel3: TRLPanel;
    RLLabel7: TRLLabel;
    RLDBResult2: TRLDBResult;
    RLLabel10: TRLLabel;
    RLDBResult3: TRLDBResult;
    RLLabel11: TRLLabel;
    RLDBResult4: TRLDBResult;
    RLLabel12: TRLLabel;
    RLPanel2: TRLPanel;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBText1: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    FDQuery1Desconto: TCurrencyField;
    RLLabel3: TRLLabel;
    RLDBResult1: TRLDBResult;
    procedure FDQuery1CalcFields(DataSet: TDataSet);
  private
    FTipoAgrupamento: integer;
    procedure SetTipoAgrupamento(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    property TipoAgrupamento: integer read FTipoAgrupamento write SetTipoAgrupamento;
    procedure imprimirRelatorio;
  end;

var
  frmRelatorioAbastecimento2: TfrmRelatorioAbastecimento2;

implementation

{$R *.dfm}

uses UnFrmCadAbastecimento;

{ TfrmRelatorioAbastecimento2 }

procedure TfrmRelatorioAbastecimento2.FDQuery1CalcFields(DataSet: TDataSet);
begin
FDQuery1DESCONTO.AsCurrency:= (FDQuery1ABA_VALOR_BRUTO.AsCurrency * 13)/100;
end;

procedure TfrmRelatorioAbastecimento2.imprimirRelatorio;
begin
case TipoAgrupamento of
//Dia
0:
  begin
    RLLbTitulo.Caption:=RLLbTitulo.Caption + '  -  Dia';
    RLGroup1.DataFields:='ABA_DATA';
  end;
1:// tanque
  begin
    RLLbTitulo.Caption:=RLLbTitulo.Caption + '   -  Tanque';
    RLGroup1.DataFields:= 'ABA_TIPOCOMBUSTIVEL';
  end;
  2: // bomba
  begin
    RLLbTitulo.Caption:=RLLbTitulo.Caption + '   -  Bomba Utilizada';
    RLGroup1.DataFields:='ABA_BOMBA_UTILIZADA';
  end;

end;

RLReport1.Preview;
end;

procedure TfrmRelatorioAbastecimento2.SetTipoAgrupamento(const Value: integer);
begin
  FTipoAgrupamento := Value;
end;

end.
