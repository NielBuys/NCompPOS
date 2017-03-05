unit UtilsUnit;


interface
  uses SysUtils, DateUtils, Dialogs, Windows, Math, Registry, ShlObj, ActiveX,db,Classes;

  function ValidateID(ID: String): Boolean;
  function WorkoutAge(StoreDate: TDateTime): Integer;

  function IntDatetoString(i: integer): String;
  function DatetoIntDate(d: TDateTime): integer;

  function Decrypt(pr: String): String;
  function Encrypt(tr: String): String;

  function WinExecAndWait32(AFileName, AParameters: String;
    Visibility: integer): DWord;
  Function GetUserProfileDir : String;
  function GetFileInfo(FName, InfoType: String): String;
  function TrimSpaces(stemp: AnsiString): AnsiString;
  function TrimDash(stemp: AnsiString): AnsiString;
  function MyRoundTo(const AValue: Double; const ADigit: TRoundToRange): Double;
  function GetRegistryData(RootKey: HKEY; Key, Value: String): variant;
  procedure SetRegistryData(RootKey: HKEY; Key, Value: String;
    RegDataType: TRegDataType; Data: variant);
  function GetTempDirectory: String;
  function ValidEmail(email: AnsiString): boolean;
  function FindVolumeSerial(const Drive: PChar): String;
  function FixSQLString(stemp: String): String;
  function ChangeEnterforSMS(stemp: AnsiString): AnsiString;
  function UrlEncode(const DecodedStr: AnsiString; Pluses: Boolean): AnsiString;
  function UrlDecode(const EncodedStr: AnsiString): AnsiString;
  function HexToInt(HexStr: AnsiString): Int64;
  function filenamespescharfix(stemp:string): AnsiString;
  function GetSpecialFolder(const CSIDL : integer) : String;
  function AddCR(stemp: AnsiString): AnsiString;
  function RemoveLF(stemp: String): String;
  function IsInteger(S: AnsiString): Boolean;
  function TestSwitchString(SwitchString,TestValue: AnsiString): AnsiString;
  function UpdateSwitchString(SwitchString,TestValue,Value: AnsiString): AnsiString;
  function CreateEasyPayNumber(GroupNo,MemNo,BranchNo:Integer):String;
  function UNIXTimeToDateTime(UnixTime: LongWord; localtime : boolean): TDateTime;
  function DateTimeToUNIXTime(DelphiTime : TDateTime; localtime : boolean): LongWord;
  function FileSize(fileName : wideString) : Int64;
  function replacedoublequotewithsinglequote(stemp: AnsiString): AnsiString;
  function CreateGuid: string;
  function ConvertFieldtoSQLString(FieldStore: TField): String;
  function ConvertFieldtoMySQLString(FieldStore: TField): String;
  procedure Split(const Delimiter: Char; Input: string; const Strings: TStrings);
  function CalculateBMI(LenghtValue,WeightValue: Extended; WeightUnit, LenghtUnit:String): Extended;
  function FloatToLocaleIndependantString(const v: Extended): string;
  function IsWindows64: Boolean;

  const
  // Sets UnixStartDate to TDateTime of 01/01/1970
//  UnixStartDate: TDateTime = 25569.0;
DELPHI_DATE_01_01_1970 = 25569;

var
   myGlobalFormatSettings : TFormatSettings;

implementation

function ValidateID(ID: String): Boolean;
var
    i1, i2, i3, i4, i5: Integer;
    s: String;
begin
  ValidateID := True;
  If  Length(ID) = 13 then
  begin
    try
      i1 := StrtoInt(copy(ID,1,1)) + StrtoInt(copy(ID,3,1)) + StrtoInt(copy(ID,5,1)) + StrtoInt(copy(ID,7,1)) + StrtoInt(copy(ID,9,1)) + StrtoInt(copy(ID,11,1));
      i2 := StrtoInt(copy(ID,2,1) + copy(ID,4,1) + copy(ID,6,1) + copy(ID,8,1) + copy(ID,10,1) + copy(ID,12,1)) * 2;
      If Length(InttoStr(i2)) = 5 then
        s := '0' + InttoStr(i2)
      else
      begin
        If Length(InttoStr(i2)) = 4 then
          s := '00' + InttoStr(i2)
        else
        begin
          If Length(InttoStr(i2)) = 3 then
            s := '000' + InttoStr(i2)
          else
            s := InttoStr(i2);
        end;
      end;
      If Length(s) = 6 then
        i3 := StrtoInt(copy(s,1,1)) + StrtoInt(copy(s,2,1)) + StrtoInt(copy(s,3,1)) + StrtoInt(copy(s,4,1)) + StrtoInt(copy(s,5,1)) + StrtoInt(copy(s,6,1))
      else
        i3 := StrtoInt(copy(s,1,1)) + StrtoInt(copy(s,2,1)) + StrtoInt(copy(s,3,1)) + StrtoInt(copy(s,4,1)) + StrtoInt(copy(s,5,1)) + StrtoInt(copy(s,6,1)) + StrtoInt(copy(s,7,1));
      i4 := i1 + i3;
      i5 := 10 - strtoint(copy(InttoStr(i4),2,1));
      If i5 > 9 then
        i5 := 0;
      If copy(ID,13,1) <> InttoStr(i5) then
        ValidateID := False;
    except
      ValidateID := False;
    end;
  end
  else
    ValidateID := False;
