🎮 Steam Market Analysis: Data Cleaning & InsightsÉtude de cas réalisée dans le cadre du Certificat Professionnel Google Data Analytics📌 Présentation du ProjetL'objectif de cette étude est d'analyser les facteurs de succès des jeux vidéo sur la plateforme Steam. En utilisant SQL pour le nettoyage et l'analyse, j'ai cherché à identifier quels genres et quelles stratégies de prix maximisent la satisfaction des joueurs.🛠️ Phase 1 : ASK (Poser les questions)Problématique : Comment un studio de développement peut-il optimiser son lancement sur un marché saturé ?Quelles combinaisons de genres affichent les meilleurs taux de satisfaction ?Le prix de vente influence-t-il la perception de qualité (success rate) ?📥 Phase 2 : PREPARE (Préparer)Source des données : Dataset public Steam (données extraites via API).Outils utilisés : * MySQL Workbench (Nettoyage et requêtes complexes).VS Code (Rédaction du rapport et scripts).Google Sheets (Visualisation de données).🧹 Phase 3 : PROCESS (Nettoyer)Le dataset présentait des incohérences de formatage (dates textuelles, listes Python dans les colonnes). Voici les étapes clés de nettoyage SQL :1. Standardisation des datesSQL-- Transformation du texte ISO en type DATE réel
UPDATE games_cleaned 
SET release_date_fixed = CAST(release_date AS DATE)
WHERE release_date REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$';
2. Nettoyage syntaxique des genres et développeursSQL-- Suppression des résidus de listes Python ['...']
UPDATE games_cleaned 
SET developers = REPLACE(REPLACE(REPLACE(developers, "['", ""), "']", ""), "'", ""),
    genres = REPLACE(REPLACE(REPLACE(genres, "['", ""), "']", ""), "'", "");
3. Création d'indicateurs calculés (KPIs)SQL-- Ajout du taux de succès (Success Rate)
ALTER TABLE games_cleaned ADD COLUMN success_rate DECIMAL(5,2);

UPDATE games_cleaned 
SET success_rate = (positive / (positive + negative)) * 100
WHERE (positive + negative) > 0;
📊 Phase 4 : ANALYZE (Analyser)1. Analyse des Genres les plus performantsLes données révèlent que les jeux hybrides (mélangeant plusieurs genres) ont un meilleur taux d'approbation :Mix de GenresNombre de JeuxSatisfaction MoyenneAction, Indie, Racing17277.02%Action, Casual, Indie, Sports15473.32%Indie, RPG, Strategy40173.12%
