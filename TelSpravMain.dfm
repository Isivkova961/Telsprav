object fTelSprav: TfTelSprav
  Left = 319
  Top = 242
  Width = 1129
  Height = 485
  Caption = #1058#1077#1083#1077#1092#1086#1085#1085#1099#1081' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Times New Roman'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object lKolZap: TLabel
    Left = 872
    Top = 352
    Width = 5
    Height = 23
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -21
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object dbgTel: TDBGrid
    Left = 0
    Top = 0
    Width = 1113
    Height = 337
    Align = alTop
    DataSource = dmTel.dsTel
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Times New Roman'
    TitleFont.Style = []
    OnKeyDown = dbgTelKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = #1054#1090#1076#1077#1083#1077#1085#1080#1077
        Title.Alignment = taCenter
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1044#1086#1083#1078#1085#1086#1089#1090#1100
        Title.Alignment = taCenter
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1060#1072#1084#1080#1083#1080#1103
        Title.Alignment = taCenter
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1048#1084#1103
        Title.Alignment = taCenter
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1054#1090#1095#1077#1089#1090#1074#1086
        Title.Alignment = taCenter
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1058#1077#1083#1077#1092#1086#1085
        Title.Alignment = taCenter
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.Alignment = taCenter
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IP'
        Title.Alignment = taCenter
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1048#1084#1103' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1072
        Title.Alignment = taCenter
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'email\login'
        Title.Alignment = taCenter
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'password'
        Title.Alignment = taCenter
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 80
        Visible = True
      end>
  end
  object eFIO: TEdit
    Left = 104
    Top = 344
    Width = 169
    Height = 25
    TabOrder = 1
    OnChange = eFIOChange
    OnKeyPress = eFIOKeyPress
  end
  object eDepart: TEdit
    Left = 104
    Top = 368
    Width = 169
    Height = 25
    TabOrder = 2
    OnChange = eDepartChange
    OnKeyPress = eDepartKeyPress
  end
  object ePost: TEdit
    Left = 104
    Top = 392
    Width = 169
    Height = 25
    TabOrder = 3
    OnChange = ePostChange
    OnKeyPress = ePostKeyPress
  end
  object meTel: TMaskEdit
    Left = 360
    Top = 344
    Width = 113
    Height = 25
    EditMask = '9-99-99;1;_'
    MaxLength = 7
    TabOrder = 4
    Text = ' -  -  '
    OnChange = meTelChange
  end
  object eText: TEdit
    Left = 632
    Top = 344
    Width = 177
    Height = 25
    TabOrder = 5
    OnChange = eTextChange
  end
  object meIP: TMaskEdit
    Left = 360
    Top = 368
    Width = 113
    Height = 25
    EditMask = '99.99.999.999;1;_'
    MaxLength = 13
    TabOrder = 6
    Text = '  .  .   .   '
    OnChange = meIPChange
  end
  object eNameComp: TEdit
    Left = 408
    Top = 392
    Width = 121
    Height = 25
    TabOrder = 7
    OnChange = eNameCompChange
  end
  object cebFIO: TCheckBox
    Left = 8
    Top = 352
    Width = 73
    Height = 17
    Caption = #1060'.'#1048'.'#1054'.'
    TabOrder = 8
    OnClick = cebFIOClick
  end
  object cebDepart: TCheckBox
    Left = 8
    Top = 376
    Width = 97
    Height = 17
    Caption = #1054#1090#1076#1077#1083#1077#1085#1080#1077
    TabOrder = 9
    OnClick = cebDepartClick
  end
  object cebPost: TCheckBox
    Left = 8
    Top = 400
    Width = 89
    Height = 17
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
    TabOrder = 10
    OnClick = cebPostClick
  end
  object cebTel: TCheckBox
    Left = 280
    Top = 352
    Width = 73
    Height = 17
    Caption = #1058#1077#1083#1077#1092#1086#1085
    TabOrder = 11
    OnClick = cebTelClick
  end
  object cebText: TCheckBox
    Left = 528
    Top = 352
    Width = 97
    Height = 17
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    TabOrder = 12
    OnClick = cebTextClick
  end
  object cebIP: TCheckBox
    Left = 280
    Top = 376
    Width = 73
    Height = 17
    Caption = 'IP'
    TabOrder = 13
    OnClick = cebIPClick
  end
  object cebNameComp: TCheckBox
    Left = 280
    Top = 400
    Width = 129
    Height = 17
    Caption = #1048#1084#1103' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1072
    TabOrder = 14
    OnClick = cebNameCompClick
  end
  object MainMenu1: TMainMenu
    Left = 1080
    Top = 400
    object nFile: TMenuItem
      Caption = #1060#1072#1081#1083
    end
    object nSprav: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
      object nAdd: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
        ShortCut = 45
        OnClick = nAddClick
      end
      object nEdit: TMenuItem
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100
      end
      object nDelete: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
        ShortCut = 46
        OnClick = nDeleteClick
      end
    end
  end
end
