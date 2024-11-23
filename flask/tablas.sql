CREATE DATABASE HOTEL_SQLUXE_CS50
GO
USE HOTEL_SQLUXE_CS50
GO

CREATE TABLE ADMINBD(
    Id_Admin INT PRIMARY KEY,
    Usuario VARCHAR(20) NOT NULL,
    Contraseña VARCHAR(255) NOT NULL
)
GO

CREATE TABLE Estado (
    Id_Estado INT PRIMARY KEY,
    Descripcion VARCHAR(10) CHECK (Descripcion IN ('Activo', 'Inactivo', 'Disponible', 'Ocupada', 'Confirmada', 'Cancelada')) NOT NULL,
    Situacion_Estado VARCHAR(250)
)
GO

CREATE TABLE Subscriber (
    id INT IDENTITY(1,1) PRIMARY KEY,
    email NVARCHAR(255) NOT NULL UNIQUE, 
    created_at DATETIME DEFAULT GETDATE() 
)
GO

CREATE TABLE Cliente (
    Id_Cliente INT PRIMARY KEY IDENTITY(1,1),
    Nacionalidad VARCHAR(20),
    Cedula VARCHAR(20) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Fecha_Nacimiento DATE NOT NULL,
    Direccion_cliente VARCHAR(200) NOT NULL,
    Correo VARCHAR(100) NOT NULL,
    Genero CHAR(1) CHECK(Genero IN('M', 'F')) NOT NULL,
    Telefono_cliente VARCHAR(20) NOT NULL
)
GO


CREATE TABLE Cargo (
    Id_Cargo INT PRIMARY KEY,
    Nombre_Cargo VARCHAR(50) NOT NULL,
    Descripcion_Cargo VARCHAR(250) NOT NULL,
	SalarioCargo DECIMAL(10, 2)
)
GO

CREATE TABLE Record_Policial (
    Id_Record_Policial INT PRIMARY KEY,
    Antecedentes VARCHAR(200) NOT NULL,
    Departamento_Emision VARCHAR(50) NOT NULL,
    Municipio_Emision VARCHAR(50) NOT NULL,
    Fecha_Emision DATE NOT NULL,
    Detalles_Record_Policial VARCHAR(250)
)
GO

CREATE TABLE Empleado (
    Id_Empleado INT PRIMARY KEY IDENTITY(1,1),
    Nombre_Empleado VARCHAR(50) NOT NULL,
    Apellido_Empleado VARCHAR(50) NOT NULL,
    Fecha_Nacimiento_Empleado DATE NOT NULL,
    Estado_Civil VARCHAR(15) NOT NULL,
    No_Cedula VARCHAR(20) NOT NULL,
    Correo VARCHAR(100) NOT NULL,
    NumIns_Empleado VARCHAR(20),
    Id_Record_Policial INT,
    Genero_Empleado CHAR(1) CHECK(Genero_Empleado IN('M', 'F')) NOT NULL,
    Id_Cargo INT,
    Id_Estado INT,
    FOREIGN KEY (Id_Estado) REFERENCES Estado(Id_Estado),
    FOREIGN KEY (Id_Cargo) REFERENCES Cargo(Id_Cargo),
    FOREIGN KEY (Id_Record_Policial) REFERENCES Record_Policial(Id_Record_Policial)
)
GO

CREATE TABLE Telefono_Empleado (
    Id_NumTelfEmpleado INT PRIMARY KEY,
    Num_Telf VARCHAR(20) NOT NULL,
    Id_Empleado INT NOT NULL,
    Descripcion_Telefono_Empleado VARCHAR(250),
    FOREIGN KEY (Id_Empleado) REFERENCES Empleado(Id_Empleado) ON DELETE CASCADE 
)
GO

CREATE TABLE Departamento (
    Id_Departamento INT PRIMARY KEY NOT NULL,
    Nombre_Departamento VARCHAR(100) NOT NULL,
    Desc_Departamento VARCHAR(250)
)
GO

CREATE TABLE Municipio (
    Id_Municipio INT PRIMARY KEY,
    Nombre_Municipio VARCHAR(100) NOT NULL,
    Id_Departamento INT NOT NULL,
    Desc_Municipio VARCHAR(250),
    FOREIGN KEY (Id_Departamento) REFERENCES Departamento(Id_Departamento)
)
GO

CREATE TABLE Distrito (
    Id_Distrito INT PRIMARY KEY,
    Id_Municipio INT NOT NULL,
    Nombre_Distrito VARCHAR(100) NOT NULL,
    Desc_Distrito VARCHAR(250),
    FOREIGN KEY (Id_Municipio) REFERENCES Municipio(Id_Municipio)
)
GO

CREATE TABLE Barrio (
    Id_Barrio INT PRIMARY KEY,
    Id_Distrito INT,
    Id_Municipio INT NOT NULL,
    Nombre_Barrio VARCHAR(100) NOT NULL,
    Desc_Barrio VARCHAR(100),
    FOREIGN KEY (Id_Distrito) REFERENCES Distrito(Id_Distrito),
    FOREIGN KEY (Id_Municipio) REFERENCES Municipio(Id_Municipio)
)
GO

