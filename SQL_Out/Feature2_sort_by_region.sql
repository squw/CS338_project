SELECT tb.primaryTitle, ta.region
FROM title_basics tb
JOIN title_akas ta ON tb.tconst = ta.titleId
WHERE ta.region = 'selected_region';

-- Replace 'selected_region' with the actual region selected by the user.