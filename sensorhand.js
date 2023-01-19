// JavaScript sensor handling
class SensorManager {
    constructor() {
        this.sensors = new Map();
        this.webSocket = new WebSocket('ws://localhost:8080/sensors');
    }

    async readSensorData() {
        try {
            const response = await fetch('/api/sensors/data');
            return await response.json();
        } catch (error) {
            console.error('Sensor reading failed:', error);
            throw error;
        }
    }
} <sup data-citation="1" className="inline select-none [&>a]:rounded-2xl [&>a]:border [&>a]:px-1.5 [&>a]:py-0.5 [&>a]:transition-colors shadow [&>a]:bg-ds-bg-subtle [&>a]:text-xs [&>svg]:w-4 [&>svg]:h-4 relative -top-[2px] citation-shimmer"><a href="https://iabac.org/blog/data-engineering-for-internet-of-things-iot-managing-sensor-data-at-scale">1</a></sup><sup data-citation="6" className="inline select-none [&>a]:rounded-2xl [&>a]:border [&>a]:px-1.5 [&>a]:py-0.5 [&>a]:transition-colors shadow [&>a]:bg-ds-bg-subtle [&>a]:text-xs [&>svg]:w-4 [&>svg]:h-4 relative -top-[2px] citation-shimmer"><a href="https://blog.pixelfreestudio.com/how-to-integrate-iot-devices-with-web-applications-using-apis/">6</a></sup>

