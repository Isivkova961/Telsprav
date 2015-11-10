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
      if MessageDlg('Вы уверены что хотите удалить?',mtWarning,mbOkCancel,0)=mrOk then
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
  if not (Key in ['а'..'я','А'..'Я',#8,#46,#32]) then Key:=#0;
end;

procedure TfTelSprav.eDepartKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['а'..'я','А'..'Я',#8,#46,#32]) then Key:=#0;
end;

procedure TfTelSprav.ePostKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['а'..'я','А'..'Я',#8,#46,#32]) then Key:=#0;
end;

procedure TfTelSprav.eFIOChange(Sender: TObject);
begin
  if eFIO.Text<>'' then
    cebFIO.Checked:=true;
  Filterbase;
end;

procedure TfTelSprav.Filtretion(var str:string);
var s:string;
begin
  s:='';
  if (cebFIO.Checked=true) and (eFIO.Text<>'') then
    if s='' then
      s:=s+'(Фамилия LIKE ''*'+eFIO.Text+'*'' or Имя LIKE ''*'+eFIO.Text+'*'' or Отчество LIKE ''*'+eFIO.Text+'*'')'
    else
      s:=s+' and (Фамилия LIKE ''*'+eFIO.Text+'*'' or Имя LIKE ''*'+eFIO.Text+'*'' or Отчество LIKE ''*'+eFIO.Text+'*'')'
  else
    if (cebFIO.Checked=true) and (eFIO.Text='') then
      if s='' then
        s:=s+'(Фамилия LIKE '+#39+#39+' or Имя LIKE '+#39+#39+' or Отчество LIKE '+#39+#39+')'
      else
        s:=s+' and (Фамилия LIKE '+#39+#39+' or Имя LIKE '+#39+#39+' or Отчество LIKE '+#39+#39+')';
  if (cebDepart.Checked=true) and (eDepart.Text<>'') then
    if s='' then
      s:=s+'Отделение LIKE ''%'+eDepart.Text+'%'''
    else
      s:=s+' and Отделение LIKE ''*'+eDepart.Text+'*'''
  else
    if (cebDepart.Checked=true) and (eDepart.Text='') then
      if s='' then
        s:=s+'Отделение LIKE '+#39+#39
      else
        s:=s+' and Отделение LIKE '+#39+#39;
  if (cebPost.Checked=true) and (ePost.Text<>'') then
    if s='' then
      s:=s+'Должность LIKE ''*'+ePost.Text+'*'''
    else
      s:=s+' and Должность LIKE ''*'+ePost.Text+'*'''
  else
    if (cebPost.Checked=true) and (ePost.Text='') then
      if s='' then
        s:=s+'Должность LIKE '+#39+#39
      else
        s:=s+' and Должность LIKE '+#39+#39;
  if (cebTel.Checked=true) and (meTel.Text<>' -  -  ') then
    if s='' then
      s:=s+'Телефон LIKE ''*'+meTel.Text+'*'''
    else
      s:=s+' and Телефон LIKE ''*'+meTel.Text+'*'''
  else
    if (cebTel.Checked=true) and (meTel.Text=' -  -  ') then
      if s='' then
        s:=s+'Телефон LIKE '+#39+#39
      else
        s:=s+' and Телефон LIKE '+#39+#39;
  if (cebText.Checked=true) and (eText.Text<>'') then
    if s='' then
      s:=s+'Примечание LIKE ''*'+eText.Text+'*'''
    else
      s:=s+' and Примечание LIKE ''*'+eText.Text+'*'''
  else
    if (cebText.Checked=true) and (eText.Text='') then
      if s='' then
        s:=s+'Примечание LIKE '+#39+#39
      else
        s:=s+' and Примечание LIKE '+#39+#39;
  if (cebIP.Checked=true) and (meIP.Text<>'  .  .   .   ') then
    if s='' then
      s:=s+'IP LIKE ''*'+meIP.Text+'*'''
    else
      s:=s+' and IP LIKE ''*'+meIP.Text+'*'''
  else
    if (cebIP.Checked=true) and (meIP.Text='  .  .   .   ') then
      if s='' then
        s:=s+'IP LIKE '+#39+#39
      else
        s:=s+' and IP LIKE '+#39+#39;
  if (cebNameComp.Checked=true) and (eNameComp.Text<>'') then
    if s='' then
      s:=s+'[Имя компьютера] LIKE ''*'+eNameComp.Text+'*'''
    else
      s:=s+' and [Имя компьютера] LIKE ''*'+eNameComp.Text+'*'''
  else
    if (cebNameComp.Checked=true) and (eNameComp.Text='') then
      if s='' then
        s:=s+'[Имя компьютера] LIKE '+#39+#39
      else
        s:=s+' and [Имя компьютера] LIKE '+#39+#39;
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
    cebDepart.Checked:=true;
  Filterbase;
end;

procedure TfTelSprav.ePostChange(Sender: TObject);
begin
  if ePost.Text<>'' then
    cebPost.Checked:=true;
  Filterbase;
end;

procedure TfTelSprav.meTelChange(Sender: TObject);
begin
  meTel.Modified:=false;
  if cebTel.Checked=false then
    cebTel.Checked:=true;
  Filterbase;
end;

procedure TfTelSprav.meIPChange(Sender: TObject);
begin
  meIP.Modified:=false;
  if cebIP.Checked=false then
    cebIP.Checked:=true;
  Filterbase;
end;

procedure TfTelSprav.eNameCompChange(Sender: TObject);
begin
  if eNameComp.Text<>'' then
    cebNameComp.Checked:=true;
  Filterbase;
end;

procedure TfTelSprav.eTextChange(Sender: TObject);
begin
  if eText.Text<>'' then
    cebText.Checked:=true;
  Filterbase;
end;

procedure TfTelSprav.nDeleteClick(Sender: TObject);
begin
  if MessageDlg('Вы уверены что хотите удалить?',mtWarning,mbOkCancel,0)=mrOk then
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
      adoqTel.SQL.Text:='SELECT * FROM [Телефоны]';
      adoqTel.Open;
    end;
end;

end.
