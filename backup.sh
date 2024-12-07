#!/bin/bash

# Chemin vers le volume Docker (persistance ownCloud)
DOCKER_VOLUME_PATH="/var/lib/docker/volumes/bd8059f5cbb7a620fc71aaba5df597a78c53e3eb568ba9a0297dde3e559cd012/_data/data/admin/files/TOIP"

# Répertoire où les sauvegardes seront stockées
ARCHIVE_DIR="/var/lib/docker/volumes/bd8059f5cbb7a620fc71aaba5df597a78c53e3eb568ba9a0297dde3e559cd012/_data/data/admin/files/Archive"

# Vérifier si le dossier d'archive existe, sinon le créer
mkdir -p "$ARCHIVE_DIR"

# Format de la date et heure pour le fichier de sauvegarde
TIMESTAMP=$(date +"%d-%m-%Y_%H:%M:%S")

# Nom du fichier de sauvegarde
BACKUP_FILE="$ARCHIVE_DIR/sio2-$TIMESTAMP.txt"

# Créer l'archive contenant les données ownCloud
tar -cvf "$BACKUP_FILE" -C "$DOCKER_VOLUME_PATH" . > /dev/null 2>&1

# Vérification et affichage d'un message
if [ $? -eq 0 ]; then
    echo "La sauvegarde a été effectuée avec succès : $BACKUP_FILE"
else
    echo "Échec de la sauvegarde."
fi
