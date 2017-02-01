unit TCUtilsFrm;

interface
      uses UtilsUnit, SysUtils, ExtractFrm, Math, Dialogs, Forms, Variants;

      Function FindPeriod(DateStr: TDateTime): Integer;
      Function WriteTCMessage(S: String): Integer;
      Function ChangeTotals(Ammount: Currency;AccountID: Integer): Boolean;
      procedure CreateTCCreditor();
      procedure CreateTCStock();
      function CreateUnpostedInvoice(LastDocNo: String; InvDateStr: TDateTime): Boolean;
      Function PosPymtCode(PMTSTR:STRING):Integer;
      procedure BatConPost();
      procedure UpdateBatchID();
      procedure TCPostTransaction(Ref, Acc: String; transDate: TDateTime; Ammount: Currency);
      function CreateUnpostedPurcInvoice(LastDocNo: String; InvDateStr: TDateTime): Boolean;
      procedure UpdateTCStock;
      procedure UpdateTCStockfromPurch();

var
      PeriodID, InvLine, BatchID, MyCurrentUser, BatchLineCount: Integer;
      Total, TotalTax: Currency;

implementation
      uses Datafrm2, ListsMnu, PurchaseFrm, TCDataMod;

Function FindPeriod(DateStr: TDateTime): Integer;
     {expect following tables to be open TcPeriod}
begin

      FindPeriod := 0;
      TCData.TCPeriod.DisableControls;
      TCData.TcPeriod.First;
      while not TCData.TcPeriod.EOF do
      begin
        If (DatetoIntDate(DateStr) >= DatetoIntDate(TCData.TCPeriodDStartDate.Value)) and (DatetoIntDate(DateStr) <= DatetoIntDate(TCData.TCPeriodDEndDate.Value)) then
        begin
          FindPeriod := TCData.TCPeriodWPeriodID.Value;
          break;
        end;
        TCData.TCPeriod.Next;
      end;
      TCData.TCPeriod.EnableControls;
end;

Function WriteTCMessage(S: String): Integer;
   {expect following tables to be open tblMessage}
begin
      TCData.tblMessage.Append;
      TCData.tblMessageSDescription.Value := S;
      TCData.tblMessage.Post;
      WriteTCMessage := TCData.tblMessageWMessageID.Value;
end;

Function ChangeTotals(Ammount: Currency;AccountID: Integer): Boolean;
   {expect following tables to be open TCTotal, tblAccount}
begin
    ChangeTotals := False;
    TCData.TCTotal.DisableControls;
    TCData.TcTotal.First;
    while not TCData.TcTotal.EOF do
    begin
      If (TCData.TCTotalWAccountID.Value = AccountID) and (TCData.TCTotalWPeriodID.Value = PeriodID) and (TCData.TCTotalBActual.Value = true) then
      begin
        TCData.TCTotal.Edit;
        TCData.TCTotalFAmount.Value := TCData.TCTotalFAmount.Value + Ammount;
        TCData.TCTotal.Post;
        ChangeTotals := True;
        break;
      end;
      TCData.TCTotal.Next;
    end;

    If PeriodID < 14 then
    begin
      TCData.TcTotal.First;
      while not TCData.TcTotal.EOF do
      begin
        If (TCData.TCTotalWAccountID.Value = AccountID) and (TCData.TCTotalWPeriodID.Value = 0) and (TCData.TCTotalBActual.Value = true) then
        begin
          TCData.TCTotal.Edit;
          TCData.TCTotalFAmount.Value := TCData.TCTotalFAmount.Value + Ammount;
          TCData.TCTotal.Post;
          break;
        end;
        TCData.TCTotal.Next;
      end;
    end;

    If Dataform2.IniFile.ReadString ('TCSetup', 'TCDebCntrlAccID', '') <> '' then
    begin
      TCData.tblAccount.Locate('WAccountID',InttoStr(AccountID),[]);
      If TCData.tblAccountWAccountTypeID.Value = 1 then
      begin
        TCData.TcTotal.First;
        while not TCData.TcTotal.EOF do
        begin
          If (TCData.TCTotalWAccountID.Value = StrtoInt(Dataform2.IniFile.ReadString ('TCSetup', 'TCDebCntrlAccID', ''))) and (TCData.TCTotalWPeriodID.Value = PeriodID) and (TCData.TCTotalBActual.Value = true) then
          begin
            TCData.TCTotal.Edit;
            TCData.TCTotalFAmount.Value := TCData.TCTotalFAmount.Value + Ammount;
            TCData.TCTotal.Post;
            break;
          end;
          TCData.TCTotal.Next;
        end;
        If PeriodID < 14 then
        begin
          TCData.TcTotal.First;
          while not TCData.TcTotal.EOF do
          begin
            If (TCData.TCTotalWAccountID.Value = StrtoInt(Dataform2.IniFile.ReadString ('TCSetup', 'TCDebCntrlAccID', ''))) and (TCData.TCTotalWPeriodID.Value = 0) and (TCData.TCTotalBActual.Value = true) then
            begin
              TCData.TCTotal.Edit;
              TCData.TCTotalFAmount.Value := TCData.TCTotalFAmount.Value + Ammount;
              TCData.TCTotal.Post;
              break;
            end;
            TCData.TCTotal.Next;
          end;
        end;
      end;
    end;

    If Dataform2.IniFile.ReadString ('TCSetup', 'TCCrdCntrlAccID', '') <> '' then
    begin
      TCData.tblAccount.Locate('WAccountID',InttoStr(AccountID),[]);
      If TCData.tblAccountWAccountTypeID.Value = 2 then
      begin
        TCData.TcTotal.First;
        while not TCData.TcTotal.EOF do
        begin
          If (TCData.TCTotalWAccountID.Value = StrtoInt(Dataform2.IniFile.ReadString ('TCSetup', 'TCCrdCntrlAccID', ''))) and (TCData.TCTotalWPeriodID.Value = PeriodID) and (TCData.TCTotalBActual.Value = true) then
          begin
            TCData.TCTotal.Edit;
            TCData.TCTotalFAmount.Value := TCData.TCTotalFAmount.Value + Ammount;
            TCData.TCTotal.Post;
            break;
          end;
          TCData.TCTotal.Next;
        end;
        If PeriodID < 14 then
        begin
          TCData.TCTotal.DisableControls;
          TCData.TcTotal.First;
          while not TCData.TcTotal.EOF do
          begin
            If (TCData.TCTotalWAccountID.Value = StrtoInt(Dataform2.IniFile.ReadString ('TCSetup', 'TCCrdCntrlAccID', ''))) and (TCData.TCTotalWPeriodID.Value = 0) and (TCData.TCTotalBActual.Value = true) then
            begin
              TCData.TCTotal.Edit;
              TCData.TCTotalFAmount.Value := TCData.TCTotalFAmount.Value + Ammount;
              TCData.TCTotal.Post;
              break;
            end;
            TCData.TCTotal.Next;
          end;
        end;
      end;
    end;
    TCData.TCTotal.EnableControls;
end;

procedure CreateTCCreditor();
var
    i: Integer;
