object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 241
  Width = 355
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NomeSoft'
        DataType = ftMemo
      end
      item
        Name = 'VersaoSoft'
        DataType = ftMemo
      end
      item
        Name = 'Distribuidora'
        DataType = ftMemo
      end
      item
        Name = 'Site'
        DataType = ftMemo
      end
      item
        Name = 'DiretorioInstall'
        DataType = ftMemo
      end
      item
        Name = 'NomePasta'
        DataType = ftMemo
      end
      item
        Name = 'ArquivoPrincipal'
        DataType = ftMemo
      end
      item
        Name = 'SemPrincipal'
        DataType = ftBoolean
      end
      item
        Name = 'AbrirAposInstall'
        DataType = ftBoolean
      end
      item
        Name = 'ArquivoAposInstall'
        DataType = ftMemo
      end
      item
        Name = 'ArquivosEPastas'
        DataType = ftMemo
      end
      item
        Name = 'UsarIcone'
        DataType = ftBoolean
      end
      item
        Name = 'Licenca'
        DataType = ftMemo
      end
      item
        Name = 'Senha'
        DataType = ftMemo
      end
      item
        Name = 'LocalSaveInstall'
        DataType = ftMemo
      end
      item
        Name = 'LocalIcone'
        DataType = ftMemo
      end
      item
        Name = 'LocalArquivos'
        DataType = ftMemo
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 32
    Top = 16
    Data = {
      820200009619E0BD0100000018000000110000000000030000008202084E6F6D
      65536F667404004B000000010007535542545950450200490005005465787400
      0A56657273616F536F667404004B000000010007535542545950450200490005
      0054657874000D446973747269627569646F726104004B000000010007535542
      545950450200490005005465787400045369746504004B000000010007535542
      5459504502004900050054657874001044697265746F72696F496E7374616C6C
      04004B000000010007535542545950450200490005005465787400094E6F6D65
      506173746104004B000000010007535542545950450200490005005465787400
      104172717569766F5072696E636970616C04004B000000010007535542545950
      4502004900050054657874000C53656D5072696E636970616C02000300000000
      0010416272697241706F73496E7374616C6C0200030000000000124172717569
      766F41706F73496E7374616C6C04004B00000001000753554254595045020049
      00050054657874000F4172717569766F734550617374617304004B0000000100
      07535542545950450200490005005465787400095573617249636F6E65020003
      0000000000074C6963656E636104004B00000001000753554254595045020049
      00050054657874000553656E686104004B000000010007535542545950450200
      490005005465787400104C6F63616C53617665496E7374616C6C04004B000000
      0100075355425459504502004900050054657874000A4C6F63616C49636F6E65
      04004B0000000100075355425459504502004900050054657874000D4C6F6361
      6C4172717569766F7304004B0000000100075355425459504502004900050054
      657874000000}
    object ClientDataSet1NomeSoft: TMemoField
      FieldName = 'NomeSoft'
      BlobType = ftMemo
    end
    object ClientDataSet1VersaoSoft: TMemoField
      FieldName = 'VersaoSoft'
      BlobType = ftMemo
    end
    object ClientDataSet1Distribuidora: TMemoField
      FieldName = 'Distribuidora'
      BlobType = ftMemo
    end
    object ClientDataSet1Site: TMemoField
      FieldName = 'Site'
      BlobType = ftMemo
    end
    object ClientDataSet1DiretorioInstall: TMemoField
      FieldName = 'DiretorioInstall'
      BlobType = ftMemo
    end
    object ClientDataSet1NomePasta: TMemoField
      FieldName = 'NomePasta'
      BlobType = ftMemo
    end
    object ClientDataSet1ArquivoPrincipal: TMemoField
      FieldName = 'ArquivoPrincipal'
      BlobType = ftMemo
    end
    object ClientDataSet1SemPrincipal: TBooleanField
      FieldName = 'SemPrincipal'
    end
    object ClientDataSet1AbrirAposInstall: TBooleanField
      FieldName = 'AbrirAposInstall'
    end
    object ClientDataSet1ArquivoAposInstall: TMemoField
      FieldName = 'ArquivoAposInstall'
      BlobType = ftMemo
    end
    object ClientDataSet1ArquivosEPastas: TMemoField
      FieldName = 'ArquivosEPastas'
      BlobType = ftMemo
    end
    object ClientDataSet1UsarIcone: TBooleanField
      FieldName = 'UsarIcone'
    end
    object ClientDataSet1Licenca: TMemoField
      FieldName = 'Licenca'
      BlobType = ftMemo
    end
    object ClientDataSet1Senha: TMemoField
      FieldName = 'Senha'
      BlobType = ftMemo
    end
    object ClientDataSet1LocalSaveInstall: TMemoField
      FieldName = 'LocalSaveInstall'
      BlobType = ftMemo
    end
    object ClientDataSet1LocalIcone: TMemoField
      FieldName = 'LocalIcone'
      BlobType = ftMemo
    end
    object ClientDataSet1LocalArquivos: TMemoField
      FieldName = 'LocalArquivos'
      BlobType = ftMemo
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 128
    Top = 16
  end
end
