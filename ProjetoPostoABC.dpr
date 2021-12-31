program ProjetoPostoABC;
uses
  Vcl.Forms,
  UnFrmCadAbastecimento in 'UnFrmCadAbastecimento.pas' {frmCadAbastecimento},
  UnEnum in 'UnEnum.pas',
  UnFrmRelatorioAbastecimento in 'UnFrmRelatorioAbastecimento.pas' {frmRelatorioAbastecimento},
  UnAbastecimento in 'UnAbastecimento.pas',
  UnFormPrincipal in 'UnFormPrincipal.pas' {frmPrincipal};

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadAbastecimento, frmCadAbastecimento);
  Application.CreateForm(TfrmRelatorioAbastecimento, frmRelatorioAbastecimento);
  Application.Run;
end.
