object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'SERVER'
  ClientHeight = 492
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 475
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Button1: TButton
    Left = 8
    Top = 16
    Width = 105
    Height = 25
    Caption = 'Up Server on port:'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 240
    Top = 16
    Width = 75
    Height = 25
    Caption = 'GO'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 552
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 2
    OnClick = Button3Click
  end
  object RichEdit1: TRichEdit
    Left = 8
    Top = 47
    Width = 299
    Height = 386
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 3
    Zoom = 100
  end
  object Edit1: TEdit
    Left = 136
    Top = 20
    Width = 49
    Height = 21
    TabOrder = 4
    Text = '11990'
  end
  object ListBox1: TListBox
    Left = 344
    Top = 47
    Width = 283
    Height = 386
    ItemHeight = 13
    TabOrder = 5
    OnClick = ListBox1Click
  end
  object Edit2: TEdit
    Left = 8
    Top = 448
    Width = 473
    Height = 21
    TabOrder = 6
  end
  object Button4: TButton
    Left = 487
    Top = 446
    Width = 140
    Height = 25
    Caption = 'Send'
    TabOrder = 7
    OnClick = Button4Click
  end
end
