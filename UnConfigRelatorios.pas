unit UnConfigRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmConfigRelatorios = class(TForm)
    Panel1: TPanel;
    rdgRelatorios: TRadioGroup;
    pnlRelatorios: TPanel;
    GroupAgrupamentos: TGroupBox;
    CbAgrupamentos: TComboBox;
    Label1: TLabel;
    sbImprimir: TSpeedButton;
    procedure rdgRelatoriosClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigRelatorios: TfrmConfigRelatorios;

implementation

{$R *.dfm}

uses UnFrmRelatorioAbastecimento, UnfrmRelatorioAbastecimento2;

procedure TfrmConfigRelatorios.rdgRelatoriosClick(Sender: TObject);
begin
if rdgRelatorios.ItemIndex = 0 then
GroupAgrupamentos.Visible:=false
else
GroupAgrupamentos.Visible:=true;
end;

procedure TfrmConfigRelatorios.sbImprimirClick(Sender: TObject);
begin
  case rdgRelatorios.ItemIndex of
   //modelo 1
   0: frmRelatorioAbastecimento.RLReport1.Preview;
   1:
   begin
//     with frmRelatorioAbastecimento2.Create(self) do
     try
      frmRelatorioAbastecimento2.TipoAgrupamento:=CbAgrupamentos.ItemIndex;
       frmRelatorioAbastecimento2.imprimirRelatorio;

     finally

     end;

   end;
  end;
end;

end.
