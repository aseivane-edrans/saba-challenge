# Ejecución de Máquina de Estados

## Desarrollo
 - En primer lugar se debió correr la máquina de estados en Yakindu. 
 **Solución:** dado que las versiones de Eclipse no se correspondían con las más recientes del Plugin, hubo que seguir los pasos brindados por la cátedra para poder utilizar el aplicativo y cargar la licencia. 

 -  La siguiente problemática se encontró cuando se corrió el debugger del proyecto. Se encontraron muchas advertencias que no permitian una correcta lectura de lo que estaba sucediendo. 
 **Solución:** el error se debió a una mala configuración del lintern que pudo corregirse a partir de una correcta ejecución del _busybox_ en el directorio que correspondía.
 
 - El problema más grave se encontró al querer ejecutar el _makefile_ y generar los archivos a ser enviados a la placa EDU-CIAA. Esto no estaba pudiendo realizarse y se podían observar una gran cantidad de errores en la consola.
 **Solución:** se pudo observar que el error estaba en la ubicación de los directorios firmware_v3 y el Software de la CIAA. Estos deben encontrarse al mismo nivel para que el compilador comprenda dónde encontrar los distintos archivos.
 
  ## Conclusión
  
  Finalmente se logró replicar lo observado en la Máquina de estados de Yakindu en la placa EDU-CIAA, cumpliendo con lo esperado al ejecutar los distintas eventos que provocaban los cambios de estado correspondientes.