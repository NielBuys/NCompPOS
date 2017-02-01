object ImportData: TImportData
  OldCreateOrder = False
  Left = 239
  Top = 152
  Height = 282
  Width = 409
  object ExcelFileConnect: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0; Data Source=\\Riskfinserver\da' +
      'ta\NIEL IMPORT\test.xls;Extended Properties=Excel 8.0;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 72
    Top = 24
  end
  object ADOQuery1: TADOQuery
    Connection = ExcelFileConnect
    Parameters = <>
    Left = 168
    Top = 24
  end
  object ExcelSource: TDataSource
    DataSet = ADOQuery1
    Left = 248
    Top = 24
  end
end
