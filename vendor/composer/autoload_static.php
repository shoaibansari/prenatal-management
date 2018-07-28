<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit2fb72a04d9ce753a71f2a334deea026e
{
    public static $classMap = array (
        'Format' => __DIR__ . '/..' . '/chriskacerguis/codeigniter-restserver/application/libraries/Format.php',
        'REST_Controller' => __DIR__ . '/..' . '/chriskacerguis/codeigniter-restserver/application/libraries/REST_Controller.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->classMap = ComposerStaticInit2fb72a04d9ce753a71f2a334deea026e::$classMap;

        }, null, ClassLoader::class);
    }
}