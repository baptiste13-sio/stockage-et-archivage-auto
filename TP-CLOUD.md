# TP OWNCLOUD B2

## Installation d'owncloud avec docker.

- docker pull owncloud 
- docker run -p 8081:80 -d owncloud 

## Connexion a owncloud sur le navigateur.

- http://[adresse IP]:8081 
- Création d'un utilisateur administrateur sur owncloud

## Installation et configuration du client Owncloud sur Windows. 

- Se rendre sur le site owncloud et installer la version client puis lancer l'exécutable.  
- On ajoute l'adresse de notre serveur Owncloud http://[adresse ip]:8081 
- Puis on renseigne le login / mdp et nous sommes connectés à notre compte. 

## Les différentes possibilités que nous offre Owncloud. 

- Le stockage et la synchronisation de fichiers 
    - centralisé qui permet de sauvegarder les fichiers sur un serveur pour un accès plus facile. 
    - multi-appareils avec une synchronisation automatique entre les différents appareils (ordianteurs, tablettes, téléphone...)
    - accès hors ligne via des clients locaux.

- Un partage de fichier sécurisé 
    - liens publics avec mdp et date d'expiration. 
    - Partage de fichiers et dossiers avec des utilisateurs internes ou externes. 
    - Des permissions personnalisées avec des           autorisations spécifiques. 

- Sécurité et confidentialité 
    - hébergement privé. 
    - chiffrement et authentification à deux facteurs et intégration LDAP.

- Collaboration en temps réel 
    - édition collaborative avec des outils comme OnlyOffice.
    - Possibilité de laisser des commentaires sur les fichiers partagés.
    - Versionnage avec historique de modifications qui permet de restaurer des versions antérieurs d'un fichier. 

- Extensibilité et Intégrations 
    - Modules complémentaires avec un choix large d'applications et extensions pour ajouter des fonctionnalités (calendrier, gestion de tâches...)
    - API REST qui permet l'intégration avec d'autres applications... 

- Compatibilité multi-plateformes 
    - Applications clients windows, macOS, Linux, Android et iOS. 
    - Interface Web avec un accès aux fichiers via le navigateur sans installer de logiciel. 

- Administration & Gestion 
    - Gestion des utilisateurs et groupes avec un contrôle sur les droits d'accès. 
    - Monitoring avec un tableau de bord pour surveiller l'activité, l'utilisation et les performances. 
    - Mise à jour automatique qui permet un maintien du système à jour avec des outils automatisés. 

- Intégration avec le stockage externe 
    - Support mutli-stockage avec l'intégration d'Amazon S3, Google Cloud Storage ou même de serveurs SFTP/FTP
    - Permet également d'accéder à des des données provenant de différentes sources sur une interface unique. 

- Mobilité & Accessibilité 
    - Applications mobiles, upload de photos automatiques, consultation et édition de fichiers en déplacement. 
    - Streaming multimédia avec la lecture de fichiers audio ou vidéo stockés sur le serveur. 

- Utilisation dans des Contextes Professionnels 
    - Audit : Journaux d’audit pour suivre l’activité des utilisateurs et garantir la traçabilité.
    - Conformité : Compatible avec des normes telles que GDPR, ISO27001, etc.
    - Collaboration d'équipe : Idéal pour partager des documents, gérer des projets et collaborer de manière centralisée.


## Mise en œuvre d'un espace de stockage cloud. 

- Sur l'interface web de notre serveur Cloud, nous allons créer un dossier TOIP, dans lequel nous ajoutons un fichier de test au format .txt. 
- Création du répertoire Archive afin de stocker les fichiers du répertoire TOIP avec le script. 

    ![alt text](owncloud-fichiers-1.png) ![alt text](doc-txt-owncloud-1.png)

## Mise en place du script de sauvegarde. 

- Dans notre machine qui contient owncloud, nous allons créer un fichier backup.sh qui contiendra le script de sauvegarde. 
- Ensuite nous allons devoir indiquer le répertoire de notre machine Docker afin que le script sauvegarde les données dans le répertoire Archive. 
- On se rend dans /var/lib/docker/volumes/[id de notre docker]/_data/data/admin/files/TOIP
- On ajoute le chemin du répertoire dans notre script. 

![alt text](script-1.png)

- Après cela, nous allons exécuter la sauvegarde avec la commande ./backup.sh

![alt text](sauvgarde-1.png)
- On se rend dans le répertoire de notre sauvegarde : /var/www/html, avec un ls nous voyons notre fichier sauvegardé. 
- Nous allons afficher notre fichier avec la commande cat. 

![alt text](verif-2.png)

- Nous voyons donc que notre fichier sauvgardé est bien indentique à celui enregistré. 
