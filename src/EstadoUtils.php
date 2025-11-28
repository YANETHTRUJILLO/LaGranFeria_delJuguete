<?php
namespace App;

class EstadoUtils {

    public static function estado2texto($id){
        switch ($id) {
            case '1': return 'Por procesar';
            case '2': return 'Por pagar';
            default: return 'Desconocido';
        }
    }

    public static function estado2textoProcesado($id){
        switch ($id) {
            case '1': return 'En proceso de selección';
            case '2': return 'Pago pendiente';
            case '3': return 'En preparación';
            case '4': return 'En ruta de entrega';
            case '5': return 'Entregado con éxito';
            default: return 'Desconocido';
        }
    }
}