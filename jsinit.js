// JavaScript initialization
document.addEventListener('DOMContentLoaded', async () => {
    const sensorManager = new SensorManager();
    const sessionManager = new SessionManager();
    const visualizer = new DataVisualizer('chart-container');

    try {
        await sessionManager.initializeSession();
        const sensorData = await sensorManager.readSensorData();
        visualizer.createChart(sensorData);

        // Set up real-time updates
        setInterval(async () => {
            const newData = await sensorManager.readSensorData();
            visualizer.updateChart(newData);
        }, 5000); // Update every 5 seconds
    } catch (error) {
        console.error('Application initialization failed:', error);
        // Handle initialization error
    }
}); <sup data-citation="2" className="inline select-none [&>a]:rounded-2xl [&>a]:border [&>a]:px-1.5 [&>a]:py-0.5 [&>a]:transition-colors shadow [&>a]:bg-ds-bg-subtle [&>a]:text-xs [&>svg]:w-4 [&>svg]:h-4 relative -top-[2px] citation-shimmer"><a href="https://thinglabs.io/visualizing-iot-data-with-web-app">2</a></sup><sup data-citation="6" className="inline select-none [&>a]:rounded-2xl [&>a]:border [&>a]:px-1.5 [&>a]:py-0.5 [&>a]:transition-colors shadow [&>a]:bg-ds-bg-subtle [&>a]:text-xs [&>svg]:w-4 [&>svg]:h-4 relative -top-[2px] citation-shimmer"><a href="https://blog.pixelfreestudio.com/how-to-integrate-iot-devices-with-web-applications-using-apis/">6</a></sup>

