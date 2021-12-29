unit UnFormPrincipal;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.StdCtrls, Data.DB, Datasnap.DBClient, Vcl.Mask, Vcl.DBCtrls,
  IBX.IBCustomDataSet,IBX.IBQuery, Vcl.Grids, Vcl.DBGrids,UnEnum;
type
  TfrmFormPrincipal = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    pnlCadastroAbastecimento: TPanel;
    pnlTop: TPanel;
    Sb_Limpar: TSpeedButton;
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
    DBNavigator1: TDBNavigator;
    Label5: TLabel;
    DBEdtLitro: TDBEdit;
    Label6: TLabel;
    DBEdtPreco: TDBEdit;
    edtCodigo: TDBEdit;
    DBEdtDesconto: TDBEdit;
    DsConsulta: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure Sb_LimparClick(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBEdtLitroExit(Sender: TObject);
    procedure DBEdtValAbastecidoChange(Sender: TObject);
    procedure edtConsultaChange(Sender: TObject);
    procedure cbPesquisaChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    function GetTipoCombustivel:TTipoCombustivel;
    procedure SetTipoCombustivel(const Value: TTipoCombustivel);
    procedure Sb_SairClick(Sender: TObject);
    function GetTipoOperacao: TTipoOperacao;
    procedure setTipoOperacao(const Value: TTipoOperacao);
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaDados;
    function ConsultaChave:string;
    procedure GravandoDados;
    procedure LimpaComponentes;
    procedure ValidaCampos;
    property TipoCombustivel: TTipoCombustivel read GetTipoCombustivel write SetTipoCombustivel;
    property TipoOperacao: TTipoOperacao read GetTipoOperacao write setTipoOperacao;
  end;
var
  frmFormPrincipal: TfrmFormPrincipal;
implementation
{$R *.dfm}
uses UnDataModule;
procedure TfrmFormPrincipal.CarregaDados;
begin
{with frmDataModule.IbqConsulta do
try
  Close;
  sql.Clear;
  sql.Add('select * from ABASTECIMENTO where ABA_CODIGO=:ID');
  ParamByName('ID').Value:= edtCodigo.Text;
  Open;
   TipoCombustivel:= FieldByName('ABA_TIPOCOMBUSTIVEL').AsInteger;
finally
  Free;
end;}

end;
procedure TfrmFormPrincipal.cbPesquisaChange(Sender: TObject);
var
Text:string;
begin
Text:=trim(edtConsulta.text);
  if cbPesquisa.ItemIndex = 6 then
    edtConsulta.Text:=' '
  else if not Text.isEmpty then
    edtConsulta.Clear;

  if edtConsulta.CanFocus then
    edtConsulta.SetFocus;
end;

function TfrmFormPrincipal.ConsultaChave: string;
var
i,NovoID:integer;
strComando:string;

begin
     frmDataModule.FDQuery1.Close;
     frmDataModule.FDQuery1.Open;
  if frmDataModule.FDQuery1.RecordCount = 0 then     // se n�o houver Registro
  begin
      strComando:='Select * from ABASTECIMENTO where ABA_CODIGO = 0'
  end
  else  // se existe Registro
  strComando:='Select max (ABA_CODIGO) as UltimoRegistro from ABASTECIMENTO';


          with  frmDataModule do
          begin
          FDQueryConsulta.close;
             FDQueryConsulta.SQL.Clear;
             FDQueryConsulta.SQL.Add(strComando);
             FDQueryConsulta.open;
//              if FDQueryConsulta.IsEmpty then
//              NovoID:=1
//              else
              NovoID:=(FDQueryConsulta.FieldByName('UltimoRegistro').AsInteger)+1;
              for i:=1 to 10 do
                try
                  with frmDataModule.FDTable1  do
                  begin

                  Insert;
                  {Inserindo Codigo do Abastecimento}
//                  FDTable1ABA_CODIGO.AsString:=inttostr(NovoID);
                  FieldByName('ABA_CODIGO').AsString:=inttostr(NovoID);
                  FieldByName('ABA_DATA').AsDateTime:= Date;
                  {Colocando a data de Inser��o no registro}
//                  FDTable1ABA_DATA.AsDateTime:= Date;
//
//                  Post;
//                  Edit;
                  result:=inttostr(NovoID);
                  break;
                  end;
                except
                  NovoID:=NovoID+1;
                  frmDataModule.FDTable1.Edit;
                end;

          end;
end;

procedure TfrmFormPrincipal.DBEdtLitroExit(Sender: TObject);
begin
   //ValorBruto
//   frmDataModule.FDTable1.Append;
 if TipoOperacao = toInsert then
  frmDataModule.FDTable1ABA_VALOR_BRUTO.Value:= frmDataModule.FDTable1ABA_PRECO_COMBUSTIVEL.Value * frmDataModule.FDTable1ABA_QTDLITROS.Value;
end;

procedure TfrmFormPrincipal.DBEdtValAbastecidoChange(Sender: TObject);
begin
//frmDataModule.FDTable1.Append;
  if TipoOperacao = toInsert then
   begin
   frmDataModule.FDTable1DESCONTO.AsCurrency:=frmDataModule.FDTable1ABA_VALOR_BRUTO.AsCurrency * 0.13;
    // o total vai ser o valor liquido deduzindo o imposto
    frmDataModule.FDTable1ABA_VALOR_LIQUIDO.Value:= frmDataModule.FDTable1ABA_VALOR_BRUTO.Value - frmDataModule.FDTable1DESCONTO.Value;
   end;
end;

procedure TfrmFormPrincipal.DBGrid1DblClick(Sender: TObject);
begin
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

procedure TfrmFormPrincipal.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);

