    ¿Cuántos perros de cada sexo hay en total actualmente en el centro?

    SELECT COUNT(*) AS "Dados de alta",especie
        FROM mascotas
            WHERE especie LIKE "P" AND estado LIKE "A"
                GROUP BY sexo;

     
     ¿Cuántos ejemplares contiene cada jaula o ubicación?

    SELECT COUNT(*) AS "NºEjemplares",ubicacion
        FROM mascotas
            WHERE estado LIKE "A"
                GROUP BY ubicacion;

     ¿Cuántos ejemplares de cada especie, y dentro de cada especie, de cada sexo, hay actualmente en el centro? (En este ejercicio tendremos que agrupar por dos niveles de la misma manera que con ORDER BY podíamos ordenador los registros según los valores de sus campos por niveles).
       
        SELECT COUNT(*) AS "Nº de altas",especie,sexo
            FROM `mascotas` WHERE estado LIKE "A"
                GROUP BY especie,sexo;
    

     ¿Cuántos perros y gatos han pasado por el centro y han sido dados de baja?

    SELECT COUNT(*) AS "Nº de bajas"
        FROM `mascotas` WHERE estado LIKE "B"
;


     ¿Cuántos perros macho hay en el centro agrupados por ubicación?
       
        SELECT COUNT(*) AS "Perros macho por ubicación",ubicacion
            FROM `mascotas` WHERE estado LIKE "A" AND especie LIKE "P" AND sexo LIKE "M"
                GROUP BY ubicacion;

     Construir una consulta que nos devuelva qué especies distintas hay en cada ubicación.
      
        SELECT ubicacion,especie
            FROM mascotas
                WHERE estado LIKE "A"
                    GROUP BY ubicacion,especie;


     ¿Cuántos ejemplares habrá dados de alta en las ubicaciones E02 y E03?

        SELECT COUNT(*) AS "Nº animales",ubicacion,especie,estado
            FROM mascotas
                WHERE estado LIKE "A" AND ubicacion IN ("E02", "E03")
                    GROUP BY ubicacion;


     ¿Qué ubicaciones del centro de veterinaria tienen tan solo un ejemplar?

    SELECT COUNT(*) AS "Nº animales",ubicacion,especie,estado
            FROM mascotas
                WHERE estado LIKE "A" 
                    GROUP BY ubicacion
                        HAVING COUNT = 1;


     Devuelve aquellas ubicaciones que tengan entre 2 y 3 animales.
       SELECT COUNT(*) AS "Nº animales",ubicacion,especie,estado
            FROM mascotas
                WHERE estado LIKE "A" 
                    GROUP BY ubicacion
                        HAVING COUNT IN (2,3);


     ¿Qué ubicaciones del centro tiene más de 2 ejemplares?
        SELECT COUNT(*) AS "Nº animales",ubicacion,especie,estado
                    FROM mascotas
                        WHERE estado LIKE "A" 
                            GROUP BY ubicacion
                                HAVING COUNT > 1;
                

