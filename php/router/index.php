<?php
//
// MINI ROUTER
//  - pour le momment on ne gère pas les paramètres.
//

// fonction qui affiche l'url
function showData($method = 'GET', $path = '/')
{
    print('<pre>' . var_export($_SERVER, true) . '</pre>');

}

class Router {
    var $routes = ['GET' => [], 'PUT' => [], 'POST' => []];

    function add_route($method, $path, $fun)
    {
        print('adding a route');
        switch (trim($method)) {
            case 'GET':
                array_push($this->routes['GET'], new GET($path, $fun));
                break;
            case 'POST':
                new POST($path, $fun);
                break;
            case 'PUT':
                array_push($this->routes['PUT'], new PUT($path, $fun));
                break;
        }
    }

    function listen()
    {
        showData($_SERVER['REQUEST_METHOD'], $_SERVER['REQUEST_URI']);

        $method = strtoupper($_SERVER['REQUEST_METHOD']);
        $possible_routes = $this->routes[$method];

        $path = trim($_SERVER['REQUEST_URI']);

        foreach($possible_routes as $route) {
            print("resonse from match");
            print $route->match($path);
        }

        print('<pre>' . var_export($possible_routes, true) . '</pre>');
    }
}


class Route {

    var $path;
    var $fun;

    function __construct($path, Closure $fun)
    {
        echo("constructeur");
        $this->path = $path;
        $this->fun = $fun;
    }

    function match($path)
    {
        print("false !!! ");
        return false;
    }
}

class GET extends Route {

    function __construct($path, $fun)
    {
        parent::__construct($path, $fun);
        print('creating a GET route');
    }

}

class POST extends Route {

    function __construct($path, $fun)
    {
        parent::__construct($path, $fun);
        print('creating a POST route');
    }

}

class PUT extends Route {

    function __construct($path, $fun)
    {
        parent::__construct($path, $fun);
        print('creating a PUT route');
    }

}

$router = new Router();

// GET @ /  => echo "this is the root"
$router->add_route('GET', '/', function() {
    echo('this is the root');
});

$router->add_route('PUT', '/', function() {
    echo('this is the root');
});

print('<pre>' . var_export($router->routes, true) . '</pre>');

$router->listen();
