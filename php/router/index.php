<?php
//
// MINI ROUTER
//  - Pour le momment on ne gère pas les paramètres.
//    Donc on fait un matching basic.
//

function printv($str)
{
    print('<pre>' . var_export($str, true) . '</pre>');
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
        $method = strtoupper($_SERVER['REQUEST_METHOD']);
        $possible_routes = $this->routes[$method];

        $path = trim($_SERVER['REQUEST_URI']);

        foreach($possible_routes as $route) {
            print("resonse from match");
            if ($route->match($path) == true)
            {
                call_user_func($route->fun);
                break;
            }
        }

        print('<pre>' . var_export($possible_routes, true) . '</pre>');
    }
}


class Route {

    var $path;
    var $fun;

    function __construct($path, Closure $fun)
    {
        printv("constructeur");
        $this->path = $path;
        $this->fun = $fun;
    }

    function match($path)
    {
        if ($this->path == $path) {
            printv('true ');
            return true;
        }
        printv("false !!! ");
        return false;
    }
}

class GET extends Route {

    function __construct($path, $fun)
    {
        parent::__construct($path, $fun);
        printv('creating a GET route');
    }

}

class POST extends Route {

    function __construct($path, $fun)
    {
        parent::__construct($path, $fun);
        printv('creating a POST route');
    }

}

class PUT extends Route {

    function __construct($path, $fun)
    {
        parent::__construct($path, $fun);
        printv('creating a PUT route');
    }

}

$router = new Router();

$router->add_route('GET', '/', function() {
    printv('this is the root');
});

$router->add_route('GET', '/', function() {
    printv('this is the root 2');
});

$router->add_route('PUT', '/', function() {
    printv('this is the root');
});

$router->listen();
