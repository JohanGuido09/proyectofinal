USE HOTEL_SQLUXE_CS50
GO
INSERT INTO ADMINBD (Id_Admin,Usuario,Contraseña) 
VALUES(1, 'Admin','administrador@hotelsqluxe.bd-log@@&reg///');

INSERT INTO Estado (Id_estado, Descripcion) 
VALUES  (1, 'Activo'),
        (2, 'Inactivo'),
        (3, 'Disponible'),
        (4, 'Ocupada'),
        (5, 'Confirmada'),
        (6, 'Cancelada')
        GO

INSERT INTO Cliente (Nacionalidad, Cedula, Nombre, Apellido, Fecha_Nacimiento, Direccion_cliente, Correo, Genero, Telefono_cliente)
VALUES
('Nicaragua', '001-010101-0001L', 'Juan', 'Pérez', '1990-05-20', 'Calle Principal 123, Managua', 'juan.perez@example.com', 'M', '505-1234-5678'),
('Nicaragua', '002-020202-0002L', 'María', 'Lopez', '1992-11-15', 'Avenida Central 45, León', 'maria.lopez@example.com', 'F', '505-8765-4321'),
('Costa Rica', '003-030303-0003L', 'Carlos', 'Ramirez', '1988-03-30', 'Barrio La Paz, San José', 'carlos.ramirez@example.com', 'M', '506-9876-5432'),
('Honduras', '004-040404-0004L', 'Ana', 'Martínez', '1995-08-12', 'Colonia El Carmen, Tegucigalpa', 'ana.martinez@example.com', 'F', '504-6543-9876'),
('El Salvador', '005-050505-0005L', 'José', 'González', '1985-01-10', 'Boulevard Los Héroes, San Salvador', 'jose.gonzalez@example.com', 'M', '503-4321-8765'),
('Guatemala', '006-060606-0006L', 'Carmen', 'Sánchez', '1993-07-25', 'Zona 10, Ciudad de Guatemala', 'carmen.sanchez@example.com', 'F', '502-3210-9876'),
('Panamá', '007-070707-0007L', 'Luis', 'Fernández', '1989-10-05', 'Calle 50, Ciudad de Panamá', 'luis.fernandez@example.com', 'M', '507-5678-1234'),
('México', '008-080808-0008L', 'Sofía', 'Morales', '1994-02-14', 'Avenida Reforma, Ciudad de México', 'sofia.morales@example.com', 'F', '52-1234-5678'),
('Colombia', '009-090909-0009L', 'Miguel', 'Torres', '1987-09-09', 'Carrera 7, Bogotá', 'miguel.torres@example.com', 'M', '57-8765-4321'),
('Perú', '010-101010-0010L', 'Isabel', 'Rojas', '1991-06-18', 'Calle Las Begonias, Lima', 'isabel.rojas@example.com', 'F', '51-9876-5432'),
('Chile', '011-111111-0011L', 'Sebastián', 'Navarro', '1986-04-22', 'Avenida Providencia, Santiago', 'sebastian.navarro@example.com', 'M', '56-6543-9876'),
('Argentina', '012-121212-0012L', 'Lucía', 'Castro', '1990-12-01', 'Calle Florida, Buenos Aires', 'lucia.castro@example.com', 'F', '54-4321-8765'),
('Uruguay', '013-131313-0013L', 'Ricardo', 'Vega', '1983-03-15', 'Barrio Pocitos, Montevideo', 'ricardo.vega@example.com', 'M', '598-3210-9876'),
('Paraguay', '014-141414-0014L', 'Fernanda', 'Méndez', '1996-07-09', 'Calle Palma, Asunción', 'fernanda.mendez@example.com', 'F', '595-5678-1234'),
('Ecuador', '015-151515-0015L', 'Gabriel', 'Lara', '1992-11-23', 'Calle Amazonas, Quito', 'gabriel.lara@example.com', 'M', '593-1234-5678');

INSERT INTO Cargo (Id_Cargo, Nombre_Cargo, Descripcion_Cargo, SalarioCargo)
VALUES
(1, 'Recepcionista', 'Responsable de atender a los huéspedes, realizar check-in y check-out', 1500.00),
(2, 'Gerente', 'Encargado de la administración general del hotel, supervisión de operaciones y personal', 3000.00),
(3, 'Camarero', 'Atiende en el área de restaurantes, sirve alimentos y bebidas a los huéspedes', 1200.00),
(4, 'Cocinero', 'Preparación de alimentos y supervisión de la cocina', 1800.00),
(5, 'Mucama', 'Responsable de la limpieza y arreglo de las habitaciones y áreas comunes del hotel', 1000.00);
GO

