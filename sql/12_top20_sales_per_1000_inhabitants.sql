-- 12 · Top 20 communes over 10,000 inhabitants by sales per 1,000 inhabitants
SELECT commune.dep_nom AS department,
       commune.com_nom_maj AS commune,
       ROUND(COUNT(ventes.id_vente) * 1000.0 / commune.population, 2) AS sales_per_1000
FROM ventes
JOIN biens   ON ventes.id_bien = biens.id_bien
JOIN commune ON biens.coddep_codcom = commune.coddep_codcom
WHERE commune.population > 10000
GROUP BY commune.coddep_codcom, commune.dep_nom, commune.com_nom_maj, commune.population
ORDER BY sales_per_1000 DESC
LIMIT 20;
