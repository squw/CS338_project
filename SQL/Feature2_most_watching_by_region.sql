SELECT
    tb.tconst,
    tb.primaryTitle,
    ta.region,
    tr.numVotes as watchCount
FROM
    title_basics AS tb
    JOIN title_ratings AS tr ON tb.tconst = tr.tconst
    JOIN title_akas AS ta ON tb.tconst = ta.titleId
WHERE
    ta.region = :region
ORDER BY
    watchCount DESC
LIMIT 20;