CLASS zcl_primera_clase_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_primera_clase_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    "Ejercicio 3
*
*    TYPES: BEGIN OF ty_pedido,
*            lv_id_pedido    TYPE i,
*            lv_importe      TYPE p LENGTH 5 DECIMALS 2,
*            lv_tipo_cliente TYPE string,
*          END OF ty_pedido.
*
*    DATA ls_pedido TYPE ty_pedido.
*    DATA lt_pedidos TYPE TABLE OF ty_pedido.
*    DATA: lv_contador TYPE i,
*          lv_resto    TYPE i.
*
*    DO 5 TIMES.
*      lv_contador += 1.
*      ls_pedido-lv_id_pedido = lv_contador.
*      ls_pedido-lv_importe = lv_contador * '120.75'.
*      lv_resto = lv_contador MOD 2.
*
*      CASE lv_resto.
*        WHEN 0.
*          ls_pedido-lv_tipo_cliente = 'PREMIUM'.
*
*        WHEN OTHERS.
*          ls_pedido-lv_tipo_cliente = 'ESTANDAR'.
*
*      ENDCASE.
*
*      APPEND ls_pedido TO lt_pedidos.
*    ENDDO.
*
*    out->write( ls_pedido ).


*    "Ejercicio 1 con LOOP AT
*    TYPES: BEGIN OF ty_producto,
*             nombre TYPE string,
*             precio TYPE p LENGTH 5 DECIMALS 2,
*           END OF ty_producto.
*
*    DATA ls_producto TYPE ty_producto.
*    DATA lt_producto TYPE TABLE OF ty_producto.
*
*    ls_producto-nombre = 'Producto A'.
*    ls_producto-precio = '50.27'.
*    APPEND ls_producto TO lt_producto.
*
*    ls_producto-nombre = 'Producto B'.
*    ls_producto-precio = '65.45'.
*    APPEND ls_producto TO lt_producto.
*
*    ls_producto-nombre = 'Producto C'.
*    ls_producto-precio = '80.39'.
*    APPEND ls_producto TO lt_producto.
*
*    LOOP AT lt_producto INTO ls_producto.
*      out->write( ls_producto-nombre ).
*    ENDLOOP.
*
*
*    "Ejercicio 2 con LOOP AT
*    TYPES: BEGIN OF ty_empleado,
*             nombre  TYPE string,
*             salario TYPE p LENGTH 5 DECIMALS 2,
*           END OF ty_empleado.
*
*    DATA ls_empleado TYPE ty_empleado.
*    DATA lt_empleado TYPE TABLE OF ty_empleado.
*
*    ls_empleado-nombre = 'Juan'.
*    ls_empleado-salario = '3000'.
*    APPEND ls_empleado TO lt_empleado.
*
*    ls_empleado-nombre = 'Pedro'.
*    ls_empleado-salario = '1500'.
*    APPEND ls_empleado TO lt_empleado.
*
*    LOOP AT lt_empleado INTO ls_empleado.
*      IF ls_empleado-salario > 2000.
*        out->write( ls_empleado-nombre ).
*      ENDIF.
*    ENDLOOP.
*
*
*    "Ejercicio 3 con LOOP AT
*    TYPES: BEGIN OF ty_pedido,
*             id_pedido TYPE i,
*             importe   TYPE p LENGTH 5 DECIMALS 2,
*             estado    TYPE string,
*           END OF ty_pedido.
*
*    DATA ls_pedido TYPE ty_pedido.
*    DATA lt_pedido TYPE TABLE OF ty_pedido.
*    DATA lv_contador TYPE i.
*
*    DO 6 TIMES.
*      ls_pedido-id_pedido = sy-index.
*      ls_pedido-importe = sy-index * '45.30'.
*
*      CASE sy-index MOD 3.
*        WHEN 0.
*          ls_pedido-estado = 'ENVIADO'.
*        WHEN 1.
*          ls_pedido-estado = 'PENDIENTE'.
*        WHEN 2.
*          ls_pedido-estado = 'CANCELADO'.
*      ENDCASE.
*
*      APPEND ls_pedido TO lt_pedido.
*    ENDDO.
*
*    LOOP AT lt_pedido INTO ls_pedido.
*      IF ls_pedido-estado = 'PENDIENTE'.
*        out->write( |ID: { ls_pedido-id_pedido } IMPORTE: { ls_pedido-importe }| ).
*        lv_contador += 1.
*      ENDIF.
*    ENDLOOP.
*
*    out->write( lv_contador ).

