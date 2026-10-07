-- 01 · Number of apartments sold in the first half of 2020
SELECT COUNT(*) AS apartments_sold
FROM ventes
JOIN biens ON ventes.id_bien = biens.id_bien
WHERE biens.type_local = 'Appartement'
  AND ventes.date BETWEEN '2020-01-01' AND '2020-06-30';
