{{ Sistema de Abastecimento
    Author Jhonanthy Almeida

}


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
    DbgAbastecimento: TDBGrid;
    FDQuery1Desconto: TCurrencyField;
    procedure Timer1Timer(Sender: TObject);
    procedure SBAbastecimentoClick(Sender: TObject);
    procedure sbSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DbgAbastecimentoDblClick(Sender: TObject);
    procedure FDQuery1CalcFields(DataSet: TDataSet);
    procedure sbImprimirClick(Sender: TObject);
    procedure edtConsultaChange(Sender: TObject);
    procedure cbPesquisaChange(Sender: TObject);
    procedure MonthCalendar1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FConsultaSQL: string;
    FDataAbastecimento: TDateTime;
    procedure SetConsultaSQL(const Value: string);
    procedure SetDataAbastecimento(const Value: TDateTime);
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizaAbastecimento;
    property ConsultaSQL :string read FConsultaSQL write SetConsultaSQL;
    property DataAbastecimento :TDateTime read FDataAbastecimento write SetDataAbastecimento;


  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses  UnFrmCadAbastecimento, UnFrmRelatorioAbastecimento, UnConfigRelatorios;

{ TfrmPrincipal }

procedure TfrmPrincipal.AtualizaAbastecimento;
var
strComando:string;
begin
strComando:='select * from ABASTECIMENTO';
if DataAbastecimento<>0 then
strComando:=strComando + '  Where ABA_DATA = '+ quotedstr(FormatDateTime('mm/dd/yyyy', DataAbastecimento));

strComando:=strComando + '  order by ABA_CODIGO desc';

FDQuery1.Close;
FDQuery1.SQL.Clear;
FDQuery1.SQL.Add(strComando);
FDQuery1.Open;


end;

procedure TfrmPrincipal.cbPesquisaChange(Sender: TObject);
var
Text:string;
begin
Text:=trim(edtConsulta.text);
  if cbPesquisa.ItemIndex = 6 then
  begin
    edtConsulta.Text:=' ';
    edtConsulta.Enabled:=false;
  end
  else
  begin
   edtConsulta.Enabled:=true;

  end;

   if not Text.isEmpty then
    edtConsulta.Clear;

  if edtConsulta.CanFocus then
    edtConsulta.SetFocus;
end;
procedure TfrmPrincipal.DbgAbastecimentoDblClick(Sender: TObject);
var
strComando:string;
codigo:integer;
begin
 codigo:= FDQuery1ABA_CODIGO.AsInteger;
  with TfrmCadAbastecimento.Create(self)do
  try

    with FDTable1 do
    begin
      Close;
      sql.Clear;
      strComando := '  select * from ABASTECIMENTO ' +
        '  where ABA_CODIGO in (' + StringReplace(
        inttostr(codigo), '*',
        'ABA_CODIGO', []) + ')';

      sql.Add(strComando);
      Open;
      Locate('ABA_CODIGO', FDQuery1.FieldByName('ABA_CODIGO').AsString, []);
      CbBombaUtilizada.ItemIndex:= FieldByName('ABA_BOMBA_UTILIZADA').AsInteger;
      begin
      FDTable1.Edit;    //carregando campo calculado imposto para;
      FDTable1.FieldByName('DESCONTO').AsCurrency:= self.FDQuery1Desconto.AsCurrency;
      end;
    end;

  finally
     showmodal;
     AtualizaAbastecimento;
     Free;
     FreeOnRelease;
  end;
end;



procedure TfrmPrincipal.edtConsultaChange(Sender: TObject);
var
strComando:string;
begin

strComando:=' Select * from ABASTECIMENTO  ';
  FDQuery1.Close;

    if trim(edtConsulta.Text)='' then
       strComando:= strComando + '  ';
    case cbPesquisa.ItemIndex of
     0 : // codigo do abastecimento
      begin
       strComando:= strComando + '  WHERE ABA_CODIGO = '+trim(edtConsulta.Text);
      end;
     1: //tipo de combustivel
       begin
       strComando:= strComando + '  WHERE upper(ABA_TIPOCOMBUSTIVEL) LIKE '+quotedstr('%'+ uppercase(edtConsulta.Text)+'%');
       end;
     2: // bomba utilizada
       begin
       strComando:= strComando + '  WHERE ABA_BOMBA_UTILIZADA = '+trim(edtConsulta.Text);
       end;
     3: // Dia
      begin
       strComando:= strComando + '  WHERE EXTRACT(Day from ABA_DATA) like '+trim(edtConsulta.Text);
      end;
     4://M�s
      begin
       strComando:= strComando + '  WHERE EXTARCT(Month from ABA_DATA) like '+trim(edtConsulta.Text);
      end;
     5://Ano
     begin
       strComando:= strComando + '  WHERE EXTARCT(Year from ABA_DATA) like '+trim(edtConsulta.Text);
     end;
     6: //Todos os Registros
     begin
       strComando:= strComando + '  ';
     end;

    end;

strComando:= strComando +'  order by ABA_CODIGO desc';
FDQuery1.SQL.Clear;
FDQuery1.SQL.Add(strComando);
FDQuery1.open;
if  FDQuery1.IsEmpty then
application.MessageBox('Consulta n�o encontrada na Base!','Informa��o',MB_OK+MB_ICONINFORMATION);

end;
procedure TfrmPrincipal.FDQuery1CalcFields(DataSet: TDataSet);
begin
 FDQuery1Desconto.AsCurrency:= FDQuery1ABA_VALOR_BRUTO.AsCurrency * 0.13;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
DataAbastecimento:=0;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
MonthCalendar1.Date := Date;
AtualizaAbastecimento;
end;

procedure TfrmPrincipal.MonthCalendar1DblClick(Sender: TObject);
begin
DataAbastecimento:=MonthCalendar1.Date;
AtualizaAbastecimento;
end;

procedure TfrmPrincipal.SBAbastecimentoClick(Sender: TObject);
begin
with TfrmCadAbastecimento.Create(self) do
try
  showmodal;
finally
  FreeOnRelease;
  AtualizaAbastecimento;
end;
end;

procedure TfrmPrincipal.sbImprimirClick(Sender: TObject);
begin
//  frmRelatorioAbastecimento.RLReport1.Preview;
  with TfrmConfigRelatorios.Create(self) do
  try
   showmodal;
  finally
    FreeOnRelease;
  end;
end;

procedure TfrmPrincipal.sbSairClick(Sender: TObject);
begin
frmPrincipal.Close;
end;

procedure TfrmPrincipal.SetConsultaSQL(const Value: string);
begin
  FConsultaSQL := Value;
end;

procedure TfrmPrincipal.SetDataAbastecimento(const Value: TDateTime);
begin
  FDataAbastecimento := Value;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
PanelData.Caption := DateToStr(Date) + '  ' + TimeToStr(Now);
end;

end.
