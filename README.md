# atbd-entrega-2

## Datos
- books.cvs: Datos originales
- books_100_clean.csv: 100 instancias de los datos preprocesados
- books_10k_clean.csv: 10 mil instancias de los datos preprocesados

## Preproceso de los datos
- limpiar_csv.ipynb: Análisis y preproceso de los datos

## Sentencias Neo4j
- sentencias_neo4j.cyp: Todas las sentencias ejecutadas que se piden en el enunciado.

Pasos seguidos:
1. Poner en marcha Neo4j:
   ```
   cypher-shell
   ```
2. Ejecutar sentencias desde el browser: http://localhost:7474/

## Sentencias MongoDB
- sentencias_mongodb.js: Todas las sentencias ejecutadas que se piden en el enunciado.

Pasos seguidos:
1. Importar los datos desde el csv:
   ```
   mongoimport --db biblioteca --collection libros --type csv --headerline --file ./books_100_cleaned.csv
   ```
2. Entrar en MondoDB:
   ```
   mongoshj
   ```
3. Entrar en la base de datos creada y ejecutar las consultas desde la terminal:
   ```
   use biblioteca
   ```
