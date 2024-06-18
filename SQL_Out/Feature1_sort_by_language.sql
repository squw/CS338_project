SELECT tb.primaryTitle, ta.language
FROM title_basics tb
JOIN title_akas ta ON tb.tconst = ta.titleId
WHERE ta.language = 'selected_language';

-- Replace 'selected_language' with the actual language selected by the user.
