program TelSprav;

uses
  Forms,
  TelSpravMain in 'TelSpravMain.pas' {fTelSprav},
  TelDM in 'TelDM.pas' {dmTel: TDataModule},
  TelNew in 'TelNew.pas' {fNewTel};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfTelSprav, fTelSprav);
  Application.CreateForm(TdmTel, dmTel);
  Application.CreateForm(TfNewTel, fNewTel);
  Application.Run;
end.
