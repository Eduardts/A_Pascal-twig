// Data visualization using D3.js
class DataVisualizer {
    constructor(containerId) {
        this.container = d3.select(`#${containerId}`);
        this.margin = {top: 20, right: 20, bottom: 30, left: 50};
        this.width = 960 - this.margin.left - this.margin.right;
        this.height = 500 - this.margin.top - this.margin.bottom;
    }

    createChart(data) {
        const svg = this.container.append('svg')
            .attr('width', this.width + this.margin.left + this.margin.right)
            .attr('height', this.height + this.margin.top + this.margin.bottom)
            .append('g')
            .attr('transform', `translate(${this.margin.left},${this.margin.top})`);

        // Add visualization logic here
        this.updateChart(data);
    }

    updateChart(newData) {
        // Update visualization with new sensor data
        try {
            // Chart update logic
        } catch (error) {
            console.error('Visualization update failed:', error);
            this.handleVisualizationError(error);
        }
    }
} <sup data-citation="2" className="inline select-none [&>a]:rounded-2xl [&>a]:border [&>a]:px-1.5 [&>a]:py-0.5 [&>a]:transition-colors shadow [&>a]:bg-ds-bg-subtle [&>a]:text-xs [&>svg]:w-4 [&>svg]:h-4 relative -top-[2px] citation-shimmer"><a href="https://thinglabs.io/visualizing-iot-data-with-web-app">2</a></sup><sup data-citation="3" className="inline select-none [&>a]:rounded-2xl [&>a]:border [&>a]:px-1.5 [&>a]:py-0.5 [&>a]:transition-colors shadow [&>a]:bg-ds-bg-subtle [&>a]:text-xs [&>svg]:w-4 [&>svg]:h-4 relative -top-[2px] citation-shimmer"><a href="https://www.slingacademy.com/article/read-device-data-using-various-sensors-with-the-sensor-api-in-javascript/">3</a></sup>