*
*    "Ejercicio 1 con READ TABLE
*    TYPES: BEGIN OF ty_producto,
*             nombre TYPE string,
*             precio TYPE p LENGTH 8 DECIMALS 2,
*           END OF ty_producto.
*
*    DATA: ls_producto TYPE ty_producto,
*          lt_producto TYPE TABLE OF ty_producto.
*
*    ls_producto-nombre = 'Producto A'.
*    ls_producto-precio = '56.99'.
*    APPEND ls_producto TO lt_producto.
*
*    ls_producto-nombre = 'Producto B'.
*    ls_producto-precio = '66.87'.
*    APPEND ls_producto TO lt_producto.
*
*    ls_producto-nombre = 'Producto C'.
*    ls_producto-precio = '75.99'.
*    APPEND ls_producto TO lt_producto.
*
*    ls_producto-nombre = 'Producto D'.
*    ls_producto-precio = '99.99'.
*    APPEND ls_producto TO lt_producto.
*
*    READ TABLE lt_producto INTO ls_producto INDEX 2.
*    IF sy-subrc = 0.
*      out->write( |Nombre: { ls_producto-nombre } Precio: { ls_producto-precio }| ).
*    ELSE.
*      out->write( 'No se ha encontrado el producto' ).
*    ENDIF.
*
*
*    "Ejercicio 2
*    TYPES: BEGIN OF ty_empleado,
*             id_empleado  TYPE i,
*             nombre       TYPE string,
*             departamento TYPE string,
*           END OF ty_empleado.
*
*    DATA: ls_empleado TYPE ty_empleado,
*          lt_empleado TYPE TABLE OF ty_empleado.
*
*    ls_empleado-id_empleado = 1.
*    ls_empleado-nombre = 'Pedro'.
*    ls_empleado-departamento = 'VENTAS'.
*    APPEND ls_empleado TO lt_empleado.
*
*    ls_empleado-id_empleado = 2.
*    ls_empleado-nombre = 'Juan'.
*    ls_empleado-departamento = 'VENTAS'.
*    APPEND ls_empleado TO lt_empleado.
*
*    ls_empleado-id_empleado = 3.
*    ls_empleado-nombre = 'Judas'.
*    ls_empleado-departamento = 'IT'.
*    APPEND ls_empleado TO lt_empleado.
*
*    ls_empleado-id_empleado = 4.
*    ls_empleado-nombre = 'Oscar'.
*    ls_empleado-departamento = 'RECURSOS HUMANOS'.
*    APPEND ls_empleado TO lt_empleado.
*
*    ls_empleado-id_empleado = 5.
*    ls_empleado-nombre = 'Gabri'.
*    ls_empleado-departamento = 'RECURSOS HUMANOS'.
*    APPEND ls_empleado TO lt_empleado.
*
*    READ TABLE lt_empleado INTO ls_empleado WITH KEY id_empleado = 3.
*    IF sy-subrc = 0.
*      out->write( |Nombre: { ls_empleado-nombre } Departamento: { ls_empleado-departamento }| ).
*    ELSE.
*      out->write( |No existe ese empleado| ).
*    ENDIF.
*
*
*    "Ejercicio 3
*    TYPES: BEGIN OF ty_pedido,
*             id_pedido TYPE i,
*             importe   TYPE p LENGTH 8 DECIMALS 2,
*             estado    TYPE string,
*           END OF ty_pedido.
*
*    DATA: ls_pedido     TYPE ty_pedido,
*          lt_pedido     TYPE TABLE OF ty_pedido,
*          lv_resto      TYPE i,
*          lv_id_buscado TYPE i VALUE 4.
*
*    DO 6 TIMES.
*      ls_pedido-id_pedido = sy-index.
*      ls_pedido-importe = sy-index * '50.25'.
*      lv_resto = sy-index MOD 2.
*
*      CASE lv_resto.
*        WHEN 0.
*          ls_pedido-estado = 'ENVIADO'.
*        WHEN 1.
*          ls_pedido-estado = 'PENDIENTE'.
*      ENDCASE.
*
*      APPEND ls_pedido TO lt_pedido.
*
*    ENDDO.
*
*    READ TABLE lt_pedido INTO ls_pedido WITH KEY id_pedido = lv_id_buscado estado = 'PENDIENTE'.
*
*    IF sy-subrc = 0.
*      out->write( |Importe: { ls_pedido-importe }| ).
*    ELSE.
*      out->write( |No hay pedidos en estado PENDIENTE| ).
*    ENDIF.