begin
 if Button =  nbInsert then
 begin
 LimpaComponentes;
   TipoOperacao := toInsert;
   frmDataModule.FDTable1.FieldByName('ABA_DATA').AsDateTime:=Date;
 end;
 if Button = nbPost then
    begin
    TipoOperacao := toSelect;
//      GravandoDados;
//      ValidaCampos;
    end;

end;

procedure TfrmFormPrincipal.edtConsultaChange(Sender: TObject);
var
strComando:string;
begin
strComando:=' Select * from ABASTECIMENTO  ';
  frmDataModule.FDQueryConsulta.Close;
    case cbPesquisa.ItemIndex of
     0 : // codigo do abastecimento
      begin
       strComando:= strComando + '  WHERE ABA_CODIGO = '+trim(edtConsulta.Text);
//       strComando:= strComando +'  order by ABA_CODIGO Desc';
      end;
     1: //tipo de combustivel
       begin
       strComando:= strComando + '  WHERE ABA_TIPOCOMBUSTIVEL like '+trim(edtConsulta.Text);
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
frmDataModule.FDQueryConsulta.SQL.Clear;
frmDataModule.FDQueryConsulta.SQL.Add(strComando);
frmDataModule.FDQueryConsulta.open;
//caso n�o encontre mostra a mensagem
if frmDataModule.FDQueryConsulta.IsEmpty then
application.MessageBox('Consulta n�o encontrada na Base!','Informa��o',MB_OK+MB_ICONINFORMATION);

end;

procedure TfrmFormPrincipal.FormCreate(Sender: TObject);
begin
//CarregaDados;
//frmDataModule.FDTransaction1.StartTransaction;

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
//       frmDataModule.FDTable1.Edit;

        frmDataModule.FDTable1.FieldByName('ABA_BOMBA_UTILIZADA').AsInteger:=CbBombaUtilizada.ItemIndex;
       frmDataModule.FDTable1.FieldByName('ABA_TIPOCOMBUSTIVEL').AsString:= TipoCombustivel;
//       frmDataModule.FDTable1.Post;


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

{procedure TfrmFormPrincipal.Sb_ExcluirClick(Sender: TObject);
var
mensagem:string;
confExcl:integer;
begin
beep;
  confExcl:= Application.MessageBox('Confirma a exclus�o deste registro?', 'Aten��o', MB_YesNo+mb_DefButton2+mb_IconQuestion);
  if confExcl = IDYes then
 begin
//  IBDataSet1.Delete;
//  frmDataModule.trans.CommitRetaining;
  mensagem:= 'O registro foi excluido com sucesso.  ';
  Application.MessageBox(PChar(mensagem), 'Informa��o', MB_Ok+mb_IconInformation);
 end
 else if confExcl = IDNO then
 begin
//   frmDataModule.trans.RollbackRetaining;
   mensagem:= 'A exclus�o deste registro foi abortada.  ';
   Application.MessageBox(PChar(mensagem), 'Informa��o', MB_Ok+mb_IconInformation);
 end;
end;}
{procedure TfrmFormPrincipal.sb_gravarClick(Sender: TObject);
var
mensagem:string;
begin
//IBDataSet1.Post;
//frmDataModule.Trans.CommitRetaining;
Application.MessageBox(PChar(mensagem), 'Informa��o', MB_Ok+mb_IconInformation);
end;}
{procedure TfrmFormPrincipal.sb_InserirClick(Sender: TObject);
var
strComando:string;
begin
// IBDataSet1.Insert;
// ClientDataSet1.Insert
end;}
procedure TfrmFormPrincipal.Sb_LimparClick(Sender: TObject);
begin
//limpar cada componente ;
LimpaComponentes ;
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
  with frmDataModule do
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
        -1,2:
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
