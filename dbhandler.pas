// Pascal database handler
type
  TDatabaseHandler = class
    private
      FConnection: TSQLConnection;
    public
      procedure StoreSensorData(DeviceID: string; Reading: Double);
      function GetHistoricalData(DeviceID: string): TDataSet;
  end;

procedure TDatabaseHandler.StoreSensorData(DeviceID: string; Reading: Double);
begin
  try
    with FConnection.CreateCommand do
    begin
      CommandText := 'INSERT INTO sensor_readings (device_id, reading, timestamp) VALUES (:did, :val, :ts)';
      ParamByName('did').AsString := DeviceID;
      ParamByName('val').AsFloat := Reading;
      ParamByName('ts').AsDateTime := Now;
      Execute;
    end;
  except
    on E: Exception do
      LogError('Database storage failed: ' + E.Message);
  end;
end; <sup data-citation="1" className="inline select-none [&>a]:rounded-2xl [&>a]:border [&>a]:px-1.5 [&>a]:py-0.5 [&>a]:transition-colors shadow [&>a]:bg-ds-bg-subtle [&>a]:text-xs [&>svg]:w-4 [&>svg]:h-4 relative -top-[2px] citation-shimmer"><a href="https://iabac.org/blog/data-engineering-for-internet-of-things-iot-managing-sensor-data-at-scale">1</a></sup><sup data-citation="4" className="inline select-none [&>a]:rounded-2xl [&>a]:border [&>a]:px-1.5 [&>a]:py-0.5 [&>a]:transition-colors shadow [&>a]:bg-ds-bg-subtle [&>a]:text-xs [&>svg]:w-4 [&>svg]:h-4 relative -top-[2px] citation-shimmer"><a href="https://www.geeksforgeeks.org/how-to-design-databases-for-iot-applications/">4</a></sup>

