
// Entrar en la collection 'biblioteca'
use biblioteca


// Ver todos los datos
db.libros.find()


// Poner a Amy Tan y Adam Lebor en mayúscula
db.libros.updateMany(
	{"Book-Author": { $in: ["Amy Tan", "Adam Lebor"]}},
	[{ $set: { "Book-Author": {$toUpper: "$Book-Author"}}}]
)


// Buscar los libros publicados a partir de 2020 de Amy Tan
db.libros.find({
  "Book-Author": "AMY TAN",
  "Year-Of-Publication": { $gte: 1994 }
})


// Buscar los libros cuyo título empice or 'The' de Amy Tan
db.libros.find({
	"Book-Author": "AMY TAN",
	"Book-Title": { $regex: /^The/i }
})


// Buscar libro por ISBN
db.libros.find({"ISBN": 0195153448})


// Obtener tiempo de ejecución (en milisegundos) de una consulta
db.getCollection("libros").find({
	"Year-Of-Publication": 1999
}).explain("executionStats").executionStats.executionTimeMillis;


// Crear un índice sobre ese valor
db.libros.createIndex({"Year-Of-Publication": 1})


// Obtener tiempo de ejecución (en milisegundos) de una consulta con el índice creado
db.getCollection("libros").find({
	"Year-Of-Publication": 1999
}).explain("executionStats").executionStats.executionTimeMillis;

