unit TelSpravMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGrids, Mask, StdCtrls, ImgList;

type
  TfTelSprav = class(TForm)
    dbgTel: TDBGrid;
    mmTel: TMainMenu;
    nFile: TMenuItem;
    nSprav: TMenuItem;
    nAdd: TMenuItem;
    nEdit: TMenuItem;
    nDelete: TMenuItem;
    eFIO: TEdit;
    eDepart: TEdit;
    ePost: TEdit;
    meTel: TMaskEdit;
    eText: TEdit;
    meIP: TMaskEdit;
    eNameComp: TEdit;
    cebFIO: TCheckBox;
    cebDepart: TCheckBox;
    cebPost: TCheckBox;
    cebTel: TCheckBox;
    cebText: TCheckBox;
    cebIP: TCheckBox;
    cebNameComp: TCheckBox;
    lKolZap: TLabel;
    ilTel: TImageList;
    procedure dbgTelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nAddClick(Sender: TObject);
    procedure eFIOKeyPress(Sender: TObject; var Key: Char);
    procedure eDepartKeyPress(Sender: TObject; var Key: Char);
    procedure ePostKeyPress(Sender: TObject; var Key: Char);
    procedure eFIOChange(Sender: TObject);
    procedure Filtretion(var str:string);
    procedure Filterbase;
    procedure eDepartChange(Sender: TObject);
    procedure ePostChange(Sender: TObject);
    procedure meTelChange(Sender: TObject);
    procedure meIPChange(Sender: TObject);
    procedure eNameCompChange(Sender: TObject);
    procedure eTextChange(Sender: TObject);
    procedure nDeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cebFIOClick(Sender: TObject);
    procedure cebDepartClick(Sender: TObject);
    procedure cebPostClick(Sender: TObject);
    procedure cebTelClick(Sender: TObject);
    procedure cebIPClick(Sender: TObject);
    procedure cebNameCompClick(Sender: TObject);
    procedure cebTextClick(Sender: TObject);
    procedure VivodMainTable;
  private
    { Private declarations }
  public
    NewEdit:boolean;
    { Public declarations }
  end;

var
  fTelSprav: TfTelSprav;


implementation

uses TelDM, TelNew;

{$R *.dfm}

procedure TfTelSprav.dbgTelKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=45 then
    begin
      NewEdit:=true;
      fNewTel.ShowModal;
      lKolZap.Caption:=IntToStr(dmTel.adoqTel.RecordCount);
    end;
  if Key=13 then
    begin
      NewEdit:=false;
      fNewTel.ShowModal;
      lKolZap.Caption:=IntToStr(dmTel.adoqTel.RecordCount);
    end;
  if Key=46 then
    begin
      if MessageDlg('�� ������� ��� ������ �������?',mtWarning,mbOkCancel,0)=mrOk then
        dmTel.adoqTel.Delete;
      lKolZap.Caption:=IntToStr(dmTel.adoqTel.RecordCount);
    end;
end;

procedure TfTelSprav.nAddClick(Sender: TObject);
begin
  NewEdit:=true;
  fNewTel.ShowModal;
end;

