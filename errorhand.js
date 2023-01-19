// Error handling and session management
class SessionManager {
    constructor() {
        this.session = null;
    }

    async initializeSession() {
        try {
            const response = await fetch('/api/session/init', {
                credentials: 'include',
                headers: {
                    'Content-Type': 'application/json'
                }
            });
            if (!response.ok) throw new Error('Session initialization failed');
            this.session = await response.json();
        } catch (error) {
            console.error('Session error:', error);
            throw error;
        }
    }
} <sup data-citation="5" className="inline select-none [&>a]:rounded-2xl [&>a]:border [&>a]:px-1.5 [&>a]:py-0.5 [&>a]:transition-colors shadow [&>a]:bg-ds-bg-subtle [&>a]:text-xs [&>svg]:w-4 [&>svg]:h-4 relative -top-[2px] citation-shimmer"><a href="https://dev.to/saint_vandora/how-to-implement-session-management-in-nodejs-applications-5emm">5</a></sup><sup data-citation="7" className="inline select-none [&>a]:rounded-2xl [&>a]:border [&>a]:px-1.5 [&>a]:py-0.5 [&>a]:transition-colors shadow [&>a]:bg-ds-bg-subtle [&>a]:text-xs [&>svg]:w-4 [&>svg]:h-4 relative -top-[2px] citation-shimmer"><a href="https://codezup.com/javascript-iot-practical-guide/">7</a></sup>

