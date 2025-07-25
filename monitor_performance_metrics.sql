-- monitor_performance_metrics.sql
-- Monitors system performance by pulling CPU and memory usage from metrics table

SELECT
    server_name,
    cpu_usage_percent,
    memory_usage_percent,
    timestamp
FROM
    system_performance_metrics
WHERE
    timestamp >= DATEADD(hour, -6, GETDATE())
ORDER BY
    timestamp DESC;
