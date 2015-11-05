object dmTel: TdmTel
  OldCreateOrder = False
  Left = 483
  Top = 321
  Height = 206
  Width = 254
  object adocTel: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.12.0;Data Source='#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082'.mdb;Per' +
      'sist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 32
    Top = 16
  end
  object adotTel: TADOTable
    Active = True
    Connection = adocTel
    CursorType = ctStatic
    TableName = #1058#1077#1083#1077#1092#1086#1085#1099
    Left = 80
    Top = 16
  end
  object dsTel: TDataSource
    DataSet = adoqTel
    Left = 136
    Top = 16
  end
  object adoqTel: TADOQuery
    Connection = adocTel
    Parameters = <>
    Left = 32
    Top = 72
  end
end
