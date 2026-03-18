# ==========================================================
# PROJET : Analyse du marché Steam (Google Data Analytics)
# ETAPE : Visualisation des données
# ==========================================================

# 1. Installation (uniquement si tu ne l'as jamais fait)
# install.packages("tidyverse")

# 2. Chargement des bibliothèques
library(tidyverse)

# 3. Définition du dossier de travail
# REMPLACE BIEN LE CHEMIN CI-DESSOUS PAR LE TIEN
setwd("C:/Users/alexi/Documents/R/")

# 4. Importation du fichier CSV
# On vérifie si le fichier existe avant de charger
if (file.exists("games_cleaned.csv")) {
  steam_data <- read.csv("games_cleaned.csv")
  print("Fichier chargé avec succès !")
} else {
  stop("ERREUR : Le fichier games_cleaned.csv est introuvable dans ce dossier.")
}

# 5. Création du graphique
# On stocke le graphique dans une variable 'mon_graphique'
mon_graphique <- ggplot(data = steam_data, aes(x = price, y = success_rate)) +
  geom_jitter(alpha = 0.3, color = "steelblue") + 
  geom_smooth(method = "lm", color = "red", se = TRUE) +
  labs(
    title = "Corrélation entre Prix et Satisfaction sur Steam",
    subtitle = "Analyse réalisée pour le certificat Google Data Analytics",
    x = "Prix du jeu (€)",
    y = "Taux de satisfaction (%)",
    caption = "Source: Dataset Steam 2026"
  ) +
  theme_minimal()

# 6. FORCE L'AFFICHAGE
# Cette commande ouvre une fenêtre externe si l'onglet 'Plots' est bloqué
print(mon_graphique)

# 7. SAUVEGARDE AUTOMATIQUE
# Cela va créer un fichier image dans ton dossier C:/Users/alexi/Documents/R/
ggsave("graphique_final_steam.png", plot = mon_graphique, width = 10, height = 7)
print("Le graphique a été enregistré sous le nom 'graphique_final_steam.png'")