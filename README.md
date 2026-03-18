# 🎮 Étude de Cas : Analyse du Marché Steam (Certificat Google Data Analytics)

## 📌 Présentation du Projet
Ce projet est le point culminant de mon certificat professionnel **Google Data Analytics**. L'objectif est d'analyser les données de la plateforme Steam pour aider un studio de développement à prendre des décisions basées sur les données concernant le genre de leur futur jeu et sa stratégie de prix.

---

## 🛠️ Phase 1 : ASK (Poser les questions)
**Problématique :** Comment maximiser le succès critique d'un jeu indépendant ?
* Quelles combinaisons de genres affichent les meilleurs taux de satisfaction ?
* Existe-t-il une corrélation entre le prix de vente et la note des utilisateurs ?

---

## 📥 Phase 2 : PREPARE (Préparer)
* **Source :** Dataset public Steam (données brutes via API).
* **Outils :** * **SQL (MySQL)** : Pour le nettoyage massif et les agrégations.
    * **R (Tidyverse)** : Pour l'analyse statistique et la visualisation de données.

---

## 🧹 Phase 3 : PROCESS (Nettoyer)
Le nettoyage a été effectué en SQL pour garantir l'intégrité des données :
- **Normalisation des dates :** Conversion des chaînes de caractères au format `DATE`.
- **Nettoyage des colonnes :** Suppression des résidus de formatage Python (`[' ']` dans les genres).
- **Création de KPIs :** Calcul du `success_rate` (ratio avis positifs / total).

```sql
-- Calcul du Success Rate par jeu
UPDATE games_cleaned 
SET success_rate = (positive / (positive + negative)) * 100
WHERE (positive + negative) > 0;
```

---

## 📊 Phase 4 : ANALYZE (Analyser)

### 1. Analyse des Genres (SQL)
L'analyse montre que les niches hybrides (ex: **Action + Indie + Racing**) sur-performent avec un taux de satisfaction moyen de **77.02%**, contre 65% pour les jeux d'action classiques.

### 2. Visualisation Statistique (R)
J'ai utilisé R pour tester la corrélation entre le prix et la satisfaction.
```r
ggplot(data, aes(x = price, y = success_rate)) +
  geom_jitter(alpha = 0.3) +
  geom_smooth(method = "lm") +
  labs(title = "Corrélation Prix vs Satisfaction")
```
*Insight : Les jeux situés entre 15€ et 25€ affichent une satisfaction plus stable, suggérant une meilleure perception de la qualité par les joueurs.*

---

## 📈 Phase 5 : SHARE & ACT (Agir)

### Recommandations Business :
1. **Ciblage :** Développer un jeu hybride (Action/Sports) plutôt qu'un genre saturé.
2. **Pricing :** Adopter un prix "Mid-range" (14.99€ - 24.99€) pour maximiser les avis positifs tout en rentabilisant le projet.

---

## 📁 Structure du Repository
- `cleaning_scripts.sql` : Script de nettoyage complet.
- `visualization_analysis.R` : Script d'analyse statistique R.
- `games_cleaned.csv` : Dataset final utilisé pour l'analyse.

**Auteur :** [Ton Nom]
**Certificat :** Google Data Analytics (2026)



