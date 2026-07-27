-- PROJET : Analyse du marché Steam (Google Data Analytics)
-- ETAPE : Nettoyage et Préparation des données

-- 1. Nettoyage des dates (Conversion du texte en format DATE)
UPDATE games_cleaned 
SET release_date_fixed = CAST(release_date AS DATE)
WHERE release_date REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$';

-- 2. Nettoyage des colonnes 'genres' et 'developers' 
-- (Suppression des crochets [' '] issus de l'export Python)
UPDATE games_cleaned 
SET developers = REPLACE(REPLACE(REPLACE(developers, "['", ""), "']", ""), "'", ""),
    genres = REPLACE(REPLACE(REPLACE(genres, "['", ""), "']", ""), "'", "");

-- 3. Création du KPI 'success_rate' (Taux de satisfaction)
ALTER TABLE games_cleaned ADD COLUMN success_rate DECIMAL(5,2);

UPDATE games_cleaned 
SET success_rate = (positive / (positive + negative)) * 100
WHERE (positive + negative) > 0;

-- 4. Analyse : Top 5 des combinaisons de genres par satisfaction
SELECT genres, COUNT(*) as nb_jeux, AVG(success_rate) as avg_satisfaction
FROM games_cleaned
GROUP BY genres
HAVING nb_jeux > 50
ORDER BY avg_satisfaction DESC
LIMIT 5;