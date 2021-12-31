unit UnFormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait;

type
  TfrmPrincipal = class(TForm)
    PanelPrincipal: TPanel;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDQuery1ABA_CODIGO: TIntegerField;
    FDQuery1ABA_TIPOCOMBUSTIVEL: TStringField;
    FDQuery1ABA_BOMBA_UTILIZADA: TIntegerField;
    FDQuery1ABA_QTDLITROS: TSingleField;
    FDQuery1ABA_DATA: TDateField;
    FDQuery1ABA_PRECO_COMBUSTIVEL: TSingleField;
    FDQuery1ABA_VALOR_BRUTO: TSingleField;
    FDQuery1ABA_VALOR_LIQUIDO: TSingleField;
    Panel1: TPanel;
    pnlbutton: TPanel;
    Panel2: TPanel;
    MonthCalendar1: TMonthCalendar;
    Panel3: TPanel;
    SBAbastecimento: TSpeedButton;
    sbImprimir: TSpeedButton;
    sbSair: TSpeedButton;
    Panel4: TPanel;
    lbConsulta: TLabel;
    edtConsulta: TEdit;
    cbPesquisa: TComboBox;
    PanelData: TPanel;
    Timer1: TTimer;
    dbgAtividade: TDBGrid;
    FDQuery1Desconto: TCurrencyField;
    procedure Timer1Timer(Sender: TObject);
    procedure SBAbastecimentoClick(Sender: TObject);
    procedure sbSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DbgAbastecimentoDblClick(Sender: TObject);
    procedure FDQuery1CalcFields(DataSet: TDataSet);
    procedure sbImprimirClick(Sender: TObject);
  private
    FConsultaSQL: string;
    procedure SetConsultaSQL(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizaAbastecimento;
    property ConsultaSQL :string read FConsultaSQL write SetConsultaSQL;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UnDataModule, UnFrmCadAbastecimento, UnFrmRelatorioAbastecimento;

{ TfrmPrincipal }

procedure TfrmPrincipal.AtualizaAbastecimento;
begin
FDQuery1.Close;
FDQuery1.Open;


end;

procedure TfrmPrincipal.DbgAbastecimentoDblClick(Sender: TObject);
var
strComando:string;
begin

  with TfrmCadAbastecimento.Create(self)do
  try

    with FDQuery1 do
    begin
      Close;
      sql.Clear;
      strComando := '  select * from ABASTECIMENTO ' +
        '  where ABA_CODIGO in (' + StringReplace(
        'select * from ABASTECIMENTO ODER BY ABA_CODIGO DESC', '*',
        'ABA_CODIGO', []) + ')';

      sql.Add(strComando);
      Open;
      Locate('ABA_CODIGO', FDQueryConsulta.FieldByName('ABA_CODIGO').AsString, []);
      CbBombaUtilizada.ItemIndex:= FieldByName('ABA_BOMBA_UTILIZADA').AsInteger
    end;

  finally

  end;
end;

procedure TfrmPrincipal.FDQuery1CalcFields(DataSet: TDataSet);
begin
 FDQuery1Desconto.AsCurrency:= FDQuery1ABA_VALOR_BRUTO.AsCurrency * 0.13;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
AtualizaAbastecimento;
end;

procedure TfrmPrincipal.SBAbastecimentoClick(Sender: TObject);
begin
with TfrmCadAbastecimento.Create(self) do
try
  showmodal;
finally
  AtualizaAbastecimento;
end;
end;

procedure TfrmPrincipal.sbImprimirClick(Sender: TObject);
begin
  frmRelatorioAbastecimento.RLReport1.Preview;
end;

procedure TfrmPrincipal.sbSairClick(Sender: TObject);
begin
frmPrincipal.Close;
end;

procedure TfrmPrincipal.SetConsultaSQL(const Value: string);
begin
  FConsultaSQL := Value;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
PanelData.Caption := DateToStr(Date) + '  ' + TimeToStr(Now);
end;

end.
