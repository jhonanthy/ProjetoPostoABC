unit UnFormPrincipal;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.StdCtrls, Data.DB, Datasnap.DBClient, Vcl.Mask, Vcl.DBCtrls,
  IBX.IBCustomDataSet,IBX.IBQuery, Vcl.Grids, Vcl.DBGrids,UnEnum,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait;
type
  TfrmFormPrincipal = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    pnlCadastroAbastecimento: TPanel;
    pnlTop: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    CbBombaUtilizada: TComboBox;
    DBEdtValAbastecido: TDBEdit;
    Label3: TLabel;
    DBEdtValTotal: TDBEdit;
    lbValorAbastecido: TLabel;
    edtData: TDBEdit;
    lbData: TLabel;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    edtConsulta: TEdit;
    cbPesquisa: TComboBox;
    lbConsulta: TLabel;
    Label4: TLabel;
    DataSource1: TDataSource;
    Label5: TLabel;
    DBEdtLitro: TDBEdit;
    Label6: TLabel;
    DBEdtPreco: TDBEdit;
    edtCodigo: TDBEdit;
    DBEdtDesconto: TDBEdit;
    DsConsulta: TDataSource;
    FDTable1: TFDTable;
    FDTable1ABA_CODIGO: TIntegerField;
    FDTable1ABA_BOMBA_UTILIZADA: TIntegerField;
    FDTable1ABA_DATA: TDateField;
    FDTable1DESCONTO: TCurrencyField;
    FDTable1ABA_TIPOCOMBUSTIVEL: TStringField;
    FDTable1ABA_QTDLITROS: TSingleField;
    FDTable1ABA_PRECO_COMBUSTIVEL: TSingleField;
    FDTable1ABA_VALOR_BRUTO: TSingleField;
    FDTable1ABA_VALOR_LIQUIDO: TSingleField;
    FDConnection1: TFDConnection;
    FDTransaction1: TFDTransaction;
    FDQueryConsulta: TFDQuery;
    Panel3: TPanel;
    Imprimir: TSpeedButton;
    Sb_Limpar: TSpeedButton;
    SbCancelar: TSpeedButton;
    Sb_Excluir: TSpeedButton;
    SbGravar: TSpeedButton;
    SbAlterar: TSpeedButton;
    SbNovo: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure DBEdtLitroExit(Sender: TObject);
    procedure DBEdtValAbastecidoChange(Sender: TObject);
    procedure edtConsultaChange(Sender: TObject);
    procedure cbPesquisaChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ImprimirClick(Sender: TObject);
    procedure SbGravarClick(Sender: TObject);
    procedure SbAlterarClick(Sender: TObject);
    procedure SbNovoClick(Sender: TObject);
    procedure Sb_ExcluirClick(Sender: TObject);
    procedure SbCancelarClick(Sender: TObject);
  private
    function GetTipoCombustivel:TTipoCombustivel;
    procedure SetTipoCombustivel(const Value: TTipoCombustivel);
    procedure Sb_SairClick(Sender: TObject);
    function GetTipoOperacao: TTipoOperacao;
    procedure setTipoOperacao(const Value: TTipoOperacao);
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaDados(Value:string);
    procedure GravandoDados;
    procedure LimpaComponentes;
    procedure ValidaCampos;

    property TipoCombustivel: TTipoCombustivel read GetTipoCombustivel write SetTipoCombustivel;
    property TipoOperacao: TTipoOperacao read GetTipoOperacao write setTipoOperacao;
  end;
var
  frmFormPrincipal: TfrmFormPrincipal;
  Teste:string;
implementation
{$R *.dfm}
uses UnDataModule, UnFrmRelatorioAbastecimento;
procedure TfrmFormPrincipal.CarregaDados(Value:string);
var
strComando:string;
begin
    with FDTable1 do
    begin
      Close;
      sql.Clear;
      strComando := '  select * from ABASTECIMENTO ' +
        '  where ABA_CODIGO in (' + StringReplace(Value, '*',
        'ABA_CODIGO', []) + ')';

      sql.Add(strComando);
      Open;
      Locate('ABA_CODIGO', frmDataModule.FDQueryConsulta.FieldByName('ABA_CODIGO').AsString, []);
    end;
end;

procedure TfrmFormPrincipal.cbPesquisaChange(Sender: TObject);
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
   edtConsulta.Enabled:=true;

   if not Text.isEmpty then
    edtConsulta.Clear;

  if edtConsulta.CanFocus then
    edtConsulta.SetFocus;
end;


procedure TfrmFormPrincipal.DBEdtLitroExit(Sender: TObject);
begin
   //ValorBruto
//   frmDataModule.FDTable1.Append;
 if TipoOperacao = toInsert then
  FDTable1ABA_VALOR_BRUTO.Value:= FDTable1ABA_PRECO_COMBUSTIVEL.Value * FDTable1ABA_QTDLITROS.Value;
end;

