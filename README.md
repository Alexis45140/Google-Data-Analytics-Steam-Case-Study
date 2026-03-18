# 🎮 Steam Market Analysis: Data Cleaning & Insights
### *Étude de cas réalisée dans le cadre du Certificat Professionnel Google Data Analytics*

## 📌 Présentation du Projet
L'objectif de cette étude est d'analyser les facteurs de succès des jeux vidéo sur la plateforme **Steam**. En utilisant SQL pour le nettoyage et l'analyse, j'ai cherché à identifier quels genres et quelles stratégies de prix maximisent la satisfaction des joueurs.

---

## 🛠️ Phase 1 : ASK (Poser les questions)
**Problématique :** Comment un studio de développement peut-il optimiser son lancement sur un marché saturé ?
* Quelles combinaisons de genres affichent les meilleurs taux de satisfaction ?
* Le prix de vente influence-t-il la perception de qualité (success rate) ?

---

## 📥 Phase 2 : PREPARE (Préparer)
* **Source des données :** Dataset public Steam (données extraites via API).
* **Outils utilisés :** * **MySQL Workbench** (Nettoyage et requêtes complexes).
    * **VS Code** (Rédaction du rapport et scripts).
    * **Google Sheets** (Visualisation de données).

---

## 🧹 Phase 3 : PROCESS (Nettoyer)
Le dataset présentait des incohérences de formatage (dates textuelles, listes Python dans les colonnes). Voici les étapes clés de nettoyage SQL :

### 1. Standardisation des dates
```sql
-- Transformation du texte ISO en type DATE réel
UPDATE games_cleaned 
SET release_date_fixed = CAST(release_date AS DATE)
WHERE release_date REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$';