*    "Ejercicio 1
*    TYPES: BEGIN OF ty_videojuego,
*             titulo TYPE String,
*             precio TYPE p LENGTH 5 DECIMALS 2,
*           END OF ty_videojuego.
*
*    DATA ls_videojuego TYPE ty_videojuego.
*    DATA lt_videojuego TYPE TABLE OF ty_videojuego.
*
*    ls_videojuego-titulo = 'Spyro'.
*    ls_videojuego-precio = '40.00'.
*    APPEND ls_videojuego TO lt_videojuego.
*
*    ls_videojuego-titulo = 'Spyro 2'.
*    ls_videojuego-precio = '40.00'.
*    APPEND ls_videojuego TO lt_videojuego.
*
*    ls_videojuego-titulo = 'Spyro 3'.
*    ls_videojuego-precio = '40.00'.
*    APPEND ls_videojuego TO lt_videojuego.
*
*    LOOP AT lt_videojuego ASSIGNING FIELD-SYMBOL(<fs_videojuego>).
*      <fs_videojuego>-precio =  <fs_videojuego>-precio * '0.8'.
*      out->write( | El juego { <fs_videojuego>-titulo } cuesta { <fs_videojuego>-precio }| ).
*
*    ENDLOOP.

    "2. (Intermedio) — El equipo de una expedición
    "Declara con TYPES/DATA una estructura ty_expedicionario con los campos nombre (texto),
    "oxigeno_restante (entero) y estado (texto), y su tabla lt_expedicion. Añade 5 miembros del equipo con distintos niveles de oxigeno_restante
    "(algunos altos, otros bajos), dejando estado vacío de momento. Usando LOOP AT ... ASSIGNING, recorre la tabla y, con un IF,
    "actualiza el campo estado directamente sobre la fila original: si oxigeno_restante es menor que 20, asigna 'RETIRADA INMEDIATA';
    "en caso contrario, asigna 'CONTINUA'.
    "Después, usando READ TABLE con declaración inline,
    "busca si existe algún expedicionario concreto por nombre y muestra su estado actualizado con pipes.

*TYPES: BEGIN OF ty_expedicionario,
*        nombre              TYPE string,
*        oxigeno_restante    TYPE i,
*        estado              TYPE string,
*       END OF ty_expedicionario.
*
*DATA: lt_expedicionario TYPE TABLE OF ty_expedicionario,
*      ls_expedicionario TYPE ty_expedicionario.
*
*ls_expedicionario-nombre            = 'LuisCA'.
*ls_expedicionario-oxigeno_restante  = 16.
*ls_expedicionario-estado            = ''.
*APPEND ls_expedicionario TO lt_expedicionario.
*
*ls_expedicionario-nombre            = 'Juan'.
*ls_expedicionario-oxigeno_restante  = 47.
*ls_expedicionario-estado            = ''.
*APPEND ls_expedicionario TO lt_expedicionario.
*
*ls_expedicionario-nombre            = 'Alicia'.
*ls_expedicionario-oxigeno_restante  = 61.
*ls_expedicionario-estado            = ''.
*APPEND ls_expedicionario TO lt_expedicionario.
*
*ls_expedicionario-nombre            = 'Maria'.
*ls_expedicionario-oxigeno_restante  = 32.
*ls_expedicionario-estado            = ''.
*APPEND ls_expedicionario TO lt_expedicionario.
*
*ls_expedicionario-nombre            = 'Pedro'.
*ls_expedicionario-oxigeno_restante  = 28.
*ls_expedicionario-estado            = ''.
*APPEND ls_expedicionario TO lt_expedicionario.
*
*FIELD-SYMBOLS: <fs_expedicionario> TYPE ty_expedicionario.
*
*
*LOOP AT lt_expedicionario ASSIGNING <fs_expedicionario>.
* IF  <fs_expedicionario>-oxigeno_restante < 20.
*     <fs_expedicionario>-estado = 'RETIRADA INMEDIATA'.
*     ELSE.
*     <fs_expedicionario>-estado = 'CONTINUA'.
*     ENDIF.
*ENDLOOP.
*
*READ TABLE lt_expedicionario ASSIGNING FIELD-SYMBOL(<fs_expedicionario_buscado>)
*     WITH KEY nombre = 'LuisCA'.
*        IF sy-subrc = 0.
*            out->write( |El estado de { <fs_expedicionario_buscado>-nombre } es: { <fs_expedicionario_buscado>-estado }| ).
*        ELSE.
*            out->write( |No se encontró ningún expedicionario con ese nombre| ).
*        ENDIF.

    "3. (Difícil) — El sistema de facturación de un taller mecánico
    "Declara con TYPES/DATA una estructura ty_reparacion con los campos id_reparacion (entero), coste (decimal) y prioridad (texto),
    "y su tabla lt_reparaciones.
    "Usando DO 8 TIMES, genera reparaciones donde id_reparacion sea el número de vuelta,
    "coste sea el número de vuelta multiplicado por 35.80, y prioridad se calcule con CASE sobre el resto de dividir el número de vuelta entre
    "3:
    " 'URGENTE' si el resto es 0,
    "'NORMAL' si es 1,
    " 'BAJA' si es 2.
    "Añade cada una con APPEND. Después, usando LOOP AT ... ASSIGNING con WHERE prioridad = 'URGENTE',
    "aplica un recargo del 15% al coste de cada reparación urgente directamente sobre la fila original.
    "Finalmente, recorre toda la tabla con un LOOP AT normal y muestra con pipes un resumen de cada reparación
    "(id, coste final, prioridad), y al terminar, muestra cuántas reparaciones en total quedaron con prioridad 'URGENTE'.

