# prog05_desappint_ej2020
Programa 5. Verificación de instalación de PHP y configuración de MySQL

La finalidad de este programa es verificar que tengan instalado Apache, PHP y MySQL con la correcta configuración para poder acceder a bases de datos MySQL. 


1. Una vez instalado MySQL (ya sea de manera individual o como parte de algun paquete completo como AppServ o XAMPP), es necesario ejecutar los scripts CreacionTablasDesApp.sql, LlenaCatalogosDesApp.sql y  ColocaDatosInicialesDesApp.sql, los cuales crean la base de datos a utilizarse a partir de ahora, los usuarios para acceder a ella, las tablas que la componen, llenan las tablas de catalógo de entidad y municipio y ponen datos iniciales en otras tablas. Para este paso, realice lo siguiente (RUTA se sustituye por la ubicación donde tengan los archivos .sql): 
En una ventana de comandos, ejecute los siguientes comandos (tecleando después de cada uno su clave de root de MySQL cuando se le pida):
      mysql --default-character-set=utf8 -u root -p < RUTA/CreacionTablasDesApp.sql 
      mysql --default-character-set=utf8 -u root -p < RUTA/LlenaCatalogosDesApp.sql 
      mysql --default-character-set=utf8 -u root -p < RUTA/ColocaDatosInicialesDesApp.sql 
      
2. Edite la línea 17 del archivo infoserver.php para que el contenido de la variable $usuario sea su nombre completo, haga commit después de este cambio.
3. En el archivo php.ini de configuración de PHP (ubicado en la subcarpeta php7, asumiendo que instalo AppServ y que está trabajando en Windows, para otros paquetes o sistemas operativos será necesario que investigue como hacer este paso), descomente la línea que dice "extension=php_pdo_mysql.dll" asegurandose que no tenga un punto y coma al inicio de la línea. Esto es para poder activar la funcionalidad de PDO (PHP Data Objects) que permiten un acceso a las bases de datos de manera portable.

4. Coloque los archivos config.php e infoserver.php en el directorio de documentos de Apache (subdirectorio www en el caso de AppServ) y en un navegador ponga la siguiente dirección:  http://localhost/infoserver.php

5. Debería aparecer una página como la que se muestra en la imagen CapturaNavegador.png, donde se ve la configuración de su servidor, las tablas que contiene la base de datos y el nombre de las instituciones de Zacatecas (esto ultimo tomado de la tabla institucion)

6. Guarde esta página dando click con el botón derecho en la pagina, seleccionado Guardar Como... y asegurandose que el tipo es Página Web completa, el nombre del archivo debe ser su matricula (con extension html) y debe ser guardado en el directorio donde se clonó el repositorio

7. Haga commit de este cambio (agregado del archivo HTML)

8. Haga push de su repositorio

ESTOS PASOS DEBEN SER REALIZADOS ANTES DE LAS 23:59 DEL DOMINGO 8 DE MARZO DEL 2020
