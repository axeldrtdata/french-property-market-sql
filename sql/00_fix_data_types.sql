-- 00 · Data types for SQLite, run once before the queries
-- The source files store some values in French formats that SQLite cannot use as is:
--   1. dates written with slashes (2020/01/02) are converted to ISO format (2020-01-02),
--      so that filters such as BETWEEN '2020-01-01' AND '2020-06-30' work;
--   2. Carrez surfaces written with a decimal comma ('48,22') are converted to numbers;
--   3. sale amounts written with a decimal comma are converted to numbers too.

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
