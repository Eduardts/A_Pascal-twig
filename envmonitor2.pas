// Pascal sensor integration code
type
  TSensor = class
    private
      FDeviceID: string;
      FLastReading: Double;
    public
      constructor Create(DeviceID: string);
      function ReadSensorData: Double;
      procedure ValidateReading(Value: Double);
  end;

procedure TSensor.ValidateReading(Value: Double);
begin
  if (Value < -50) or (Value > 100) then
    raise ESensorException.Create('Invalid sensor reading');
end;

