unit UnFormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.StdCtrls, Data.DB, Datasnap.DBClient, Vcl.Mask, Vcl.DBCtrls,
  IBX.IBCustomDataSet,IBX.IBQuery, Vcl.Grids, Vcl.DBGrids;

type
  TfrmFormPrincipal = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    pnlCadastroAbastecimento: TPanel;
    pnlTop: TPanel;
    sb_Inserir: TSpeedButton;
    sb_alterar: TSpeedButton;
    Sb_Excluir: TSpeedButton;
    Sb_Sair: TSpeedButton;
    Sb_Limpar: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtCodigo: TDBEdit;
    Label2: TLabel;
    CbBombaUtilizada: TComboBox;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdtValorAbastecido: TDBEdit;
    lbValorAbastecido: TLabel;
    edtData: TDBEdit;
    lbData: TLabel;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    edtConsulta: TEdit;
    ComboBox1: TComboBox;
    lbConsulta: TLabel;
    Label4: TLabel;
    edtDesconto: TEdit;
    IBDataSet1: TIBDataSet;
    DataSource1: TDataSource;
    IBDataSet1ABA_CODIGO: TIntegerField;
    IBDataSet1ABA_TIPOCOMBUSTIVEL: TIntegerField;
    IBDataSet1ABA_BOMBA_UTILIZADA: TIntegerField;
    IBDataSet1ABA_QTDLITROS: TIBBCDField;
    IBDataSet1ABA_DATA: TDateField;
    IBDataSet1ABA_VALOR_BRUTO: TIBBCDField;
    IBDataSet1ABA_VALOR_LIQUIDO: TIBBCDField;
    RdgTipoCombustivel: TDBRadioGroup;
    sb_gravar: TSpeedButton;
    procedure Sb_SairClick(Sender: TObject);
    procedure sb_InserirClick(Sender: TObject);
    procedure RdgTipoCombustivelClick(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sb_alterarClick(Sender: TObject);
    procedure Sb_ExcluirClick(Sender: TObject);
    procedure sb_gravarClick(Sender: TObject);
    procedure Sb_LimparClick(Sender: TObject);
  private
    FTipoCombustivel: integer;
    procedure SetTipoCombustivel(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaDados;
    procedure GravandoDados;
    property TipoCombustivel: integer read FTipoCombustivel write SetTipoCombustivel;
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
IBDataSet1.Close;
IBDataSet1.Open;

end;

procedure TfrmFormPrincipal.DBEdit2Exit(Sender: TObject);
begin
 IBDataSet1ABA_VALOR_LIQUIDO.Value:= IBDataSet1ABA_VALOR_BRUTO.value * 0.13; // calcula o desconto do imposto
end;

procedure TfrmFormPrincipal.FormCreate(Sender: TObject);
begin
//CarregaDados;

IBDataSet1.Open;
end;

procedure TfrmFormPrincipal.GravandoDados;
begin

end;

procedure TfrmFormPrincipal.RdgTipoCombustivelClick(Sender: TObject);
begin
CbBombaUtilizada.Enabled:=true;
CbBombaUtilizada.Items.Clear;
 case RdgTipoCombustivel.ItemIndex of
  0 :
  begin
     CbBombaUtilizada.Items.add('Bomba 1 - Gasolina');
     CbBombaUtilizada.Items.add('Bomba 2 - Gasolina');
  end;
  1 :
  begin
    CbBombaUtilizada.Items.add('Bomba 1 - Ol�o Diesel');
    CbBombaUtilizada.Items.add('Bomba 2 - Ol�o Diesel');
  end;
 end;
end;

procedure TfrmFormPrincipal.sb_alterarClick(Sender: TObject);
begin
IBDataSet1.Edit;
end;

procedure TfrmFormPrincipal.Sb_ExcluirClick(Sender: TObject);
var
mensagem:string;
confExcl:integer;
begin
beep;
  confExcl:= Application.MessageBox('Confirma a exclus�o deste registro?', 'Aten��o', MB_YesNo+mb_DefButton2+mb_IconQuestion);
  if confExcl = IDYes then
 begin
  IBDataSet1.Delete;
  frmDataModule.trans.CommitRetaining;
  mensagem:= 'O registro foi excluido com sucesso.  ';
  Application.MessageBox(PChar(mensagem), 'Informa��o', MB_Ok+mb_IconInformation);
 end
 else if confExcl = IDNO then
 begin
   frmDataModule.trans.RollbackRetaining;
   mensagem:= 'A exclus�o deste registro foi abortada.  ';
   Application.MessageBox(PChar(mensagem), 'Informa��o', MB_Ok+mb_IconInformation);
 end;
end;

procedure TfrmFormPrincipal.sb_gravarClick(Sender: TObject);
var
mensagem:string;
begin
IBDataSet1.Post;
frmDataModule.Trans.CommitRetaining;
Application.MessageBox(PChar(mensagem), 'Informa��o', MB_Ok+mb_IconInformation);
end;

procedure TfrmFormPrincipal.sb_InserirClick(Sender: TObject);
var
strComando:string;
begin
 IBDataSet1.Insert;
// ClientDataSet1.Insert
end;

procedure TfrmFormPrincipal.Sb_LimparClick(Sender: TObject);
begin
//limpar cada componente ;
end;

procedure TfrmFormPrincipal.Sb_SairClick(Sender: TObject);
begin
Close;
end;

procedure TfrmFormPrincipal.SetTipoCombustivel(const Value: integer);
begin
  FTipoCombustivel := Value;
end;

end.
