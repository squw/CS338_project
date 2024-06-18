SELECT tb.primaryTitle, ta.region
FROM titleBasics tb
JOIN titleAkas ta ON tb.tconst = ta.titleId
WHERE ta.region = 'selected_region';

-- Replace 'selected_region' with the actual region selected by the user.