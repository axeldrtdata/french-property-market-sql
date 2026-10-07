-- 06 · The 10 most expensive apartments, with their region and Carrez surface
SELECT biens.id_bien,
       biens.surface_carrez,
       ventes.montant,
       commune.com_nom_maj AS commune,
       region.reg_nom      AS region
FROM ventes
JOIN biens   ON ventes.id_bien = biens.id_bien
JOIN commune ON biens.coddep_codcom = commune.coddep_codcom
JOIN region  ON commune.reg_code = region.reg_code
WHERE biens.type_local = 'Appartement'
ORDER BY ventes.montant DESC
LIMIT 10;
