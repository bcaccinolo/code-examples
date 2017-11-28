<?php
//
// MINI ROUTER
//
//  - DONE Mise en place d'une Route
//
//  - DONE Donc on fait un matching basic.
//
//  - DONE User PhpUnit pour les tests.
//
//  - DONE il faut gérer les variables.
//
//  - Trouver un bon format et bien documenter. Le tout.
//
//  - tester et mettre en place le Router qui regroupe et gère les Routes
//

function printv($str)
{
    print('<pre>' . var_export($str, true) . '</pre>');
}

class Router {
    var $routes = ['GET' => [], 'PUT' => [], 'POST' => []];

    function add_route($method, $path, $fun)
    {
        switch (trim($method)) {
            case 'GET':
            array_push($this->routes['GET'], new GET($path, $fun));
            break;
            case 'POST':
            array_push($this->routes['POST'], new GET($path, $fun));
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

    function match_and_exec($method, $path)
    {
        $possible_routes = $this->routes[$method];
        foreach($possible_routes as $route)
        {
            $result = $route->match($path);
            if (is_array($result) == false)
            {
                break;
            }
            return $route->call($result);
        }
        return false;
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

    // Returns:
    // if it matches, it returns an array with the matching parameters
    // it it does not match, it returns false
    function match($path)
    {
        $regexp_path = preg_replace ('#:[a-z-_]+#' , '([a-zA-Z0-9]+)' , $this->path);
        // print("\nReturned value from preg_filter: " . $regexp_path);
        // print("\nInitial path " . $this->path);
        // print("\npath after filtering: " . $regexp_path);
        // print("\n>" . $regexp_path . "< >" . $path . "< match result : " . preg_match('#'.$regexp_path.'#', $path, $matches) );
        // print("\n");
        $result = preg_match('#^'.$regexp_path.'$#', $path, $matches);
        // removing the first value of the $matches cause it's not a match.
        array_splice($matches, 0, 1);

        if ($result == 1)
        {
            return $matches;
        }
        return false;
    }

    // It calls the method with the given parameters
    function call($params)
    {
        return call_user_func_array($this->fun, $params);
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


