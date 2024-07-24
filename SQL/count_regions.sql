SELECT region, count(*) as `count`
FROM title_akas
WHERE region IS NOT NULL
GROUP BY region
ORDER BY `count` DESC
LIMIT :num_regions;

