<?php
//
// MINI ROUTER
//  - Pour le momment on ne gère pas les paramètres.
//    Donc on fait un matching basic.
//
//  - >>> User PhpUnit pour les tests.
//
//  - Bon maintenant, il faut gérer les variables.
//    > Pour cela, mettre en place des tests unitaires.
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
        $this->path = $path;
        $this->fun = $fun;
    }

    function match($path)
    {
        $regexp_path = preg_replace ('#:[a-z-_]+#' , '([a-zA-Z0-9]+)' , $this->path);
        // print("\nReturned value from preg_filter: " . $regexp_path);
        // print("\nInitial path " . $this->path);
        // print("\npath after filtering: " . $regexp_path);
        // print("\n>" . $regexp_path . "< >" . $path . "< match result : " . preg_match('#'.$regexp_path.'#', $path) );
        // print("\n");
        $matches = array();
        $result = preg_match('#^'.$regexp_path.'$#', $path, $matches);

        if ($result == 1)
        {
            return $matches;
        }
        return false;
    }
}

class GET extends Route {

    function __construct($path, $fun)
    {
        parent::__construct($path, $fun);
    }

}

class POST extends Route {

    function __construct($path, $fun)
    {
        parent::__construct($path, $fun);
    }

}

class PUT extends Route {

    function __construct($path, $fun)
    {
        parent::__construct($path, $fun);
    }

}


