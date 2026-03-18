# 🎮 Étude de Cas : Analyse du Marché Steam (2026)
### *Projet réalisé pour le Certificat Professionnel Google Data Analytics*

## 📌 1. PHASE : ASK (Poser les questions)
**Objectif :** Aider un studio indépendant à identifier les opportunités de succès sur Steam.
* **Question de recherche 1 :** Quelles combinaisons de genres affichent les meilleurs taux de satisfaction (Success Rate) ?
* **Question de recherche 2 :** Existe-t-il un "prix idéal" qui maximise l'approbation des joueurs ?

---

## 📥 2. PHASE : PREPARE (Préparer)
* **Dataset :** Données extraites de l'API Steam (format CSV).
* **Outils :** * **SQL (MySQL) :** Pour le nettoyage lourd et l'analyse statistique.
    * **VS Code :** Pour l'organisation des scripts et la rédaction Markdown.
    * **Google Sheets :** Pour la visualisation des tendances.

---

## 🧹 3. PHASE : PROCESS (Nettoyer)
Le dataset brut présentait des incohérences majeures que j'ai corrigées via SQL.

### A. Normalisation des Dates
Les dates étaient au format texte ISO. Je les ai converties en type `DATE` pour permettre les analyses temporelles.
```sql
UPDATE games_cleaned 
SET release_date_fixed = CAST(release_date AS DATE)
WHERE release_date REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$';
```

### B. Nettoyage des résidus de listes (String Cleaning)
Suppression des crochets `[' ']` hérités de l'export Python dans les colonnes `genres` et `developers`.
```sql
UPDATE games_cleaned 
SET developers = REPLACE(REPLACE(REPLACE(developers, "['", ""), "']", ""), "'", ""),
    genres = REPLACE(REPLACE(REPLACE(genres, "['", ""), "']", ""), "'", "");
```

### C. Calcul des KPIs (Indicateurs de Performance)
Création d'une métrique de satisfaction normalisée.
```sql
ALTER TABLE games_cleaned ADD COLUMN success_rate DECIMAL(5,2);

UPDATE games_cleaned 
SET success_rate = (positive / (positive + negative)) * 100
WHERE (positive + negative) > 0;
```

---

## 📊 4. PHASE : ANALYZE (Analyser)

### A. Analyse de la Satisfaction par Genre
Les données montrent que les genres de niche hybrides sur-performent les genres généralistes :

| Mix de Genres | Nombre de Jeux | Satisfaction Moyenne |
| :--- | :--- | :--- |
| **Action, Indie, Racing** | 172 | **77.02%** |
| **Action, Casual, Indie, Sports** | 154 | **73.32%** |
| **Action, Indie, Sports** | 143 | **73.24%** |
| **Indie, RPG, Strategy** | 401 | **73.12%** |

### B. Analyse de la Cohérence Prix / Score
* **Jeux Gratuits :** Volume élevé, mais satisfaction très variable.
* **Jeux Mid-range (10-30€) :** Offrent la meilleure stabilité de notes, suggérant une qualité de production supérieure et une communauté plus engagée.

---

## 📈 5. PHASE : SHARE & ACT (Partager et Agir)

### Insights Clés :
1.  **Potentiel de Niche :** Les jeux hybrides mélangeant **Action** et **Sports/Racing** sont moins nombreux sur le marché mais reçoivent systématiquement de meilleures notes que les "Action" purs.
2.  **Stratégie Tarifaire :** Un prix situé entre **14.99€ et 24.99€** semble être le "sweet spot" pour signaler la qualité tout en restant accessible aux joueurs indépendants.

### Recommandations Business :
* **Développement :** Privilégier un jeu hybride (ex: Action-Sports) pour éviter la saturation des genres classiques.
* **Lancement :** Adopter une tarification Premium modérée pour favoriser les avis positifs dès la sortie.

---

## 📁 Fichiers du Projet
* `clean_data.sql` : Scripts de nettoyage complets.
* `analysis_queries.sql` : Requêtes d'analyse de marché.

**Contact :** [Ton Nom] – [Lien LinkedIn]
```