procedure TfTelSprav.eFIOKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['�'..'�','�'..'�',#8,#46,#32]) then Key:=#0;
end;

procedure TfTelSprav.eDepartKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['�'..'�','�'..'�',#8,#46,#32]) then Key:=#0;
end;

procedure TfTelSprav.ePostKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['�'..'�','�'..'�',#8,#46,#32]) then Key:=#0;
end;

procedure TfTelSprav.eFIOChange(Sender: TObject);
begin
  if eFIO.Text<>'' then
    begin
      cebFIO.Checked:=true;
      Filterbase;
    end
end;

procedure TfTelSprav.Filtretion(var str:string);
var s:string;
begin
  s:='';
  if (cebFIO.Checked=true) and (eFIO.Text<>'') then
    if s='' then
      s:=s+'(������� LIKE ''*'+eFIO.Text+'*'' or ��� LIKE ''*'+eFIO.Text+'*'' or �������� LIKE ''*'+eFIO.Text+'*'')'
    else
      s:=s+' and (������� LIKE ''*'+eFIO.Text+'*'' or ��� LIKE ''*'+eFIO.Text+'*'' or �������� LIKE ''*'+eFIO.Text+'*'')';
  if (cebDepart.Checked=true) and (eDepart.Text<>'') then
    if s='' then
      s:=s+'��������� LIKE ''%'+eDepart.Text+'%'''
    else
      s:=s+' and ��������� LIKE ''*'+eDepart.Text+'*''';
  if (cebPost.Checked=true) and (ePost.Text<>'') then
    if s='' then
      s:=s+'��������� LIKE ''*'+ePost.Text+'*'''
    else
      s:=s+' and ��������� LIKE ''*'+ePost.Text+'*''';
  if (cebTel.Checked=true) and (meTel.Text<>' -  -  ') then
    if s='' then
      s:=s+'������� LIKE ''*'+meTel.Text+'*'''
    else
      s:=s+' and ������� LIKE ''*'+meTel.Text+'*''';
  if (cebText.Checked=true) and (eText.Text<>'') then
    if s='' then
      s:=s+'���������� LIKE ''*'+eText.Text+'*'''
    else
      s:=s+' and ���������� LIKE ''*'+eText.Text+'*''';
  if (cebIP.Checked=true) and (meIP.Text<>'  .  .   .   ') then
    if s='' then
      s:=s+'IP LIKE ''*'+meIP.Text+'*'''
    else
      s:=s+' and IP LIKE ''*'+meIP.Text+'*''';
  if (cebNameComp.Checked=true) and (eNameComp.Text<>'') then
    if s='' then
      s:=s+'[��� ����������] LIKE ''*'+eNameComp.Text+'*'''
    else
      s:=s+' and [��� ����������] LIKE ''*'+eNameComp.Text+'*''';
  str:=str+s;
end;

procedure TfTelSprav.Filterbase;
var st:string;
begin
  Filtretion(st);
  if st<>'' then
    with dmTel do
      begin
        adoqTel.Filter:=st;
        adoqTel.Filtered:=true;
      end
  else
    dmTel.adoqTel.Filtered:=false;
  lKolZap.Caption:=IntToStr(dmTel.adoqTel.RecordCount);
end;

procedure TfTelSprav.eDepartChange(Sender: TObject);
begin
  if eDepart.Text<>'' then
    begin
      cebDepart.Checked:=true;
      Filterbase;
    end;
end;

procedure TfTelSprav.ePostChange(Sender: TObject);
begin
  if ePost.Text<>'' then
    begin
      cebPost.Checked:=true;
      Filterbase;
    end;
end;

procedure TfTelSprav.meTelChange(Sender: TObject);
begin
  meTel.Modified:=false;
  if meTel.Text<>' -  -  ' then
    begin
      cebTel.Checked:=true;
      Filterbase;
    end;
end;

procedure TfTelSprav.meIPChange(Sender: TObject);
begin
  meIP.Modified:=false;
  if meIP.Text<>'  .  .   .   ' then
    begin
      cebIP.Checked:=true;
      Filterbase;
    end;
end;

procedure TfTelSprav.eNameCompChange(Sender: TObject);
begin
  if eNameComp.Text<>'' then
    begin
      cebNameComp.Checked:=true;
      Filterbase;
    end;
end;

procedure TfTelSprav.eTextChange(Sender: TObject);
begin
  if eText.Text<>'' then
    begin
      cebText.Checked:=true;
      Filterbase;
    end;
end;

procedure TfTelSprav.nDeleteClick(Sender: TObject);
begin
  if MessageDlg('�� ������� ��� ������ �������?',mtWarning,mbOkCancel,0)=mrOk then
    dmTel.adoqTel.Delete;
end;

procedure TfTelSprav.FormShow(Sender: TObject);
begin
  VivodMainTable;
  lKolZap.Caption:=IntToStr(dmTel.adoqTel.RecordCount);
end;

procedure TfTelSprav.cebFIOClick(Sender: TObject);
begin
  if cebFIO.Checked=false then
    eFIO.Text:=''
  else
    Filterbase;
end;

procedure TfTelSprav.cebDepartClick(Sender: TObject);
begin
  if cebDepart.Checked=false then
    eDepart.Text:='';
  Filterbase;
end;

procedure TfTelSprav.cebPostClick(Sender: TObject);
begin
  if cebPost.Checked=false then
    ePost.Text:=''
  else
    Filterbase;
end;

procedure TfTelSprav.cebTelClick(Sender: TObject);
begin
  if cebTel.Checked=false then
    meTel.Text:=''
  else
    Filterbase;
end;

procedure TfTelSprav.cebIPClick(Sender: TObject);
begin
  if cebIP.Checked=false then
    meIP.Text:=''
  else
    Filterbase;
end;

procedure TfTelSprav.cebNameCompClick(Sender: TObject);
begin
  if cebNameComp.Checked=false then
    eNameComp.Text:=''
  else
    Filterbase;
end;

procedure TfTelSprav.cebTextClick(Sender: TObject);
begin
  if cebText.Checked=false then
    eText.Text:=''
  else
    Filterbase;
end;

procedure TfTelSprav.VivodMainTable;
begin
  with dmTel do
    begin
      adoqTel.SQL.Text:='SELECT * FROM [��������]';
      adoqTel.Open;
    end;
end;

end.