CREATE TABLE Calle (
    Id_Calle INT PRIMARY KEY,
    Nombre_Calle VARCHAR(100) NOT NULL,
    Desc_Calle VARCHAR(250)
)
GO

CREATE TABLE Tipo_Residencia(
    Id_Tipo_Residencia INT PRIMARY KEY,
    TipoResidencia VARCHAR(100) CHECK(TipoResidencia IN('Casa Principal', 'Domicilio Secundario', 'Temporal'))
)
GO

CREATE TABLE Direccion_Empleado (
    Id_Direccion_Empleado INT PRIMARY KEY,
    Id_Empleado INT NOT NULL,
    Id_Barrio INT NOT NULL,
    Id_Calle INT NOT NULL,
    Num_Casa VARCHAR(10),
    Ubicacion_Exacta_Empleado VARCHAR(200),
    Id_Tipo_Residencia INT,
    FOREIGN KEY (Id_Empleado) REFERENCES Empleado(Id_Empleado) ON DELETE CASCADE ,
    FOREIGN KEY (Id_Barrio) REFERENCES Barrio(Id_Barrio),
    FOREIGN KEY (Id_Calle) REFERENCES Calle(Id_Calle),
    FOREIGN KEY (Id_Tipo_Residencia) REFERENCES Tipo_Residencia(Id_Tipo_Residencia)
)
GO

CREATE TABLE Descrip_UbicacionHotel(
    Id_DescripUbicacion INT PRIMARY KEY,
    descripcionUbicacion VARCHAR(250) --ejem: Pisos del 1 al 3, Pisos del 4 al 5, Piso 6 
)
GO 

CREATE TABLE Ubicacion_Hotel(
    Id_Ubicacion_Hotel INT PRIMARY KEY,
    Id_DescripUbicacion INT NOT NULL,
    lugar_hotel VARCHAR(50), --ejem: Planta baja, Planta media, Planta alta
    FOREIGN KEY (Id_DescripUbicacion) REFERENCES Descrip_UbicacionHotel(Id_DescripUbicacion) 
)
GO
CREATE TABLE Tipo_Habitacion (
    Id_Tipo_Habitacion INT PRIMARY KEY,
    Nombre_TipoHab VARCHAR(100) NOT NULL CHECK(Nombre_TipoHab IN ('Suite','Pareja','Familiar','Doble','Individual')), 
    Descripcion_Habitacion VARCHAR(100),
	Precio_Habitacion DECIMAL(10,2) NOT NULL --precio de la habitacion 
)
GO

CREATE TABLE Caract_Habitacion (
    Id_CaracteristicaHab INT PRIMARY KEY,
    Nombre_Caracteristica VARCHAR(50) NOT NULL, --wifi, tv, jacuzzi, aire acondicionado, balcon
    Descripcion_Caracteristica VARCHAR(100),
    Id_Tipo_Habitacion INT NOT NULL,
    FOREIGN KEY (Id_Tipo_Habitacion) REFERENCES Tipo_Habitacion(Id_Tipo_Habitacion)
)
GO

CREATE TABLE Habitacion (
    Id_Habitacion INT PRIMARY KEY,
    Num_Habitacion VARCHAR(10) NOT NULL,
    Tam_Habitacion VARCHAR(10) NOT NULL,
    Id_Ubicacion_Hotel INT NOT NULL,
    Id_Tipo_Habitacion INT NOT NULL,
    Numero_Camas CHAR(2) NOT NULL,
    Capacidad_Personas CHAR(2) NOT NULL,
    Id_Estado INT NOT NULL,
    Descripcion_Adicional_Habitacion VARCHAR(250),
    FOREIGN KEY (Id_Ubicacion_Hotel) REFERENCES Ubicacion_Hotel(Id_Ubicacion_Hotel),
    FOREIGN KEY (Id_Tipo_Habitacion) REFERENCES Tipo_Habitacion(Id_Tipo_Habitacion),
    FOREIGN KEY (Id_Estado) REFERENCES Estado(Id_Estado)
)
GO

CREATE TABLE Categoria_Servicios (
    Id_Categoria_Servicio INT PRIMARY KEY,
    Nombre_Categoria_Servicio VARCHAR(50) NOT NULL,
    Descripcion_Categoria_Servicio VARCHAR(250) NOT NULL,
    Condiciones_Categoria_Servicios VARCHAR(250)
)
GO

CREATE TABLE Tipos_Servicio (
    Id_Tipo_Servicio INT PRIMARY KEY,
    Id_Categoria_Servicio INT NOT NULL,
    Nombre_Servicio VARCHAR(100) NOT NULL, -- Supongo que se refiere a Lavanderia, Tour, ...
    Descripcion_Tipo_Servicio VARCHAR(250) NOT NULL,
    Condiciones_Tipo_Servicio VARCHAR(250),
    FOREIGN KEY (Id_Categoria_Servicio) REFERENCES Categoria_Servicios(Id_Categoria_Servicio)
)
GO