begin
    TCData.tblAccount.Insert;
    TCData.tblAccountSDescription.Value := DataForm2.InvoiceTableClientName.Value;
    TCData.tblAccountWAccountTypeID.Value := 2;
    TCData.tblAccountWReportingGroup1ID.Value := 0;
    TCData.tblAccountWReportingGroup2ID.Value := 0;
    TCData.tblAccountDSysDate.Value := now;
    If Dataform2.InvoiceTableGLDebNo.Value = '' then
    begin
      TCData.tblAccountSAccountCode.Value := 'C' + Trimspaces(Uppercase(Copy(DataForm2.InvoiceTableClientName.Value,1,2))) + InttoStr(TCData.tblAccountWAccountID.Value);
      Dataform2.InvoiceTable.Edit;
      Dataform2.InvoiceTableGLDebNo.Value := TCData.tblAccountSAccountCode.Value;
      Dataform2.InvoiceTable.Post;
    end
    else
      TCData.tblAccountSAccountCode.Value := Dataform2.InvoiceTableGLDebNo.Value;
    TCData.tblAccountSMainAccountCode.Value := Copy(TCData.tblAccountSAccountCode.Value,1,3);
    TCData.tblAccountSSubAccountCode.Value := Copy(TCData.tblAccountSAccountCode.Value,4,6);
    TCData.tblAccount.Post;
    TCData.creditordetail.Insert;
    TCData.creditordetailWAccountID.Value := TCData.tblAccountWAccountID.Value;
    TCData.creditordetailSPostal1.Value := DataForm2.InvoiceTableClientAdr1.Value;
    TCData.creditordetailSPostal2.Value := DataForm2.InvoiceTableClientAdr2.Value;
    TCData.creditordetailSPostal3.Value := dataform2.InvoiceTableClientAdr3.Value;
    TCData.creditordetailSPostalCode.Value := Dataform2.InvoiceTableClientPCode.Value;
    TCData.creditordetailSTelephone1.Value := Dataform2.InvoiceTableClientTelW.Value;
    TCData.creditordetailSTelephone2.Value := Dataform2.InvoiceTableClientTelC.Value;
    TCData.creditordetailSEmail.Value := dataform2.InvoiceTableClientEMail.Value;
    TCData.creditordetailSReference.Value := Dataform2.InvoiceTableClientVatNo.Value;
    TCData.creditordetail.Post;
    for i := 0 to 26 do
    begin
      TCData.TCTotal.Insert;
      TCData.TCTotalWAccountID.Value := TCData.tblAccountWAccountID.Value;
      TCData.TCTotalWPeriodID.Value := i;
      TCData.TCTotalBActual.Value := True;
      TCData.TCTotalFAmount.Value := 0.00;
      TCData.TCTotal.Post;
    end;
    TCData.TCTotal.Insert;
    TCData.TCTotalWAccountID.Value := TCData.tblAccountWAccountID.Value;
    TCData.TCTotalWPeriodID.Value := 0;
    TCData.TCTotalBActual.Value := False;
    TCData.TCTotalFAmount.Value := 0.00;
    TCData.TCTotal.Post;
    for i := 14 to 26 do
    begin
      TCData.TCTotal.Insert;
      TCData.TCTotalWAccountID.Value := TCData.tblAccountWAccountID.Value;
      TCData.TCTotalWPeriodID.Value := i;
      TCData.TCTotalBActual.Value := False;
      TCData.TCTotalFAmount.Value := 0.00;
      TCData.TCTotal.Post;
    end;
//    DataForm2.tblGlobal.Close;
end;

procedure CreateTCStock();
begin
          TCData.TCStockTable.Insert;
          If DataForm2.PurchaseItemTableTCStockNo.Value <> '' then
            TCData.TCStockTable.FieldByName('SStockCode').AsString := Dataform2.PurchaseItemTableTCStockNo.Value
          else
            TCData.TCStockTable.FieldByName('SStockCode').AsString := InttoStr(Dataform2.PurchaseItemTableStockNo.Value);
          TCData.TCStockTable.FieldByName('SBarCodeNumber').AsString := DataForm2.PurchaseItemTableBarcode.Value;
          TCData.TCStockTable.FieldByName('SDescription').AsString := DataForm2.PurchaseItemTableDescription.Value + ' (' + DataForm2.PurchaseItemTableModelNo.Value + ')';
          TCData.TCStockTable.FieldByName('WReportingGroup1ID').AsInteger := 0;
          TCData.TCStockTable.FieldByName('WReportingGroup2ID').AsInteger := 0;
          TCData.TCStockTable.FieldByName('WCostAccountID').AsInteger := DataForm2.IniFile.ReadInteger('TCSetup', 'TCCostofSalesId', 0);
          TCData.TCStockTable.FieldByName('WInputTaxID').asInteger := DataForm2.IniFile.ReadInteger('TCSetup', 'TCInputTaxId', 0);
          TCData.TCStockTable.FieldByName('WOutputTaxID').asInteger := DataForm2.IniFile.ReadInteger('TCSetup', 'TCTaxId', 0);
          TCData.TCStockTable.FieldByName('FOpeningQty').AsFloat := 0;
          TCData.TCStockTable.Fieldbyname('FQtyOnHand').AsFloat := 0;
          TCData.TCStockTable.FieldByName('FInvQtyOnHand').AsFloat := 0;
          TCData.TCStockTable.FieldByName('FReorderQty').AsFloat := 0;
          TCData.TCStockTable.FieldByName('WSalesAccountID').asInteger := DataForm2.IniFile.ReadInteger('TCSetup', 'TCSalesAccountId', 0);
          TCData.TCStockTable.FieldByName('WStockAccountID').asInteger := DataForm2.IniFile.ReadInteger('TCSetup', 'TCStockControlId', 0);
          TCData.TCStockTable.FieldByName('FSellingPrice1').AsFloat := Dataform2.PurchaseItemTablePrice.Value * 100 / 114;
          TCData.TCStockTable.FieldByName('FSellingPrice2').AsFloat := dataform2.PurchaseItemTablePrice2.Value * 100 / 114;
          TCData.TCStockTable.FieldByName('FSellingPrice3').AsFloat := 0;
          TCData.TCStockTable.FieldByName('FUnitAveCost').AsFloat := 0;
          TCData.TCStockTable.FieldByName('FUnitCost').AsFloat := 0;
          TCData.TCStockTable.FieldByName('WUnitID').AsInteger := 0;
          TCData.TCStockTable.FieldByName('WStockTypeID').asInteger := 0;
          TCData.TCStockTable.FieldByName('SExtraDesc').AsString := Dataform2.PurchaseItemTableExtraDescr.Value;
          TCData.TCStockTable.Post;
          TCData.TCStockTable.Refresh;
          If Dataform2.PurchaseItemTableTCStockNo.Value <> TCData.TCStockTable.FieldByName('SStockCode').AsString then
          begin
            Dataform2.PurchaseItemTable.Edit;
            Dataform2.PurchaseItemTableTCStockNo.Value := TCData.TCStockTable.FieldByName('SStockCode').AsString;
            DataForm2.PurchaseItemTable.Post;
          end;
end;

function CreateUnpostedInvoice(LastDocNo: String; InvDateStr: TDateTime): Boolean;
var
    SellingPrice: Currency;
    LastDocID,i: Integer;
    Fault: Boolean;
    TCDebtorCode: String;
