-- 03 · Share of apartment sales by number of main rooms
-- The denominator comes from a subquery with the same filters (rooms > 0 excludes anomalies).
SELECT biens.nombre_pieces_principales AS rooms,
       COUNT(*) AS sales,
       ROUND(COUNT(*) * 100.0 / (
           SELECT COUNT(*)
           FROM ventes v2
           JOIN biens b2 ON v2.id_bien = b2.id_bien
           WHERE b2.type_local = 'Appartement' AND b2.nombre_pieces_principales > 0
       ), 2) AS share_pct
FROM ventes
JOIN biens ON ventes.id_bien = biens.id_bien
WHERE biens.type_local = 'Appartement'
  AND biens.nombre_pieces_principales > 0
GROUP BY biens.nombre_pieces_principales
ORDER BY share_pct DESC;
