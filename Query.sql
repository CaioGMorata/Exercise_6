SELECT 
    CASE 
        WHEN n.Grade >= 8 THEN s.Name 
        ELSE 'NULL' 
    END AS Name,
    n.Grade,
    s.Value
FROM 
    Students s
INNER JOIN 
    Notes n
ON 
    s.Value BETWEEN n.Min_Value AND n.Max_Value
ORDER BY 
    CASE 
        WHEN n.Grade >= 8 THEN -n.Grade -- Descending order for grades >= 8
        ELSE n.Grade                   -- Ascending order for grades < 8
    END,
    CASE 
        WHEN n.Grade >= 8 THEN s.Name  -- Alphabetical order for names (grade >= 8)
        ELSE s.Value                   -- Order by value for grade < 8
    END;