begin
               CreateUnpostedInvoice := True;
               Total := 0 ;
               TotalTax  := 0 ;

               TCData.TCQuery2.Close;
               with TCData.TCQuery2.SQL do
               begin
                 Clear;
                 Add('select SDocNo from DocHead.DB');
                 Add('where SDocNo = "' + LastDocNo + '"');
               end;
               TCData.TCQuery2.Open;
               If TCData.TCQuery2.RecordCount > 0 then
               begin
                 ExtractForm.Memo1.Lines.Add('"' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + '/' + InttoStr(DataForm2.InvoiceTable.FieldbyName('InvNo').asInteger) + '","Inv already exist in Turbocash, Invoice skipped","' + Dataform2.InvoiceTable.Fieldbyname('InvBy').asString + '"');
                 CreateUnpostedInvoice := False;
                 Exit;
               end;
               TCData.TCQuery2.Close;

               DataForm2.Query2.Close;
               with DataForm2.Query2.SQL do begin
                 Clear;
                 Add('SELECT SUM(Round(Price * Qty,2) - (Round(Price * Qty,2) * (Discount / 100))) as Total FROM invoiceitem_db');
                 Add('where LinkID = ' + InttoStr(DataForm2.InvoiceTableNr.Value));
                 Add('and BranchNo = ' + InttoStr(DataForm2.InvoiceTableBranchNo.Value));
               end;
               DataForm2.Query2.Open;

               If Floattostrf(Dataform2.Query2.FieldByName('Total').asFloat,ffFixed,17,2) <> FloattoStrF(Dataform2.InvoiceTableInvTotal.Value,ffFixed,17,2) then
               begin
//                 showmessage('1 ' + Floattostrf(Dataform2.Query2.FieldByName('Total').asFloat,ffFixed,17,2) + '==' + FloattoStrF(Dataform2.InvoiceTableInvTotal.Value,ffFixed,17,2));
                 ExtractForm.Memo1.Lines.Add('"' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + '/' + InttoStr(DataForm2.InvoiceTable.FieldbyName('InvNo').asInteger) + '","Inv Items don''t balance, Invoice skipped","' + Dataform2.InvoiceTable.Fieldbyname('InvBy').asString + '"');
                 CreateUnpostedInvoice := False;
                 Exit;
               end;
               Dataform2.Query2.Close;

               If not TCData.tblUser.Locate('SUserName', Dataform2.InvoiceTable.Fieldbyname('InvBy').asString, []) then
               begin
                 ExtractForm.Memo1.Lines.Add('"' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + '/' + InttoStr(DataForm2.InvoiceTable.FieldbyName('InvNo').asInteger) + '","TC User Not Found, Invoice skipped","' + Dataform2.InvoiceTable.Fieldbyname('InvBy').asString + '"');
                 CreateUnpostedInvoice := False;
                 Exit;
               end;

               If Dataform2.InvoiceTableInvClose.Value <> 'LaybC' then
               begin
                 if DataForm2.InvoiceTable.Fieldbyname('GLDebNo').asString = Dataform2.GlobalTableTCCashDebNo.Value then
                 begin
                   TCDebtorCode := DataForm2.InvoiceTable.Fieldbyname('GLDebNo').asString;
                 end
                 else
                 begin
                   Dataform2.Query4.Close;
                   with Dataform2.Query4.SQL do
                   begin
                     Clear;
                     Add('select TCNo from accounts_db');
                     Add('where BranchNo = ' + copy(Dataform2.InvoiceTableGLDebNo.Value,1,i-1));
                     Add('and AccNo = ' + copy(Dataform2.InvoiceTableGLDebNo.Value,i+1,Length(Dataform2.InvoiceTableGLDebNo.Value)-(i)));
                     Add('and AccType = 1');
                   end;
                   Dataform2.Query4.Open;
                   TCDebtorCode := Dataform2.Query4.FieldByName('TCNo').asString;
                   Dataform2.Query4.Close;
                 end;
                 TCData.TCQuery2.Close;
                 with TCData.TCQuery2.SQL do
                 begin
                   Clear;
                   Add('select WAccountID from Account.DB');
                   Add('where SAccountCode = "' + TCDebtorCode + '"');
                   Add('and (WAccountTypeID = 1)');
                 end;
                 TCData.TCQuery2.Open;
                 If TCData.TCQuery2.RecordCount > 0 then
                 begin
                   If not TCData.tblAccount.Locate('WAccountID', InttoStr(TCData.TCQuery2.FieldbyName('WAccountID').AsInteger), []) then
                   begin
                     ExtractForm.Memo1.Lines.Add('"' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + '/' + InttoStr(DataForm2.InvoiceTable.FieldbyName('InvNo').asInteger) + '","TC Account Not Found!, Invoice skipped","' + Dataform2.InvoiceTable.Fieldbyname('InvBy').asString + '"');
                     CreateUnpostedInvoice := False;
                     Exit;
                   end;
                 end
                 else
                 begin
                   ExtractForm.Memo1.Lines.Add('"' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + '/' + InttoStr(DataForm2.InvoiceTable.FieldbyName('InvNo').asInteger) + '","TC Account Not Found!, Invoice skipped","' + Dataform2.InvoiceTable.Fieldbyname('InvBy').asString + '"');
                   CreateUnpostedInvoice := False;
                   Exit;
                 end;
                 TCData.TCQuery2.Close;
               end
               else
               begin
                 if Dataform2.IniFile.ReadString ('TCSetup', 'TCLayBuyDebAccNo', '') <> '' then
                 begin
                   If not TCData.tblAccount.Locate('WAccountID', Dataform2.IniFile.ReadString ('TCSetup', 'TCLayBuyDebAccNo', ''), []) then
                   begin
                     ExtractForm.Memo1.Lines.Add('"' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + '/' + InttoStr(DataForm2.InvoiceTable.FieldbyName('InvNo').asInteger) + '","TC Account Not Found!, Invoice skipped","' + Dataform2.InvoiceTable.Fieldbyname('InvBy').asString + '"');
                     CreateUnpostedInvoice := False;
                     Exit;
                   end;
                 end
                 else
                 begin
                     ExtractForm.Memo1.Lines.Add('"' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + '/' + InttoStr(DataForm2.InvoiceTable.FieldbyName('InvNo').asInteger) + '","TC Lay Buy Account ID Not Correct!, Invoice skipped go into setup and fix","' + Dataform2.InvoiceTable.Fieldbyname('InvBy').asString + '"');
                     CreateUnpostedInvoice := False;
                     Exit;
                 end;
               end;

               If not TCData.tblGroups.Locate('SDescription', Dataform2.InvoiceTable.Fieldbyname('InvBy').asString, []) then
               begin
                 ExtractForm.Memo1.Lines.Add('"' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + '/' + InttoStr(DataForm2.InvoiceTable.FieldbyName('InvNo').asInteger) + '","TC Sales Man Not Found!, Invoice skipped","' + Dataform2.InvoiceTable.Fieldbyname('InvBy').asString + '"');
                 CreateUnpostedInvoice := False;
                 Exit;
               end;

               Fault := False;

               MyCurrentUser := TCData.tblUser.FieldbyName('WUserID').asInteger;
