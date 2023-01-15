
SELECT created_at, 
	COUNT(CASE WHEN event_name = 'post' 1 ELSE null END) * 1.00 / 
	COUNT (CASE WHEN event_name = 'enter' 1 ELSE null END) * 100 AS percent_success
FROM post_events
GROUP BY created_at
ORDER BY created_at;

