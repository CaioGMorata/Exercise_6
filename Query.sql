SELECT DISTINCT
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
        WHEN n.Grade >= 8 THEN -n.Grade -- Ordem decrescente para notas >= 8. Descending order for grades >= 8.
        ELSE -n.Grade                   -- Ordem crescente para notas < 8. Ascending order for grades < 8.
    END,
    CASE 
        WHEN n.Grade >= 8 THEN s.Name  -- Ordem alfabética para nomes (grade >= 8). Alphabetical order for names (grid >= 8).
        ELSE s.Value                   -- Ordem crescente para notas < 8. Ascending order for grades < 8.
    END;