//               LastDocNo := ;
//               LastDocNo := 'N' + InttoStr(Dataform2.InvoiceTable.Fieldbyname('InvNo').asInteger);
               TCData.tblDocHeader.Append;
               TCData.tblDocHeaderWUserID.Value := MyCurrentUser;
               TCData.tblDocHeaderSDocNo.Value := LastDocNo;
               TCData.tblDocHeaderWTypeID.Value := 10;
               LastDocID := TCData.tblDocHeaderWDocID.Value;
               TCData.tblDocHeaderWAccountID.Value := TCData.tblAccount.Fieldbyname('WAccountID').asInteger;
               TCData.tblDocHeaderWPaymentTypeID.Value := PosPymtCode(Dataform2.InvoiceTable.Fieldbyname('InvoiceType').asString);
               TCData.tblDocHeaderWSourceTypeID.Value := 0; {From Point of Sales Screen}
               TCData.tblDocHeaderBPrinted.Value := False;
               TCData.tblDocHeaderBPosted.Value := False;
               TCData.tblDocHeaderBRepeating.Value := False;
               TCData.tblDocHeaderWSalesManID.Value := TCData.tblGroups.FieldbyName('WGroupID').asInteger;
               TCData.tblDocHeaderWCurrencyID.Value := 0;
               If DataForm2.InvoiceTableClientAdr1.Value <> '' then
                 TCData.tblDocHeaderWPostal1ID.Value := WriteTCMessage(DataForm2.InvoiceTableClientAdr1.Value)
               else
                 TCData.tblDocHeaderWPostal1ID.Value := 0;
               If DataForm2.InvoiceTableClientAdr2.Value <> '' then
                 TCData.tblDocHeaderWPostal2ID.Value := WriteTCMessage(DataForm2.InvoiceTableClientAdr2.Value)
               else
                 TCData.tblDocHeaderWPostal2ID.Value := 0;
               If DataForm2.InvoiceTableClientAdr3.Value <> '' then
                 TCData.tblDocHeaderWPostal3ID.Value := WriteTCMessage(DataForm2.InvoiceTableClientAdr3.Value)
               else
                 TCData.tblDocHeaderWPostal3ID.Value := 0;
               If DataForm2.InvoiceTableClientPCode.Value <> '' then
                 TCData.tblDocHeaderWPostalCodeID.Value := WriteTCMessage(DataForm2.InvoiceTableClientPCode.Value)
               else
                 TCData.tblDocHeaderWPostalCodeID.Value := 0;
               TCData.tblDocHeaderWDelAddress1ID.Value := 0;
               TCData.tblDocHeaderWDelAddress2ID.Value := 0;
               TCData.tblDocHeaderWDelAddress3ID.Value := 0;
               TCData.tblDocHeaderWDelCodeID.Value := 0;
               TCData.tblDocHeaderSReference.Value := Dataform2.InvoiceTableRefNo.Value;
               If DataForm2.InvoiceTableClientName.Value <> '' then
                 TCData.tblDocHeaderWMessage1ID.Value := WriteTCMessage(DataForm2.InvoiceTableClientName.Value)
               else
                 TCData.tblDocHeaderWMessage1ID.Value := 0;
               If DataForm2.InvoiceTableClientTelC.Value <> '' then
                 TCData.tblDocHeaderWMessage2ID.Value := WriteTCMessage(DataForm2.InvoiceTableClientTelC.Value)
               else
                 TCData.tblDocHeaderWMessage2ID.Value := 0;
               If DataForm2.InvoiceTableClientEMail.Value <> '' then
                 TCData.tblDocHeaderWMessage3ID.Value := WriteTCMessage(DataForm2.InvoiceTableClientEMail.Value)
               else
                 TCData.tblDocHeaderWMessage3ID.Value := 0;

               TCData.tblDocHeaderDDate.Value := InvDateStr;
               TCData.tblDocHeaderDAllocatedDate.Value := InvDateStr;

               TCData.tblDocHeader.Post;

  {Post Invoice Llines}
               Dataform2.InvoiceItemTable.Close;
               with Dataform2.InvoiceItemTable.SQL do
               begin
                 Clear;
                 Add('select * from invoiceitem_db');
                 Add('where LinkID = ' + InttoStr(Dataform2.InvoiceTableNr.Value));
                 Add('and BranchNo = ' + InttoStr(Dataform2.InvoiceTableBranchNo.Value));
               end;
               Dataform2.InvoiceItemTable.Open;
               InvLine := 1;
               DataForm2.InvoiceItemTable.First;
               while not DataForm2.InvoiceItemTable.EOF do
               begin
                 if not TCData.TCStockTable.Locate('SStockCode', Dataform2.InvoiceItemTableTCStockNo.Value,[]) then
                 begin
                   if not Dataform2.StockTable.Locate('TCStockNo;BranchNo', VarArrayOf([DataForm2.InvoiceItemTable.FieldbyName('TCStockNo').asString,0]),[]) then
                   begin
                     ExtractForm.Memo1.Lines.Add('"' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + '/' + InttoStr(DataForm2.InvoiceTable.FieldbyName('InvNo').asInteger) + '","Can''t find stock item!, Invoice skipped: TC Stock No ' + Dataform2.InvoiceItemTableTCStockNo.Value + '","' + Dataform2.InvoiceTable.Fieldbyname('InvBy').asString + '",' + FloattoStrF(Dataform2.InvoiceTableInvTotal.Value,ffFixed,17,2) + ',' + InttoStr(Dataform2.InvoiceTableInvDate.Value));
                     Fault := True;
                   end
                   else
                   begin
                     if not TCData.TCStockTable.Locate('SStockCode', Dataform2.StockTableTCStockNo.Value,[]) then
                     begin
                       ExtractForm.Memo1.Lines.Add('"' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + '/' + InttoStr(DataForm2.InvoiceTable.FieldbyName('InvNo').asInteger) + '","Can''t find stock item!, Invoice skipped: TC Stock No ' + Dataform2.InvoiceItemTableTCStockNo.Value + '","' + Dataform2.InvoiceTable.Fieldbyname('InvBy').asString + '",' + FloattoStrF(Dataform2.InvoiceTableInvTotal.Value,ffFixed,17,2) + ',' + InttoStr(Dataform2.InvoiceTableInvDate.Value));
                       Fault := True;
                     end;
                   end;
                 end;
                 TCData.tblDocLine.Append;
                 TCData.tblDocLineWDocID.Value := LastDocID;
                 TCData.tblDocLineWDocLineID.Value := InvLine;
                 Inc(InvLine);
                 TCData.tblDocLineWStockID.Value := TCData.TCStockTable.FieldByName('WStockID').asInteger;
                 TCData.tblDocLineWLineTypeID.Value := 94; // Stock Item
                 TCData.tblDocLineWDescriptionID.Value := WriteTCMessage(Dataform2.InvoiceItemTableDescription.Value);
                 TCData.tblDocLineFQtyOrdered.Value := DataForm2.InvoiceItemTable.FieldbyName('Qty').asFloat;
                 TCData.tblDocLineFQtyShipped.Value := DataForm2.InvoiceItemTable.FieldbyName('Qty').asFloat;

                 SellingPrice := DataForm2.InvoiceItemTable.FieldbyName('Price').AsCurrency * Dataform2.InvoiceItemTable.FieldByName('Qty').AsFloat;

                 TCData.tblDocLineFSellingPrice.Value := DataForm2.InvoiceItemTable.FieldbyName('Price').AsCurrency;
                 TCData.tblDocLineFItemDiscount.Value := DataForm2.InvoiceItemTable.FieldbyName('Discount').asFloat;
                 TCData.tblDocLineWtaxID.Value:= DataForm2.IniFile.ReadInteger('TCSetup', 'TCTaxId', 0);
    {}
                 TCData.tblDocLineFInclusiveAmt.Value := MyRoundTo(SellingPrice - (SellingPrice * DataForm2.InvoiceItemTable.FieldbyName('Discount').asFloat / 100),-2);
