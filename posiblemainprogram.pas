// Pascal main program
program SensorMonitor;

uses
  SensorUnit, DatabaseUnit, ErrorHandling;

var
  SensorMgr: TSensor;
  DbHandler: TDatabaseHandler;
begin
  try
    SensorMgr := TSensor.Create('TEMP001');
    DbHandler := TDatabaseHandler.Create;
    
    while not Terminated do
    begin
      try
        Reading := SensorMgr.ReadSensorData;
        SensorMgr.ValidateReading(Reading);
        DbHandler.StoreSensorData(SensorMgr.DeviceID, Reading);
      except
        on E: ESensorException do
          LogError('Sensor error: ' + E.Message);
        on E: EDatabaseException do
          LogError('Database error: ' + E.Message);
      end;
      Sleep(1000); // 1 second interval
    end;
  finally
    SensorMgr.Free;
    DbHandler.Free;
  end;
end. <sup data-citation="1" className="inline select-none [&>a]:rounded-2xl [&>a]:border [&>a]:px-1.5 [&>a]:py-0.5 [&>a]:transition-colors shadow [&>a]:bg-ds-bg-subtle [&>a]:text-xs [&>svg]:w-4 [&>svg]:h-4 relative -top-[2px] citation-shimmer"><a href="https://iabac.org/blog/data-engineering-for-internet-of-things-iot-managing-sensor-data-at-scale">1</a></sup><sup data-citation="4" className="inline select-none [&>a]:rounded-2xl [&>a]:border [&>a]:px-1.5 [&>a]:py-0.5 [&>a]:transition-colors shadow [&>a]:bg-ds-bg-subtle [&>a]:text-xs [&>svg]:w-4 [&>svg]:h-4 relative -top-[2px] citation-shimmer"><a href="https://www.geeksforgeeks.org/how-to-design-databases-for-iot-applications/">4</a></sup>