*    TYPES: BEGIN OF ty_reparacion,
*                id_reparacion       TYPE i,
*                coste               TYPE p LENGTH 10 DECIMALS 2,
*                prioridad           TYPE string,
*           END OF ty_reparacion.
*
*    DATA: lt_reparacion TYPE TABLE OF ty_reparacion,
*          ls_reparacion TYPE ty_reparacion,
*          lv_contador   TYPE i,
*          lv_resto      TYPE i.
*
*    DO 8 TIMES.
*        lv_contador += 1.
*        ls_reparacion-id_reparacion = lv_contador.
*           ls_reparacion-coste = lv_contador * '35.80'.
*           lv_resto = ls_reparacion-id_reparacion MOD 3.
*                CASE lv_resto.
*                    WHEN 0.
*                        ls_reparacion-prioridad = 'URGENTE'.
*                        APPEND ls_reparacion TO lt_reparacion.
*                    WHEN 1.
*                        ls_reparacion-prioridad = 'NORMAL'.
*                        APPEND ls_reparacion TO lt_reparacion.
*                    WHEN 2.
*                        ls_reparacion-prioridad = 'BAJA'.
*                        APPEND ls_reparacion TO lt_reparacion.
*                ENDCASE.
*    ENDDO.
*
*    LOOP AT lt_reparacion ASSIGNING FIELD-SYMBOL(<fs_reparacion>) WHERE prioridad = 'URGENTE'.
*      <fs_reparacion>-coste = <fs_reparacion>-coste + ( <fs_reparacion>-coste * '0.15' ).
*    ENDLOOP.
*
*    DATA: lv_contador_urgentes TYPE i.
*
*    LOOP AT lt_reparacion INTO ls_reparacion.
*      out->write( |El ID { ls_reparacion-id_reparacion } tiene un coste final de { ls_reparacion-coste } y la prioridad es: { ls_reparacion-prioridad }| ).
*            IF ls_reparacion-prioridad = 'URGENTE'.
*                lv_contador_urgentes = lv_contador_urgentes + 1.
*            ENDIF.
*    ENDLOOP.
*    out->write( |Las reparaciones en estado 'URGENTE' son un total de: { lv_contador_urgentes }| ).