//                 TCData.tblDocLineFInclusiveAmt.Value := MyRoundTo(DataForm2.InvoiceItemTable.FieldbyName('SellingPrice').AsFloat - (DataForm2.InvoiceItemTable.FieldbyName('SellingPrice').AsFloat * DataForm2.InvoiceItemTable.FieldbyName('Discount').asFloat / 100),-2);
                 TCData.tblDocLineFExclusiveAmt.Value := MyRoundTo(TCData.tblDocLineFInclusiveAmt.Value * 100 / (Dataform2.GlobalTableVat.Value + 100),-2);
//                 TCData.tblDocLineFExclusiveAmt.Value := TCData.tblDocLineFInclusiveAmt.Value * 100 / (Dataform2.GlobalTableVat.Value + 100);


//                 Discount := DataForm2.tblDocLineFInclusiveAmt.Value * Dataform2.InvoiceItemTableDiscount.Value / 100;
                 Total := Total + (TCData.tblDocLineFInclusiveAmt.Value);

//                 ExtractForm.Memo1.Lines.Add('"' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + '/' + InttoStr(DataForm2.InvoiceTable.FieldbyName('InvNo').asInteger) + '","Inv Items' + Floattostr(TCData.tblDocLineFInclusiveAmt.Value) + ',' + Floattostr(Total) + ',' + FloattoStr(MyRoundTo(DataForm2.InvoiceItemTable.FieldbyName('SellingPrice').asFloat - (DataForm2.InvoiceItemTable.FieldbyName('SellingPrice').asFloat * DataForm2.InvoiceItemTable.FieldbyName('Discount').asFloat / 100),-2)) + '","' + Dataform2.InvoiceTable.Fieldbyname('InvBy').asString + '"');

                 TotalTax  := TotalTax + (TCData.tblDocLineFInclusiveAmt.Value - TCData.tblDocLineFExclusiveAmt.Value);
    {}
                 TCData.tblDocLineFTaxAmount.Value := TCData.tblDocLineFInclusiveAmt.Value - TCData.tblDocLineFExclusiveAmt.Value;
                 TCData.tblDocLine.Post;
                 DataForm2.InvoiceItemTable.Next;
               end;

//               If Floattostr(MyRoundTo(Total,-2)) <> FloattoStr(Dataform2.InvoiceTableInvTotal.Value) then
//               If MyRoundTo(Total,-2) <> MyRoundTo(Dataform2.InvoiceTableInvTotal.Value,-2) then
//               begin
//                 showmessage('2 ' + Floattostr(MyRoundTo(Total,-2)) + '==' + FloattoStr(Dataform2.InvoiceTableInvTotal.Value));
//                 ExtractForm.Memo1.Lines.Add('"' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + '/' + InttoStr(DataForm2.InvoiceTable.FieldbyName('InvNo').asInteger) + '","Inv Items don''t balance, Invoice skipped' + Floattostr(MyRoundTo(Total,-2)) + ',' + FloattoStr(Dataform2.InvoiceTableInvTotal.Value) + '","' + Dataform2.InvoiceTable.Fieldbyname('InvBy').asString + '"');
//                 Fault := True;
//               end;
//               Dataform2.Query2.Close;

               TCData.tblDocHeader.edit ;
               TCData.tblDocHeaderFDocAmount.AsCurrency :=  Total;
               TCData.tblDocHeaderFTaxAmount.AsCurrency :=  TotalTax;
               TCData.tblDocHeaderdSysdate.asdatetime := now;
               TCData.tblDocHeader.post ;

               If Fault = True then
               begin
                 with TCData.TCQuery.SQL do
                 begin
                   clear;
                   Add('delete from DocLine.DB');
                   Add('where WDocID = ' + InttoStr(LastDocID));
                 end;
                 TCData.TCQuery.ExecSQL;
                 with TCData.TCQuery.SQL do
                 begin
                   clear;
                   Add('delete from DocHead.DB');
                   Add('where WDocID = ' + InttoStr(LastDocID));
                 end;
                 TCData.TCQuery.ExecSQL;
                 CreateUnpostedInvoice := False;
                 Exit;
               end;

               Dataform2.InvoiceTable.Edit;
               DataForm2.InvoiceTableShiftSet.Value := LastDocNo;
               DataForm2.InvoiceTable.Post;
end;

Function PosPymtCode(PMTSTR:STRING):Integer;
begin
   if PMTSTR = 'Cash' then
     Result := 16
   else
   begin
     if PMTSTR = 'CreditCard' then
       Result := 8
     else
       Result := 1;
   end;
end;

procedure BatConPost();
   {expect following tables to be open TCBatCon, TCBatTypes}
begin
      TCData.TCBatCon.Insert;
      TCData.TCBatConWBatchID.Value := BatchID;
      TCData.TCBatConWUserID.Value := MyCurrentUser;
      TCData.TCBatConWBatchTypeID.Value := StrtoInt(DataForm2.IniFile.ReadString('TCSetup', 'TCBatchTypeId', ''));
      TCData.TCBatConSBatchNumber.Value := 'TPOS' + InttoStr(BatchID);
      TCData.TCBatConBPosted.Value := True;
      TCData.TCBatConBImported.Value := True;
      TCData.TCBatConBDocSource.Value := False;
      TCData.TCBatConWLineCount.Value := BatchLineCount;
      TCData.TCBatConSFilename.Value := 'FileName' + InttoStr(BatchID);
      TCData.TCBatConWDocID.Value := 0;
      TCData.TCBatConDSysDate.Value := now;
      TCData.TCBatTypes.Locate('WBatchTypeID', DataForm2.IniFile.ReadString('TCSetup', 'TCBatchTypeId', ''), []);
      TCData.TCBatConSAlias.Value := TCData.TCBatTypesSDescription.Value;
      TCData.TCBatConSUniqueID.Value := 'Un' + InttoStr(BatchID);
      TCData.TCBatCon.FieldByName('WInitBatID').AsInteger := BatchID;
      TCData.TCBatCon.Post;
end;

procedure UpdateBatchID();
var
  i : Integer ;
  TryAgain : Boolean ;
begin
  TryAgain := true ;
  i := 0 ;
  While TryAgain do
  begin
      try
      TryAgain := false ;
      TCData.tblGlobal.close;
      TCData.tblGlobal.Open;
      TCData.tblGlobal.Edit;

      except
        inc(i);
        if i < 5 then
        TryAgain := true else
        raise;
        sleep(100);
      end;
  end;
  BatchID := TCData.tblGlobalWNewBatchID.Value;
