<?php
declare(strict_types=1);

use PHPUnit\Framework\TestCase;

// COMMAND
// ./vendor/bin/phpunit --bootstrap index.php tests/routerTest.php

/**
 * @covers Router
 */
final class RouterTest extends TestCase
{
    public function testRouter()
    {
        $router = new Router();

        $this->assertTrue(true);
    }
}

/**
 * @covers Router
 */
final class RouteTest extends TestCase
{
    public function testRoute()
    {
        $router = new Route();

        printv('coucou');

        $this->assertTrue(true);
    }
}
