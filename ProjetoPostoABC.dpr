program ProjetoPostoABC;
uses
  Vcl.Forms,
  UnFormPrincipal in 'UnFormPrincipal.pas' {frmFormPrincipal},
  UnDataModule in 'UnDataModule.pas' {frmDataModule},
  UnEnum in 'UnEnum.pas',
  UnFrmRelatorioAbastecimento in 'UnFrmRelatorioAbastecimento.pas' {frmRelatorioAbastecimento};

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFormPrincipal, frmFormPrincipal);
  Application.CreateForm(TfrmDataModule, frmDataModule);
  Application.CreateForm(TfrmRelatorioAbastecimento, frmRelatorioAbastecimento);
  Application.Run;
end.
