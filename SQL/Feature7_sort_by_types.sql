SELECT tb.primaryTitle, ta.types
FROM titleBasics tb
JOIN titleAkas ta ON tb.tconst = ta.titleId
WHERE ta.types = 'selected_types';

-- Replace 'selected_types' with the actual language selected by the user.