INSERT INTO Record_Policial (Id_Record_Policial, Antecedentes, Departamento_Emision, Municipio_Emision, Fecha_Emision, Detalles_Record_Policial)
VALUES
    (1, 'Ninguno', 'Managua', 'Distrito I', '2024-01-15', 'El ciudadano no posee antecedentes policiales registrados.'),
    (2, 'Hurto menor', 'Masaya', 'Masaya', '2023-12-10', 'Implicado en un caso de hurto menor en 2022.'),
    (3, 'Riña en la vía pública', 'León', 'León', '2022-11-05', 'Participación en una riña en la vía pública en 2021.'),
    (4, 'Ninguno', 'Chinandega', 'Chinandega', '2024-03-08', 'Sin registros policiales en la base de datos.'),
    (5, 'Conducción temeraria', 'Estelí', 'Estelí', '2023-09-20', 'Involucrado en un caso de conducción temeraria en 2023.');



INSERT INTO Empleado (Nombre_Empleado, Apellido_Empleado, Fecha_Nacimiento_Empleado, Estado_Civil, No_Cedula, Correo, NumIns_Empleado, Id_Record_Policial, Genero_Empleado, Id_Cargo, Id_Estado)
VALUES
('Juan', 'Pérez', '1985-06-15', 'Soltero', '1234567890', 'juan.perez@hotel.com', 'INS12345', 1, 'M', 2, 1),
('Ana', 'González', '1990-03-22', 'Casada', '0987654321', 'ana.gonzalez@hotel.com', 'INS67890', 2, 'F', 1, 2),
('Carlos', 'Ramírez', '1982-11-10', 'Divorciado', '1122334455', 'carlos.ramirez@hotel.com', 'INS11223', 3, 'M', 3, 3),
('María', 'López', '1995-07-30', 'Soltera', '2233445566', 'maria.lopez@hotel.com', 'INS22334', 4, 'F', 4, 1),
('Luis', 'Martínez', '1988-01-18', 'Casado', '3344556677', 'luis.martinez@hotel.com', 'INS33445', 5, 'M', 5, 2);
GO

INSERT INTO Telefono_Empleado (Id_NumTelfEmpleado, Num_Telf, Id_Empleado, Descripcion_Telefono_Empleado)
VALUES
(1,'555-1234', 1, 'Teléfono móvil personal de Juan Pérez'),
(2,'555-5678', 2, 'Teléfono de oficina de Ana González'),
(3,'555-8765', 3, 'Teléfono móvil personal de Carlos Ramírez'),
(4,'555-4321', 4, 'Teléfono de oficina de María López'),
(5,'555-9876', 5, 'Teléfono móvil personal de Luis Martínez');
GO

	INSERT INTO Departamento (Id_Departamento, Nombre_Departamento, Desc_Departamento)
VALUES
    (1, 'Managua', 'Capital de Nicaragua y principal centro económico del país'),
    (2, 'León', 'Departamento histórico con fuerte influencia colonial'),
    (3, 'Granada', 'Ciudad turística y uno de los destinos más antiguos de Nicaragua'),
    (4, 'Masaya', 'Conocida por su artesanía y cultura'),
    (5, 'Chinandega', 'Zona costera con gran producción agrícola');

	INSERT INTO Municipio (Id_Municipio, Nombre_Municipio, Id_Departamento, Desc_Municipio)
VALUES
    -- Municipios de Managua
    (1, 'Managua', 1, 'Municipio capital'),
    (2, 'Ticuantepe', 1, 'Famoso por su producción de piñas'),
    (3, 'Villa El Carmen', 1, 'Municipio rural cercano a la capital'),

    -- Municipios de León
    (4, 'León', 2, 'Cabecera departamental de León'),
    (5, 'El Jicaral', 2, 'Municipio rural de León'),

    -- Municipios de Granada
    (6, 'Granada', 3, 'Principal municipio del departamento'),
    (7, 'Diriá', 3, 'Municipio con tradición indígena'),

    -- Municipios de Masaya
    (8, 'Masaya', 4, 'Conocida como la Ciudad de las Flores'),
    (9, 'Nindirí', 4, 'Cercano a la Laguna de Masaya'),

    -- Municipios de Chinandega
    (10, 'Chinandega', 5, 'Cabecera departamental de Chinandega'),
    (11, 'Corinto', 5, 'Puerto más importante de Nicaragua');

	INSERT INTO Distrito (Id_Distrito, Id_Municipio, Nombre_Distrito, Desc_Distrito)
VALUES
    -- Distritos de Managua
    (1, 1, 'Distrito I', 'Zona central de Managua'),
    (2, 1, 'Distrito II', 'Zona cercana al centro histórico'),
    (3, 1, 'Distrito III', 'Zona residencial y comercial'),
    (4, 1, 'Distrito IV', 'Zona periférica de Managua'),
    
    -- Distritos de León
    (5, 4, 'Distrito Central León', 'Zona urbana de León'),

    -- Distritos de Granada
    (6, 6, 'Distrito Centro Granada', 'Zona turística de Granada');

	INSERT INTO Barrio (Id_Barrio, Id_Distrito, Id_Municipio, Nombre_Barrio, Desc_Barrio)