procedure TfrmFormPrincipal.DBEdtValAbastecidoChange(Sender: TObject);
begin
//frmDataModule.FDTable1.Append;
  if TipoOperacao = toInsert then
   begin
   FDTable1DESCONTO.AsCurrency :=FDTable1ABA_VALOR_BRUTO.AsCurrency * 0.13;
    // o total vai ser o valor liquido deduzindo o imposto
    FDTable1ABA_VALOR_LIQUIDO.Value:= FDTable1ABA_VALOR_BRUTO.Value - FDTable1DESCONTO.Value;
   end;
end;

procedure TfrmFormPrincipal.DBGrid1DblClick(Sender: TObject);
begin
CarregaDados(Teste);
PageControl1.ActivePage:=TabSheet1;
end;

procedure TfrmFormPrincipal.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
  var
  teste:string;
begin
 {if Button = nbInsert then
 begin

// frmDataModule.FDTable1.Insert;
//   edtCodigo.Text:=ConsultaChave;
 end
 else}
 if Button = nbPost then
  begin
   GravandoDados;
   ValidaCampos;
  end;
end;

procedure TfrmFormPrincipal.edtConsultaChange(Sender: TObject);
var
strComando:string;
begin

strComando:=' Select * from ABASTECIMENTO  ';
  FDQueryConsulta.Close;
//FDTable1.Active:=false;
//FDTable1.Close;
 //verificar consulta quando pesquisa e apaga
    if trim(edtConsulta.Text)='' then
       strComando:= strComando + '  ';
    case cbPesquisa.ItemIndex of
     0 : // codigo do abastecimento
      begin
       strComando:= strComando + '  WHERE ABA_CODIGO = '+trim(edtConsulta.Text);
//       strComando:= strComando +'  order by ABA_CODIGO Desc';
      end;
     1: //tipo de combustivel
       begin
       {strComando2 + ' and ( upper(TEN_ATENDENTE) LIKE ' +
              quotedstr('%' + uppercase(strPesquisa) + '%');}
       strComando:= strComando + '  WHERE upper(ABA_TIPOCOMBUSTIVEL) LIKE '+quotedstr('%'+ uppercase(edtConsulta.Text)+'%');
       strComando:= strComando +'  order by ABA_CODIGO Desc';
       end;
     2: // bomba utilizada
       begin
       strComando:= strComando + '  WHERE ABA_BOMBA_UTILIZADA = '+trim(edtConsulta.Text);
       strComando:= strComando +'  order by ABA_CODIGO Desc';
       end;
     3: // Dia
      begin
       strComando:= strComando + '  WHERE EXTRACT(Day from ABA_DATA) like '+trim(edtConsulta.Text);
       strComando:= strComando +'  order by ABA_CODIGO Desc';
      end;
     4://M�s
      begin
       strComando:= strComando + '  WHERE EXTARCT(Month from ABA_DATA) like '+trim(edtConsulta.Text);
       strComando:= strComando +'  order by ABA_DATA Desc';
      end;
     5://Ano
     begin
       strComando:= strComando + '  WHERE EXTARCT(Year from ABA_DATA) like '+trim(edtConsulta.Text);
       strComando:= strComando +'  order by ABA_DATA Desc';
     end;
     6: //Todos os Registros
     begin
       strComando:= strComando + '  ';
       strComando:= strComando +'  order by ABA_CODIGO asc';
     end;

    end;
Teste:=strComando;

FDQueryConsulta.SQL.Clear;
FDQueryConsulta.SQL.Add(strComando);
FDQueryConsulta.open;
//caso n�o encontre mostra a mensagem
//if frmDataModule.FDQueryConsulta.IsEmpty then
if  FDQueryConsulta.IsEmpty then
application.MessageBox('Consulta n�o encontrada na Base!','Informa��o',MB_OK+MB_ICONINFORMATION);

end;

procedure TfrmFormPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FDTable1.Cancel;
//frmDataModule.FDConnection1.RollbackRetaining;
FDTransaction1.RollbackRetaining;
end;

procedure TfrmFormPrincipal.FormCreate(Sender: TObject);
begin
//CarregaDados;
FDTransaction1.StartTransaction;
FDTable1.Open;


    CbBombaUtilizada.Enabled:=true;
    CbBombaUtilizada.Items.Clear;
    CbBombaUtilizada.Items.add('');
    CbBombaUtilizada.Items.add('Bomba 1 - Gasolina');
    CbBombaUtilizada.Items.add('Bomba 2 - Ol�o Diesel');
    CbBombaUtilizada.Items.add('Bomba 3 - Gasolina');
    CbBombaUtilizada.Items.add('Bomba 4 - Ol�o Diesel');
end;


procedure TfrmFormPrincipal.FormShow(Sender: TObject);
begin
FDTable1.Open;
LimpaComponentes;
edtCodigo.Enabled:=false;
edtData.Enabled:=false;
end;

function TfrmFormPrincipal.GetTipoCombustivel: TTipoCombustivel;
begin
  case self.Tag of
    1:
    result  := tcGasolina ;
    2:
    result  := tcDiesel;
  end;
end;

function TfrmFormPrincipal.GetTipoOperacao: TTipoOperacao;
begin
 case self.tag of
    1:
      result := toInsert;
    2:
      result := toUpdate;
    3:
      result := toDelete;
  else
    result := toSelect;
  end;

