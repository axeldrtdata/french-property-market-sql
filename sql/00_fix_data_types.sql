-- 00 · Fix data types before any analysis
-- Three issues found when auditing the loaded data:
--   1. dates are stored as text with slashes (2020/01/02), so ISO filters such as
--      BETWEEN '2020-01-01' AND '2020-06-30' silently return nothing;
--   2. most Carrez surfaces are stored as text with a decimal comma ('48,22'),
--      which SQLite truncates to 48 in calculations;
--   3. 237 sale amounts are text with a decimal comma, which also breaks sorting
--      (text values sort above numbers in SQLite).

UPDATE ventes
SET date = replace(date, '/', '-');

UPDATE biens
SET surface_carrez = CAST(replace(surface_carrez, ',', '.') AS REAL)
WHERE typeof(surface_carrez) = 'text' AND surface_carrez <> '';

UPDATE biens
SET surface_carrez = NULL
WHERE surface_carrez = '';

UPDATE ventes
SET montant = CAST(replace(montant, ',', '.') AS REAL)
WHERE typeof(montant) = 'text';

-- Checks: every value should now be of the expected type
SELECT 'date' AS field, typeof(date) AS type, count(*) AS n FROM ventes GROUP BY typeof(date)
UNION ALL
SELECT 'montant', typeof(montant), count(*) FROM ventes GROUP BY typeof(montant)
UNION ALL
SELECT 'surface_carrez', typeof(surface_carrez), count(*) FROM biens GROUP BY typeof(surface_carrez);