VALUES
    -- Barrios de Managua
    (1, 1, 1, 'Barrio Altagracia', 'Cercano al mercado Roberto Huembes'),
    (2, 2, 1, 'Colonia Centroamérica', 'Barrio residencial de clase media'),
    (3, 3, 1, 'Barrio 19 de Julio', 'Barrio popular'),

    -- Barrios de León
    (4, 5, 4, 'Sutiaba', 'Barrio indígena de León'),

    -- Barrios de Granada
    (5, 6, 6, 'La Calzada', 'Zona turística y comercial de Granada');

	INSERT INTO Calle (Id_Calle, Nombre_Calle, Desc_Calle)
VALUES
    (1, 'Calle Principal de Managua', 'Arteria principal de la ciudad'),
    (2, 'Avenida Bolívar', 'Conecta con el puerto Salvador Allende'),
    (3, 'Calle Real Xalteva', 'Ubicada en Granada, una de las más antiguas de Nicaragua'),
    (4, 'Calle La Calzada', 'Famosa por sus restaurantes y bares en Granada'),
    (5, 'Calle Central de León', 'Calle histórica que conecta con la catedral de León');

INSERT INTO Tipo_Residencia (Id_Tipo_Residencia, TipoResidencia)
VALUES
    (1, 'Casa Principal'),
    (2, 'Domicilio Secundario'),
    (3, 'Temporal');

	INSERT INTO Direccion_Empleado (Id_Direccion_Empleado, Id_Empleado, Id_Barrio, Id_Calle, Num_Casa, Ubicacion_Exacta_Empleado, Id_Tipo_Residencia)
VALUES
    -- Dirección para el empleado 1
    (1, 1, 1, 1, '123', 'Cerca del mercado Roberto Huembes', 1), 
    -- Dirección para el empleado 2
    (2, 2, 2, 2, '456', 'Residencial en Colonia Centroamérica', 2),
    -- Dirección para el empleado 3
    (3, 3, 3, 3, '789', 'En el barrio 19 de Julio', 3),
    -- Dirección para el empleado 4
    (4, 4, 4, 4, '101', 'En la zona histórica de Sutiaba', 1),
    -- Dirección para el empleado 5
    (5, 5, 5, 5, '202', 'En la calle Calzada, Granada', 2);

INSERT INTO Descrip_UbicacionHotel (Id_DescripUbicacion, descripcionUbicacion)
VALUES 
(1, 'Primeros pisos (1-3): Recepcion y lobby. Algunas habitaciones individuales y dobles para facilitar el acceso'),
(2, 'Pisos intermedios (4-5): Habitaciones familiares y de parejas'),
(3, 'Piso superior (6): Habitaciones suites');

-- Insertar en la tabla Ubicacion_Hotel
INSERT INTO Ubicacion_Hotel (Id_Ubicacion_Hotel, Id_DescripUbicacion, lugar_hotel)
VALUES
(1, 1, 'Planta baja'),
(2, 1, 'Planta media'),
(3, 1, 'Planta alta'),
(4, 2, 'Planta baja'),
(5, 2, 'Planta alta'),
(6, 3, 'Planta alta');

-- Inserciones para la tabla Tipo_Habitacion
INSERT INTO Tipo_Habitacion (Id_Tipo_Habitacion, Nombre_TipoHab, Descripcion_Habitacion, Precio_Habitacion)
VALUES
(1, 'Suite', 'Habitacion de lujo con comodidades premium.', 250.00),
(2, 'Familiar', 'Espacio amplio con múltiples camas para familias.', 200.00),
(3, 'Doble', 'Habitacion con dos camas individuales.', 120.00),
(4, 'Individual', 'Habitacion con una cama para una persona.', 90.00),
(5, 'Pareja', 'Habitacion diseñada para parejas con cama king-size.', 150.00);

-- Inserciones para la tabla Caract_Habitacion
INSERT INTO Caract_Habitacion (Id_CaracteristicaHab, Nombre_Caracteristica, Descripcion_Caracteristica, Id_Tipo_Habitacion)
VALUES
-- Caracteristicas de Tipo Suite
(1, 'Cama King o Queen', 'Cama amplia y comoda para maximo lujo.', 1),
(2, 'Estudio con escritorio', 'area de trabajo privado con escritorio.', 1),
(3, 'Closet de lujo', 'Espacio amplio y moderno para guardar ropa.', 1),
(4, 'Caja fuerte', 'Caja de seguridad para objetos de valor.', 1),
(5, 'Televisor', 'Pantalla de alta definicion.', 1),
(6, 'Cocina', 'Cocina equipada con electrodomesticos modernos.', 1),
(7, 'Aire acondicionado', 'Sistema de control climatico.', 1),
(8, 'Calefactor', 'Calefaccion para mayor confort.', 1),
(9, 'Jacuzzi', 'Tina de hidromasaje de lujo.', 1),
(10, 'Balcon', 'Balcon privado con vistas al mar.', 1),
(11, 'Wi-Fi', 'Conexion inalambrica de alta velocidad.', 1),
(12, 'Minibar', 'Pequeño refrigerador con bebidas y snacks.', 1),
(13, 'Mesa de billar', 'Mesa para entretenimiento en la habitacion.', 1),