end;

procedure TfrmFormPrincipal.GravandoDados;
var
TipoCombustivel:string;
begin
{Bomba 1 � Gasolina}
       case CbBombaUtilizada.ItemIndex of
         1,3: TipoCombustivel:='Gasolina';
         2,4: TipoCombustivel:='Diesel';
       end;

       FDTable1.FieldByName('ABA_BOMBA_UTILIZADA').AsInteger:=CbBombaUtilizada.ItemIndex;
       FDTable1.FieldByName('ABA_TIPOCOMBUSTIVEL').AsString:= TipoCombustivel;


end;

procedure TfrmFormPrincipal.ImprimirClick(Sender: TObject);
begin
 frmRelatorioAbastecimento.RLReport1.Preview;
end;

procedure TfrmFormPrincipal.LimpaComponentes;
var
i:integer;
begin
//Limpa Componentes que est�o no panel do cadastro
           //GroupBox1.ComponentCount
  for i := frmFormPrincipal.ComponentCount -1 downto 0 do
  begin
    //edits
//    pnlCadastroAbastecimento.Components
    if (frmFormPrincipal.Components[i] is TDBEdit) then
       (frmFormPrincipal.Components[i] as TDBEdit).text := '';
     //combo box
    if (frmFormPrincipal.Components[i] is TComboBox) then
        (frmFormPrincipal.Components[i] as TComboBox).ItemIndex := -1;
  end;

end;


procedure TfrmFormPrincipal.SbAlterarClick(Sender: TObject);
begin
  FDTable1.Edit;
end;

procedure TfrmFormPrincipal.SbCancelarClick(Sender: TObject);
begin
FDTable1.Cancel;
FDTransaction1.RollbackRetaining;
end;

procedure TfrmFormPrincipal.SbGravarClick(Sender: TObject);
begin
 TipoOperacao := toSelect;
  GravandoDados;
  ValidaCampos;
try
FDTable1.Post;
FDTransaction1.CommitRetaining;
except
application.MessageBox('N�o foi possivel salvar o registro','ERRO',MB_OK+MB_ICONEXCLAMATION);
end;
application.MessageBox('Registro salvo com Sucesso!','Informa��o',MB_OK+MB_ICONINFORMATION);
end;

procedure TfrmFormPrincipal.SbNovoClick(Sender: TObject);
begin
// insere
LimpaComponentes;
TipoOperacao := toInsert;
FDTable1.append;
FDTable1.FieldByName('ABA_DATA').AsDateTime:=Date;
end;

procedure TfrmFormPrincipal.Sb_ExcluirClick(Sender: TObject);
var
confExcl:integer;
begin
//mensagem perguntando se realmente quer deletar
 beep;
  confExcl:= Application.MessageBox('Confirma a exclus�o deste registro?', 'Aten��o', MB_YesNo+mb_DefButton2+mb_IconQuestion);
  if confExcl = IDYes then
  begin
  try
  FDTable1.Delete;
  FDTransaction1.CommitRetaining;
  except
   Application.MessageBox('N�o foi Possivel Deletar o registro!','ERRO',MB_OK+MB_ICONEXCLAMATION);
   exit;
  end;
   Application.MessageBox('Registro Excluido com Sucesso!','Informa��o',MB_OK+MB_ICONINFORMATION);

  end
  else if confExcl = IDNO then
  begin
   FDTransaction1.RollbackRetaining;
   Application.MessageBox('A Exclus�o do registro foi abortada!','Informa��o',MB_OK+MB_ICONINFORMATION);
   exit;
  end;

end;

procedure TfrmFormPrincipal.Sb_SairClick(Sender: TObject);
begin
Close;
end;
procedure TfrmFormPrincipal.SetTipoCombustivel(const Value: TTipoCombustivel);
begin

end;
procedure TfrmFormPrincipal.setTipoOperacao(const Value: TTipoOperacao);
begin
  self.tag := ord(Value);
end;

procedure TfrmFormPrincipal.ValidaCampos;
begin
  begin
    if FDTable1ABA_PRECO_COMBUSTIVEL.IsNull then
    begin
      application.MessageBox('Pre�o do Combustivel por Litro n�o inserido!'
      ,'Aten��o',MB_OK+MB_ICONWARNING);
      if DBEdtPreco.CanFocus then
         DBEdtPreco.SetFocus;
         exit;
    end;

    if FDTable1ABA_QTDLITROS.IsNull then
    begin
      application.MessageBox('Quantidade de Litros abastecido n�o inserido!'
      ,'Aten��o',MB_OK+MB_ICONWARNING);
      if DBEdtLitro.CanFocus then
         DBEdtLitro.SetFocus;
         exit;
    end;
  end;

  case CbBombaUtilizada.ItemIndex of
        -1,0:
         begin
           application.MessageBox('A Bomba de abastecimento n�o foi selecionada!'
            ,'Aten��o',MB_OK+MB_ICONWARNING);
            if CbBombaUtilizada.CanFocus then
               CbBombaUtilizada.SetFocus;
               exit;
         end;
  end;
end;

end.
