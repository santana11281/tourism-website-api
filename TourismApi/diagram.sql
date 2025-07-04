PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Destinos (

    id INTEGER PRIMARY KEY AUTOINCREMENT ,

    nombre VARCHAR(100),

    ciudad VARCHAR(100),

    provincia VARCHAR(100),

    tipo VARCHAR(50), -- Ej: "Playa", "Monta├▒a", etc.

    descripcion TEXT,

    imagen_portada_url TEXT,

    imagen TEXT,

    rating DECIMAL(2,1)

);
INSERT INTO Destinos VALUES(1,'Santo Domingo','Santo Domingo','Distrito Nacional','Ciudad','Capital de Rep├║blica Dominicana.','https://fotografias.lasexta.com/clipping/cmsimages01/2021/10/05/58F6ED90-190B-4488-BF99-A999A4AACA16/98.jpg?crop=1066,600,x68,y0&width=1900&height=1069&optimize=high&format=webply','',4.5);
INSERT INTO Destinos VALUES(2,'San Pedro de Macor├¡s','San Pedro','San Pedro de Macor├¡s','Ciudad','Conocida por su historia azucarera.','https://elnacional.com.do/wp-content/uploads/2022/10/ciudad-de-spm.jpg','',4);
INSERT INTO Destinos VALUES(3,'La Romana','La Romana','La Romana','Ciudad','Cerca de Altos de Chav├│n.','https://images.prismic.io/prismic-rd-2/Z-lIX3dAxsiBwFng_DROM4-PlayaDominicus%2CBayahibe%2CLaRomana-Copy.jpg?auto=format,compress','',4.299999999999999823);
INSERT INTO Destinos VALUES(4,'Punta Cana','Punta Cana','La Altagracia','Playa','Zona tur├¡stica famosa por sus playas.','https://content.r9cdn.net/rimg/dimg/c5/58/d56628fa-city-23052-162e4aeda47.jpg?width=1366&height=768&xhint=1688&yhint=1513&crop=true','',4.799999999999999823);
CREATE TABLE Activity (

    id INTEGER PRIMARY KEY AUTOINCREMENT,

    icon TEXT NOT NULL,

    title TEXT NOT NULL,

    description TEXT NOT NULL

);
INSERT INTO Activity VALUES(1,'fa-water','Deportes Acu├íticos','Disfruta de actividades como snorkel, buceo y surf en nuestras hermosas playas.');
INSERT INTO Activity VALUES(2,'fa-mountain','Aventuras','Explora monta├▒as, cascadas y senderos con gu├¡as experimentados.');
INSERT INTO Activity VALUES(3,'fa-utensils','Gastronom├¡a','Descubre la deliciosa cocina dominicana y sus sabores ├║nicos.');
INSERT INTO Activity VALUES(4,'fa-umbrella-beach','Playas','Rel├íjate en las mejores playas del Caribe con aguas cristalinas.');
CREATE TABLE DestinosActivityRelation (

    id INTEGER PRIMARY KEY AUTOINCREMENT,

    destino_id INTEGER NOT NULL,

    activity_id INTEGER NOT NULL,

    FOREIGN KEY (destino_id) REFERENCES Destinos(id),

    FOREIGN KEY (activity_id) REFERENCES Activity(id)

);
INSERT INTO DestinosActivityRelation VALUES(1,4,1);
INSERT INTO DestinosActivityRelation VALUES(2,4,4);
INSERT INTO DestinosActivityRelation VALUES(3,3,3);
INSERT INTO DestinosActivityRelation VALUES(4,3,4);
INSERT INTO DestinosActivityRelation VALUES(5,2,2);
INSERT INTO DestinosActivityRelation VALUES(6,2,3);
INSERT INTO DestinosActivityRelation VALUES(7,1,2);
INSERT INTO DestinosActivityRelation VALUES(8,1,3);
INSERT INTO DestinosActivityRelation VALUES(9,1,4);
CREATE TABLE Clima (

    id INTEGER PRIMARY KEY AUTOINCREMENT,

    tipo TEXT NOT NULL,

    temperatura TEXT  NOT NULL

);
INSERT INTO Clima VALUES(16,'tropical','30┬░');
INSERT INTO Clima VALUES(17,'tropical h├║medo','29┬░');
INSERT INTO Clima VALUES(18,'tropical seco','31┬░');
INSERT INTO Clima VALUES(19,'tropical costero','32┬░');
CREATE TABLE ClimaDestinoRelation (

    id INTEGER PRIMARY KEY AUTOINCREMENT,

    destino_id INTEGER NOT NULL,

    clima_id INTEGER NOT NULL,

    FOREIGN KEY (destino_id) REFERENCES Destinos(id),

    FOREIGN KEY (clima_id) REFERENCES Clima(id)

);
INSERT INTO ClimaDestinoRelation VALUES(1,1,16);
INSERT INTO ClimaDestinoRelation VALUES(2,2,17);
INSERT INTO ClimaDestinoRelation VALUES(3,3,18);
INSERT INTO ClimaDestinoRelation VALUES(4,4,19);
CREATE TABLE MejorEpocaVisitaDestinoRelation (

    id INTEGER PRIMARY KEY AUTOINCREMENT,

    destino_id INTEGER NOT NULL,

    epoca_id INTEGER NOT NULL,

    FOREIGN KEY (destino_id) REFERENCES Destinos(id),

    FOREIGN KEY (epoca_id) REFERENCES MejorEpocaVisita(id)

);
INSERT INTO MejorEpocaVisitaDestinoRelation VALUES(1,1,4);
INSERT INTO MejorEpocaVisitaDestinoRelation VALUES(2,2,4);
INSERT INTO MejorEpocaVisitaDestinoRelation VALUES(3,3,4);
INSERT INTO MejorEpocaVisitaDestinoRelation VALUES(4,4,4);
CREATE TABLE MejorEpocaVisita (

    id INTEGER PRIMARY KEY AUTOINCREMENT,

    epoca TEXT NOT NULL,

    temporada TEXT NOT NULL

);
INSERT INTO MejorEpocaVisita VALUES(1,'Primavera','Abril a Junio');
INSERT INTO MejorEpocaVisita VALUES(2,'Verano','Julio a Agosto');
INSERT INTO MejorEpocaVisita VALUES(3,'Otono','Septiembre a Noviembre');
INSERT INTO MejorEpocaVisita VALUES(4,'Invierno','Diciembre a Febrero');
CREATE TABLE Transporte (

    id INTEGER PRIMARY KEY AUTOINCREMENT,

    tipo TEXT NOT NULL, -- Ej: "A├⌐reo", "Terrestre", "Mar├¡timo"

    descripcion TEXT NOT NULL -- Ej: "Vuelos directos a Santo Domingo."

);
INSERT INTO Transporte VALUES(1,'A├⌐reo','Vuelos directos a Santo Domingo.');
INSERT INTO Transporte VALUES(2,'Terrestre','Autobuses y taxis disponibles en todo el pa├¡s.');
INSERT INTO Transporte VALUES(3,'Mar├¡timo','Ferries y cruceros que conectan las islas del Caribe.');
CREATE TABLE TransporteDestinoRelation (

    id INTEGER PRIMARY KEY AUTOINCREMENT,

    destino_id INTEGER NOT NULL,

    transporte_id INTEGER NOT NULL,

    FOREIGN KEY (destino_id) REFERENCES Destinos(id),

    FOREIGN KEY (transporte_id) REFERENCES Transporte(id)

);
INSERT INTO TransporteDestinoRelation VALUES(1,1,1);
INSERT INTO TransporteDestinoRelation VALUES(2,2,2);
INSERT INTO TransporteDestinoRelation VALUES(3,3,2);
INSERT INTO TransporteDestinoRelation VALUES(4,4,1);
CREATE TABLE AlojamientoDestinoRelation (

    id INTEGER PRIMARY KEY AUTOINCREMENT,

    destino_id INTEGER NOT NULL,

    alojamiento_id INTEGER NOT NULL,

    FOREIGN KEY (destino_id) REFERENCES Destinos(id),

    FOREIGN KEY (alojamiento_id) REFERENCES Alojamiento(id)

);
INSERT INTO AlojamientoDestinoRelation VALUES(1,1,1);
INSERT INTO AlojamientoDestinoRelation VALUES(2,2,2);
INSERT INTO AlojamientoDestinoRelation VALUES(3,3,3);
INSERT INTO AlojamientoDestinoRelation VALUES(4,4,4);
CREATE TABLE Alojamiento (

    id INTEGER PRIMARY KEY AUTOINCREMENT,

    nombre TEXT NOT NULL,

    tipo TEXT NOT NULL, -- Ej: "Hotel", "Hostal", "Apartamento"

    descripcion TEXT NOT NULL,

    direccion TEXT NOT NULL,

    telefono TEXT NOT NULL,

    email TEXT NOT NULL,

    precio DECIMAL(10,2) NOT NULL, -- Precio por noche

    rating DECIMAL(2,1) NOT NULL -- Rating del alojamiento

);
INSERT INTO Alojamiento VALUES(1,'Hotel Colonial Plaza','Hotel','Elegante hotel boutique en la Zona Colonial.','Calle Padre Billini 123, Santo Domingo','809-555-1010','info@colonialplaza.do',95,4.299999999999999823);
INSERT INTO Alojamiento VALUES(2,'Hostal R├¡o Dulce','Hostal','Ambiente familiar junto al r├¡o Higuamo.','Av. Independencia 78, San Pedro de Macor├¡s','809-555-2020','contacto@riodulcehostal.do',45,3.899999999999999912);
INSERT INTO Alojamiento VALUES(3,'Apartamento Altos Suites','Apartamento','Suite moderna cerca de Altos de Chav├│n.','Carretera La Romana-Cotu├¡ Km 3, La Romana','809-555-3030','reservas@altossuites.do',130,4.599999999999999644);
INSERT INTO Alojamiento VALUES(4,'Resort Mar Caribe','Hotel','Resort todo incluido con vistas al Caribe.','Playa B├ívaro, Punta Cana','809-555-4040','reservas@marcariberesort.do',260,4.900000000000000355);
CREATE TABLE DestinoDetalles (

    id INTEGER PRIMARY KEY AUTOINCREMENT,

    destino_id INTEGER NOT NULL,

    detalle TEXT NOT NULL,

    descripcion TEXT NOT NULL,

    FOREIGN KEY (destino_id) REFERENCES Destinos(id)

);
INSERT INTO DestinoDetalles VALUES(1,1,'Centro hist├│rico vibrante con arquitectura colonial, museos, vida nocturna y cultura dominicana.','Santo Domingo, la capital de Rep├║blica Dominicana, es una ciudad donde convergen historia y modernidad. Con su famosa Zona Colonial, declarada Patrimonio de la Humanidad por la UNESCO, ofrece una mezcla ├║nica de calles empedradas, arquitectura del siglo XVI, museos culturales y una activa vida urbana con restaurantes, galer├¡as y centros comerciales.');
INSERT INTO DestinoDetalles VALUES(2,2,'Ciudad costera con ra├¡ces azucareras, arquitectura tradicional y encanto cultural.','San Pedro de Macor├¡s es conocida por su rica historia en la industria azucarera y su legado cultural, especialmente en el b├⌐isbol. Sus calles cuentan con edificaciones hist├│ricas, mientras que su costa ofrece vistas relajantes del Mar Caribe. Adem├ís, es cuna de importantes figuras del deporte y la literatura dominicana.');
INSERT INTO DestinoDetalles VALUES(3,3,'Destino cultural cercano a Altos de Chav├│n, con playas tranquilas y campos de golf.','La Romana es un destino tur├¡stico de lujo ubicado al sureste del pa├¡s. Famosa por Altos de Chav├│n, una r├⌐plica de un pueblo mediterr├íneo del siglo XVI, y por su cercan├¡a a resorts exclusivos como Casa de Campo, ofrece actividades como golf, excursiones en catamar├ín y visitas a la isla Catalina. Ideal para el turismo cultural y de descanso.');
INSERT INTO DestinoDetalles VALUES(4,4,'Destino de ensue├▒o famoso por sus playas de arena blanca bordeadas de palmeras y sus aguas turquesas y c├ílidas.','Punta Cana es el principal destino tur├¡stico del Caribe por sus playas paradis├¡acas, resorts todo incluido y una amplia oferta de actividades acu├íticas. Sus aguas cristalinas, excelente clima durante todo el a├▒o y opciones para relajaci├│n o aventura la convierten en el lugar ideal tanto para vacaciones familiares como para escapadas rom├ínticas o de lujo.');
INSERT INTO sqlite_sequence VALUES('Destinos',4);
INSERT INTO sqlite_sequence VALUES('Activity',4);
INSERT INTO sqlite_sequence VALUES('DestinosActivityRelation',9);
INSERT INTO sqlite_sequence VALUES('Clima',19);
INSERT INTO sqlite_sequence VALUES('ClimaDestinoRelation',4);
INSERT INTO sqlite_sequence VALUES('MejorEpocaVisita',4);
INSERT INTO sqlite_sequence VALUES('MejorEpocaVisitaDestinoRelation',4);
INSERT INTO sqlite_sequence VALUES('Transporte',3);
INSERT INTO sqlite_sequence VALUES('TransporteDestinoRelation',4);
INSERT INTO sqlite_sequence VALUES('Alojamiento',4);
INSERT INTO sqlite_sequence VALUES('AlojamientoDestinoRelation',4);
INSERT INTO sqlite_sequence VALUES('DestinoDetalles',4);
COMMIT;