*4. (Muy muy muy difícil) — El centro de control de una carrera de relevos
*Declara con TYPES/DATA una estructura ty_corredor con los campos
*    dorsal (entero),
*    tiempo_vuelta (decimal),
*    equipo (texto)
*    y estado (texto),
*
*    y su tabla lt_corredores.
*
*    Usando DO 10 TIMES, genera corredores donde
*        dorsal sea el número de vuelta,
*            tiempo_vuelta sea el resultado de 50 menos el número de vuelta
*                multiplicado por 1.25 (para que varíen los tiempos),
*            equipo se calcule con CASE sobre el resto de dividir el dorsal entre 2
*                ('ROJO' si es par, 'AZUL' si es impar),
*             y estado se deje inicialmente vacío.
*
*    Añade cada corredor con APPEND.
*
*    Después, usando LOOP AT ... ASSIGNING sin filtro, recorre toda la tabla y,
*    con un IF anidado combinando condiciones lógicas, actualiza estado directamente
*    sobre la fila original:
*        si tiempo_vuelta es menor que 40 Y el equipo es 'ROJO', asigna 'CLASIFICADO';
*        si tiempo_vuelta es menor que 40 Y el equipo es 'AZUL', asigna 'CLASIFICADO' también,
*            pero antes de asignarlo comprueba con un READ TABLE (por dorsal, usando declaración inline)
*            si ya existe un corredor del equipo 'ROJO' con un tiempo_vuelta mejor (menor);
*                si es así, asigna en su lugar 'DESCALIFICADO POR EQUIPO'.
*
*        Para cualquier otro caso, asigna 'ELIMINADO'.
*
*        Al terminar, recorre la tabla de nuevo con
*            LOOP AT ... WHERE estado = 'CLASIFICADO' y muestra con
*            pipes el resumen de los clasificados,
*            junto con un contador final de cuántos corredores de cada
*            equipo ('ROJO' y 'AZUL') lograron clasificarse.

*    TYPES: BEGIN OF ty_corredor,
*             dorsal        TYPE i,
*             tiempo_vuelta TYPE p LENGTH 5 DECIMALS 2,
*             equipo        TYPE string,
*             estado        TYPE string,
*           END OF ty_corredor.
*
*    DATA ls_corredor TYPE ty_corredor.
*    DATA lt_corredor TYPE TABLE OF ty_corredor.
*
*    DO 10 TIMES.
*      ls_corredor-dorsal = sy-index.
*      ls_corredor-tiempo_vuelta = 45 - ( sy-index * '1.25' ).
*
*      IF sy-index > 8.
*        ls_corredor-tiempo_vuelta += 5.
*      ENDIF.
*
*      DATA(lv_resto) = sy-index MOD 2.
*      CASE lv_resto.
*        WHEN 0.
*          ls_corredor-equipo = 'ROJO'.
*        WHEN 1.
*          ls_corredor-equipo = 'AZUL'.
*      ENDCASE.
*
*      APPEND ls_corredor TO lt_corredor.
*
*    ENDDO.
*
**    Después, usando LOOP AT ... ASSIGNING sin filtro, recorre toda la tabla y,
**    con un IF anidado combinando condiciones lógicas, actualiza estado directamente
**    sobre la fila original:
**        si tiempo_vuelta es menor que 40 Y el equipo es 'ROJO', asigna 'CLASIFICADO';
**        si tiempo_vuelta es menor que 40 Y el equipo es 'AZUL', asigna 'CLASIFICADO' también,
**            pero antes de asignarlo comprueba con un READ TABLE (por dorsal, usando declaración inline)
**            si ya existe un corredor del equipo 'ROJO' con un tiempo_vuelta mejor (menor);
**                si es así, asigna en su lugar 'DESCALIFICADO POR EQUIPO'.
**
**        Para cualquier otro caso, asigna 'ELIMINADO'.
*
*    SORT lt_corredor BY tiempo_vuelta ASCENDING.
*
*    LOOP AT lt_corredor ASSIGNING FIELD-SYMBOL(<fs_corredor>).
*      IF <fs_corredor>-tiempo_vuelta < 40.
*        READ TABLE lt_corredor ASSIGNING FIELD-SYMBOL(<fs_clasificado>)
*          WITH KEY equipo = <fs_corredor>-equipo
*                   estado = 'CLASIFICADO'.
*        IF sy-subrc = 0.
*          IF <fs_clasificado>-tiempo_vuelta < <fs_corredor>-tiempo_vuelta.
*            <fs_corredor>-estado = 'DESCALIFICADO POR EQUIPO'.
*          ELSE.
*            <fs_corredor>-estado = 'CLASIFICADO'.
**            <fs_clasificado>-estado = 'DESCALIFICADO POR EQUIPO'.
*          ENDIF.
*
*        ELSE.
*          <fs_corredor>-estado = 'CLASIFICADO'.
*        ENDIF.
*
*      ELSE.
*        <fs_corredor>-estado = 'ELIMINADO'.
*      ENDIF.
*    ENDLOOP.
*
*    LOOP AT lt_corredor INTO ls_corredor
*        WHERE estado = 'CLASIFICADO'.
*      out->write( ls_corredor ).
*    ENDLOOP.
*
*    out->write( lt_corredor ).


  ENDMETHOD.
ENDCLASS.
