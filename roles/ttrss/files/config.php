<?php
	// *******************************************
	// *** Database configuration (important!) ***
	// *******************************************

        define('DB_TYPE', "pgsql"); // or mysql
        define('DB_HOST', "localhost");
        define('DB_USER', "ttrss");
        define('DB_NAME', "ttrss");
        define('DB_PASS', "{{ ttrss_dbpw }}");
        define('DB_PORT', ''); // usually 5432 for PostgreSQL, 3306 for MySQL

	define('MYSQL_CHARSET', 'UTF8');

	// ***********************************
	// *** Basic settings (important!) ***
	// ***********************************

	define('SELF_URL_PATH', 'https://ttrss.seanho.com:4343/');
	define('FEED_CRYPT_KEY', '');
	define('SINGLE_USER_MODE', false);
	define('SIMPLE_UPDATE_MODE', false);

	// *****************************
	// *** Files and directories ***
	// *****************************

	define('PHP_EXECUTABLE', '/usr/bin/php');
	define('LOCK_DIRECTORY', 'lock');
	define('CACHE_DIR', 'cache');
	define('ICONS_DIR', "feed-icons");
	define('ICONS_URL', "feed-icons");

	// **********************
	// *** Authentication ***
	// **********************

	define('AUTH_AUTO_CREATE', true);
	define('AUTH_AUTO_LOGIN', true);

	// *********************
	// *** Feed settings ***
	// *********************

	define('FORCE_ARTICLE_PURGE', 0);
	define('PUBSUBHUBBUB_HUB', '');
	define('PUBSUBHUBBUB_ENABLED', false);

	// ****************************
	// *** Sphinx search plugin ***
	// ****************************

	define('SPHINX_SERVER', 'localhost:9312');
	define('SPHINX_INDEX', 'ttrss, delta');

	// ***********************************
	// *** Self-registrations by users ***
	// ***********************************

	define('ENABLE_REGISTRATION', false);
	define('REG_NOTIFY_ADDRESS', 'ttrss@seanho.com');
	define('REG_MAX_USERS', 10);

	// **********************************
	// *** Cookies and login sessions ***
	// **********************************
	
	define('SESSION_COOKIE_LIFETIME', 86400);

	// *********************************
	// *** Email and digest settings ***
	// *********************************

	define('SMTP_FROM_NAME', 'Tiny Tiny RSS');
	define('SMTP_FROM_ADDRESS', 'ttrss@seanho.com');
	define('DIGEST_SUBJECT', '[tt-rss] New headlines for last 24 hours');
	define('SMTP_SERVER', '');
	define('SMTP_LOGIN', '');
	define('SMTP_PASSWORD', '');
	define('SMTP_SECURE', '');
	
	// ***************************************
	// *** Other settings (less important) ***
	// ***************************************

	define('CHECK_FOR_UPDATES', true);
	define('ENABLE_GZIP_OUTPUT', true);
	define('PLUGINS', 'auth_internal, note');
	define('LOG_DESTINATION', 'sql');
	define('CONFIG_VERSION', 26);

	// vim:ft=php
