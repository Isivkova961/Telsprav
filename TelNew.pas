unit TelNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TfNewTel = class(TForm)
    lFam: TLabel;
    lIm: TLabel;
    lOt: TLabel;
    lDepart: TLabel;
    lPost: TLabel;
    lTel: TLabel;
    lIP: TLabel;
    lNameComp: TLabel;
    lEmail: TLabel;
    lPassword: TLabel;
    eFam: TEdit;
    eIm: TEdit;
    eOt: TEdit;
    eDepart: TEdit;
    ePost: TEdit;
    meTel: TMaskEdit;
    meIP: TMaskEdit;
    eNameComp: TEdit;
    eEmail: TEdit;
    ePassword: TEdit;
    bbSave: TBitBtn;
    bbCancel: TBitBtn;
    lText: TLabel;
    eText: TEdit;
    procedure bbCancelClick(Sender: TObject);
    procedure bbSaveClick(Sender: TObject);
    procedure meTelChange(Sender: TObject);
    procedure meIPChange(Sender: TObject);
    procedure eFamKeyPress(Sender: TObject; var Key: Char);
    procedure eImKeyPress(Sender: TObject; var Key: Char);
    procedure eOtKeyPress(Sender: TObject; var Key: Char);
    procedure eDepartKeyPress(Sender: TObject; var Key: Char);
    procedure ePostKeyPress(Sender: TObject; var Key: Char);
    procedure PerehKlav(int:integer);
    procedure eNameCompEnter(Sender: TObject);
    procedure eFamEnter(Sender: TObject);
    procedure eImEnter(Sender: TObject);
    procedure eOtEnter(Sender: TObject);
    procedure eDepartEnter(Sender: TObject);
    procedure ePostEnter(Sender: TObject);
    procedure eTextEnter(Sender: TObject);
    procedure eEmailChange(Sender: TObject);
    procedure ePasswordChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NewData;
    procedure LoadData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fNewTel: TfNewTel;

implementation

uses TelDM, TelSpravMain;

{$R *.dfm}

procedure TfNewTel.bbCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfNewTel.bbSaveClick(Sender: TObject);
begin
  if fTelSprav.NewEdit=true then
    begin
      with dmTel.adoqTel do
        begin
          Insert;
          FieldByName('�������').Value:=eFam.Text;
          FieldByName('���').Value:=eIm.Text;
          FieldByName('��������').Value:=eOt.Text;
          FieldByName('���������').Value:=eDepart.Text;
          FieldByName('���������').Value:=ePost.Text;
          if meTel.Text<>' -  -  ' then
            FieldByName('�������').Value:=meTel.Text
          else
            FieldByName('�������').Value:='';
          if meIP.Text<>'  .  .   .   ' then
            FieldByName('IP').Value:=meIP.Text
          else
            FieldByName('IP').Value:='';
          FieldByName('��� ����������').Value:=eNameComp.Text;
          FieldByName('email\login').Value:=eEmail.Text;
          FieldByName('password').Value:=ePassword.Text;
          FieldByName('����������').Value:=eText.Text;
          Post;
        end;
    end
  else
    begin
      with dmTel.adoqTel do
        begin
          Edit;
          FieldByName('�������').Value:=eFam.Text;
          FieldByName('���').Value:=eIm.Text;
          FieldByName('��������').Value:=eOt.Text;
          FieldByName('���������').Value:=eDepart.Text;
          FieldByName('���������').Value:=ePost.Text;
          if meTel.Text<>' -  -  ' then
            FieldByName('�������').Value:=meTel.Text
          else
            FieldByName('�������').Value:='';
          if meIP.Text<>'  .  .   .   ' then
            FieldByName('IP').Value:=meIP.Text
          else
            FieldByName('IP').Value:='';
          FieldByName('��� ����������').Value:=eNameComp.Text;
          FieldByName('email\login').Value:=eEmail.Text;
          FieldByName('password').Value:=ePassword.Text;
          FieldByName('����������').Value:=eText.Text;
          Post;
        end;
    end;
  fTelSprav.Refresh;
  Close;
