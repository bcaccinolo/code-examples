<?php
declare(strict_types=1);

use PHPUnit\Framework\TestCase;

// COMMAND
// ./vendor/bin/phpunit --bootstrap index.php tests/routeTest.php --testdox

/**
 * @covers Route
 */
final class RouteTest extends TestCase
{
    public function testMatchForSimpleUrl()
    {
        $router = new GET('/', function(){
            return "get root";
        });

        $this->assertFalse($router->match('/not-good'));
        $this->assertTrue(is_array($router->match('/')));
    }

    public function testMatchForSimpleUrl2()
    {
        $router = new GET('/about', function(){
            return "get about page";
        });

        $this->assertFalse($router->match('/not-good'));
        $this->assertTrue(is_array($router->match('/about')));
    }

    public function testMatchWithParameter()
    {
        $router = new GET('/user/:id', function(){
            return "get user";
        });

        $this->assertFalse($router->match('/user'));
        $this->assertTrue(is_array($router->match('/user/12')));
        $this->assertFalse($router->match('/user/12/edit'));
    }

    public function testMatchWith2Parameters()
    {
        $router = new GET('/user/:id/book/:book_id', function(){
            return "get user";
        });

        $this->assertFalse($router->match('/user/book/12'));
        $this->assertTrue(is_array($router->match('/user/12/book/42')));
        $this->assertFalse($router->match('/user/12/edit'));
    }

}