end;

function WorkoutAge(StoreDate: TDateTime): Integer;
begin
        try
          WorkoutAge := YearsBetween(Date,StoreDate);
        except
          WorkoutAge := 0;
        end;
end;

function DatetoIntDate(d: TDateTime): integer;
var
//  yy, mm, dd: String;
  s: String;
begin
//  If ShortDateFormat = 'dd/MM/yyyy' then
//  begin
//    dd := copy(datetostr(d),1,2);
//    mm := copy(datetostr(d),4,2);
//    yy := copy(datetostr(d),7,4);
//  end
//  else
//  begin
//    If ShortDateFormat = 'dd/MM/yy' then
//    begin
//      dd := copy(datetostr(d),1,2);
//      mm := copy(datetostr(d),4,2);
//      yy := copy(datetostr(d),7,2);
//      Insert('20',yy,1);
//    end
//    else
//    begin
//      if ShortDateFormat = 'MM/dd/yyyy' then
//      begin
//        mm := copy(datetostr(d),1,2);
//        dd := copy(datetostr(d),4,2);
//        yy := copy(datetostr(d),7,4);
//      end
//      else
//      begin
//        yy := copy(datetostr(d),1,4);
//        mm := copy(datetostr(d),6,2);
//        dd := copy(datetostr(d),9,2);
//      end;
//    end;
//  end;
//  s := yy + mm + dd;
  DateTimeToString(s, 'yyyymmdd', d);;
  DatetoIntDate := strtoint(s);
end;

function IntDatetoString(i: integer): String;
var
  yy, mm, dd: String;
  d: TDatetime;
begin
  if i = 0 then
    IntDatetostring := ''
  else
  begin
    yy := copy(inttostr(i),1,4);
    mm := copy(inttostr(i),5,2);
    dd := copy(inttostr(i),7,2);
    try
      d := EncodeDate(strtoint(yy), strtoint(mm), strtoint(dd));
    except
      begin
        IntDatetoString := '';
        exit;
      end;
    end;
    IntDatetoString := datetostr(d);
//    If ShortDateFormat = 'dd/MM/yyyy' then
//    begin
//      IntDatetostring := dd + '/' + mm + '/' + yy;
//    end
//    else
//    begin
//      If ShortDateFormat = 'dd/MM/yy' then
//      begin
//        delete(yy,1,2);
//        IntDatetostring := dd + '/' + mm + '/' + yy;
//      end
//      else
//      begin
//        IntDatetostring := yy + '/' + mm + '/' + dd;
//      end;
//    end;
//    If IsValidDate(StrtoInt(yy),StrtoInt(mm),StrtoInt(dd)) = False then
//      IntDatetoString := '';
  end;
end;

//Encrypt
function Encrypt(tr: String): String;
var
  i: Integer;
  Temp: String;
begin
  for i := 1 to Length(tr) do
  begin
    Temp := Temp + Chr(Ord(tr[i]) + 3);
  end;
  Encrypt := Temp;
end;

//Decrypt
function Decrypt(pr: String): String;
var
  i: Integer;
  Temp: String;
begin
  for i := 1 to Length(pr) do
  begin
    Temp := Temp + Chr(Ord(pr[i]) - 3);
  end;
  Decrypt := Temp;
end;

function WinExecAndWait32(AFileName, AParameters: String; Visibility: integer): DWord ;
 { returns -1 if the Exec failed, otherwise returns the process' exit
   code when the process terminates }