end;

procedure TfNewTel.meTelChange(Sender: TObject);
begin
  meTel.Modified:=false;
end;

procedure TfNewTel.meIPChange(Sender: TObject);
begin
  meIP.Modified:=false;
end;

procedure TfNewTel.eFamKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['�'..'�','�'..'�',#8,#46]) then Key:=#0;
end;

procedure TfNewTel.eImKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['�'..'�','�'..'�',#8,#46]) then Key:=#0;
end;

procedure TfNewTel.eOtKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['�'..'�','�'..'�',#8,#46]) then Key:=#0;
end;

procedure TfNewTel.eDepartKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['�'..'�','�'..'�',#8,#46,#32]) then Key:=#0;
end;

procedure TfNewTel.ePostKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['�'..'�','�'..'�',#8,#46,#32]) then Key:=#0;
end;

procedure TfNewTel.PerehKlav(int:integer);
Var
KK : HKL;
  KBid : Integer;
Const
  USKeyboard = 1033;
  RusKeyboard = 1049;
begin
  KK := GetKeyboardLayout(0);
  KBid := LOWORD(KK);
  if int=1 then
  If KBid = USKeyboard Then
    ActivateKeyboardLayout(HKL_NEXT, 0);
  if int=2 then
  If KBid = RusKeyboard Then
    ActivateKeyboardLayout(HKL_NEXT, 0);
end;

procedure TfNewTel.eNameCompEnter(Sender: TObject);
begin
  PerehKlav(2);
end;

procedure TfNewTel.eFamEnter(Sender: TObject);
begin
  PerehKlav(1);
end;

procedure TfNewTel.eImEnter(Sender: TObject);
begin
  PerehKlav(1);
end;

procedure TfNewTel.eOtEnter(Sender: TObject);
begin
  PerehKlav(1);
end;

procedure TfNewTel.eDepartEnter(Sender: TObject);
begin
  PerehKlav(1);
end;

procedure TfNewTel.ePostEnter(Sender: TObject);
begin
  PerehKlav(1);
end;

procedure TfNewTel.eTextEnter(Sender: TObject);
begin
  PerehKlav(1);
end;

procedure TfNewTel.eEmailChange(Sender: TObject);
begin
  PerehKlav(2);
end;

procedure TfNewTel.ePasswordChange(Sender: TObject);
begin
  PerehKlav(2);
end;

procedure TfNewTel.FormShow(Sender: TObject);
begin
  if fTelSprav.NewEdit=true then
    NewData
  else
    LoadData;
  eFam.SetFocus;
end;

procedure TfNewTel.NewData;
begin
  fNewTel.Caption:='���������� ������ ��������';
  eFam.Text:='';
  eIm.Text:='';
  eOt.Text:='';
  eDepart.Text:='';
  ePost.Text:='';
  eText.Text:='';
  meTel.Text:='';
  meIP.Text:='';
  eEmail.Text:='';
  ePassword.Text:='';
  eNameComp.Text:='';
end;

procedure TfNewTel.LoadData;
begin
  fNewTel.Caption:='��������� ��������';
  with dmTel.adoqTel do
    begin
      eFam.Text:=FieldByName('�������').AsString;
      eIm.Text:=FieldByName('���').AsString;
      eOt.Text:=FieldByName('��������').AsString;
      eDepart.Text:=FieldByName('���������').AsString;
      ePost.Text:=FieldByName('���������').AsString;
      eText.Text:=FieldByName('����������').AsString;
      meTel.Text:=FieldByName('�������').AsString;
      meIP.Text:=FieldByName('IP').AsString;
      eEmail.Text:=FieldByName('email\login').AsString;
      ePassword.Text:=FieldByName('password').AsString;
      eNameComp.Text:=FieldByName('��� ����������').AsString;
    end;
end;

end.
