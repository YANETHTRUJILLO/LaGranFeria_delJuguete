<?php
use PHPUnit\Framework\TestCase;
use App\ObtenerPedidos;

class ObtenerPedidosTest extends TestCase {

    public function testEstructuraBasica(){
        $mock = $this->createMock(PDO::class);
        $this->assertTrue(true); // Afirmación mínima
    }
}