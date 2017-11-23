<?php

// fonction qui affiche l'url
function showData($method = 'GET', $path = '/')
{
    print($method . ' @ ' . $path);
}

// showData($_SERVER['REQUEST_METHOD'], $_SERVER['PATH_INFO']);

function route($method, $path, $fun)
{
    switch ($method) {
        case 'GET':
            new GET($path, $fun);
            break;
        case 'POST':
            new POST($path, $fun);
            break;
        case 'PUT':
            new PUT($path, $fun);
            break;
    }
}

class Route {

    function __construct($path, $fun)
    {
        echo("constructeur");
        call_user_func($fun);
    }
}

class GET extends Route {

}

class POST extends Route {

}

class PUT extends Route {

}

// GET @ /  => echo "this is the root"
route('GET', '/', function() {
    echo('this is the root');
});

route('PUT ', '/', function() {
    echo('this is the root');
});

