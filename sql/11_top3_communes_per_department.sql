-- 11 · Top 3 communes by average sale value in departments 06, 13, 33, 59 and 69
-- ROW_NUMBER() restarts the ranking for each department thanks to PARTITION BY.
WITH ranked AS (
    SELECT biens.code_dep,
           commune.com_nom_maj AS commune,
           ROUND(AVG(ventes.montant), 0) AS avg_sale_value,
           ROW_NUMBER() OVER (
               PARTITION BY biens.code_dep
               ORDER BY AVG(ventes.montant) DESC
           ) AS rank_in_department
    FROM ventes
    JOIN biens   ON ventes.id_bien = biens.id_bien
    JOIN commune ON biens.coddep_codcom = commune.coddep_codcom
    WHERE biens.code_dep IN ('06', '13', '33', '59', '69')
    GROUP BY biens.code_dep, commune.coddep_codcom, commune.com_nom_maj
)
SELECT code_dep, commune, avg_sale_value
FROM ranked
WHERE rank_in_department <= 3
ORDER BY code_dep, avg_sale_value DESC;