-- Caracteristicas de Tipo Familiar
(14, 'Cama Queen y/o literas', 'Camas grandes y literas ideales para niños.', 2),
(15, 'Espacio de almacenamiento amplio', 'Armarios y cajones adicionales.', 2),
(16, 'Televisor', 'Pantalla para entretenimiento familiar.', 2),
(17, 'Aire acondicionado', 'Control de temperatura para comodidad.', 2),
(18, 'Wi-Fi', 'Internet para todos los dispositivos familiares.', 2),
(19, 'Minibar', 'Refrigerador con bebidas y snacks.', 2),
(20, 'Detalles y juguetes para niños', 'Decoraciones y juguetes incluidos.', 2),
(21, 'Mesa de comedor familiar', 'Mesa para comidas en grupo.', 2),

-- Caracteristicas de Tipo Doble
(22, 'Cama Queen o dos individuales', 'Cama grande o dos camas separadas.', 3),
(23, 'Televisor', 'Pantalla de alta definicion.', 3),
(24, 'Aire acondicionado', 'Sistema de control climatico.', 3),
(25, 'Wi-Fi', 'Internet inalambrico.', 3),
(26, 'Escritorio compacto', 'Espacio de trabajo pequeño.', 3),
(27, 'Closet pequeño', 'Espacio reducido para guardar ropa.', 3),
(28, 'Baño privado basico', 'Baño sencillo pero comodo.', 3),

-- Caracteristicas de Tipo Individual
(29, 'Cama individual', 'Cama para una persona.', 4),
(30, 'Escritorio', 'area de trabajo personal.', 4),
(31, 'Closet compacto', 'Espacio reducido para guardar ropa.', 4),
(32, 'Televisor', 'Pantalla de alta definicion.', 4),
(33, 'Aire acondicionado', 'Control de temperatura individual.', 4),
(34, 'Wi-Fi', 'Conexion a internet.', 4),
(35, 'Caja fuerte', 'Caja de seguridad para objetos personales.', 4),
(36, 'Baño privado basico', 'Baño sencillo pero funcional.', 4),

-- Caracteristicas de Tipo Pareja
(37, 'Cama King o Queen', 'Cama espaciosa para parejas.', 5),
(38, 'Decoracion romantica', 'Detalles especiales para una estancia romantica.', 5),
(39, 'Jacuzzi', 'Tina de hidromasaje para dos.', 5),
(40, 'Televisor', 'Pantalla de alta definicion.', 5),
(41, 'Aire acondicionado', 'Climatizacion comoda.', 5),
(42, 'Wi-Fi', 'Conexion inalambrica.', 5),
(43, 'Closet amplio', 'Espacio generoso para guardar ropa.', 5),
(44, 'Balcon o ventanales', 'Vistas espectaculares.', 5),
(45, 'Comodidades para parejas', 'Batas, pantuflas y otros detalles.', 5),
(46, 'Iluminacion ambiental', 'Luces especiales para un ambiente romantico.', 5);

