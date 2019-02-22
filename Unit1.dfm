object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'SERVER'
  ClientHeight = 385
  ClientWidth = 637
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
    Top = 364
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
    Left = 174
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
    Width = 226
    Height = 282
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
    Left = 119
    Top = 20
    Width = 49
    Height = 21
    TabOrder = 4
    Text = '11990'
  end
  object ListBox1: TListBox
    Left = 240
    Top = 47
    Width = 105
    Height = 282
    ItemHeight = 13
    TabOrder = 5
    OnClick = ListBox1Click
  end
  object Edit2: TEdit
    Left = 8
    Top = 337
    Width = 226
    Height = 21
    TabOrder = 6
  end
  object Button4: TButton
    Left = 240
    Top = 335
    Width = 105
    Height = 25
    Caption = 'Send'
    TabOrder = 7
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 544
    Top = 119
    Width = 83
    Height = 25
    Caption = 'Connect to DB'
    TabOrder = 8
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 544
    Top = 150
    Width = 83
    Height = 25
    Caption = 'Button6'
    TabOrder = 9
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 544
    Top = 181
    Width = 85
    Height = 25
    Caption = 'Button7'
    TabOrder = 10
  end
  object FBConnect: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey')
    AfterConnect = FBConnectAfterConnect
    Left = 584
    Top = 232
  end
  object Query: TFDQuery
    Connection = FBConnect
    Left = 528
    Top = 232
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 488
    Top = 240
  end
end
