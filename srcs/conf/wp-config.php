<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'Qhh4m{.BGg?+rc;7B6|HX^+s[IlGpHf@M)Vgf-$lZ8;Q)YIeQ$F9?RKs*J(Bl^WR');
define('SECURE_AUTH_KEY',  '6V{.o@g#L2MbI$IJs]<?2P.`Bx]b62Zg1Ian17J]$b<-FO!$&_z#W/@Af:-|+v.8');
define('LOGGED_IN_KEY',    'z+_pS[Gc0A5sY7X6LZ2z>ugw4<u[MvG +-)fw>|f%t|tu5n9~c3xMB2|eDG8*UbW');
define('NONCE_KEY',        '+@z9AZ)Ejf{Xso$,hKfiyF>$CdrI$11*8YG|[(?seCJAoqfOlE1ZFRFw0BcGCS1M');
define('AUTH_SALT',        'V&iD`>ns+rdoiFO`:Hm-p;P[ec.I(L~HUXpC2t<K23e8G5[RogzMa&+-y4CON/k@');
define('SECURE_AUTH_SALT', 'yqt!c*7z-pgk}5.zuGa@>uGuQQ6v1irY;/r::V9-oFDi6+)O2#y`RAAKLQVyDpr+');
define('LOGGED_IN_SALT',   '3Ju{Hh]}F@-CgoCLjde,`0/=z/l6uFxG2XPD4z-A;rHTDjQ.)L0tng1At~+G#Qu5');
define('NONCE_SALT',       ';.o8m{u<#A.WKW_DJE``~R}/rIDZz?bQL)ho?L51+zfP0&~scQH]V[.-BJ(6drQt');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
