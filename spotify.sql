--9. For each album, calculate the total views of all associated tracks.
SELECT 
	album,
	track,
	SUM(views)
	FROM spotify
GROUP BY 1, 2
ORDER BY 3 DESC;

--10. Retrieve the track names that have been streamed on Spotify more than YouTube.
SELECT * FROM (SELECT 
	track,
	--most_played_on,
	COALESCE(SUM(CASE WHEN most_played_on = 'Youtube' THEN stream END),0) as streamed_on_youtube,
	COALESCE(SUM(CASE WHEN most_played_on = 'Spotify' THEN stream END), 0) as streamed_on_spotify
	
	FROM spotify
	GROUP BY 1) as t1
	WHERE streamed_on_spotify > streamed_on_youtube
	AND 
	streamed_on_youtube <> 0 ;


/*
1 Find the top 3 most-viewed tracks for each artist using window functions.
2 Write a query to find tracks where the liveness score is above the average.
3 Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.*/


WITH ranking_artist 
AS

(SELECT 
	artist, 
	track,
	SUM(views) as total_views,
	DENSE_RANK() OVER(PARTITION BY artist ORDER BY SUM(views) DESC) as rank
FROM spotify
GROUP BY 1, 2
ORDER BY 1, 3 DESC
)
SELECT * FROM ranking_artist
WHERE rank <= 3;

--2 Write a query to find tracks where the liveness score is above the average.





-- SELECT 
-- 	track,
-- 	liveness
-- FROM spotify
-- GROUP BY 1,2
-- ORDER BY 1,2;

SELECT 
	track,
	artist,
	liveness
FROM spotify
WHERE liveness > ( SELECT AVG(liveness) FROM spotify);

-- SELECT AVG(liveness) FROM spotify; --0.19367208624708632


-- 3 Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.*/
WITH cte
AS
(SELECT
	album,
	MAX(energy) as highest_energy,
	MIN(energy) as lowest_energy
	
FROM spotify
GROUP BY 1)
SELECT 
	album,
	highest_energy - lowest_energy as energy_diff
FROM cte
ORDER BY 2 DESC;

--Find tracks where the energy-to-liveness ratio is greater than 1.2.
SELECT energy/liveness > 1.2 as ratio FROM spotify;

WITH ratio
AS(
SELECT 
	track,
	energy,
	liveness,
	energy/liveness > 1.2 as ratio
FROM spotify  
GROUP BY 1,2,3
ORDER BY 1,2
)
SELECT 
	track,
	ratio
FROM ratio
ORDER BY 2 DESC;

--Calcu
SELECT 
	track,
	views,
	likes
FROM spotify
GROUP BY 1,2,3
ORDER BY 2 DESC
