unit TelDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmTel = class(TDataModule)
    adocTel: TADOConnection;
    adotTel: TADOTable;
    dsTel: TDataSource;
    adoqTel: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmTel: TdmTel;

implementation

{$R *.dfm}

end.
