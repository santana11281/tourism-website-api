PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Destinos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(100),
    provincia VARCHAR(100),
    tipo VARCHAR(50), -- Ej: "Playa", "Monta├▒a", etc.
    descripcion VARCHAR(MAX),
    imagen_portada_url VARCHAR(MAX),
    imagen VARCHAR(MAX),
    rating DECIMAL(2,1)
);
INSERT INTO Destinos VALUES(1,'Santo Domingo','Santo Domingo','Distrito Nacional','Ciudad','Capital de Rep├║blica Dominicana.','https://fotografias.lasexta.com/clipping/cmsimages01/2021/10/05/58F6ED90-190B-4488-BF99-A999A4AACA16/98.jpg?crop=1066,600,x68,y0&width=1900&height=1069&optimize=high&format=webply','',4.5);
INSERT INTO Destinos VALUES(2,'San Pedro de Macor├¡s','San Pedro','San Pedro de Macor├¡s','Ciudad','Conocida por su historia azucarera.','https://elnacional.com.do/wp-content/uploads/2022/10/ciudad-de-spm.jpg','',4);
INSERT INTO Destinos VALUES(3,'La Romana','La Romana','La Romana','Ciudad','Cerca de Altos de Chav├│n.','https://images.prismic.io/prismic-rd-2/Z-lIX3dAxsiBwFng_DROM4-PlayaDominicus%2CBayahibe%2CLaRomana-Copy.jpg?auto=format,compress','',4.299999999999999823);
INSERT INTO Destinos VALUES(4,'Punta Cana','Punta Cana','La Altagracia','Playa','Zona tur├¡stica famosa por sus playas.','https://content.r9cdn.net/rimg/dimg/c5/58/d56628fa-city-23052-162e4aeda47.jpg?width=1366&height=768&xhint=1688&yhint=1513&crop=true','',4.799999999999999823);
CREATE TABLE Activity (
    id INT IDENTITY(1,1) PRIMARY KEY,
    icon VARCHAR(MAX) NOT NULL,
    title VARCHAR(MAX) NOT NULL,
    description VARCHAR(MAX) NOT NULL
);
INSERT INTO Activity VALUES(1,'fa-water','Deportes Acu├íticos','Disfruta de actividades como snorkel, buceo y surf en nuestras hermosas playas.');
INSERT INTO Activity VALUES(2,'fa-mountain','Aventuras','Explora monta├▒as, cascadas y senderos con gu├¡as experimentados.');
INSERT INTO Activity VALUES(3,'fa-utensils','Gastronom├¡a','Descubre la deliciosa cocina dominicana y sus sabores ├║nicos.');
INSERT INTO Activity VALUES(4,'fa-umbrella-beach','Playas','Rel├íjate en las mejores playas del Caribe con aguas cristalinas.');
CREATE TABLE DestinosActivityRelation (
    id INT IDENTITY(1,1) PRIMARY KEY,
    destino_id INT NOT NULL,
    activity_id INT NOT NULL,
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
    id INT IDENTITY(1,1) PRIMARY KEY,
    tipo VARCHAR(MAX) NOT NULL,
    tempratura VARCHAR(MAX) NOT NULL
);
INSERT INTO Clima VALUES(16,'tropical','30┬░');
INSERT INTO Clima VALUES(17,'tropical h├║medo','29┬░');
INSERT INTO Clima VALUES(18,'tropical seco','31┬░');
INSERT INTO Clima VALUES(19,'tropical costero','32┬░');
CREATE TABLE ClimaDestinoRelation (
    id INT IDENTITY(1,1) PRIMARY KEY,
    destino_id INT NOT NULL,
    clima_id INT NOT NULL,
    FOREIGN KEY (destino_id) REFERENCES Destinos(id),
    FOREIGN KEY (clima_id) REFERENCES Clima(id)
);
INSERT INTO ClimaDestinoRelation VALUES(1,1,16);
INSERT INTO ClimaDestinoRelation VALUES(2,2,17);
INSERT INTO ClimaDestinoRelation VALUES(3,3,18);
INSERT INTO ClimaDestinoRelation VALUES(4,4,19);
CREATE TABLE MejorEpocaVisitaDestinoRelation (
    id INT IDENTITY(1,1) PRIMARY KEY,
    destino_id INT NOT NULL,
    epoca_id INT NOT NULL,
    FOREIGN KEY (destino_id) REFERENCES Destinos(id),
    FOREIGN KEY (epoca_id) REFERENCES MejorEpocaVisita(id)
);
INSERT INTO MejorEpocaVisitaDestinoRelation VALUES(1,1,4);
INSERT INTO MejorEpocaVisitaDestinoRelation VALUES(2,2,4);
INSERT INTO MejorEpocaVisitaDestinoRelation VALUES(3,3,4);
INSERT INTO MejorEpocaVisitaDestinoRelation VALUES(4,4,4);
CREATE TABLE MejorEpocaVisita (
    id INT IDENTITY(1,1) PRIMARY KEY,
    epoca VARCHAR(MAX) NOT NULL,
    temporada VARCHAR(MAX) NOT NULL
);
INSERT INTO MejorEpocaVisita VALUES(1,'Primavera','Abril a Junio');
INSERT INTO MejorEpocaVisita VALUES(2,'Verano','Julio a Agosto');
INSERT INTO MejorEpocaVisita VALUES(3,'Otono','Septiembre a Noviembre');
INSERT INTO MejorEpocaVisita VALUES(4,'Invierno','Diciembre a Febrero');
CREATE TABLE Transporte (
    id INT IDENTITY(1,1) PRIMARY KEY,
    tipo VARCHAR(MAX) NOT NULL, -- Ej: "A├⌐reo", "Terrestre", "Mar├¡timo"
    descripcion VARCHAR(MAX) NOT NULL -- Ej: "Vuelos directos a Santo Domingo."
);
INSERT INTO Transporte VALUES(1,'A├⌐reo','Vuelos directos a Santo Domingo.');
INSERT INTO Transporte VALUES(2,'Terrestre','Autobuses y taxis disponibles en todo el pa├¡s.');
INSERT INTO Transporte VALUES(3,'Mar├¡timo','Ferries y cruceros que conectan las islas del Caribe.');
CREATE TABLE TransporteDestinoRelation (
    id INT IDENTITY(1,1) PRIMARY KEY,
    destino_id INT NOT NULL,
    transporte_id INT NOT NULL,
    FOREIGN KEY (destino_id) REFERENCES Destinos(id),
    FOREIGN KEY (transporte_id) REFERENCES Transporte(id)
);
INSERT INTO TransporteDestinoRelation VALUES(1,1,1);
INSERT INTO TransporteDestinoRelation VALUES(2,2,2);
INSERT INTO TransporteDestinoRelation VALUES(3,3,2);
INSERT INTO TransporteDestinoRelation VALUES(4,4,1);
CREATE TABLE AlojamientoDestinoRelation (
    id INT IDENTITY(1,1) PRIMARY KEY,
    destino_id INT NOT NULL,
    alojamiento_id INT NOT NULL,
    FOREIGN KEY (destino_id) REFERENCES Destinos(id),
    FOREIGN KEY (alojamiento_id) REFERENCES Alojamiento(id)
);
INSERT INTO AlojamientoDestinoRelation VALUES(1,1,1);
INSERT INTO AlojamientoDestinoRelation VALUES(2,2,2);
INSERT INTO AlojamientoDestinoRelation VALUES(3,3,3);
INSERT INTO AlojamientoDestinoRelation VALUES(4,4,4);
CREATE TABLE Alojamiento (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(MAX) NOT NULL,
    tipo VARCHAR(MAX) NOT NULL, -- Ej: "Hotel", "Hostal", "Apartamento"
    descripcion VARCHAR(MAX) NOT NULL,
    direccion VARCHAR(MAX) NOT NULL,
    telefono VARCHAR(MAX) NOT NULL,
    email VARCHAR(MAX) NOT NULL,
    precio DECIMAL(10,2) NOT NULL, -- Precio por noche
    rating DECIMAL(2,1) NOT NULL -- Rating del alojamiento
);
INSERT INTO Alojamiento VALUES(1,'Hotel Colonial Plaza','Hotel','Elegante hotel boutique en la Zona Colonial.','Calle Padre Billini 123, Santo Domingo','809-555-1010','info@colonialplaza.do',95,4.299999999999999823);
INSERT INTO Alojamiento VALUES(2,'Hostal R├¡o Dulce','Hostal','Ambiente familiar junto al r├¡o Higuamo.','Av. Independencia 78, San Pedro de Macor├¡s','809-555-2020','contacto@riodulcehostal.do',45,3.899999999999999912);
INSERT INTO Alojamiento VALUES(3,'Apartamento Altos Suites','Apartamento','Suite moderna cerca de Altos de Chav├│n.','Carretera La Romana-Cotu├¡ Km 3, La Romana','809-555-3030','reservas@altossuites.do',130,4.599999999999999644);
INSERT INTO Alojamiento VALUES(4,'Resort Mar Caribe','Hotel','Resort todo incluido con vistas al Caribe.','Playa B├ívaro, Punta Cana','809-555-4040','reservas@marcariberesort.do',260,4.900000000000000355);
CREATE TABLE DestinoDetalles (
    id INT IDENTITY(1,1) PRIMARY KEY,
    destino_id INT NOT NULL,
    detalle VARCHAR(MAX) NOT NULL,
    descripcion VARCHAR(MAX) NOT NULL,
    img_url VARCHAR(MAX),
    FOREIGN KEY (destino_id) REFERENCES Destinos(id)
);
INSERT INTO DestinoDetalles VALUES(1,1,'Centro hist├│rico vibrante con arquitectura colonial, museos, vida nocturna y cultura dominicana.','Santo Domingo, la capital de Rep├║blica Dominicana, es una ciudad donde convergen historia y modernidad. Con su famosa Zona Colonial, declarada Patrimonio de la Humanidad por la UNESCO, ofrece una mezcla ├║nica de calles empedradas, arquitectura del siglo XVI, museos culturales y una activa vida urbana con restaurantes, galer├¡as y centros comerciales.','https://images.prismic.io/prismic-rd-2/Z-bnSndAxsiBwEpb_PuertadelaMisericordia.SantoDomingo_.jpg?auto=format,compress');
INSERT INTO DestinoDetalles VALUES(2,2,'Ciudad costera con ra├¡ces azucareras, arquitectura tradicional y encanto cultural.','San Pedro de Macor├¡s es conocida por su rica historia en la industria azucarera y su legado cultural, especialmente en el b├⌐isbol. Sus calles cuentan con edificaciones hist├│ricas, mientras que su costa ofrece vistas relajantes del Mar Caribe. Adem├ís, es cuna de importantes figuras del deporte y la literatura dominicana.','https://upload.wikimedia.org/wikipedia/commons/9/9e/Catedral_San_Pedro.jpg');
INSERT INTO DestinoDetalles VALUES(3,3,'Destino cultural cercano a Altos de Chav├│n, con playas tranquilas y campos de golf.','La Romana es un destino tur├¡stico de lujo ubicado al sureste del pa├¡s. Famosa por Altos de Chav├│n, una r├⌐plica de un pueblo mediterr├íneo del siglo XVI, y por su cercan├¡a a resorts exclusivos como Casa de Campo, ofrece actividades como golf, excursiones en catamar├ín y visitas a la isla Catalina. Ideal para el turismo cultural y de descanso.','https://solstis.tours/cdn-cgi/imagedelivery/VzYWRpJYIXLVGwr8vjyQnA/abe3e054-1ded-4fb8-c6e2-285e82354b00/public');
INSERT INTO DestinoDetalles VALUES(4,4,'Destino de ensue├▒o famoso por sus playas de arena blanca bordeadas de palmeras y sus aguas turquesas y c├ílidas.','Punta Cana es el principal destino tur├¡stico del Caribe por sus playas paradis├¡acas, resorts todo incluido y una amplia oferta de actividades acu├íticas. Sus aguas cristalinas, excelente clima durante todo el a├▒o y opciones para relajaci├│n o aventura la convierten en el lugar ideal tanto para vacaciones familiares como para escapadas rom├ínticas o de lujo.','https://images.prismic.io/prismic-rd-2/Z6N4BpbqstJ9-Qdf_punta-cana-cover.jpg?auto=format%2Ccompress&fit=max&w=3840');
CREATE TABLE Rutas (
    id INT IDENTITY(1,1) PRIMARY KEY,
    origen VARCHAR(MAX) NOT NULL,
    destino VARCHAR(MAX) NOT NULL,
    distancia_km INT,
    duracion VARCHAR(MAX) -- e.g. '2h 30min'
);
INSERT INTO Rutas VALUES(1,'Santo Domingo','Punta Cana',200,'2h 30min');
CREATE TABLE RutaParadas (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ruta_id INT NOT NULL,
    nombre VARCHAR(MAX) NOT NULL,
    descripcion VARCHAR(MAX),
    tiempo VARCHAR(MAX), -- '1:00', '2:30', etc.
    icono VARCHAR(MAX), -- e.g. 'building', 'coffee', 'temple', etc.
    FOREIGN KEY (ruta_id) REFERENCES Rutas(id)
);
CREATE TABLE RutasDestinoRelation (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ruta_id INT NOT NULL,
    destino_id INT NOT NULL,
    FOREIGN KEY (ruta_id) REFERENCES Rutas(id),
    FOREIGN KEY (destino_id) REFERENCES Destinos(id)
);
INSERT INTO RutasDestinoRelation VALUES(1,1,1);
INSERT INTO RutasDestinoRelation VALUES(2,1,4);
INSERT INTO RutasDestinoRelation VALUES(3,1,1);
INSERT INTO RutasDestinoRelation VALUES(4,1,4);
CREATE TABLE TransporteOpciones (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ruta_id INT NOT NULL,
    tipo VARCHAR(MAX) NOT NULL, -- 'Carro privado', 'Autob├║s', etc.
    duracion VARCHAR(MAX),
    precio_min DECIMAL(10,2),
    precio_max DECIMAL(10,2),
    icono VARCHAR(MAX), -- e.g. 'car', 'bus'
    FOREIGN KEY (ruta_id) REFERENCES Rutas(id)
);
INSERT INTO TransporteOpciones VALUES(1,1,'Carro privado','2h 30min',150,200,'car');
INSERT INTO TransporteOpciones VALUES(2,1,'Autob├║s','3h 00min',50,70,'bus');
INSERT INTO TransporteOpciones VALUES(3,1,'Taxi compartido','2h 45min',100,120,'taxi');
CREATE TABLE TipsViaje (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ruta_id INT NOT NULL,
    texto VARCHAR(MAX) NOT NULL,
    FOREIGN KEY (ruta_id) REFERENCES Rutas(id)
);
INSERT INTO TipsViaje VALUES(1,1,'Lleva protector solar y repelente de insectos para disfrutar al m├íximo de las playas.');
INSERT INTO TipsViaje VALUES(2,1,'Hidr├ítate constantemente, especialmente si viajas en verano.');
INSERT INTO TipsViaje VALUES(3,1,'Consulta el clima antes de viajar para llevar la ropa adecuada.');
INSERT INTO TipsViaje VALUES(4,1,'Prueba la gastronom├¡a local en los restaurantes recomendados a lo largo de la ruta.');
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
INSERT INTO sqlite_sequence VALUES('Rutas',1);
INSERT INTO sqlite_sequence VALUES('RutasDestinoRelation',4);
INSERT INTO sqlite_sequence VALUES('TransporteOpciones',3);
INSERT INTO sqlite_sequence VALUES('TipsViaje',4);
COMMIT;
