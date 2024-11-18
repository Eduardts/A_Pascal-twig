unit TemplateHandler;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TTemplateHandler = class
  private
    FTemplateFile: string;
    FVariables: TStringList;
  public
    constructor Create;
    destructor Destroy; override;
    function LoadTemplate(const FileName: string): string;
    function ReplaceVariables(const Template: string): string;
    property Variables: TStringList read FVariables;
    property TemplateFile: string read FTemplateFile write FTemplateFile;
  end;

implementation

constructor TTemplateHandler.Create;
begin
  inherited Create;
  FVariables := TStringList.Create;
end;

destructor TTemplateHandler.Destroy;
begin
  FVariables.Free;
  inherited Destroy;
end;

function TTemplateHandler.LoadTemplate(const FileName: string): string;
var
  FileStream: TFileStream;
  StreamReader: TStringList;
begin
  Result := '';
  if FileExists(FileName) then
  begin
    StreamReader := TStringList.Create;
    try
      StreamReader.LoadFromFile(FileName);
      Result := StreamReader.Text;
    finally
      StreamReader.Free;
    end;
  end;
end;

function TTemplateHandler.ReplaceVariables(const Template: string): string;
var
  i: Integer;
  TempResult: string;
begin
  TempResult := Template;
  for i := 0 to FVariables.Count - 1 do
  begin
    TempResult := StringReplace(TempResult, 
                              '{{ ' + FVariables.Names[i] + ' }}',
                              FVariables.ValueFromIndex[i],
                              [rfReplaceAll]);
  end;
  Result := TempResult;
end;

end.

