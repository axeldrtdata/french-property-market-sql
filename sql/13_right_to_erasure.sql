-- 13 · Right to erasure (GDPR, article 17): delete one transaction on request
-- No ON DELETE CASCADE by design: rows are deleted explicitly, in the right order,
-- so that nothing is removed by accident. Replace 'v001' with the sale to delete.
BEGIN TRANSACTION;

-- 1. Delete the sale
DELETE FROM ventes
WHERE id_vente = 'v001';

-- 2. Delete the property only if no other sale refers to it
DELETE FROM biens
WHERE id_bien = 'b001'
  AND NOT EXISTS (SELECT 1 FROM ventes WHERE ventes.id_bien = 'b001');

COMMIT;
