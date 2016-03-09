unit TelSpravMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGrids, Mask, StdCtrls, ImgList, ExtCtrls;

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
    rbSort: TRadioGroup;
    rbVU: TRadioGroup;
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
    procedure PerehKlav(int:integer);
    procedure eNameCompEnter(Sender: TObject);
    procedure eNameCompExit(Sender: TObject);
    procedure nEditClick(Sender: TObject);
    procedure rbSortClick(Sender: TObject);
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
  lKolZap.Caption:=IntToStr(dmTel.adoqTel.RecordCount);
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
    cebFIO.Checked:=true;
  Filterbase;
end;

procedure TfTelSprav.Filtretion(var str:string);
var s,st:string;
begin
  s:='';
  if cebFIO.Checked then
    if s='' then
      s:=s+'(������� LIKE ''*'+eFIO.Text+'*'' or ��� LIKE ''*'+eFIO.Text+'*'' or �������� LIKE ''*'+eFIO.Text+'*'')'
    else
      s:=s+' and (������� LIKE ''*'+eFIO.Text+'*'' or ��� LIKE ''*'+eFIO.Text+'*'' or �������� LIKE ''*'+eFIO.Text+'*'')';
  if cebDepart.Checked then
    if s='' then
      s:=s+'��������� LIKE ''%'+eDepart.Text+'%'''
    else
      s:=s+' and ��������� LIKE ''*'+eDepart.Text+'*''';
  if cebPost.Checked then
    if s='' then
      s:=s+'��������� LIKE ''*'+ePost.Text+'*'''
    else
      s:=s+' and ��������� LIKE ''*'+ePost.Text+'*''';
  if cebTel.Checked then
    begin
      st:=meTel.Text;
      if pos('- ',st)>0 then
        delete(st,pos('- ',st),length(st));
      if pos(' ',st)>0 then
        delete(st,pos(' ',st),length(st));
      if s='' then
        s:=s+'������� LIKE ''*'+st+'*'''
      else
        s:=s+' AND ������� LIKE ''*'+st+'*''';
    end;
  if cebText.Checked then
    if s='' then
      s:=s+'���������� LIKE ''*'+eText.Text+'*'''
    else
      s:=s+' and ���������� LIKE ''*'+eText.Text+'*''';
  if cebIP.Checked then
    begin
      st:=meIP.Text;
      if pos('. ',st)>0 then
        delete(st,pos('. ',st),length(st));
      if pos(' ',st)>0 then
        delete(st,pos(' ',st),length(st));
      if s='' then
        s:=s+'IP LIKE ''*'+st+'*'''
      else
        s:=s+' and IP LIKE ''*'+st+'*''';
    end;
  if cebNameComp.Checked then
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
  lKolZap.Caption:=IntToStr(dmTel.adoqTel.RecordCount);
end;

procedure TfTelSprav.FormShow(Sender: TObject);
begin
  VivodMainTable;
  lKolZap.Caption:=IntToStr(dmTel.adoqTel.RecordCount);
end;

procedure TfTelSprav.cebFIOClick(Sender: TObject);
begin
  if cebFIO.Checked=false then
    eFIO.Text:='';
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
    ePost.Text:='';
  Filterbase;
end;

procedure TfTelSprav.cebTelClick(Sender: TObject);
begin
  if cebTel.Checked=false then
    meTel.Text:='';
  Filterbase;
end;

procedure TfTelSprav.cebIPClick(Sender: TObject);
begin
  if cebIP.Checked=false then
    meIP.Text:='';
  Filterbase;
end;

procedure TfTelSprav.cebNameCompClick(Sender: TObject);
begin
  if cebNameComp.Checked=false then
    eNameComp.Text:='';
  Filterbase;
end;

procedure TfTelSprav.cebTextClick(Sender: TObject);
begin
  if cebText.Checked=false then
    eText.Text:='';
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

procedure TfTelSprav.PerehKlav(int:integer);
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

procedure TfTelSprav.eNameCompEnter(Sender: TObject);
begin
  PerehKlav(2);
end;

procedure TfTelSprav.eNameCompExit(Sender: TObject);
begin
  PerehKlav(1);
end;

procedure TfTelSprav.nEditClick(Sender: TObject);
begin
  NewEdit:=false;
  fNewTel.ShowModal;
  lKolZap.Caption:=IntToStr(dmTel.adoqTel.RecordCount);
end;

procedure TfTelSprav.rbSortClick(Sender: TObject);
var st,s:string;
begin
  case rbSort.ItemIndex of
  0:  st:='���������';
  1:  st:='���������';
  2:  st:='�������,���,��������';
  3:  st:='�������';
  4:  st:='����������';
  5:  st:='IP';
  6:  st:='[��� ����������]';
  end;
  case rbVU.ItemIndex of
  0:  s:='ASC';
  1:  s:='DESC';
  end;
  with dmTel do
    begin
      if (s<>'') and (st<>'') then
        adoqTel.SQL.Text:='SELECT * FROM [��������] ORDER BY '+st+' '+s
      else
        if s='' then
          begin
            adoqTel.SQL.Text:='SELECT * FROM [��������] ORDER BY '+st+' ASC';
            rbVU.ItemIndex:=0;
          end;
      adoqTel.Open;
    end;
end;

end.
