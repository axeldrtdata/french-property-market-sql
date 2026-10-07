-- 05 · Average price per m² of a house in Île-de-France (built surface: Carrez does not apply to houses)
SELECT ROUND(AVG(ventes.montant / biens.surface), 0) AS avg_price_m2_house_idf
FROM ventes
JOIN biens   ON ventes.id_bien = biens.id_bien
JOIN commune ON biens.coddep_codcom = commune.coddep_codcom
JOIN region  ON commune.reg_code = region.reg_code
WHERE biens.type_local = 'Maison'
  AND region.reg_nom = 'Ile-de-France';   -- label stored without accent in the reference data
