-- 10 · Difference in price per m² between 2-room and 3-room apartments
WITH prices AS (
    SELECT
        AVG(CASE WHEN nombre_pieces_principales = 2 THEN montant / surface_carrez END) AS price_2_rooms,
        AVG(CASE WHEN nombre_pieces_principales = 3 THEN montant / surface_carrez END) AS price_3_rooms
    FROM ventes
    JOIN biens ON ventes.id_bien = biens.id_bien
    WHERE type_local = 'Appartement'
)
SELECT ROUND(price_2_rooms, 0) AS price_2_rooms,
       ROUND(price_3_rooms, 0) AS price_3_rooms,
       ROUND((price_3_rooms - price_2_rooms) * 100.0 / price_2_rooms, 2) AS difference_pct
FROM prices;