//  Dataform2.TCBatCon.FieldByName('WInitBatID').AsInteger := Dataform2.TCBatConWBatchID.AsInteger;
  TCData.tblGlobalWNewBatchID.Value := TCData.tblGlobalWNewBatchID.Value + 1;
  TCData.tblGlobal.Post;
  TCData.tblGlobal.Close;
end;

procedure TCPostTransaction(Ref, Acc: String; transDate: TDateTime; Ammount: Currency);
      {expect following tables to be open TCTransAct}
begin
      If DataForm2.IniFile.ReadString('TCSetup', 'TCDateFormat', '') <> '' then
      begin
        ShortDateFormat := DataForm2.IniFile.ReadString('TCSetup', 'TCDateFormat', '');
      end;
      TCData.TCTransAct.Insert;
      TCData.TCTransActWBatchID.Value := BatchID;
      TCData.TCTransActWBatchTypeID.Value := StrtoInt(DataForm2.IniFile.ReadString('TCSetup', 'TCBatchTypeId', ''));

      // Kry Line ID van BatchTypeDb ReceiptID

      TCData.TCTransActWLineID.Value := 2;
      TCData.TCTransActDDate.Value := transDate;
      TCData.TCTransActWPeriodID.Value := PeriodID;
      TCData.TCTransActSReference.Value := Ref;
      If Ref = '********' then
      begin
        TCData.TCTransActWAccountID.Value := StrtoInt(Dataform2.IniFile.ReadString ('TCSetup', 'TCBankNo', ''));
        TCData.TCTransActFAmount.Value := Ammount;
        TCData.TCTransActFOutstandingAmount.Value := Ammount;
        If ChangeTotals(Ammount, TCData.TCTransActWAccountID.Value) = False then
          showmessage('Ammount not added to Account Totals');
      end
      else
      begin
        TCData.TCTransActWAccountID.Value := StrtoInt(Acc);
        TCData.TCTransActFAmount.Value := Ammount * -1;
        TCData.TCTransActFOutstandingAmount.Value := Ammount * -1;
        If ChangeTotals(Ammount * -1, TCData.TCTransActWAccountID.Value) = False then
          showmessage('Ammount not added to Account Totals');
      end;
      TCData.TCTransActWBalancingAccountID.Value := StrtoInt(DataForm2.IniFile.ReadString('TCSetup', 'TCBankNo', ''));
      If Ref = '********' then
        TCData.TCTransActWDescriptionID.Value := WriteTCMessage('Batch ' + Datetostr(transDate) + '-' + InttoStr(BatchID))
      else
        TCData.TCTransActWDescriptionID.Value := WriteTCMessage(Ref);
      TCData.TCTransActWUserID.Value := MyCurrentUser;
      TCData.TCTransAct.Post;
      ShortDateFormat := 'yyyy/MM/dd';
end;

function CreateUnpostedPurcInvoice(LastDocNo: String; InvDateStr: TDateTime): Boolean;
var
    LastDocID, GroupIDStr: Integer;
    Fault: Boolean;
begin
               CreateUnpostedPurcInvoice := True;
               Total := 0 ;
               TotalTax  := 0 ;

{               DataForm2.Query2.Close;
               with DataForm2.Query2.SQL do begin
                 Clear;
                 Add('SELECT SUM(Round(Price * Qty,2) - (Round(Price * Qty,2))) as Total FROM invoiceitem_db');
                 Add('where LinkID = ' + InttoStr(DataForm2.InvoiceTableNr.Value));
               end;
               DataForm2.Query2.Open;

               If Floattostrf(Dataform2.Query2.FieldByName('Total').asFloat,ffFixed,17,2) <> FloattoStrF(Dataform2.InvoiceTableInvTotal.Value,ffFixed,17,2) then
               begin
                 ExtractForm.Memo1.Lines.Add('"' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + '/' + InttoStr(DataForm2.InvoiceTable.FieldbyName('InvNo').asInteger) + '","Inv Items don''t balance, Invoice skipped","' + Dataform2.InvoiceTable.Fieldbyname('InvBy').asString + '"');
                 CreateUnpostedPurcInvoice := False;
                 Exit;
               end;
               Dataform2.Query2.Close;
 }
               If not TCData.tblUser.Locate('SUserName', Dataform2.InvoiceTable.Fieldbyname('InvBy').asString, []) then
               begin
                 ExtractForm.Memo1.Lines.Add('"' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + '/' + InttoStr(DataForm2.InvoiceTable.FieldbyName('InvNo').asInteger) + '","TC User Not Found, Invoice skipped","' + Dataform2.InvoiceTable.Fieldbyname('InvBy').asString + '"');
                 CreateUnpostedPurcInvoice := False;
                 Exit;
               end;

               TCData.TCQuery2.Close;
               with TCData.TCQuery2.SQL do
               begin
                 Clear;
                 Add('select WAccountID from Account.DB');
                 Add('where SAccountCode = "' + DataForm2.InvoiceTable.Fieldbyname('GLDebNo').asString + '"');
                 Add('and (WAccountTypeID = 2)');
               end;
               TCData.TCQuery2.Open;
               If TCData.TCQuery2.RecordCount > 0 then
               begin
                 If not TCData.tblAccount.Locate('WAccountID', InttoStr(TCData.TCQuery2.FieldbyName('WAccountID').AsInteger), []) then
                 begin
                   ExtractForm.Memo1.Lines.Add('"' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + '/' + InttoStr(DataForm2.InvoiceTable.FieldbyName('InvNo').asInteger) + '","TC Account Not Found!, Invoice skipped","' + Dataform2.InvoiceTable.Fieldbyname('InvBy').asString + '"');
                   CreateUnpostedPurcInvoice := False;
                   Exit;
                 end;
               end
               else
               begin
                 ExtractForm.Memo1.Lines.Add('"' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + '/' + InttoStr(DataForm2.InvoiceTable.FieldbyName('InvNo').asInteger) + '","TC Account Not Found!, Invoice skipped","' + Dataform2.InvoiceTable.Fieldbyname('InvBy').asString + '"');
                 CreateUnpostedPurcInvoice := False;
                 Exit;
               end;
               TCData.TCQuery2.Close;

               If not TCData.tblGroups.Locate('SDescription', Dataform2.InvoiceTable.Fieldbyname('InvBy').asString, []) then
               begin
//                 ExtractForm.Memo1.Lines.Add('"' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + '/' + InttoStr(DataForm2.InvoiceTable.FieldbyName('InvNo').asInteger) + '","TC Sales Man Not Found!, Invoice skipped","' + Dataform2.InvoiceTable.Fieldbyname('InvBy').asString + '"');
//                 CreateUnpostedPurcInvoice := False;
//                 Exit;
                 GroupIDStr := 0;
               end
               else
                 GroupIDStr := TCData.tblGroups.FieldbyName('WGroupID').asInteger;

               Fault := False;

               MyCurrentUser := TCData.tblUser.FieldbyName('WUserID').asInteger;
