// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://www.ncomp.co.za/Utils/server.php?wsdl
//  >Import : http://www.ncomp.co.za/Utils/server.php?wsdl:0
// Encoding : ISO-8859-1
// Version  : 1.0
// (2012/09/25 08:32:54 PM - - $Rev: 10138 $)
// ************************************************************************ //

unit server;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[]


  // ************************************************************************ //
  // Namespace : urn:getregister
  // soapAction: urn:getregister#GetKey
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : getregisterBinding
  // service   : getregister
  // port      : getregisterPort
  // URL       : http://www.ncomp.co.za/Utils/server.php
  // ************************************************************************ //
  getregisterPortType = interface(IInvokable)
  ['{7D8D5353-2BDC-67D5-4FBF-B6FF3FACCBA1}']
    function  GetKey(const PassChar: WideString; const LicenceID: WideString; const Software: WideString): WideString; stdcall;
  end;

function GetgetregisterPortType(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): getregisterPortType;


implementation
  uses SysUtils;

function GetgetregisterPortType(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): getregisterPortType;
const
  defWSDL = 'http://www.ncomp.co.za/Utils/server.php?wsdl';
  defURL  = 'http://www.ncomp.co.za/Utils/server.php';
  defSvc  = 'getregister';
  defPrt  = 'getregisterPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as getregisterPortType);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(getregisterPortType), 'urn:getregister', 'ISO-8859-1');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(getregisterPortType), 'urn:getregister#GetKey');

end.