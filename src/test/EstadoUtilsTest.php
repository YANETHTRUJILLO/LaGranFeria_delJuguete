<?php
use PHPUnit\Framework\TestCase;
use App\EstadoUtils;

class EstadoUtilsTest extends TestCase {

    public function testEstadoProcesar(){
        $this->assertEquals('Por procesar', EstadoUtils::estado2texto(1));
        $this->assertEquals('Por pagar', EstadoUtils::estado2texto(2));
    }

    public function testEstadoProcesados(){
        $this->assertEquals('Pago pendiente', EstadoUtils::estado2textoProcesado(2));
        $this->assertEquals('En preparación', EstadoUtils::estado2textoProcesado(3));
    }
}