var
  zCommandLine: array[0..512] of char;
  {
  zCurDir: array[0..255] of char;
  WorkDir: AnsiString;
  }
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin
  StrPCopy(zCommandLine, AFileName + ' ' + AParameters);
  // GetDir(0, WorkDir);
  // StrPCopy(zCurDir, WorkDir);
  FillChar(StartupInfo, Sizeof(StartupInfo), #0);
  StartupInfo.cb := Sizeof(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;
  if not CreateProcess(nil,
    zCommandLine, { pointer to command line string }
    nil, { pointer to process security attributes }
    nil, { pointer to thread security attributes }
    False, { handle inheritance flag }
    CREATE_NEW_CONSOLE or { creation flags }
    NORMAL_PRIORITY_CLASS,
    nil, { pointer to new environment block }
    nil, { pointer to current directory name }
    StartupInfo, { pointer to STARTUPINFO }
    ProcessInfo) then { pointer to PROCESS_INF }
    Result := DWord(-1)
  else
  begin
    WaitforSingleObject(ProcessInfo.hProcess, INFINITE);
    GetExitCodeProcess(ProcessInfo.hProcess, Result);
    FileClose(ProcessInfo.hProcess); { *Converted from CloseHandle* }
    FileClose(ProcessInfo.hThread); { *Converted from CloseHandle* }
  end;
end;

Function GetUserProfileDir : String;
var P : PChar;
   S : String;
Begin
  GetMem(P,128);
  GetTempPath(144, P);
  S := PChar(P);
  Result := Copy(S, 1, Length(S)-14);
  FreeMem(P);
End;

function GetFileInfo(FName, InfoType: String): String;
{usage:

//  VersionInfo: array [1..9] of string = ('CompanyName', 'FileDescription', 'FileVersion', 'InternalName',
//    'LegalCopyRight', 'OriginalFileName', 'ProductName', 'ProductVersion',
//    'SpecialBuild');

  showmessage(GetFileInfo(Application.ExeName, VersionInfo[x]));

  1: 'CompanyName'
  2: 'FileDescription'
  3: 'FileVersion'
  4: 'InternalName'
  5: 'LegalCopyRight'
  6: 'OriginalFileName'
  7: 'ProductName'
  8: 'ProductVersion'
  9: 'SpecialBuild'

}
var
  Info     : Pointer;
  InfoData : Pointer;
  InfoSize : LongInt;
  InfoLen  : {$IFDEF WIN32} DWORD;{$ELSE} LongInt; {$ENDIF}
  DataLen  : {$IFDEF WIN32} UInt; {$ELSE} word; {$ENDIF}
  LangPtr  : Pointer;
begin
  Result  := '';
  if Length(FName) <= 0 then
    Exit;

  DataLen :=255;
  FName := FName + #0;

  InfoSize := GetFileVersionInfoSize(@Fname[1], InfoLen);
  if (InfoSize > 0) then
  begin
    GetMem(Info, InfoSize);
    try
      if GetFileVersionInfo(@FName[1], InfoLen, InfoSize, Info) then
      begin
        if VerQueryValue(Info,'\VarFileInfo\Translation',LangPtr,DataLen) then
          InfoType:=Format('\StringFileInfo\%0.4x%0.4x\%s'#0,[LoWord(LongInt(LangPtr^)), HiWord(LongInt(LangPtr^)), InfoType]);
        if VerQueryValue(Info,@InfoType[1],InfoData,Datalen) then
          Result := strPas(PChar(InfoData));
      end;
    finally
      FreeMem(Info, InfoSize);
    end;
  end;
end;

function TrimSpaces(stemp: AnsiString): AnsiString;
const Remove = [' ', #13, #10];
var
  i: integer;
begin
  result := '';
  for i := 1 to length(stemp) do begin
    if not (stemp[i] in remove) then
      result := result+stemp[i];
  end;
end;

function TrimDash(stemp: AnsiString): AnsiString;
const Remove = ['-', '/', #13, #10];
var
  i: integer;
begin
  result := '';
  for i := 1 to length(stemp) do begin
    if not (stemp[i] in remove) then
      result := result+stemp[i];
  end;
end;

function MyRoundTo(const AValue: Double; const ADigit: TRoundToRange): Double;
var
  LFactor: Double;
begin
  LFactor := IntPower(10, ADigit);
  Result := Round((AValue + 0.001) / LFactor) * LFactor;
end;

function GetRegistryData(RootKey: HKEY; Key, Value: String): variant;
var
  Reg: TRegistry;
  RegDataType: TRegDataType;
  DataSize, Len: integer;
  s: String;
label cantread;
begin
  Reg := nil;
  try
    Reg := TRegistry.Create(KEY_READ);
//    Reg := TRegistry.Create(KEY_QUERY_VALUE);
    Reg.RootKey := RootKey;
    if Reg.OpenKeyReadOnly(Key) then begin
      try
        RegDataType := Reg.GetDataType(Value);
        if (RegDataType = rdString) or
           (RegDataType = rdExpandString) then
          Result := Reg.ReadString(Value)
        else if RegDataType = rdInteger then
          Result := Reg.ReadInteger(Value)
        else if RegDataType = rdBinary then begin
          DataSize := Reg.GetDataSize(Value);
          if DataSize = -1 then goto cantread;
          SetLength(s, DataSize);
          Len := Reg.ReadBinaryData(Value, PChar(s)^, DataSize);
          if Len <> DataSize then goto cantread;
          Result := s;
        end else
cantread:
          raise Exception.Create(SysErrorMessage(ERROR_CANTREAD));
      except
        s := ''; // Deallocates memory if allocated
        Reg.CloseKey;
        raise;
      end;
      Reg.CloseKey;
    end else
      raise Exception.Create(SysErrorMessage(GetLastError));
  except
    Reg.Free;
    raise;
  end;
  Reg.Free;
end;

procedure SetRegistryData(RootKey: HKEY; Key, Value: String;
  RegDataType: TRegDataType; Data: variant);
var
  Reg: TRegistry;
  s: String;
begin
  Reg := TRegistry.Create(KEY_WRITE);
  try
    Reg.RootKey := RootKey;
    if Reg.OpenKey(Key, True) then begin
      try
        if RegDataType = rdUnknown then
          RegDataType := Reg.GetDataType(Value);
        if RegDataType = rdString then
          Reg.WriteString(Value, Data)
        else if RegDataType = rdExpandString then
          Reg.WriteExpandString(Value, Data)
        else if RegDataType = rdInteger then
          Reg.WriteInteger(Value, Data)
        else if RegDataType = rdBinary then begin
          s := Data;
          Reg.WriteBinaryData(Value, PChar(s)^, Length(s));
        end else
          raise Exception.Create(SysErrorMessage(ERROR_CANTWRITE));
      except
        Reg.CloseKey;
        raise;
      end;
      Reg.CloseKey;
    end else
      raise Exception.Create(SysErrorMessage(GetLastError));
  finally
    Reg.Free;
  end;
end;

function GetTempDirectory: String;
var
  tempFolder: array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @tempFolder);
  result := StrPas(tempFolder);
end;

function ValidEmail(email: AnsiString): boolean;
  // Returns True if the email address is valid
  // Author: Ernesto D'Spirito

  const
    // Valid characters in an "atom"

    atom_chars = [#33..#255] - ['(', ')', '<', '>', '@', ',', ';', ':',

                                '\', '/', '"', '.', '[', ']', #127];

    // Valid characters in a "quoted-string"

    quoted_string_chars = [#0..#255] - ['"', #13, '\'];

    // Valid characters in a subdomain

    letters = ['A'..'Z', 'a'..'z'];
    letters_digits = ['0'..'9', 'A'..'Z', 'a'..'z'];
    subdomain_chars = ['-', '0'..'9', 'A'..'Z', 'a'..'z'];

  type
    States = (STATE_BEGIN, STATE_ATOM, STATE_QTEXT, STATE_QCHAR,
      STATE_QUOTE, STATE_LOCAL_PERIOD, STATE_EXPECTING_SUBDOMAIN,
      STATE_SUBDOMAIN, STATE_HYPHEN);

  var
    State: States;
    i, n, subdomains: integer;
    c: ansichar;

  begin
    State := STATE_BEGIN;
    n := Length(email);
    i := 1;
    subdomains := 1;
    while (i <= n) do begin
      c := email[i];
      case State of
      STATE_BEGIN:
        if c in atom_chars then
          State := STATE_ATOM
        else if c = '"' then
          State := STATE_QTEXT
        else
          break;

      STATE_ATOM:
        if c = '@' then
          State := STATE_EXPECTING_SUBDOMAIN
        else if c = '.' then
          State := STATE_LOCAL_PERIOD
        else if not (c in atom_chars) then
          break;

      STATE_QTEXT:
        if c = '\' then
          State := STATE_QCHAR
        else if c = '"' then
          State := STATE_QUOTE
        else if not (c in quoted_string_chars) then
          break;

      STATE_QCHAR:
        State := STATE_QTEXT;

      STATE_QUOTE:
        if c = '@' then
          State := STATE_EXPECTING_SUBDOMAIN
        else if c = '.' then
          State := STATE_LOCAL_PERIOD
        else
          break;

      STATE_LOCAL_PERIOD:
        if c in atom_chars then
          State := STATE_ATOM
        else if c = '"' then
          State := STATE_QTEXT
        else
          break;

      STATE_EXPECTING_SUBDOMAIN:
        if c in letters then
          State := STATE_SUBDOMAIN
        else
          break;

      STATE_SUBDOMAIN:
        if c = '.' then begin
          inc(subdomains);
          State := STATE_EXPECTING_SUBDOMAIN
        end else if c = '-' then
          State := STATE_HYPHEN
        else if not (c in letters_digits) then
          break;

      STATE_HYPHEN:

        if c in letters_digits then
          State := STATE_SUBDOMAIN
        else if c <> '-' then
          break;

      end;
      inc(i);
    end;

    if i <= n then
      Result := False
    else
      Result := (State = STATE_SUBDOMAIN) and (subdomains >= 2);

end;

function FindVolumeSerial(const Drive : PChar) : String;
var
   VolumeSerialNumber : DWORD;
   MaximumComponentLength : DWORD;
   FileSystemFlags : DWORD;
   serialNumber1, SerialNumber2: Integer;
begin
   Result:='';

   GetVolumeInformation(
        Drive,
        nil,
        0,
        @VolumeSerialNumber,
        MaximumComponentLength,
        FileSystemFlags,
        nil,
        0) ;
   SerialNumber1 := HiWord(VolumeSerialNumber);
   SerialNumber2 := LoWord(VolumeSerialNumber);

   Result := InttoStr(SerialNumber1) + InttoStr(SerialNumber2);
end; (*FindVolumeSerial*)

function FixSQLString(stemp: String): String;
const SpecialChar = ['&', '\',#39];
var
  i: integer;
  Skiploop:Boolean;
begin
  result := '';
  skiploop := false;
  for i := 1 to length(stemp) do
  begin
    if skiploop = true then
    begin
      skiploop := false;
      continue;
    end;
 //   showmessage(stemp[i]);
    if not (stemp[i] in SpecialChar) then
    begin
      result := result+stemp[i]
    end
    else
    begin
      if stemp[i] = #39 then
      begin
        if (stemp[i+1] <> #39) then
          result := result+''''''
        else
        begin
          result := result+stemp[i]+stemp[i+1];
          Skiploop := true;
        end;
      end
      else
      begin
        if stemp[i] = '\' then
        begin
          if (stemp[i+1] <> '\') then
            result := result+'\\'
          else
          begin
            result := result+stemp[i]+stemp[i+1];
            Skiploop := true;
          end;
        end
        else
        begin
          if stemp[i] = '&' then
          begin
            if (stemp[i+1] <> '&') then
              result := result+'&'
            else
            begin
              result := result+stemp[i]+stemp[i+1];
              Skiploop := true;
            end;
          end
          else
            result := result+'/';
        end;
      end;
    end;
  end;
end;

function ChangeEnterforSMS(stemp: AnsiString): AnsiString;
const Remove = [#13, #10];
var
  i: integer;
begin
  result := '';
  for i := 1 to length(stemp) do begin
    if not (stemp[i] in remove) then
      result := result+stemp[i]
    else
      if stemp[i] = #13 then
        result := result + '|';
  end;
end;

function UrlEncode(const DecodedStr: AnsiString; Pluses: Boolean): AnsiString;
var
  I: Integer;
begin
  Result := '';
  if Length(DecodedStr) > 0 then
    for I := 1 to Length(DecodedStr) do
    begin
      if not (DecodedStr[I] in ['0'..'9', 'a'..'z',
                                       'A'..'Z', ' ']) then
        Result := Result + '%' + IntToHex(Ord(DecodedStr[I]), 2)
      else if not (DecodedStr[I] = ' ') then
        Result := Result + DecodedStr[I]
      else
        begin
          if not Pluses then
            Result := Result + '%20'
          else
            Result := Result + '+';
        end;
    end;
end;

function UrlDecode(const EncodedStr: AnsiString): AnsiString;
var
  I: Integer;
begin
  Result := '';
  if Length(EncodedStr) > 0 then
  begin
    I := 1;
    while I <= Length(EncodedStr) do
    begin
      if EncodedStr[I] = '%' then
        begin
          Result := Result + Chr(HexToInt(EncodedStr[I+1]
                                       + EncodedStr[I+2]));
          I := Succ(Succ(I));
        end
      else if EncodedStr[I] = '+' then
        Result := Result + ' '
      else
        Result := Result + EncodedStr[I];

      I := Succ(I);
    end;
  end;
end;

function HexToInt(HexStr: AnsiString): Int64;
var RetVar : Int64;
    i : byte;
begin
  HexStr := UpperCase(HexStr);
  if HexStr[length(HexStr)] = 'H' then
     Delete(HexStr,length(HexStr),1);
  RetVar := 0;

  for i := 1 to length(HexStr) do begin
      RetVar := RetVar shl 4;
      if HexStr[i] in ['0'..'9'] then
         RetVar := RetVar + (byte(HexStr[i]) - 48)
      else
         if HexStr[i] in ['A'..'F'] then
            RetVar := RetVar + (byte(HexStr[i]) - 55)
         else begin
            Retvar := 0;
            break;
         end;
  end;

  Result := RetVar;
end;

function filenamespescharfix(stemp:string): AnsiString;
const SpecialChar = ['&','\','''','"','/',':'];
var
  i: integer;
begin
  result := '';
  for i := 1 to length(stemp) do
  begin
    if not (stemp[i] in SpecialChar) then
      result := result+stemp[i]
    else
      result := result + '_';
  end;
end;

function GetSpecialFolder(const CSIDL : integer) : String;
var RecPath : PChar;
begin
RecPath := StrAlloc(MAX_PATH);
try
  FillChar(RecPath^,MAX_PATH,0);
  if SHGetSpecialFolderPath(0,RecPath,CSIDL,false) then begin
   result := RecPath;
  end else result := '';
finally
  StrDispose(RecPath);
end;
end;

function AddCR(stemp: AnsiString): AnsiString;
const FindStr = [#10];
var
  i: integer;
begin
  result := '';
  for i := 1 to length(stemp) do begin
    if not (stemp[i] in FindStr) then
      result := result+stemp[i]
    else
      result := result+#13+stemp[i];
  end;
end;

function RemoveLF(stemp: String): String;
const FindStr = [#10];
var
  i: integer;
begin
  result := '';
  for i := 1 to length(stemp) do begin
    if not (stemp[i] in FindStr) then
      result := result+stemp[i];
  end;
end;

function IsInteger(S: AnsiString): Boolean;
begin
    try
      Result := True;
      StrToInt(copy(S,1,9));
    except on E: EConvertError do
      Result := False;
    end;
end;

function TestSwitchString(SwitchString,TestValue: AnsiString): AnsiString;
var
  i,I2,pos1,pos2: integer;
begin
  result := 'False';
  for i := 1 to length(SwitchString) do
  begin
    if copy(SwitchString,i,length(TestValue)) = TestValue then
    begin
      result := 'True';
      if copy(SwitchString,i+length(TestValue),1) = '(' then
      begin
        for I2 := i to length(SwitchString) do
        begin
          if copy(SwitchString,I2,1) = '(' then
            pos1 := I2;
          if copy(SwitchString,I2,1) = ')' then
          begin
            pos2 := I2;
            break;
          end;
        end;
        result := copy(SwitchString,pos1 + 1,(pos2 - pos1)-1);
      end;
    end;
  end;
end;

function UpdateSwitchString(SwitchString,TestValue,Value: AnsiString): AnsiString;
var
  i,I2,pos1,pos2: integer;
  s: AnsiString;
begin
  result := 'False';
  s := SwitchString;
  for i := 1 to length(SwitchString) do
  begin
    if copy(SwitchString,i,length(TestValue)) = TestValue then
    begin
      result := 'True';
      if (copy(SwitchString,i+length(TestValue),1) = '(') or (Value <> '') then
      begin
        pos1 := 0;
        pos2 := 0;
        for I2 := i + 1 to length(SwitchString) do
        begin
          if copy(SwitchString,I2,1) = '(' then
            pos1 := I2;
          if copy(SwitchString,I2,1) = ')' then
          begin
            pos2 := I2;
            break;
          end;
          if copy(SwitchString,I2,1) = '-' then
          begin
            if (pos1 = 0) and (pos2 = 0) and (Value <> '') then
            begin
              insert('(' + Value + ')',s,i+length(TestValue));
            end;
            break;
          end;
        end;
        if (pos1 <> 0) or (pos2 <> 0) then
        begin
          delete(s,pos1+1,(pos2-pos1)-1);
          insert(Value,s,pos1+1);
        end;
//        result := copy(SwitchString,pos1 + 1,(pos2 - pos1)-1);
      end;
    end;
  end;
  if result = 'False' then
  begin
    if Value <> '' then
      insert(TestValue+'('+Value+')',s,length(SwitchString)+1)
    else
      insert(TestValue,s,length(SwitchString));
  end;
  result := s;
end;

function CreateEasyPayNumber(GroupNo,MemNo,BranchNo:Integer):String;
var
      s,s2,s3,s4:String;
      i,i2,i3:Integer;
begin
      s := '2540' + Formatfloat('0000',GroupNo) + Formatfloat('00',BranchNo) + Formatfloat('00000000',MemNo);
      i2 := 1;
      s2 := '';
      for I := 0 to Length(s) - 1 do
      begin
        if i2 = 2 then
        begin
          i3 := StrtoInt(copy(s,I+1,1)) * 2;
//          showmessage('2=item' + copy(s,I+1,1));
          if i3 > 9 then
            i3 := i3 - 9;
          s2 := s2 + InttoStr(i3);
//          showmessage('2=' + s2);
          i2 := 1;
        end
        else
        begin
          s2 := s2 + copy(s,I+1,1);
//          showmessage('1=' + s2);
          i2 := 2;
        end;
      end;
      i3 := 0;
      for I := 0 to Length(s2) - 1 do
      begin
        i3 := i3 + StrtoInt(copy(s2,I+1,1));
      end;
      i2 := i3 + 10;
      s3 := InttoStr(i2);
      s4 := '';
      for I := 0 to Length(s3) - 1 do
      begin
        if I = Length(s3) - 1 then
          s4 := s4 + '0'
        else
          s4 := s4 + copy(s3,I,1);
      end;
//      showmessage(s4 + '=' + InttoStr(i3));
      i2 := StrtoInt(s4);
      s3 := InttoStr(i2 - i3);
      if s3 = '10' then
        s3 := '0';
      CreateEasyPayNumber := '9' + s + s3;
end;

function UNIXTimeToDateTime(UnixTime: LongWord; localtime : boolean): TDateTime;
var
  TimeZoneInformation: TTimeZoneInformation;
  offset : TDateTime;
begin
  Result := DELPHI_DATE_01_01_1970 + (UnixTime/(24*3600));

  // Does NOT do daylight savings time adjustment, I'd need a routine to
  // determine if the timestamp is during DST or not.
  if localtime then
  begin
    GetTimeZoneInformation(TimeZoneInformation);
    offset := TimeZoneInformation.Bias / (24 * 60); // bias is in minutes
    result := result - offset;
  end;
end;

function DateTimeToUNIXTime(DelphiTime : TDateTime; localtime : boolean): LongWord;
var
  TimeZoneInformation: TTimeZoneInformation;
  offset : cardinal;
begin
  Result := round( (DelphiTime - DELPHI_DATE_01_01_1970) * (24 * 3600) );

  // Does NOT do daylight savings time adjustment, I'd need a routine to
  // determine if the timestamp is during DST or not.
  if localtime then
  begin
    GetTimeZoneInformation(TimeZoneInformation);
    offset := TimeZoneInformation.Bias * 60;  //bias is in minutes
    result := result + offset;
  end;
end;

function FileSize(fileName : wideString) : Int64;
 var
   sr : TSearchRec;
 begin
   if FindFirst(fileName, faAnyFile, sr ) = 0 then
      result := Int64(sr.FindData.nFileSizeHigh) shl Int64(32) + Int64(sr.FindData.nFileSizeLow)
   else
      result := -1;

   SysUtils.FindClose(sr) ;
 end;



function replacedoublequotewithsinglequote(stemp: AnsiString): AnsiString;
const Remove = ['"', #13, #10];
var
  i: integer;
begin
  result := '';
  for i := 1 to length(stemp) do begin
    if not (stemp[i] in remove) then
      result := result+stemp[i]
    else
    begin
      if stemp[i] = '"' then
        result := result+'''';
    end;
  end;
end;

function CreateGuid: string;
var
  ID: TGUID;
begin
  Result := '';
  if CoCreateGuid(ID) = S_OK then
    Result := GUIDToString(ID);
end;

Function ConvertFieldtoSQLString(FieldStore: TField):String;
var
      temp:String;
begin
        temp := '';
        case TFieldType(Ord(FieldStore.DataType)) of
          ftString, ftGuid, ftWideString:
          begin
            if (FieldStore.AsString ='') or (FieldStore.IsNull) then
               temp :='null'  //Put a default string
            else
               temp := '''' + FixSQLString(FieldStore.AsString) + '''';
          end;

          ftInteger, ftWord, ftSmallint, ftAutoinc, ftLargeint, ftByte:
          begin
            if FieldStore.AsInteger > 0 then
               temp := IntToStr(FieldStore.AsInteger)
            else
            begin
              if FieldStore.IsNull then
                temp := 'null'
              else
                temp := '0';
            end;
          end;
          ftFloat, ftCurrency, ftBCD:
          begin
  //          Showmessage(FloattoStr(FieldStore.AsFloat) + '==' + FloatToLocaleIndependantString(FieldStore.AsFloat));
            if FieldStore.AsFloat <> 0 then
              temp := FloatToLocaleIndependantString(FieldStore.AsFloat)
            else
            begin
              if FieldStore.IsNull then
                temp := 'null'
              else
                temp := '0';
            end;
          end;
          ftBoolean:
          begin
            if not FieldStore.isnull then
            begin
              if FieldStore.Value then
                temp:= '1'
              else
                temp:= '0';
            end
            else
              temp := 'null';
          end;
          ftDate:
          begin
            if (not FieldStore.IsNull) or
               (Length(Trim(FieldStore.AsString)) > 0) then
              temp := 'convert(datetime, ''' + FormatDateTime('yyyy/MM/dd',
                             FieldStore.AsDateTime) + ''',111)'
            else
            begin
              if FieldStore.IsNull then
                temp := 'null'
              else
              temp:= 'convert(datetime, ''1900/01/01'',111)'; //put some valid default date
            end;
          end;
          ftDateTime, ftTimeStamp:
          begin
            if (not FieldStore.IsNull) or
               (Length(Trim(FieldStore.AsString)) > 0) then
              temp := 'convert(datetime, ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss',
                             FieldStore.AsDateTime) + ''',120)'
            else
            begin
              if FieldStore.IsNull then
                temp := 'null'
              else
                temp := 'convert(datetime, ''1900/01/01 00:00:00'',120)';//Put some valid default date and time
            end;
          end;
          ftTime:
          begin
            if (not FieldStore.IsNull) or
               (Length(Trim(FieldStore.AsString)) > 0) then
               temp := 'convert(datetime, ''' + FormatDateTime('hh:mm:ss',
                           FieldStore.AsDateTime) + ''',8)'
            else
            begin
              if FieldStore.IsNull then
                temp := 'null'
              else
                temp := 'convert(datetime, ''00:00:00'',8)'; //Put some valid default time
            end;
          end;
        end;
        ConvertFieldtoSQLString := temp;
end;

Function ConvertFieldtoMySQLString(FieldStore: TField):String;
var
      temp:String;
begin
        temp := '';
        case TFieldType(Ord(FieldStore.DataType)) of
          ftString, ftGuid, ftWideString:
          begin
            if (FieldStore.AsString ='') or (FieldStore.IsNull) then
               temp :='null'  //Put a default string
            else
               temp := '''' + FixSQLString(FieldStore.AsString) + '''';
          end;

          ftInteger, ftWord, ftSmallint, ftAutoinc, ftLargeint, ftByte:
          begin
            if FieldStore.AsInteger > 0 then
               temp := IntToStr(FieldStore.AsInteger)
            else
            begin
              if FieldStore.IsNull then
                temp := 'null'
              else
                temp := '0';
            end;
          end;
          ftFloat, ftCurrency, ftBCD:
          begin
  //          Showmessage(FloattoStr(FieldStore.AsFloat) + '==' + FloatToLocaleIndependantString(FieldStore.AsFloat));
            if FieldStore.AsFloat <> 0 then
              temp := FloatToLocaleIndependantString(FieldStore.AsFloat)
            else
            begin
              if FieldStore.IsNull then
                temp := 'null'
              else
                temp := '0';
            end;
          end;
          ftBoolean:
          begin
            if not FieldStore.isnull then
            begin
              if FieldStore.Value then
                temp:= '1'
              else
                temp:= '0';
            end
            else
              temp := 'null';
          end;
          ftDate:
          begin
            if (not FieldStore.IsNull) or
               (Length(Trim(FieldStore.AsString)) > 0) then
              temp := 'convert(datetime, ''' + FormatDateTime('yyyy/MM/dd',
                             FieldStore.AsDateTime) + ''',111)'
            else
            begin
              if FieldStore.IsNull then
                temp := 'null'
              else
              temp:= 'convert(datetime, ''1900/01/01'',111)'; //put some valid default date
            end;
          end;
          ftDateTime, ftTimeStamp:
          begin
            if (not FieldStore.IsNull) or
               (Length(Trim(FieldStore.AsString)) > 0) then
              temp := 'convert(datetime, ''' + FormatDateTime('yyyy-MM-dd hh:mm:ss',
                             FieldStore.AsDateTime) + ''',120)'
            else
            begin
              if FieldStore.IsNull then
                temp := 'null'
              else
                temp := 'convert(datetime, ''1900/01/01 00:00:00'',120)';//Put some valid default date and time
            end;
          end;
          ftTime:
          begin
            if (not FieldStore.IsNull) or
               (Length(Trim(FieldStore.AsString)) > 0) then
               temp := 'convert(datetime, ''' + FormatDateTime('hh:mm:ss',
                           FieldStore.AsDateTime) + ''',8)'
            else
            begin
              if FieldStore.IsNull then
                temp := 'null'
              else
                temp := 'convert(datetime, ''00:00:00'',8)'; //Put some valid default time
            end;
          end;
        end;
        ConvertFieldtoMySQLString := temp;
end;

procedure Split
   (const Delimiter: Char;
    Input: string;
    const Strings: TStrings) ;
begin
   Assert(Assigned(Strings)) ;
   Strings.Clear;
   Strings.Delimiter := Delimiter;
   Strings.StrictDelimiter := True;
   Strings.DelimitedText := Input;
end;

Function CalculateBMI(LenghtValue,WeightValue: Extended; WeightUnit, LenghtUnit:String): Extended;
var
        WeightConv,LenghtConv:Extended;
begin
        if (LenghtValue <> 0) and (WeightValue <> 0) then
        begin
          if WeightUnit = 'lbs' then
            WeightConv := WeightValue / 2.2046
          else
            WeightConv := WeightValue;
          if LenghtUnit = 'feet' then
            LenghtConv := (LenghtValue * 30.48) / 100
          else
            LenghtConv := LenghtValue;
          CalculateBMI := WeightConv / (LenghtConv * LenghtConv);
        end
        else
          CalculateBMI := 0;
end;

function FloatToLocaleIndependantString(const v: Extended): string;
//var
//   oldDecimalSeparator: Char;
begin
  GetLocaleFormatSettings(0,myGlobalFormatSettings);
  myGlobalFormatSettings.DecimalSeparator := '.';
//   oldDecimalSeparator := SysUtils.DecimalSeparator;
//   SysUtils.DecimalSeparator := '.'; //Windows formatting functions assume single decimal point
   try
      Result := FloatToStrF(v, ffFixed,
            18, //Precision: "should be 18 or less for values of type Extended"
            9, //Scale 0..18.   Sure...9 digits before decimal mark, 9 digits after. Why not
            myGlobalFormatSettings
      );
   finally
//      SysUtils.DecimalSeparator := oldDecimalSeparator;
   end;
end;

function IsWindows64: Boolean;
type
  TIsWow64Process = function(AHandle:THandle; var AIsWow64: BOOL): BOOL; stdcall;
var
  vKernel32Handle: DWORD;
  vIsWow64Process: TIsWow64Process;
  vIsWow64       : BOOL;
begin
  // 1) assume that we are not running under Windows 64 bit
  Result := False;

  // 2) Load kernel32.dll library
  vKernel32Handle := LoadLibrary('kernel32.dll');
  if (vKernel32Handle = 0) then Exit; // Loading kernel32.dll was failed, just return

  try

    // 3) Load windows api IsWow64Process
    @vIsWow64Process := GetProcAddress(vKernel32Handle, 'IsWow64Process');
    if not Assigned(vIsWow64Process) then Exit; // Loading IsWow64Process was failed, just return

    // 4) Execute IsWow64Process against our own process
    vIsWow64 := False;
    if (vIsWow64Process(GetCurrentProcess, vIsWow64)) then
      Result := vIsWow64;   // use the returned value

  finally
    FreeLibrary(vKernel32Handle);  // unload the library
  end;
end;

end.
