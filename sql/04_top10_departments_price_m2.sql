-- 04 · Top 10 departments by average price per m² (Carrez surface, all properties as in the brief)
SELECT commune.dep_code AS department_code,
       commune.dep_nom  AS department,
       ROUND(AVG(ventes.montant / biens.surface_carrez), 0) AS avg_price_m2
FROM ventes
JOIN biens   ON ventes.id_bien = biens.id_bien
JOIN commune ON biens.coddep_codcom = commune.coddep_codcom
GROUP BY commune.dep_code, commune.dep_nom
ORDER BY avg_price_m2 DESC
LIMIT 10;
