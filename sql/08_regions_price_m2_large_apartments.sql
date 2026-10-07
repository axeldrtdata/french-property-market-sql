-- 08 · Regions ranked by average price per m² of apartments with more than 4 rooms
SELECT region.reg_nom AS region,
       ROUND(AVG(ventes.montant / biens.surface_carrez), 0) AS avg_price_m2
FROM ventes
JOIN biens   ON ventes.id_bien = biens.id_bien
JOIN commune ON biens.coddep_codcom = commune.coddep_codcom
JOIN region  ON commune.reg_code = region.reg_code
WHERE biens.type_local = 'Appartement'
  AND biens.nombre_pieces_principales > 4
GROUP BY region.reg_nom
ORDER BY avg_price_m2 DESC;
