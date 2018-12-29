object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = #1040#1074#1090#1086#1087#1077#1088#1077#1074#1086#1076#1095#1080#1082
  ClientHeight = 523
  ClientWidth = 1029
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object PanelLangs: TPanel
    AlignWithMargins = True
    Left = 5
    Top = 5
    Width = 202
    Height = 494
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitHeight = 299
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 196
      Height = 19
      Align = alTop
      Caption = #1044#1086#1089#1090#1091#1087#1085#1099#1077' '#1103#1079#1099#1082#1080
      ExplicitWidth = 128
    end
    object ListViewLangs: TListView
      Left = 0
      Top = 25
      Width = 202
      Height = 469
      Align = alClient
      Columns = <
        item
          Caption = #1071#1079#1099#1082
          Width = 130
        end
        item
          Caption = #1050#1086#1076
        end>
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      ExplicitLeft = 8
      ExplicitTop = 35
      ExplicitWidth = 194
      ExplicitHeight = 256
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 212
    Top = 5
    Width = 814
    Height = 494
    Margins.Left = 0
    Margins.Top = 5
    Margins.Bottom = 5
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 10
    ExplicitWidth = 471
    ExplicitHeight = 417
    object Label2: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 808
      Height = 19
      Margins.Bottom = 0
      Align = alTop
      Caption = #1055#1077#1088#1077#1074#1086#1076' '#1095#1077#1088#1077#1079' '#1085#1077#1089#1082#1086#1083#1100#1082#1086' '#1089#1083#1091#1095#1072#1081#1085#1099#1093' '#1103#1079#1099#1082#1086#1074
      ExplicitWidth = 327
    end
    object Panel2: TPanel
      Left = 0
      Top = 22
      Width = 814
      Height = 40
      Margins.Top = 0
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitTop = 0
      ExplicitWidth = 471
      object EditText: TEdit
        AlignWithMargins = True
        Left = 183
        Top = 3
        Width = 464
        Height = 34
        Align = alClient
        BevelInner = bvNone
        BevelKind = bkSoft
        BevelOuter = bvSpace
        BevelWidth = 3
        TabOrder = 0
        Text = #1057' '#1085#1086#1074#1099#1084' '#1075#1086#1076#1086#1084'!'
        TextHint = #1060#1088#1072#1079#1072' '#1080#1083#1080' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1077#1088#1077#1074#1086#1076#1072
        ExplicitLeft = 3
        ExplicitWidth = 370
      end
      object Button1: TButton
        AlignWithMargins = True
        Left = 720
        Top = 2
        Width = 92
        Height = 36
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alRight
        Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080
        TabOrder = 1
        OnClick = Button1Click
        ExplicitLeft = 355
        ExplicitTop = 12
        ExplicitHeight = 29
      end
      object ComboBoxLang: TComboBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 174
        Height = 33
        Align = alLeft
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object SpinEditCount: TlkSpinEdit
        AlignWithMargins = True
        Left = 653
        Top = 3
        Width = 61
        Height = 34
        Align = alRight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxValue = 100
        MinValue = 1
        ParentFont = False
        TabOrder = 3
        Value = 10
        ExplicitHeight = 33
      end
    end
    object ListViewResult: TListView
      AlignWithMargins = True
      Left = 3
      Top = 65
      Width = 808
      Height = 429
      Margins.Bottom = 0
      Align = alClient
      Columns = <
        item
          Caption = #1055#1077#1088#1077#1074#1086#1076' '#1089
          Width = 120
        end
        item
          Width = 30
        end
        item
          Caption = #1087#1077#1088#1077#1074#1086#1076' '#1085#1072
          Width = 120
        end
        item
          AutoSize = True
          Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
        end>
      ReadOnly = True
      RowSelect = True
      ShowColumnHeaders = False
      TabOrder = 1
      ViewStyle = vsReport
      ExplicitWidth = 467
      ExplicitHeight = 352
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 504
    Width = 1029
    Height = 19
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Label3: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 1023
      Height = 13
      Align = alClient
      Alignment = taRightJustify
      Caption = 
        'Powered by Google Translate (Google Inc.) - Copyright (c) HemulG' +
        'M 2018'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 354
    end
  end
end
