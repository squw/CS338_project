SELECT tb.primaryTitle, ta.language
FROM titleBasics tb
JOIN titleAkas ta ON tb.tconst = ta.titleId
WHERE ta.language = 'selected_language';

-- Replace 'selected_language' with the actual language selected by the user.
