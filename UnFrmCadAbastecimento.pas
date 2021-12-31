unit UnFrmCadAbastecimento;
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
  TfrmCadAbastecimento = class(TForm)
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
    FDTable1ABA_QTDLITROS: TSingleField;
    FDTable1ABA_PRECO_COMBUSTIVEL: TSingleField;
    FDTable1ABA_VALOR_BRUTO: TSingleField;
    FDTable1ABA_VALOR_LIQUIDO: TSingleField;
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
    FConsultaSQL: string;
    procedure Sb_SairClick(Sender: TObject);
    function GetTipoOperacao: TTipoOperacao;
    procedure setTipoOperacao(const Value: TTipoOperacao);
    procedure SetConsultaSQL(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaDados(Value:string);
    procedure GravandoDados;
    procedure LimpaComponentes;
    procedure ValidaCampos;
    procedure HabilitaControles(Value:TTipoOperacao);

    property ConsultaSQL :string read FConsultaSQL write SetConsultaSQL;
    property TipoOperacao: TTipoOperacao read GetTipoOperacao write setTipoOperacao;
  end;
var
  frmCadAbastecimento: TfrmCadAbastecimento;
implementation
{$R *.dfm}
uses UnDataModule, UnFrmRelatorioAbastecimento, UnAbastecimento;
procedure TfrmCadAbastecimento.CarregaDados(Value:string);
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
      Locate('ABA_CODIGO', FDQueryConsulta.FieldByName('ABA_CODIGO').AsString, []);
      CbBombaUtilizada.ItemIndex:= FieldByName('ABA_BOMBA_UTILIZADA').AsInteger
    end;
end;

procedure TfrmCadAbastecimento.cbPesquisaChange(Sender: TObject);
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


procedure TfrmCadAbastecimento.DBEdtLitroExit(Sender: TObject);
begin
 if TipoOperacao = toInsert then
  FDTable1ABA_VALOR_BRUTO.Value:= FDTable1ABA_PRECO_COMBUSTIVEL.Value * FDTable1ABA_QTDLITROS.Value;
end;

procedure TfrmCadAbastecimento.DBEdtValAbastecidoChange(Sender: TObject);
begin
  if TipoOperacao = toInsert then
   begin
   FDTable1DESCONTO.AsCurrency :=FDTable1ABA_VALOR_BRUTO.AsCurrency * 0.13;
    // o total vai ser o valor liquido deduzindo o imposto
    FDTable1ABA_VALOR_LIQUIDO.Value:= FDTable1ABA_VALOR_BRUTO.Value - FDTable1DESCONTO.Value;
   end;
end;

procedure TfrmCadAbastecimento.DBGrid1DblClick(Sender: TObject);
begin
CarregaDados(ConsultaSQL); //carrega dados na tela principal do cadastro
PageControl1.ActivePage:=TabSheet1;
end;

procedure TfrmCadAbastecimento.DBNavigator1BeforeAction(Sender: TObject;
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
// if Button = nbPost then
//  begin
//   GravandoDados;
//   ValidaCampos;
//  end;
end;

procedure TfrmCadAbastecimento.edtConsultaChange(Sender: TObject);
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
       strComando:= strComando +'  order by ABA_CODIGO Desc';
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

ConsultaSQL:=strComando;

FDQueryConsulta.SQL.Clear;
FDQueryConsulta.SQL.Add(strComando);
FDQueryConsulta.open;
if  FDQueryConsulta.IsEmpty then
application.MessageBox('Consulta n�o encontrada na Base!','Informa��o',MB_OK+MB_ICONINFORMATION);

end;

procedure TfrmCadAbastecimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FDTable1.Cancel;
FDTransaction1.RollbackRetaining;
end;

procedure TfrmCadAbastecimento.FormCreate(Sender: TObject);
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


procedure TfrmCadAbastecimento.FormShow(Sender: TObject);
begin
FDTable1.Open;
LimpaComponentes;
TipoOperacao:=toSelect;
edtCodigo.Enabled:=false;
edtData.Enabled:=false;
HabilitaControles(TipoOperacao);
end;



function TfrmCadAbastecimento.GetTipoOperacao: TTipoOperacao;
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

procedure TfrmCadAbastecimento.GravandoDados;
var
Abastecimento : TAbastecimento;
Combustivel:string;
begin
Abastecimento := TAbastecimento.Create();
Combustivel:=Abastecimento.getTipoCombustivel(TTipoCombustivel(CbBombaUtilizada.ItemIndex));

 FDTable1.FieldByName('ABA_BOMBA_UTILIZADA').AsInteger:=CbBombaUtilizada.ItemIndex;
 FDTable1.FieldByName('ABA_TIPOCOMBUSTIVEL').AsString:= Combustivel;


end;

procedure TfrmCadAbastecimento.HabilitaControles(Value: TTipoOperacao);
begin
{em caso de inser��o}
if TipoOperacao = toInsert then
   begin
     SbAlterar.Enabled:=false;
     Sb_Excluir.Enabled:=false;
     SbCancelar.Enabled:=true;
     SbGravar.Enabled:=true;

     CbBombaUtilizada.Enabled:=true;
     DBEdtPreco.Enabled:=true;
     DBEdtLitro.Enabled:=true;
   end
else if TipoOperacao = toUpdate then
   begin
     SbNovo.Enabled:=false;
     Sb_Excluir.Enabled:=false;
     SbCancelar.Enabled:=true;
     SbGravar.Enabled:=true;
     CbBombaUtilizada.Enabled:=true;
     DBEdtPreco.Enabled:=true;
     DBEdtLitro.Enabled:=true;
   end
else if TipoOperacao = toSelect then
   begin
     SbNovo.Enabled:=true;
     Sb_Excluir.Enabled:=true;
     SbCancelar.Enabled:=true;
     SbGravar.Enabled:=true;
     CbBombaUtilizada.Enabled:=false;
     DBEdtPreco.Enabled:=false;
     DBEdtLitro.Enabled:=false;
   end;

end;

procedure TfrmCadAbastecimento.ImprimirClick(Sender: TObject);
begin
 frmRelatorioAbastecimento.RLReport1.Preview;
end;

procedure TfrmCadAbastecimento.LimpaComponentes;
var
i:integer;
begin
//Limpa Componentes que est�o no panel do cadastro
           //GroupBox1.ComponentCount
  for i := frmCadAbastecimento.ComponentCount -1 downto 0 do
  begin
    //edits
//    pnlCadastroAbastecimento.Components
    if (frmCadAbastecimento.Components[i] is TDBEdit) then
       (frmCadAbastecimento.Components[i] as TDBEdit).text := '';
     //combo box
    if (frmCadAbastecimento.Components[i] is TComboBox) then
        (frmCadAbastecimento.Components[i] as TComboBox).ItemIndex := -1;
  end;

end;


procedure TfrmCadAbastecimento.SbAlterarClick(Sender: TObject);
begin
 TipoOperacao:=toUpdate;
  FDTable1.Edit;
  HabilitaControles(TipoOperacao);
end;

procedure TfrmCadAbastecimento.SbCancelarClick(Sender: TObject);
begin
TipoOperacao:=toSelect;
FDTable1.Cancel;
FDTransaction1.RollbackRetaining;
HabilitaControles(TipoOperacao);
end;

procedure TfrmCadAbastecimento.SbGravarClick(Sender: TObject);

begin
 TipoOperacao := toSelect;
  GravandoDados;
  ValidaCampos;
 HabilitaControles(TipoOperacao);
try
FDTable1.Post;
//if TipoOperacao = toInsert then
FDTransaction1.CommitRetaining
//else

except
application.MessageBox('N�o foi possivel salvar o registro','ERRO',MB_OK+MB_ICONEXCLAMATION);
end;
application.MessageBox('Registro salvo com Sucesso!','Informa��o',MB_OK+MB_ICONINFORMATION);
end;

procedure TfrmCadAbastecimento.SbNovoClick(Sender: TObject);
begin
// insere
LimpaComponentes;
TipoOperacao := toInsert;
FDTable1.append;
FDTable1.FieldByName('ABA_DATA').AsDateTime:=Date;
HabilitaControles(TipoOperacao);
end;

procedure TfrmCadAbastecimento.Sb_ExcluirClick(Sender: TObject);
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

procedure TfrmCadAbastecimento.Sb_SairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmCadAbastecimento.SetConsultaSQL(const Value: string);
begin
  FConsultaSQL := Value;
end;

procedure TfrmCadAbastecimento.setTipoOperacao(const Value: TTipoOperacao);
begin
  self.tag := ord(Value);
end;

procedure TfrmCadAbastecimento.ValidaCampos;
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
