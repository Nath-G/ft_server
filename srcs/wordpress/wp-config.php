<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier contient les r  glages de configuration suivants : r  glages MySQL,
 * pr  fixe de table, cl  s secr  tes, langue utilis  e, et ABSPATH.
 * Vous pouvez en savoir plus    leur sujet en allant sur
 * {@link http://codex.wordpress.org/fr:Modifier_wp-config.php Modifier
 * wp-config.php}. C ^`^yest votre h  bergeur qui doit vous donner vos
 * codes MySQL.
 *
 * Ce fichier est utilis   par le script de cr  ation de wp-config.php pendant
 * le processus d ^`^yinstallation. Vous n ^`^yavez pas    utiliser le site web, vous
 * pouvez simplement renommer ce fichier en "wp-config.php" et remplir les
 * valeurs.
 *
* @package WordPress
 */

// ** R  glages MySQL - Votre h  bergeur doit vous fournir ces informations. ** //
/** Nom de la base de donn  es de WordPress. */
define('DB_NAME', 'wordpress_bdd');

/** Utilisateur de la base de donn  es MySQL. */
define('DB_USER', 'root');

/** Mot de passe de la base de donn  es MySQL. */
define('DB_PASSWORD', '');

/** Adresse de l ^`^yh  bergement MySQL. */
define('DB_HOST', 'localhost');

/** Jeu de caract  res    utiliser par la base de donn  es lors de la cr  ation des tables. */
define('DB_CHARSET', 'utf8');

/** Type de collation de la base de donn  es.
  * N ^`^yy touchez que si vous savez ce que vous faites.
  */
define('DB_COLLATE', '');

/**#@+
 * Cl  s uniques d ^`^yauthentification et salage.
 *
 * Remplacez les valeurs par d  faut par des phrases uniques !
 * Vous pouvez g  n  rer des phrases al  atoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clefs secr  tes de WordPress.org}.
 * Vous pouvez modifier ces phrases    n ^`^yimporte quel moment, afin d ^`^yinvalider tous les cookies existants.
 * Cela forcera   galement tous les utilisateurs    se reconnecter.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'put your unique phrase here');
define('SECURE_AUTH_KEY',  'put your unique phrase here');
define('LOGGED_IN_KEY',    'put your unique phrase here');
define('NONCE_KEY',        'put your unique phrase here');
define('AUTH_SALT',        'put your unique phrase here');
define('SECURE_AUTH_SALT', 'put your unique phrase here');
define('LOGGED_IN_SALT',   'put your unique phrase here');
define('NONCE_SALT',       'put your unique phrase here');
/**#@-*/

/**
 * Pr  fixe de base de donn  es pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de donn  es
 * si vous leur donnez chacune un pr  fixe unique.
 * N ^`^yutilisez que des chiffres, des lettres non-accentu  es, et des caract  res soulign  s  !
 */
$table_prefix = 'wp_';

/**
 * Pour les d  veloppeurs : le mode d  boguage de WordPress.
 *
 * En passant la valeur suivante    "true", vous activez l ^`^yaffichage des
 * notifications d ^`^yerreurs pendant vos essais.
 * Il est fortemment recommand   que les d  veloppeurs d ^`^yextensions et
 * de th  mes se servent de WP_DEBUG dans leur environnement de
 * d  veloppement.
 *
 * Pour plus d ^`^yinformation sur les autres constantes qui peuvent   tre utilis  es
 * pour le d  boguage, rendez-vous sur le Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* C ^`^yest tout, ne touchez pas    ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( !defined('ABSPATH') )
        define('ABSPATH', dirname(__FILE__) . '/');

/** R  glage des variables de WordPress et de ses fichiers inclus. */
require_once(ABSPATH . 'wp-settings.php');

/** Chemin absolu vers le dossier de WordPress. */
if ( !defined('ABSPATH') )
        define('ABSPATH', dirname(__FILE__) . '/');

/** R  glage des variables de WordPress et de ses fichiers inclus. */
require_once(ABSPATH . 'wp-settings.php');
