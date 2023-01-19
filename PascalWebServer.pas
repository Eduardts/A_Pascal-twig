program PascalWebServer;

{$mode objfpc}{$H+}

uses
  SysUtils, fpHTTPServer, Classes, HTTPDefs, TemplateHandler; fphttp, fpmimetypes,
  // Add new units for environmental monitoring
  EnvMonitor, IAMSystem;


type
  TMyServer = class(TFPHTTPServer)
  protected
    procedure RequestHandler(Sender: TObject; 
                           var ARequest: TFPHTTPConnectionRequest;
                           var AResponse: TFPHTTPConnectionResponse); 
  end;
type
  TEnvironmentalData = record
    Temperature: Double;
    Humidity: Double;
    AirQuality: Integer;
    Timestamp: TDateTime;
  end;
  TUser = record
    Username: string;
    PasswordHash: string;
    Role: string; // Admin, User, Guest
    LastLogin: TDateTime;
  end;


TMyServer = class(TFPHTTPServer)
private
  EnvironmentalData: array of TEnvironmentalData;
  Users: array of TUser;
  function GetSensorData: TEnvironmentalData;
  function AuthenticateUser(Username, Password: string): Boolean;
  function GetUserRole(Username: string): string;
public
  procedure HandleRequest(var ARequest: TFPHTTPConnectionRequest;
    var AResponse: TFPHTTPConnectionResponse); override;
    
procedure 
TMyServer.RequestHandler(Sender: TObject;
                                 var ARequest: TFPHTTPConnectionRequest;
                                 var AResponse: TFPHTTPConnectionResponse);
var
  Template: TTemplateHandler;
  TemplateContent: string;
begin
  Template := TTemplateHandler.Create;
  try
    // Load the template file
    TemplateContent := Template.LoadTemplate('index.html.twig');
    
    // Set template variables
    Template.Variables.Values['title'] := 'Twig-Wordpress Example';
    Template.Variables.Values['content'] := 'To use your own templates, consult the README.';
    
        // Additional variables
    Template.Variables.Values['action'] := '/submit';                  // The action for the form
    Template.Variables.Values['message'] := 'Success!';                // Example message
    Template.Variables.Values['error'] := 'An error occurred!';        // Example error
    Template.Variables.Values['nonce'] := '<input type="hidden" name="nonce" value="YOUR_NONCE_HERE">'; // Example nonce
    Template.Variables.Values['name'] := 'template_selector';          // Example name for select input

    // Example data for the dropdown (customize as needed)
    Template.Variables.Values['templates'] := '[["file1", "Template One"], ["file2", "Template Two"]]'; 
//    TemplatesHTML := '';
//    TemplatesHTML := TemplatesHTML + '<option value="">Default Template</option>';
//    TemplatesHTML := TemplatesHTML + '<option value="file1">Template One</option>';
//    TemplatesHTML := TemplatesHTML + '<option value="file2">Template Two</option>';
//    // Assign to template variable
//    Template.Variables.Values['templates'] := TemplatesHTML;

    // Process the template
    TemplateContent := Template.ReplaceVariables(TemplateContent);
    // Set HTTP response
    AResponse.ContentType := 'text/html';
    AResponse.Content := TemplateContent;
  finally
    Template.Free;
  end;
end;

var
  Server: TMyServer;

begin
  Server := TMyServer.Create(nil);
  try
    Server.OnRequest := @Server.RequestHandler;
    Server.Port := 8080;
    Writeln('Server listening on port 8080...');
    Server.Active := True;
    ReadLn;
  finally
    Server.Free;
  end;
end.

