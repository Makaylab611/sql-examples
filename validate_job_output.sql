-- validate_job_output.sql
-- Checks if recent batch jobs completed successfully in the last 24 hours

SELECT
    job_name,
    status,
    start_time,
    end_time,
    DATEDIFF(minute, start_time, end_time) AS duration_minutes
FROM
    job_execution_log
WHERE
    execution_date >= DATEADD(day, -1, GETDATE())
    AND status IN ('SUCCESS', 'FAILED')
ORDER BY
    end_time DESC;
