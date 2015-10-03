object Form1: TForm1
  Left = 192
  Top = 124
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Unknown Installer [ BETA ]'
  ClientHeight = 373
  ClientWidth = 454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 454
    Height = 373
    ActivePage = TabSheet7
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Bem Vindo'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 40
        Top = 0
        Width = 324
        Height = 24
        Caption = 'Bem Vindo ao Unknown Installer'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Memo1: TMemo
        Left = 16
        Top = 48
        Width = 417
        Height = 265
        Lines.Strings = (
          
            'O Unknown Installer ir'#225' te guiar para voc'#234' criar seu instalador ' +
            'de maneira mais '
          'r'#225'pida e pr'#225'tica poss'#237'vel.'
          ''
          'Em apenas alguns passos voc'#234' estar'#225' com seu Instalador pronto.'
          ''
          ''
          'Unknown Installer foi desenvolvido por Maickonn Richard.'
          ''
          'Contato: senjaxus@gmail.com')
        ParentColor = True
        ReadOnly = True
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Informa'#231#245'es do Software'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label2: TLabel
        Left = 8
        Top = 24
        Width = 91
        Height = 13
        Caption = 'Nome do Software:'
      end
      object Label3: TLabel
        Left = 8
        Top = 80
        Width = 96
        Height = 13
        Caption = 'Vers'#227'o do Software:'
      end
      object Label4: TLabel
        Left = 8
        Top = 144
        Width = 61
        Height = 13
        Caption = 'Distribuidora:'
      end
      object Label5: TLabel
        Left = 8
        Top = 208
        Width = 81
        Height = 13
        Caption = 'Site do Software:'
      end
      object Edit1: TEdit
        Left = 8
        Top = 40
        Width = 425
        Height = 21
        TabOrder = 0
        Text = 'Programa Teste'
      end
      object Edit2: TEdit
        Left = 8
        Top = 96
        Width = 425
        Height = 21
        TabOrder = 1
        Text = '1.0'
      end
      object Edit3: TEdit
        Left = 8
        Top = 160
        Width = 425
        Height = 21
        TabOrder = 2
        Text = 'Distribuidora Lab'
      end
      object Edit4: TEdit
        Left = 8
        Top = 224
        Width = 425
        Height = 21
        TabOrder = 3
        Text = 'http://www.meusite.com.br'
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Diret'#243'rio'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label6: TLabel
        Left = 8
        Top = 32
        Width = 99
        Height = 13
        Caption = 'Destino para instalar:'
      end
      object Label7: TLabel
        Left = 8
        Top = 120
        Width = 76
        Height = 13
        Caption = 'Nome da Pasta:'
      end
      object ComboBox1: TComboBox
        Left = 8
        Top = 48
        Width = 425
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 0
        Text = 'Arquivos de Programas'
        OnChange = ComboBox1Change
        Items.Strings = (
          'Arquivos de Programas'
          'Personalizado')
      end
      object Edit5: TEdit
        Left = 8
        Top = 72
        Width = 425
        Height = 21
        Enabled = False
        TabOrder = 1
      end
      object Edit6: TEdit
        Left = 8
        Top = 136
        Width = 425
        Height = 21
        TabOrder = 2
        Text = 'Meu Programa'
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Arquivos'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label8: TLabel
        Left = 8
        Top = 24
        Width = 141
        Height = 13
        Caption = 'Arquivo principal do Software:'
      end
      object Label13: TLabel
        Left = 8
        Top = 137
        Width = 88
        Height = 13
        Caption = 'Arquivos && Pastas:'
      end
      object Label16: TLabel
        Left = 8
        Top = 325
        Width = 164
        Height = 13
        Caption = 'Quantidade de Arquivos+Pastas: 0'
      end
      object Edit7: TEdit
        Left = 8
        Top = 40
        Width = 337
        Height = 21
        TabOrder = 0
        Text = 'C:\Arquivo de Programas\Meu Programa\Meu Soft.exe'
      end
      object Button1: TButton
        Left = 360
        Top = 38
        Width = 75
        Height = 25
        Caption = 'Procurar'
        TabOrder = 1
        OnClick = Button1Click
      end
      object CheckBox1: TCheckBox
        Left = 8
        Top = 64
        Width = 425
        Height = 17
        Caption = 'Esse software n'#227'o possui um arquivo principal'
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 2
      end
      object ListBox1: TListBox
        Left = 8
        Top = 152
        Width = 337
        Height = 169
        ItemHeight = 13
        PopupMenu = PopupMenu1
        TabOrder = 3
      end
      object Button2: TButton
        Left = 360
        Top = 152
        Width = 75
        Height = 25
        Caption = 'Add Diret'#243'rio'
        TabOrder = 4
        OnClick = Button2Click
      end
      object Edit8: TEdit
        Left = 8
        Top = 104
        Width = 425
        Height = 21
        TabOrder = 5
      end
      object CheckBox3: TCheckBox
        Left = 8
        Top = 86
        Width = 425
        Height = 17
        Caption = 'Abrir arquivo ao finalizar instala'#231#227'o'
        TabOrder = 6
      end
    end
    object TabSheet5: TTabSheet
      Caption = #205'cone'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Image1: TImage
        Left = 16
        Top = 40
        Width = 409
        Height = 265
        Center = True
      end
      object CheckBox2: TCheckBox
        Left = 16
        Top = 16
        Width = 409
        Height = 17
        Caption = 'Usar '#237'cone'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object Button3: TButton
        Left = 336
        Top = 312
        Width = 89
        Height = 25
        Caption = 'Procurar '#237'cone'
        TabOrder = 1
        OnClick = Button3Click
      end
      object Edit11: TEdit
        Left = 16
        Top = 314
        Width = 313
        Height = 21
        TabOrder = 2
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Licen'#231'a'
      ImageIndex = 5
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label9: TLabel
        Left = 8
        Top = 24
        Width = 75
        Height = 13
        Caption = 'Termos de Uso:'
      end
      object Memo2: TMemo
        Left = 8
        Top = 40
        Width = 425
        Height = 289
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Compilar'
      ImageIndex = 6
      object Label10: TLabel
        Left = 16
        Top = 24
        Width = 94
        Height = 13
        Caption = 'Senha para instalar:'
      end
      object Label11: TLabel
        Left = 16
        Top = 64
        Width = 77
        Height = 13
        Caption = 'Repita a Senha:'
      end
      object Label12: TLabel
        Left = 16
        Top = 136
        Width = 144
        Height = 13
        Caption = 'Local para Salvar o Instalador:'
      end
      object Label14: TLabel
        Left = 16
        Top = 256
        Width = 88
        Height = 13
        Caption = 'Progresso: [ 0 / 0 ]'
      end
      object Label15: TLabel
        Left = 16
        Top = 296
        Width = 123
        Height = 13
        Caption = 'Aguardando Confirma'#231#227'o '
      end
      object Edit9: TEdit
        Left = 16
        Top = 40
        Width = 417
        Height = 21
        PasswordChar = '*'
        TabOrder = 0
      end
      object Edit10: TEdit
        Left = 16
        Top = 80
        Width = 417
        Height = 21
        PasswordChar = '*'
        TabOrder = 1
      end
      object Edit12: TEdit
        Left = 16
        Top = 154
        Width = 353
        Height = 21
        TabOrder = 2
      end
      object Button4: TButton
        Left = 376
        Top = 151
        Width = 57
        Height = 25
        Caption = '...'
        TabOrder = 3
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 16
        Top = 208
        Width = 417
        Height = 25
        Caption = 'Compilar Instalador'
        TabOrder = 4
        OnClick = Button5Click
      end
      object ProgressBar1: TProgressBar
        Left = 16
        Top = 272
        Width = 417
        Height = 17
        TabOrder = 5
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Execut'#225'vel (*.exe)|*.exe'
    Left = 396
    Top = 80
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = #205'cones (*.ico)|*.ico'
    Left = 412
    Top = 320
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Execut'#225'vel (*.exe)|*.exe'
    Left = 388
    Top = 200
  end
  object MainMenu1: TMainMenu
    Left = 252
    Top = 232
    object A1: TMenuItem
      Caption = '&Arquivo'
      object S1: TMenuItem
        Caption = '&Salvar altera'#231#245'es'
        OnClick = S1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object N1: TMenuItem
        Caption = '&Carregar altera'#231#245'es'
        OnClick = N1Click
      end
    end
  end
  object OpenDialog2: TOpenDialog
    Filter = 
      'Arquivo de configura'#231#245'es Unknown Installer (*.unkconfig)|*.unkco' +
      'nfig'
    Left = 212
    Top = 232
  end
  object SaveDialog2: TSaveDialog
    Filter = 
      'Arquivo de configura'#231#245'es Unknown Installer (*.unkconfig)|*.unkco' +
      'nfig'
    Left = 228
    Top = 272
  end
  object PopupMenu1: TPopupMenu
    Left = 308
    Top = 208
    object R1: TMenuItem
      Caption = 'Remover'
      OnClick = R1Click
    end
  end
end
