unit UnDataModule;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBDatabase, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;
type
  TfrmDataModule = class(TForm)
    FDConnection1: TFDConnection;
    FDTransaction1: TFDTransaction;
    FDQuery1: TFDQuery;
    FDTable1: TFDTable;
    FDQueryConsulta: TFDQuery;
    FDTable1ABA_CODIGO: TIntegerField;
    FDTable1ABA_BOMBA_UTILIZADA: TIntegerField;
    FDTable1ABA_DATA: TDateField;
    FDTable1DESCONTO: TCurrencyField;
    FDTable1ABA_TIPOCOMBUSTIVEL: TStringField;
    FDQuery1ABA_CODIGO: TIntegerField;
    FDQuery1ABA_TIPOCOMBUSTIVEL: TStringField;
    FDQuery1ABA_BOMBA_UTILIZADA: TIntegerField;
    FDQuery1ABA_QTDLITROS: TSingleField;
    FDQuery1ABA_DATA: TDateField;
    FDQuery1ABA_PRECO_COMBUSTIVEL: TSingleField;
    FDQuery1ABA_VALOR_BRUTO: TSingleField;
    FDQuery1ABA_VALOR_LIQUIDO: TSingleField;
    FDTable1ABA_QTDLITROS: TSingleField;
    FDTable1ABA_PRECO_COMBUSTIVEL: TSingleField;
    FDTable1ABA_VALOR_BRUTO: TSingleField;
    FDTable1ABA_VALOR_LIQUIDO: TSingleField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  frmDataModule: TfrmDataModule;
implementation
{$R *.dfm}
end.
