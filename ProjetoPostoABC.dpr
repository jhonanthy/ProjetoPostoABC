program ProjetoPostoABC;

uses
  Vcl.Forms,
  UnFormPrincipal in 'UnFormPrincipal.pas' {frmFormPrincipal},
  UnDataModule in 'UnDataModule.pas' {frmDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFormPrincipal, frmFormPrincipal);
  Application.CreateForm(TfrmDataModule, frmDataModule);
  Application.Run;
end.
