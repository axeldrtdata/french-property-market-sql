-- 09 · Communes with at least 50 sales in Q1 2020
-- WHERE filters rows before grouping, HAVING filters the groups afterwards.
SELECT commune.com_nom_maj AS commune,
       COUNT(ventes.id_vente) AS sales_q1
FROM ventes
JOIN biens   ON ventes.id_bien = biens.id_bien
JOIN commune ON biens.coddep_codcom = commune.coddep_codcom
WHERE ventes.date BETWEEN '2020-01-01' AND '2020-03-31'
GROUP BY commune.coddep_codcom, commune.com_nom_maj
HAVING sales_q1 >= 50
ORDER BY sales_q1 DESC;
