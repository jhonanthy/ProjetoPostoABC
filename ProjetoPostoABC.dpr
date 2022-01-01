program ProjetoPostoABC;
uses
  Vcl.Forms,
  UnFrmCadAbastecimento in 'UnFrmCadAbastecimento.pas' {frmCadAbastecimento},
  UnEnum in 'UnEnum.pas',
  UnFrmRelatorioAbastecimento in 'UnFrmRelatorioAbastecimento.pas' {frmRelatorioAbastecimento},
  UnAbastecimento in 'UnAbastecimento.pas',
  UnFormPrincipal in 'UnFormPrincipal.pas' {frmPrincipal},
  UnConfigRelatorios in 'UnConfigRelatorios.pas' {frmConfigRelatorios},
  UnfrmRelatorioAbastecimento2 in 'UnfrmRelatorioAbastecimento2.pas' {frmRelatorioAbastecimento2};

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadAbastecimento, frmCadAbastecimento);
  Application.CreateForm(TfrmRelatorioAbastecimento, frmRelatorioAbastecimento);
  Application.CreateForm(TfrmConfigRelatorios, frmConfigRelatorios);
  Application.CreateForm(TfrmRelatorioAbastecimento2, frmRelatorioAbastecimento2);
  Application.Run;
end.
