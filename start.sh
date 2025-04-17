#!/bin/bash

# Mise à jour du système
sudo su
apt update -y
apt upgrade -y <<< "yes"

# Démarrer les services
docker-compose up -d

# Attendre que la base de données soit prête
echo "En attente que la base de données soit prête..."
sleep 30

# Créer l'utilisateur admin
docker-compose run --rm panel php artisan p:user:make <<EOF
lamelo2410@gmail.com
lionel
melo
night
Melo12345@
Melo12345@
EOF

echo "Installation terminée!"
echo "URL du panel: https://${RAILWAY_STATIC_URL}"
echo "Identifiants admin:"
echo "Email: lamelo2410@gmail.com"
echo "Username: lionel"
echo "Password: Melo12345@"
