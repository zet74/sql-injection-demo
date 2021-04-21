# Demo SQL Injection

<p align="center">
  <a href="#"><img src="./docs/images/shop_screenshot.jpg" /></a>
</p>

L'objectif de cette maquette d'un simple site de vente en ligne est de montrer les vulnérabilités aux injections SQL. Dans ce projet, toutes les requêtes de base de données sont intentionnellement vulnérables aux injections SQL.

### Filtre produit
Les produits listé peuvent être filtrés par arôme de café. La saisie utilisateur n'est pas controllée et "nettoyée" ce que la rend vulnérable aux injections SQL.
* editer des entrées de la base
* supprimer une table
* supprimer une base
* lister les utilisateurs stockés dans une table
* ...

### Connexion
La connexion n'est non plus pas protégée contre les injections SQL.
Un utilisateur connecté peut ajouter des articles à son panier; un utilisateur avec des droits d'administration peut supprimer des produits.
On peut donc, en utilisant une injection SQL, se connecter en tant qu'admin, ou en tant que n'importe quel utilisateur.

### Recréer les tables par défauts

En bas de page, il y a un bouton 
  <span><img height="15em" src="./docs/images/recreate.png" /></span>, qui permet de restaurer la base de données et les tables.

## Setup

Dans MySQL, créez un nouvel utilisateur `sql_injection` et donnez lui tous les droits sur la base de données `inject_demodb` et seulement celle-ci. Il est important de s'assurer qu'aucune autre bdd ne sera affectée par des vulnérabilités aux injections SQL.

```SQL
CREATE USER 'sql_injection'@'%' IDENTIFIED BY 'foobar';
GRANT ALL PRIVILEGES ON `inject_demodb` . * TO 'sql_injection'@'%';
FLUSH PRIVILEGES;
```

Créer la base de donnée `inject_demodb`:

```SQL
CREATE DATABASE inject_demodb;
```

Editer le fichier [connectdb.php](lib/connectdb.php).

Les paramètres `host`, `port`, `username` et `password` pour la connexion au SGBD peuvent être paramétrés avec les varibles d'environnement suivantes: (au cas où vous souhaitez maitriser le déploiement):

```sh
SQL_INJECTION_DB_HOST="localhost"
SQL_INJECTION_DB_PORT="3306"
SQL_INJECTION_DB_USERNAME="sql_injection"
SQL_INJECTION_DB_PASSWORD="foobar"
```

Configurer un web server pour éxécuter le fichier `index.php` et cliquez sur le bouton `Recréer la table` qui va créer la table `coffee` dans votre base de données et insérer quelques données. Les données ont été créées avec [faker-gem](https://github.com/stympy/faker) by @stympy.