//               LastDocNo := ;
//               LastDocNo := 'N' + InttoStr(Dataform2.InvoiceTable.Fieldbyname('InvNo').asInteger);
               TCData.tblDocHeader.Append;
               TCData.tblDocHeaderWUserID.Value := MyCurrentUser;
               TCData.tblDocHeaderSDocNo.Value := LastDocNo;
               TCData.tblDocHeaderWTypeID.Value :=12;
               LastDocID := TCData.tblDocHeaderWDocID.Value;
               TCData.tblDocHeaderWAccountID.Value := TCData.tblAccount.Fieldbyname('WAccountID').asInteger;
               TCData.tblDocHeaderWPaymentTypeID.Value := PosPymtCode(Dataform2.InvoiceTable.Fieldbyname('InvoiceType').asString);
               TCData.tblDocHeaderWSourceTypeID.Value := 0; {From Point of Sales Screen}
               TCData.tblDocHeaderBPrinted.Value := False;
               TCData.tblDocHeaderBPosted.Value := False;
               TCData.tblDocHeaderBRepeating.Value := False;
               TCData.tblDocHeaderWSalesManID.Value := GroupIDStr;
               TCData.tblDocHeaderWCurrencyID.Value := 0;
               If DataForm2.InvoiceTableClientAdr1.Value <> '' then
                 TCData.tblDocHeaderWPostal1ID.Value := WriteTCMessage(DataForm2.InvoiceTableClientAdr1.Value)
               else
                 TCData.tblDocHeaderWPostal1ID.Value := 0;
               If DataForm2.InvoiceTableClientAdr2.Value <> '' then
                 TCData.tblDocHeaderWPostal2ID.Value := WriteTCMessage(DataForm2.InvoiceTableClientAdr2.Value)
               else
                 TCData.tblDocHeaderWPostal2ID.Value := 0;
               If DataForm2.InvoiceTableClientAdr3.Value <> '' then
                 TCData.tblDocHeaderWPostal3ID.Value := WriteTCMessage(DataForm2.InvoiceTableClientAdr3.Value)
               else
                 TCData.tblDocHeaderWPostal3ID.Value := 0;
               If DataForm2.InvoiceTableClientPCode.Value <> '' then
                 TCData.tblDocHeaderWPostalCodeID.Value := WriteTCMessage(DataForm2.InvoiceTableClientPCode.Value)
               else
                 TCData.tblDocHeaderWPostalCodeID.Value := 0;
               TCData.tblDocHeaderWDelAddress1ID.Value := 0;
               TCData.tblDocHeaderWDelAddress2ID.Value := 0;
               TCData.tblDocHeaderWDelAddress3ID.Value := 0;
               TCData.tblDocHeaderWDelCodeID.Value := 0;
               TCData.tblDocHeaderSReference.Value := Dataform2.InvoiceTableRefNo.Value;
               If DataForm2.InvoiceTableClientName.Value <> '' then
                 TCData.tblDocHeaderWMessage1ID.Value := WriteTCMessage(DataForm2.InvoiceTableClientName.Value)
               else
                 TCData.tblDocHeaderWMessage1ID.Value := 0;
               If DataForm2.InvoiceTableClientTelC.Value <> '' then
                 TCData.tblDocHeaderWMessage2ID.Value := WriteTCMessage(DataForm2.InvoiceTableClientTelC.Value)
               else
                 TCData.tblDocHeaderWMessage2ID.Value := 0;
               If DataForm2.InvoiceTableClientEMail.Value <> '' then
                 TCData.tblDocHeaderWMessage3ID.Value := WriteTCMessage(DataForm2.InvoiceTableClientEMail.Value)
               else
                 TCData.tblDocHeaderWMessage3ID.Value := 0;

               TCData.tblDocHeaderDDate.Value := InvDateStr;
               TCData.tblDocHeaderDAllocatedDate.Value := InvDateStr;

               TCData.tblDocHeader.Post;

  {Post Invoice Llines}
               Dataform2.PurchaseItemTable.Close;
               with Dataform2.PurchaseItemTable.SQL do
               begin
                 Clear;
                 Add('select * from invoiceitem_db');
                 Add('where LinkID = ' + InttoStr(Dataform2.InvoiceTableNr.Value));
                 Add('and BranchNo = ' + InttoStr(Dataform2.InvoiceTableBranchNo.Value));
               end;
               Dataform2.PurchaseItemTable.Open;
               InvLine := 1;

               DataForm2.PurchaseItemTable.First;
               while not DataForm2.PurchaseItemTable.EOF do
               begin
                 Dataform2.Query4.Close;
                 with Dataform2.Query4.SQL do
                 begin
                   Clear;
                   Add('select Nr, TCStockNo from stock_db');
                   Add('where TCStockNo = "' + Dataform2.PurchaseItemTableTCStockNo.Value + '"');
                   Add('and BranchNo = ' + InttoStr(Dataform2.GlobalTableBranchNo.Value));
                 end;
                 Dataform2.Query4.Open;
                 If Dataform2.PurchaseItemTableTCStockNo.Value <> Dataform2.Query4.FieldByName('TCStockNo').Value then
                 begin
                   ExtractForm.Memo1.Lines.Add('"' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + '/' + InttoStr(DataForm2.InvoiceTable.FieldbyName('InvNo').asInteger) + '","Can''t find stock item!, Invoice skipped: Stock Descr ' + Dataform2.PurchaseItemTableDescription.Value + '","' + Dataform2.InvoiceTable.Fieldbyname('InvBy').asString + '"');
                   Fault := True;
                 end
                 else
                 begin
                   Dataform2.StockTable.Locate('TCStockNo', Dataform2.Query4.FieldByName('TCStockNo').asString, []);
                   if not TCData.TCStockTable.Locate('SStockCode', Dataform2.PurchaseItemTableTCStockNo.Value,[]) then
                   begin
                     CreateTCStock;
                   end
                   else
                     UpdateTCStockfromPurch();
                   If Dataform2.PurchaseItemTableTCStockNo.Value <> TCData.TCStockTableSStockCode.Value then
                   begin
                     ExtractForm.Memo1.Lines.Add('"' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + '/' + InttoStr(DataForm2.InvoiceTable.FieldbyName('InvNo').asInteger) + '","Can''t find TC stock item!, Invoice skipped: Stock Descr ' + Dataform2.PurchaseItemTableDescription.Value + '","' + Dataform2.InvoiceTable.Fieldbyname('InvBy').asString + '"');
                     Fault := True;
                   end;
                 end;
                 Dataform2.Query4.Close;
                 TCData.tblDocLine.Append;
                 TCData.tblDocLineWDocID.Value := LastDocID;
                 TCData.tblDocLineWDocLineID.Value := InvLine;
                 Inc(InvLine);
                 TCData.tblDocLineWStockID.Value := TCData.TCStockTable.FieldByName('WStockID').asInteger;
                 TCData.tblDocLineWLineTypeID.Value := 90; // Stock Item
                 TCData.tblDocLineWDescriptionID.Value := WriteTCMessage(Dataform2.PurchaseItemTableDescription.Value);
                 TCData.tblDocLineFQtyOrdered.Value := DataForm2.PurchaseItemTable.FieldbyName('Qty').asFloat;
                 TCData.tblDocLineFQtyShipped.Value := DataForm2.PurchaseItemTable.FieldbyName('Qty').asFloat;
                 TCData.tblDocLineFSellingPrice.AsCurrency := MyRoundTo(DataForm2.PurchaseItemTable.FieldbyName('CostPrice').asCurrency, -2);
                 TCData.tblDocLineFItemDiscount.Value := DataForm2.PurchaseItemTable.FieldbyName('Discount').asFloat;
                 TCData.tblDocLineWtaxID.Value:= DataForm2.IniFile.ReadInteger('TCSetup', 'TCInputTaxId', 0);
    {}
                 TCData.tblDocLineFInclusiveAmt.AsCurrency := MyRoundTo((DataForm2.PurchaseItemTable.FieldbyName('CostPrice').asCurrency * StrtoFloat('1.' + FloattoStr(Dataform2.GlobalTableVat.Value))) * DataForm2.PurchaseItemTable.FieldbyName('Qty').asFloat,-2);
                 TCData.tblDocLineFExclusiveAmt.AsCurrency := MyRoundTo(DataForm2.PurchaseItemTable.FieldbyName('CostPrice').asCurrency * DataForm2.PurchaseItemTable.FieldbyName('Qty').asFloat, -2);
                 Total := Total + TCData.tblDocLineFInclusiveAmt.AsCurrency ;
                 TotalTax  := TotalTax + (TCData.tblDocLineFInclusiveAmt.AsCurrency - TCData.tblDocLineFExclusiveAmt.AsCurrency);
    {}
                 TCData.tblDocLineFTaxAmount.AsCurrency := TCData.tblDocLineFInclusiveAmt.AsCurrency - TCData.tblDocLineFExclusiveAmt.AsCurrency;
                 TCData.tblDocLine.Post;

                 Application.ProcessMessages;

                 DataForm2.PurchaseItemTable.Next;
               end;

      {         If Floattostr(MyRoundTo(Total,-2)) <> FloattoStr(Dataform2.InvoiceTableInvTotal.Value) then
               begin
                 ExtractForm.Memo1.Lines.Add('"' + InttoStr(Dataform2.InvoiceTableBranchNo.Value) + '/' + InttoStr(DataForm2.InvoiceTable.FieldbyName('InvNo').asInteger) + '","Inv Items don''t balance, Invoice skipped","' + Dataform2.InvoiceTable.Fieldbyname('InvBy').asString + '"');
                 Fault := True;
               end;
               Dataform2.Query2.Close;    }

               TCData.tblDocHeader.edit ;
               TCData.tblDocHeaderFDocAmount.asCurrency :=  MyRoundTo(Total,-2);
               TCData.tblDocHeaderFTaxAmount.asCurrency :=  MyRoundTo(TotalTax,-2);
               TCData.tblDocHeaderdSysdate.asdatetime := now;
               TCData.tblDocHeader.post ;

               If Fault = True then
               begin
                 with TCData.TCQuery.SQL do
                 begin
                   clear;
                   Add('delete from DocLine.DB');
                   Add('where WDocID = ' + InttoStr(LastDocID));
                 end;
                 TCData.TCQuery.ExecSQL;
                 with TCData.TCQuery.SQL do
                 begin
                   clear;
                   Add('delete from DocHead.DB');
                   Add('where WDocID = ' + InttoStr(LastDocID));
                 end;
                 TCData.TCQuery.ExecSQL;
                 CreateUnpostedPurcInvoice := False;
                 Exit;
               end;

               Dataform2.InvoiceTable.Edit;
               DataForm2.InvoiceTableShiftSet.Value := LastDocNo;
               DataForm2.InvoiceTable.Post;
