object fNewTel: TfNewTel
  Left = 445
  Top = 295
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1085#1086#1074#1086#1075#1086' '#1090#1077#1083#1077#1092#1086#1085#1072
  ClientHeight = 223
  ClientWidth = 604
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Times New Roman'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object lFam: TLabel
    Left = 16
    Top = 16
    Width = 56
    Height = 17
    Caption = #1060#1072#1084#1080#1083#1080#1103
  end
  object lIm: TLabel
    Left = 16
    Top = 40
    Width = 28
    Height = 17
    Caption = #1048#1084#1103
  end
  object lOt: TLabel
    Left = 16
    Top = 64
    Width = 61
    Height = 17
    Caption = #1054#1090#1095#1077#1089#1090#1074#1086
  end
  object lDepart: TLabel
    Left = 16
    Top = 88
    Width = 68
    Height = 17
    Caption = #1054#1090#1076#1077#1083#1077#1085#1080#1077
  end
  object lPost: TLabel
    Left = 16
    Top = 112
    Width = 69
    Height = 17
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
  end
  object lTel: TLabel
    Left = 288
    Top = 16
    Width = 52
    Height = 17
    Caption = #1058#1077#1083#1077#1092#1086#1085
  end
  object lIP: TLabel
    Left = 288
    Top = 40
    Width = 14
    Height = 17
    Caption = 'IP'
  end
  object lNameComp: TLabel
    Left = 288
    Top = 64
    Width = 108
    Height = 17
    Caption = #1048#1084#1103' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1072
  end
  object lEmail: TLabel
    Left = 288
    Top = 88
    Width = 64
    Height = 17
    Caption = 'Email\login'
  end
  object lPassword: TLabel
    Left = 288
    Top = 112
    Width = 58
    Height = 17
    Caption = 'Password'
  end
  object lText: TLabel
    Left = 16
    Top = 136
    Width = 78
    Height = 17
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object eFam: TEdit
    Left = 88
    Top = 8
    Width = 193
    Height = 25
    TabOrder = 0
    OnEnter = eFamEnter
    OnKeyPress = eFamKeyPress
  end
  object eIm: TEdit
    Left = 88
    Top = 32
    Width = 193
    Height = 25
    TabOrder = 1
    OnEnter = eImEnter
    OnKeyPress = eImKeyPress
  end
  object eOt: TEdit
    Left = 88
    Top = 56
    Width = 193
    Height = 25
    TabOrder = 2
    OnEnter = eOtEnter
    OnKeyPress = eOtKeyPress
  end
  object eDepart: TEdit
    Left = 88
    Top = 80
    Width = 193
    Height = 25
    TabOrder = 3
    OnEnter = eDepartEnter
    OnKeyPress = eDepartKeyPress
  end
  object ePost: TEdit
    Left = 88
    Top = 104
    Width = 193
    Height = 25
    TabOrder = 4
    OnEnter = ePostEnter
    OnKeyPress = ePostKeyPress
  end
  object meTel: TMaskEdit
    Left = 400
    Top = 8
    Width = 134
    Height = 25
    EditMask = '9-99-99;1;_'
    MaxLength = 7
    TabOrder = 6
    Text = ' -  -  '
    OnChange = meTelChange
  end
  object meIP: TMaskEdit
    Left = 400
    Top = 32
    Width = 132
    Height = 25
    EditMask = '99/99/999/999;1;_'
    MaxLength = 13
    TabOrder = 7
    Text = '  .  .   .   '
    OnChange = meIPChange
  end
  object eNameComp: TEdit
    Left = 400
    Top = 56
    Width = 135
    Height = 25
    TabOrder = 8
    OnEnter = eNameCompEnter
  end
  object eEmail: TEdit
    Left = 400
    Top = 80
    Width = 135
    Height = 25
    TabOrder = 9
    OnChange = eEmailChange
  end
  object ePassword: TEdit
    Left = 400
    Top = 104
    Width = 135
    Height = 25
    TabOrder = 10
    OnChange = ePasswordChange
  end
  object bbSave: TBitBtn
    Left = 168
    Top = 184
    Width = 100
    Height = 30
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Default = True
    TabOrder = 11
    OnClick = bbSaveClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object bbCancel: TBitBtn
    Left = 288
    Top = 184
    Width = 100
    Height = 30
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 12
    OnClick = bbCancelClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object eText: TEdit
    Left = 96
    Top = 128
    Width = 441
    Height = 25
    TabOrder = 5
    OnEnter = eTextEnter
  end
end
