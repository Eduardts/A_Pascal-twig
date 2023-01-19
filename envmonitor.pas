// envmonitor.pas
unit EnvMonitor;

interface

uses
  Classes, SysUtils;

type
  TSensorReader = class
  private
    FAQIIndex: Integer;
    FTemperature: Double;
    FHumidity: Double;
  public
    function ReadAirQuality: Integer;
    function ReadTemperature: Double;
    function ReadHumidity: Double;
    function CalculateAQI(PM25: Double): Integer;
    property AQIIndex: Integer read FAQIIndex;
  end;

implementation

function TSensorReader.ReadAirQuality;
begin
  // Implementation for reading PM2.5 sensor
  // Similar to the implementation in citation 1
  Result := CalculateAQI(ReadPM25Value);
end;

function TSensorReader.CalculateAQI(PM25: Double): Integer;
begin
  // AQI calculation based on PM2.5 values
  // Implementation similar to citation 1
  if (PM25 >= 0) and (PM25 < 12.1) then
    Result := Linear(50, 0, 12, 0, PM25)
  else if (PM25 >= 12.1) and (PM25 < 35.5) then
    Result := Linear(100, 51, 35.4, 12.1, PM25)
  // Add more ranges as needed
end;

