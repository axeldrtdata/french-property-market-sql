-- 02 · Apartment sales by region, first half of 2020
SELECT region.reg_nom AS region,
       COUNT(*) AS apartment_sales
FROM ventes
JOIN biens   ON ventes.id_bien = biens.id_bien
JOIN commune ON biens.coddep_codcom = commune.coddep_codcom
JOIN region  ON commune.reg_code = region.reg_code
WHERE biens.type_local = 'Appartement'
  AND ventes.date BETWEEN '2020-01-01' AND '2020-06-30'
GROUP BY region.reg_nom
ORDER BY apartment_sales DESC;