CREATE TABLE Servicios (
    Id_Servicio INT PRIMARY KEY,
    Id_Tipo_Servicio INT NOT NULL,
    Id_Empleado INT NOT NULL,
    Descripcion_Adicional_Servicios VARCHAR(250),
    FOREIGN KEY (Id_Tipo_Servicio) REFERENCES Tipos_Servicio(Id_Tipo_Servicio),
    FOREIGN KEY (Id_Empleado) REFERENCES Empleado(Id_Empleado) ON DELETE CASCADE 
)
GO

CREATE TABLE Categoria_Tarifa (
    Id_Categoria_Tarifa INT PRIMARY KEY,
    Nombre_CTarifa VARCHAR(50) NOT NULL,
    Descripcion_CTarifa VARCHAR(250) NOT NULL,
    Condiciones_Categoria_Tarifa VARCHAR(250)
)
GO

CREATE TABLE Tipo_Tarifa (
    Id_Tipo_Tarifa INT PRIMARY KEY,
    Id_Categoria_Tarifa INT NOT NULL,
    Nombre_TTarifa VARCHAR(50) NOT NULL,
    Descripcion_TTarifa VARCHAR(250) NOT NULL,
    Condiciones_Tipo_Tarifa VARCHAR(250),  
    FOREIGN KEY (Id_Categoria_Tarifa) REFERENCES Categoria_Tarifa(Id_Categoria_Tarifa)
)
GO

CREATE TABLE Tarifa (
    Id_Tarifa INT PRIMARY KEY,
    Id_Tipo_Tarifa INT NOT NULL,
    Temporada VARCHAR(50) NOT NULL,  -- Ej: Baja, Media, Alta
    Fecha_Inicio DATE NOT NULL, --Fecha en la que inicia la promocion
    Fecha_Fin DATE NOT NULL,--Fecha en la que termina la promocion
    Monto_Especifico DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Id_Tipo_Tarifa) REFERENCES Tipo_Tarifa(Id_Tipo_Tarifa)
)
GO

CREATE TABLE Reservacion (
    Id_Reservacion INT PRIMARY KEY,
    Fecha_Reservacion DATETIME DEFAULT GETDATE(),
    Id_Cliente INT NOT NULL,
    Id_Habitacion INT,
    Fecha_Checkin DATE NOT NULL,
    Fecha_Checkout DATE NOT NULL,
    Id_Servicio INT,
    N_Acompanante INT,
    Descripcion_Adicional_Reservacion VARCHAR(250),
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente) ON DELETE CASCADE ,
    FOREIGN KEY (Id_Habitacion) REFERENCES Habitacion(Id_Habitacion) ON DELETE CASCADE ,
    FOREIGN KEY (Id_Servicio) REFERENCES Servicios(Id_Servicio)
)
GO

CREATE TABLE Monto_Reserva (
    Id_MontoReserv INT PRIMARY KEY,
    Id_Reservacion INT NOT NULL,
    Costo_Total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Id_Reservacion) REFERENCES Reservacion(Id_Reservacion) ON DELETE CASCADE 
)
GO

CREATE TABLE Tarjeta (
    Id_Tarjeta INT PRIMARY KEY,                  
    Id_Cliente INT NOT NULL, -- Nombre del titular
    Numero_Tarjeta VARCHAR(16),              
    Banco_Emisor_Tarjeta VARCHAR(50),                 
    Monto_Pagado DECIMAL(10, 2) NOT NULL, -- Monto pagado con tarjeta
    Autorizacion_Codigo VARCHAR(20),        
    Fecha_Transaccion_Tarjeta DATETIME DEFAULT GETDATE(), -- Fecha de la transaccion
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente) ON DELETE CASCADE 
)
GO

CREATE TABLE Factura (
    Id_Factura INT PRIMARY KEY,
    Num_Factura VARCHAR(20) NOT NULL,
    Id_MontoReserv INT NOT NULL,
    Fecha_Emision DATETIME DEFAULT GETDATE() NOT NULL,
    Id_Empleado INT NOT NULL,
    Id_Tarjeta INT,
    FOREIGN KEY (Id_MontoReserv) REFERENCES Monto_Reserva(Id_MontoReserv) ON DELETE CASCADE,
    FOREIGN KEY (Id_Empleado) REFERENCES Empleado(Id_Empleado) ON DELETE CASCADE ,
    FOREIGN KEY (Id_Tarjeta) REFERENCES Tarjeta(Id_Tarjeta)  
)
GO

CREATE TABLE Quejas (
    Id_Queja INT PRIMARY KEY,
    Fecha_Queja DATETIME DEFAULT GETDATE() NOT NULL,
    Descripcion_Queja VARCHAR(100) NOT NULL,
    Id_Estado INT NOT NULL,
    Id_Empleado INT NOT NULL,
    Id_Cliente INT,
    FOREIGN KEY (Id_Estado) REFERENCES Estado(Id_Estado),
    FOREIGN KEY (Id_Empleado) REFERENCES Empleado(Id_Empleado) ON DELETE CASCADE ,
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente) ON DELETE CASCADE 
)
GO