INSERT INTO Habitacion (Id_Habitacion, Num_Habitacion, Tam_Habitacion, Id_Ubicacion_Hotel, Id_Tipo_Habitacion, Numero_Camas, Capacidad_Personas, Id_Estado, Descripcion_Adicional_Habitacion)
VALUES 
--Habitaciones de la 1 a la 30 individuales
(1, '1', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(2, '2', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(3, '3', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(4, '4', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(5, '5', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(6, '6', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(7, '7', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(8, '8', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(9, '9', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(10, '10', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(11, '11', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(12, '12', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(13, '13', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(14, '14', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(15, '15', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(16, '16', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(17, '17', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(18, '18', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(19, '19', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(20, '20', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(21, '21', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(22, '22', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(23, '23', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(24, '24', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(25, '25', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(26, '26', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(27, '27', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(28, '28', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(29, '29', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila'),
(30, '30', 'Pequeña', 2, 4, '1', '1', 1, 'Habitacion acogedora, ideal para una estancia tranquila');
--Habitaciones de la 31 a la 53 dobles
INSERT INTO Habitacion (Id_Habitacion, Num_Habitacion, Tam_Habitacion, Id_Ubicacion_Hotel, Id_Tipo_Habitacion, Numero_Camas, Capacidad_Personas, Id_Estado, Descripcion_Adicional_Habitacion)
VALUES 
(31, '31', 'Grande', 3, 3, '2', '2', 1, 'Habitacion comoda para dos personas, con espacio ideal para una estancia relajante'),
(32, '32', 'Grande', 3, 3, '2', '2', 1, 'Habitacion comoda para dos personas, con espacio ideal para una estancia relajante'),
(33, '33', 'Grande', 3, 3, '2', '2', 1, 'Habitacion comoda para dos personas, con espacio ideal para una estancia relajante'),
(34, '34', 'Grande', 3, 3, '2', '2', 1, 'Habitacion comoda para dos personas, con espacio ideal para una estancia relajante'),
(35, '35', 'Grande', 3, 3, '2', '2', 1, 'Habitacion comoda para dos personas, con espacio ideal para una estancia relajante'),
(36, '36', 'Grande', 3, 3, '2', '2', 1, 'Habitacion comoda para dos personas, con espacio ideal para una estancia relajante'),
(37, '37', 'Grande', 3, 3, '2', '2', 1, 'Habitacion comoda para dos personas, con espacio ideal para una estancia relajante'),
(38, '38', 'Grande', 3, 3, '2', '2', 1, 'Habitacion comoda para dos personas, con espacio ideal para una estancia relajante'),
(39, '39', 'Grande', 3, 3, '2', '2', 1, 'Habitacion comoda para dos personas, con espacio ideal para una estancia relajante'),
(40, '40', 'Grande', 3, 3, '2', '2', 1, 'Habitacion comoda para dos personas, con espacio ideal para una estancia relajante'),
(41, '41', 'Grande', 3, 3, '2', '2', 1, 'Habitacion comoda para dos personas, con espacio ideal para una estancia relajante'),
(42, '42', 'Grande', 3, 3, '2', '2', 1, 'Habitacion comoda para dos personas, con espacio ideal para una estancia relajante'),
(43, '43', 'Grande', 3, 3, '2', '2', 1, 'Habitacion comoda para dos personas, con espacio ideal para una estancia relajante'),
(44, '44', 'Grande', 3, 3, '2', '2', 1, 'Habitacion comoda para dos personas, con espacio ideal para una estancia relajante'),
(45, '45', 'Grande', 3, 3, '2', '2', 1, 'Habitacion comoda para dos personas, con espacio ideal para una estancia relajante'),
(46, '46', 'Grande', 3, 3, '2', '2', 1, 'Habitacion comoda para dos personas, con espacio ideal para una estancia relajante'),
(47, '47', 'Grande', 3, 3, '2', '2', 1, 'Habitacion comoda para dos personas, con espacio ideal para una estancia relajante'),
(48, '48', 'Grande', 3, 3, '2', '2', 1, 'Habitacion comoda para dos personas, con espacio ideal para una estancia relajante'),
(49, '49', 'Grande', 3, 3, '2', '2', 1, 'Habitacion comoda para dos personas, con espacio ideal para una estancia relajante'),
(50, '50', 'Grande', 3, 3, '2', '2', 1, 'Habitacion comoda para dos personas, con espacio ideal para una estancia relajante'),
(51, '51', 'Grande', 3, 3, '2', '2', 1, 'Habitacion comoda para dos personas, con espacio ideal para una estancia relajante'),
(52, '52', 'Grande', 3, 3, '2', '2', 1, 'Habitacion comoda para dos personas, con espacio ideal para una estancia relajante'),
(53, '53', 'Grande', 3, 3, '2', '2', 1, 'Habitacion comoda para dos personas, con espacio ideal para una estancia relajante');
--Habitaciones de la 54 a la 73 familiares
INSERT INTO Habitacion (Id_Habitacion, Num_Habitacion, Tam_Habitacion, Id_Ubicacion_Hotel, Id_Tipo_Habitacion, Numero_Camas, Capacidad_Personas, Id_Estado, Descripcion_Adicional_Habitacion)
VALUES 
(54, '54', 'Grande', 4, 2, '4', '4', 1, 'Habitacion espaciosa, ideal para familias'),
(55, '55', 'Grande', 4, 2, '4', '4', 1, 'Habitacion espaciosa, ideal para familias'),
(56, '56', 'Grande', 4, 2, '4', '4', 1, 'Habitacion espaciosa, ideal para familias'),
(57, '57', 'Grande', 4, 2, '4', '4', 1, 'Habitacion espaciosa, ideal para familias'),
(58, '58', 'Grande', 4, 2, '4', '4', 1, 'Habitacion espaciosa, ideal para familias'),
(59, '59', 'Grande', 4, 2, '4', '4', 1, 'Habitacion espaciosa, ideal para familias'),
(60, '60', 'Grande', 4, 2, '4', '4', 1, 'Habitacion espaciosa, ideal para familias'),
(61, '61', 'Grande', 4, 2, '4', '4', 1, 'Habitacion espaciosa, ideal para familias'),
(62, '62', 'Grande', 4, 2, '4', '4', 1, 'Habitacion espaciosa, ideal para familias'),
(63, '63', 'Grande', 4, 2, '4', '4', 1, 'Habitacion espaciosa, ideal para familias'),
(64, '64', 'Grande', 4, 2, '4', '4', 1, 'Habitacion espaciosa, ideal para familias'),
(65, '65', 'Grande', 4, 2, '4', '4', 1, 'Habitacion espaciosa, ideal para familias'),
(66, '66', 'Grande', 4, 2, '4', '4', 1, 'Habitacion espaciosa, ideal para familias'),
(67, '67', 'Grande', 4, 2, '4', '4', 1, 'Habitacion espaciosa, ideal para familias'),
(68, '68', 'Grande', 4, 2, '4', '4', 1, 'Habitacion espaciosa, ideal para familias'),
(69, '69', 'Grande', 4, 2, '4', '4', 1, 'Habitacion espaciosa, ideal para familias'),
(70, '70', 'Grande', 4, 2, '4', '4', 1, 'Habitacion espaciosa, ideal para familias'),
(71, '71', 'Grande', 4, 2, '4', '4', 1, 'Habitacion espaciosa, ideal para familias'),
(72, '72', 'Grande', 4, 2, '4', '4', 1, 'Habitacion espaciosa, ideal para familias'),
(73, '73', 'Grande', 4, 2, '4', '4', 1, 'Habitacion espaciosa, ideal para familias');
--Habitaciones de la 74 a la 96 pareja
INSERT INTO Habitacion (Id_Habitacion, Num_Habitacion, Tam_Habitacion, Id_Ubicacion_Hotel, Id_Tipo_Habitacion, Numero_Camas, Capacidad_Personas, Id_Estado, Descripcion_Adicional_Habitacion)
VALUES 
(74, '74', 'Grande', 5, 5, '1', '2', 1, 'Habitacion intima y comoda, perfecta para parejas'),
(75, '75', 'Grande', 5, 5, '1', '2', 1, 'Habitacion intima y comoda, perfecta para parejas'),
(76, '76', 'Grande', 5, 5, '1', '2', 1, 'Habitacion intima y comoda, perfecta para parejas'),
(77, '77', 'Grande', 5, 5, '1', '2', 1, 'Habitacion intima y comoda, perfecta para parejas'),
(78, '78', 'Grande', 5, 5, '1', '2', 1, 'Habitacion intima y comoda, perfecta para parejas'),
(79, '79', 'Grande', 5, 5, '1', '2', 1, 'Habitacion intima y comoda, perfecta para parejas'),
(80, '80', 'Grande', 5, 5, '1', '2', 1, 'Habitacion intima y comoda, perfecta para parejas'),
(81, '81', 'Grande', 5, 5, '1', '2', 1, 'Habitacion intima y comoda, perfecta para parejas'),
(82, '82', 'Grande', 5, 5, '1', '2', 1, 'Habitacion intima y comoda, perfecta para parejas'),
(83, '83', 'Grande', 5, 5, '1', '2', 1, 'Habitacion intima y comoda, perfecta para parejas'),
(84, '84', 'Grande', 5, 5, '1', '2', 1, 'Habitacion intima y comoda, perfecta para parejas'),
(85, '85', 'Grande', 5, 5, '1', '2', 1, 'Habitacion intima y comoda, perfecta para parejas'),
(86, '86', 'Grande', 5, 5, '1', '2', 1, 'Habitacion intima y comoda, perfecta para parejas'),
(87, '87', 'Grande', 5, 5, '1', '2', 1, 'Habitacion intima y comoda, perfecta para parejas'),
(88, '88', 'Grande', 5, 5, '1', '2', 1, 'Habitacion intima y comoda, perfecta para parejas'),
(89, '89', 'Grande', 5, 5, '1', '2', 1, 'Habitacion intima y comoda, perfecta para parejas'),
(90, '90', 'Grande', 5, 5, '1', '2', 1, 'Habitacion intima y comoda, perfecta para parejas'),
(91, '91', 'Grande', 5, 5, '1', '2', 1, 'Habitacion intima y comoda, perfecta para parejas'),
(92, '92', 'Grande', 5, 5, '1', '2', 1, 'Habitacion intima y comoda, perfecta para parejas'),
(93, '93', 'Grande', 5, 5, '1', '2', 1, 'Habitacion intima y comoda, perfecta para parejas'),
(94, '94', 'Grande', 5, 5, '1', '2', 1, 'Habitacion intima y comoda, perfecta para parejas'),
(95, '95', 'Grande', 5, 5, '1', '2', 1, 'Habitacion intima y comoda, perfecta para parejas'),
(96, '96', 'Grande', 5, 5, '1', '2', 1, 'Habitacion intima y comoda, perfecta para parejas');

-- Habitaciones de la 97 a la 109
INSERT INTO Habitacion (Id_Habitacion, Num_Habitacion, Tam_Habitacion, Id_Ubicacion_Hotel, Id_Tipo_Habitacion, Numero_Camas, Capacidad_Personas, Id_Estado, Descripcion_Adicional_Habitacion)
VALUES 
(97, '97', 'Grande', 6, 1, '2', '2', 1, 'Habitacion de lujo con espacios amplios y elegantes'),
(98, '98', 'Grande', 6, 1, '2', '2', 1, 'Habitacion de lujo con espacios amplios y elegantes'),
(99, '99', 'Grande', 6, 1, '2', '2', 1, 'Habitacion de lujo con espacios amplios y elegantes'),
(100, '100', 'Grande', 6, 1, '2', '2', 1, 'Habitacion de lujo con espacios amplios y elegantes'),
(101, '101', 'Grande', 6, 1, '2', '2', 1, 'Habitacion de lujo con espacios amplios y elegantes'),
(102, '102', 'Grande', 6, 1, '2', '2', 1, 'Habitacion de lujo con espacios amplios y elegantes'),
(103, '103', 'Grande', 6, 1, '2', '2', 1, 'Habitacion de lujo con espacios amplios y elegantes'),
(104, '104', 'Grande', 6, 1, '2', '2', 1, 'Habitacion de lujo con espacios amplios y elegantes'),
(105, '105', 'Grande', 6, 1, '2', '2', 1, 'Habitacion de lujo con espacios amplios y elegantes'),
(106, '106', 'Grande', 6, 1, '2', '2', 1, 'Habitacion de lujo con espacios amplios y elegantes'),
(107, '107', 'Grande', 6, 1, '2', '2', 1, 'Habitacion de lujo con espacios amplios y elegantes'),
(108, '108', 'Grande', 6, 1, '2', '2', 1, 'Habitacion de lujo con espacios amplios y elegantes'),
(109, '109', 'Grande', 6, 1, '2', '2', 1, 'Habitacion de lujo con espacios amplios y elegantes');

	INSERT INTO Categoria_Servicios (Id_Categoria_Servicio, Nombre_Categoria_Servicio, Descripcion_Categoria_Servicio, Condiciones_Categoria_Servicios)
VALUES
    (1, 'Recreación', 'Servicios relacionados con actividades recreativas y de esparcimiento', 'Disponible durante las horas de operación del hotel'),
    (2, 'Alojamientos', 'Servicios relacionados con el alojamiento y las habitaciones del hotel', 'Varía según tipo de habitación'),
    (3, 'Eventos', 'Servicios de planificación y gestión de eventos', 'Sujeto a disponibilidad y reserva previa'),
    (4, 'Transporte', 'Servicios de transporte para los huéspedes', 'Sujeto a disponibilidad y condiciones del contrato'),
    (5, 'Limpieza', 'Servicios relacionados con la limpieza y lavandería', 'Servicios a solicitud o programados');

	INSERT INTO Tipos_Servicio (Id_Tipo_Servicio, Id_Categoria_Servicio, Nombre_Servicio, Descripcion_Tipo_Servicio, Condiciones_Tipo_Servicio)
VALUES
    (1, 1, 'Tour', 'Visitas guiadas por los principales puntos turísticos de la ciudad', 'Con reserva previa y horario fijo'),
    (2, 2, 'Gimnasio', 'Acceso al gimnasio del hotel para mantenerte en forma', 'Abierto las 24 horas para los huéspedes'),
    (3, 2, 'Piscina', 'Acceso a la piscina del hotel para relajación y natación', 'Disponible durante todo el día'),
    (4, 4, 'Transporte', 'Servicio de transporte desde y hacia el hotel', 'Servicio con tarifa adicional y reserva previa'),
    (5, 5, 'Lavandería', 'Servicio de lavandería para huéspedes', 'Disponible a solicitud con entrega dentro de 24 horas'),
    (6, 3, 'Eventos', 'Organización de eventos dentro del hotel como bodas y conferencias', 'Con reserva previa y contrato de servicio'),
    (7, 3, 'Boda', 'Servicio de organización y gestión para bodas', 'Incluye decoración, catering y coordinación'),
    (8, 3, 'Conferencia', 'Servicio de organización de conferencias, seminarios y presentaciones', 'Con capacidad para hasta 200 personas'),
    (9, 3, 'Reunión', 'Organización de reuniones de negocios y eventos corporativos', 'Con equipos audiovisuales y salas privadas');

	INSERT INTO Servicios (Id_Servicio, Id_Tipo_Servicio, Id_Empleado, Descripcion_Adicional_Servicios)
VALUES
    (1, 1, 1, 'Tour por los principales puntos turísticos de la ciudad'),
    (2, 2, 2, 'Acceso libre al gimnasio del hotel durante todo el día'),
    (3, 3, 3, 'Acceso a la piscina para relajación o deportes acuáticos'),
    (4, 4, 2, 'Servicio de transporte desde el aeropuerto hasta el hotel'),
    (5, 5, 1, 'Lavandería con opción de entrega en 24 horas'),
    (6, 6, 3, 'Organización de eventos personalizados según las necesidades del cliente'),
    (7, 7, 4, 'Organización de bodas, incluyendo banquete y decoración'),
    (8, 8, 2, 'Servicios para conferencias con equipos audiovisuales'),
    (9, 9, 1, 'Reuniones de negocios con opciones de catering y equipos necesarios');

	INSERT INTO Categoria_Tarifa (Id_Categoria_Tarifa, Nombre_CTarifa, Descripcion_CTarifa, Condiciones_Categoria_Tarifa)
VALUES
    (1, 'Estándar', 'Tarifa básica para clientes sin descuentos o promociones especiales', 'Aplicable a todos los clientes sin distinción'),
    (2, 'Corporativa', 'Tarifa especial para empresas y empleados corporativos', 'Requiere verificación de la empresa'),
    (3, 'Promocional', 'Tarifa de descuento para períodos promocionales', 'Solo válida durante las fechas promocionales');

INSERT INTO Tipo_Tarifa (Id_Tipo_Tarifa, Id_Categoria_Tarifa, Nombre_TTarifa, Descripcion_TTarifa, Condiciones_Tipo_Tarifa)
VALUES
    (1, 1, 'Básica', 'Tarifa básica sin beneficios adicionales', 'Sin descuentos ni servicios adicionales incluidos'),
    (2, 1, 'Con Descuento', 'Tarifa con descuento en ciertas fechas', 'Descuento de un 10% durante temporada baja'),
    (3, 2, 'Corporativa', 'Tarifa especial para empresas', 'Requiere verificar la empresa para acceder a la tarifa'),
    (4, 3, 'Promoción Verano', 'Tarifa especial para la temporada de verano', 'Disponible solo entre junio y agosto');

	INSERT INTO Tarifa (Id_Tarifa, Id_Tipo_Tarifa, Temporada, Fecha_Inicio, Fecha_Fin, Monto_Especifico)
VALUES
    (1, 1, 'Baja', '2024-01-01', '2024-03-31', 100.00),
    (2, 2, 'Alta', '2024-04-01', '2024-08-31', 150.00),
    (3, 3, 'Media','2024-09-01', '2024-11-30', 120.00),
    (4, 4, 'Promoción Verano', '2024-06-01', '2024-08-31', 80.00);

INSERT INTO Reservacion 
    (Id_Reservacion, Id_Cliente, Id_Habitacion, Fecha_Checkin, Fecha_Checkout, Id_Servicio, N_Acompanante, Descripcion_Adicional_Reservacion)
VALUES
    (1, 1, 5, '2024-11-25', '2024-11-30', 2, 1, 'Preferencia por vista al mar.'),
    (2, 3, 10, '2024-12-01', '2024-12-05', 1, 2, 'Requiere desayuno incluido.'),
    (3, 5, 15, '2024-12-10', '2024-12-12', 3, 0, NULL),
    (4, 7, 20, '2024-11-28', '2024-12-03', 5, 3, 'Cama extra para acompañante.'),
    (5, 9, 25, '2024-11-30', '2024-12-02', 4, 1, NULL),
    (6, 2, 30, '2024-12-05', '2024-12-07', 2, 0, 'Check-out tardío solicitado.'),
    (7, 4, 35, '2024-11-27', '2024-12-01', 1, 1, NULL),
    (8, 6, 40, '2024-12-03', '2024-12-06', 3, 2, 'Sin restricciones alimenticias.'),
    (9, 8, 50, '2024-12-08', '2024-12-10', 4, 4, 'Preferencia por piso alto.'),
    (10, 10, 55, '2024-12-15', '2024-12-20', 5, 0, 'Visita por aniversario.')

INSERT INTO Monto_Reserva (Id_MontoReserv, Id_Reservacion, Costo_Total)
VALUES
(1, 1, 150.00),
(2, 2, 200.50),
(3, 3, 180.00),
(4, 4, 250.75),
(5, 5, 300.00),
(6, 6, 220.30),
(7, 7, 190.00),
(8, 8, 210.40),
(9, 9, 175.80),
(10, 10, 260.10);

INSERT INTO Tarjeta (Id_Tarjeta, Id_Cliente, Numero_Tarjeta, Banco_Emisor_Tarjeta, Monto_Pagado, Autorizacion_Codigo)
VALUES
(1, 1, '1234567812345678', 'Banco Nacional', 200.00, 'AUT12345'),
(2, 2, '2345678923456789', 'Banco Latino', 150.50, 'AUT67890'),
(3, 3, '3456789034567890', 'Banco Central', 300.75, 'AUT11223'),
(4, 4, '4567890145678901', 'Banco Internacional', 120.20, 'AUT44556'),
(5, 5, '5678901256789012', 'Banco de Occidente', 250.00, 'AUT78901');

INSERT INTO Factura 
    (Id_Factura, Num_Factura, Id_MontoReserv, Fecha_Emision, Id_Empleado, Id_Tarjeta)
VALUES
    (1, 'F-2024-0001', 1, GETDATE(), 2, 1),
    (2, 'F-2024-0002', 2, GETDATE(), 3, NULL),
    (3, 'F-2024-0003', 3, GETDATE(), 1, 3),
    (4, 'F-2024-0004', 4, GETDATE(), 4, NULL),
    (5, 'F-2024-0005', 5, GETDATE(), 5, 4),
    (6, 'F-2024-0006', 6, GETDATE(), 1, 2),
    (7, 'F-2024-0007', 7, GETDATE(), 2, NULL),
    (8, 'F-2024-0008', 8, GETDATE(), 3, 1),
    (9, 'F-2024-0009', 9,GETDATE(), 4, NULL),
    (10, 'F-2024-0010', 10, GETDATE(), 5, 5);

INSERT INTO Quejas (Id_Queja, Fecha_Queja, Descripcion_Queja, Id_Estado, Id_Empleado, Id_Cliente)
VALUES
(1, GETDATE(), 'La habitación estaba sucia.', 1, 1, 1),
(2, GETDATE(), 'El servicio de lavandería fue muy lento.', 2, 2, 2),
(3, GETDATE(), 'No se cumplió con el horario de check-in.', 1, 3, 3),
(4, GETDATE(), 'Problemas con el aire acondicionado.', 3, 4, 4),
(5, GETDATE(), 'La comida no estuvo a la altura.', 2, 5, 5);
