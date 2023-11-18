// Crear nodos e insertar datos
LOAD CSV WITH HEADERS FROM 'file:///books_100_cleaned.csv' AS row
MERGE (l:Libros {isbn: row.ISBN, titulo: row.`Book-Title`, año_edicion: toInteger(row.`Year-Of-Publication`)})
MERGE (a:Autores {id_autor: row.`ID-Author`, nombre_autor: row.`Book-Author`})
MERGE (a)-[:TIENE]->(l)


// Ver todos los datos
MATCH (l:Libros)-[:TIENE]-(a:Autores)
RETURN l, a


// Poner a Amy Tan y Adam Lebor en mayúscula
MATCH (a:Autores)
WHERE a.nombre_autor IN ['Amy Tan', 'Adam Lebor'] 
SET a.nombre_autor = toUpper(a.nombre_autor)


// Buscar los libros publicados a partir de 2020 de Amy Tan
MATCH (a:Autores {nombre_autor: 'AMY TAN'})-[:TIENE]-(l:Libros)
WHERE l.año_edicion = 2020
RETURN a, COLLECT(l)


// Buscar los libros cuyo título empice or 'The' de Amy Tan
MATCH (a:Autores {nombre_autor: 'AMY TAN'})-[:TIENE]-(l:Libros)
WHERE l.titulo STARTS WITH 'The'
RETURN a, COLLECT(l)


// Buscar libro por ISBN
MATCH (l:Libros)
WHERE l.isbn = '0195153448'
RETURN l

// Obtener tiempo de ejecución (en milisegundos) de una consulta
MATCH (l:Libros) WHERE l.`año_edicion` = 1999 RETURN l


// Crear un índice sobre ese valor
CREATE INDEX ON:Libros(año_edicion)


// Obtener tiempo de ejecución (en milisegundos) de una consulta
MATCH (l:Libros) WHERE l.`año_edicion` = 1999 RETURN l

