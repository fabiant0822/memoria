object frm1: Tfrm1
  Left = 198
  Top = 93
  Caption = 'Soma mem'#243'ria j'#225't'#233'ka'
  ClientHeight = 426
  ClientWidth = 581
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = Menu
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pC: TPageControl
    Left = 0
    Top = 0
    Width = 581
    Height = 426
    ActivePage = tbJatek
    Align = alClient
    TabOrder = 0
    object tbJatek: TTabSheet
      Caption = 'J'#225't'#233'k'
      TabVisible = False
      ExplicitLeft = 92
      ExplicitTop = 54
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pPontKiir: TPanel
        Left = 424
        Top = 0
        Width = 149
        Height = 416
        Align = alRight
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        Visible = False
        object GroupBox2: TGroupBox
          Left = 0
          Top = 8
          Width = 145
          Height = 49
          Caption = 'Pontsz'#225'mok:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object lJ1: TLabel
            Left = 10
            Top = 16
            Width = 65
            Height = 26
            Caption = 'Soma:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clAqua
            Font.Height = -23
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object pJ1P: TPanel
            Left = 108
            Top = 19
            Width = 33
            Height = 25
            Alignment = taLeftJustify
            BevelOuter = bvNone
            Caption = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -24
            Font.Name = 'Arial'
            Font.Style = []
            ParentColor = True
            ParentFont = False
            TabOrder = 0
          end
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 63
          Width = 145
          Height = 49
          Caption = 'Pr'#243'b'#225'lkoz'#225'sok:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object pProba: TPanel
            Left = 32
            Top = 18
            Width = 81
            Height = 25
            BevelOuter = bvNone
            Caption = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -24
            Font.Name = 'Arial'
            Font.Style = []
            ParentColor = True
            ParentFont = False
            TabOrder = 0
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'K'#233'pek hozz'#225'ad'#225'sa'
      ImageIndex = 1
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object ITesztnezet: TImage
        Left = 449
        Top = 0
        Width = 124
        Height = 416
        Align = alClient
        Center = True
        ExplicitWidth = 132
        ExplicitHeight = 429
      end
      object pKepek: TPanel
        Left = 0
        Top = 0
        Width = 449
        Height = 416
        Align = alLeft
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        object lKepek: TListBox
          Left = 0
          Top = 25
          Width = 201
          Height = 391
          Style = lbOwnerDrawVariable
          Align = alLeft
          BevelInner = bvLowered
          BevelKind = bkFlat
          BorderStyle = bsNone
          Color = clSilver
          DragMode = dmAutomatic
          ExtendedSelect = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = lKepekClick
          OnDblClick = lKepekDblClick
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 449
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = 'A j'#225't'#233'kban szerepl'#337' 18+1 k'#233'p:  Seg'#237'ts'#233'g a k'#233'pek haszn'#225'lat'#225'hoz:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object mInfo: TMemo
          Left = 204
          Top = 25
          Width = 229
          Height = 88
          BevelInner = bvLowered
          BevelKind = bkFlat
          BorderStyle = bsNone
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Lines.Strings = (
            'A bal oldali list'#225'ban szerepl'#337' k'#233'peket'
            'szabadon kicser'#233'lgethetj'#252'k.'
            'A legutols'#243' k'#233'p fogja jelenteni a lapok'
            'h'#225'tter'#233't, vagyis ez l'#225'tszik, amikor le'
            'vannak ford'#237'tva.')
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object pKepcsere: TPanel
          Left = 204
          Top = 136
          Width = 229
          Height = 28
          Cursor = crHandPoint
          BevelInner = bvLowered
          Caption = 'A kiv'#225'lasztott k'#233'p cser'#233'je '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Bookman Old Style'
          Font.Style = []
          ParentColor = True
          ParentFont = False
          TabOrder = 3
          OnClick = pKepcsereClick
        end
        object GroupBox1: TGroupBox
          Left = 205
          Top = 182
          Width = 228
          Height = 51
          Caption = 'K'#233'pek m'#233'rete: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'Benguiat Frisky ATT'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object Label2: TLabel
            Left = 11
            Top = 22
            Width = 47
            Height = 17
            Caption = 'Magass'#225'g:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'Haettenschweiler'
            Font.Style = []
            ParentFont = False
          end
          object Label3: TLabel
            Left = 127
            Top = 20
            Width = 46
            Height = 17
            Caption = 'Sz'#233'less'#233'g:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'Haettenschweiler'
            Font.Style = []
            ParentFont = False
          end
          object sMag: TSpinEdit
            Left = 60
            Top = 18
            Width = 44
            Height = 28
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = []
            MaxValue = 0
            MinValue = 0
            ParentFont = False
            TabOrder = 0
            Value = 60
          end
          object sSzel: TSpinEdit
            Left = 175
            Top = 16
            Width = 44
            Height = 28
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = []
            MaxValue = 0
            MinValue = 0
            ParentFont = False
            TabOrder = 1
            Value = 60
          end
        end
      end
    end
  end
  object Menu: TMainMenu
    Left = 500
    Top = 192
    object mJatek: TMenuItem
      Caption = #218'j j'#225't'#233'k'
      OnClick = mJatekClick
    end
    object mBeallitasok: TMenuItem
      Caption = 'K'#233'pek...'
      OnClick = mBeallitasokClick
    end
    object mKilepes: TMenuItem
      Caption = 'Kil'#233'p'#233's'
      OnClick = mKilepesClick
    end
  end
  object OpenP: TOpenPictureDialog
    Left = 500
    Top = 224
  end
  object tEltuntet: TTimer
    Enabled = False
    Interval = 1
    OnTimer = tEltuntetTimer
    Left = 500
    Top = 256
  end
end