end;

procedure UpdateTCStock();
var
    Changed: Boolean;
begin
//        If Dataform2.TCStockTable.Locate('SStockCode',Dataform2.PurchaseItemTableTCStockNo.Value,[]) then
//        begin
          Changed := False;
          If Floattostrf(TCData.TCStockTableFSellingPrice1.Value,ffFixed,17,2) <> Floattostrf(DataForm2.StockTable.FieldByName('SalesPrice').AsFloat * 100 / 114,ffFixed,17,2) then
          begin
            Changed := True;
            TCData.TCStockTable.Edit;
            TCData.TCStockTableFSellingPrice1.Value := DataForm2.StockTable.FieldByName('SalesPrice').AsFloat * 100 / 114;
          end;
          If Floattostrf(TCData.TCStockTableFSellingPrice2.Value,ffFixed,17,2) <> Floattostrf(DataForm2.StockTable.FieldByName('SalesPrice2').AsFloat * 100 / 114,ffFixed,17,2) then
          begin
            Changed := True;
            TCData.TCStockTable.Edit;
            TCData.TCStockTableFSellingPrice2.Value := DataForm2.StockTable.FieldByName('SalesPrice2').AsFloat * 100 / 114;
          end;
          If TCData.TCStockTableSDescription.Value <> Dataform2.StockTableDescription.Value then
          begin
            Changed := True;
            TCData.TCStockTable.Edit;
            TCData.TCStockTableSDescription.Value := Dataform2.StockTableDescription.Value;
          end;
          If TCData.TCStockTableSExtraDesc.Value <> Dataform2.StockTableExtraDescr.Value then
          begin
            Changed := True;
            TCData.TCStockTable.Edit;
            TCData.TCStockTableSExtraDesc.Value := Dataform2.StockTableExtraDescr.Value;
          end;
          If Changed = True then
            TCData.TCStockTable.Post;
//        end;
end;

procedure UpdateTCStockfromPurch();
var
    Changed: Boolean;
begin
//        If Dataform2.TCStockTable.Locate('SStockCode',Dataform2.PurchaseItemTableTCStockNo.Value,[]) then
//        begin
          Changed := False;
          If Floattostrf(TCData.TCStockTableFSellingPrice1.Value,ffFixed,17,2) <> Floattostrf(DataForm2.PurchaseItemTablePrice.Value * 100 / 114,ffFixed,17,2) then
          begin
            Changed := True;
            TCData.TCStockTable.Edit;
            TCData.TCStockTableFSellingPrice1.Value := DataForm2.PurchaseItemTablePrice.Value * 100 / 114;
          end;
          If Floattostrf(TCData.TCStockTableFSellingPrice2.Value,ffFixed,17,2) <> Floattostrf(DataForm2.PurchaseItemTablePrice2.Value * 100 / 114,ffFixed,17,2) then
          begin
            Changed := True;
            TCData.TCStockTable.Edit;
            TCData.TCStockTableFSellingPrice2.Value := DataForm2.PurchaseItemTablePrice2.Value * 100 / 114;
          end;
          If TCData.TCStockTableSDescription.Value <> DataForm2.PurchaseItemTableDescription.Value + ' (' + DataForm2.PurchaseItemTableModelNo.Value + ')' then
          begin
            Changed := True;
            TCData.TCStockTable.Edit;
            TCData.TCStockTableSDescription.Value := DataForm2.PurchaseItemTableDescription.Value + ' (' + DataForm2.PurchaseItemTableModelNo.Value + ')';
          end;
          If TCData.TCStockTableSExtraDesc.Value <> DataForm2.PurchaseItemTableExtraDescr.Value then
          begin
            Changed := True;
            TCData.TCStockTable.Edit;
            TCData.TCStockTableSExtraDesc.Value := DataForm2.PurchaseItemTableExtraDescr.Value;
          end;
          If Changed = True then
            TCData.TCStockTable.Post;
//        end;
end;

end.
