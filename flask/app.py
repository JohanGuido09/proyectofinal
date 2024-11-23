from flask import Flask, render_template, request, redirect, url_for, session, flash
import pyodbc

app = Flask(__name__)
app.secret_key = 'tu_clave_secreta'

def get_db_connection():
    conn_str = 'DRIVER={ODBC Driver 17 for SQL Server};SERVER=localhost;DATABASE=HOTEL_SQLUXE_CS50;Trusted_Connection=yes;'
    conn = pyodbc.connect(conn_str)
    return conn

@app.route('/')
def index():
    return render_template('index.html') 

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        usuario = request.form['usuario']
        contrasena = request.form['contrasena']

        conn = get_db_connection()
        cursor = conn.cursor()

        cursor.execute("SELECT * FROM ADMINBD WHERE Usuario = ?", (usuario,))
        admin = cursor.fetchone()

        if admin:
            if admin.Contraseña == contrasena:
                print("Acceso autorizado")
                session['logged_in'] = True  
                session['usuario'] = usuario
                conn.close()

                return redirect(url_for('adminsq'))
            else:
                print("Contraseña incorrecta")
        else:
            print("Usuario no encontrado")

        conn.close()
        return redirect(url_for('login')) 

    return render_template('login.html')

@app.route('/admin')
def adminsq():
    if not session.get('logged_in'): 
        return redirect(url_for('login'))  

    return render_template('adminsqluxe.html', usuario=session.get('usuario'))

@app.route('/logout')
def logout():
    session.pop('logged_in', None)  
    session.pop('usuario', None)
    return redirect(url_for('login'))

@app.route('/clientes')
def clientes():
    if not session.get('logged_in'):
        return redirect(url_for('login')) 

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("""
    SELECT        Id_Cliente, Cedula, Nombre, Apellido, Fecha_Nacimiento, Genero, Nacionalidad, Direccion_cliente, Correo, Telefono_cliente
FROM            dbo.Cliente""")

    clientes = cursor.fetchall() 
    conn.close() 

    return render_template('clientes.html', clientes=clientes, usuario=session.get('usuario'))

@app.route('/agregar_cliente', methods=['GET', 'POST'])
def agregar_cliente():
    if not session.get('logged_in'):
        return redirect(url_for('login')) 
    if request.method == 'POST':
        nombre = request.form['nombre']
        apellido = request.form['apellido']
        fecha_nacimiento = request.form['fecha_nacimiento']
        cedula = request.form['cedula']
        nacionalidad = request.form['nacionalidad']
        genero = request.form['genero']
        direccion = request.form['direccion']
        correo = request.form['correo']
        telefono = request.form['telefono']

        conn = get_db_connection()
        cursor = conn.cursor()
        try:
            cursor.execute("""
                INSERT INTO Cliente (Nombre, Apellido, Fecha_Nacimiento, Cedula, Nacionalidad, Genero, Direccion_cliente, Correo, Telefono_cliente)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
            """, (nombre, apellido, fecha_nacimiento, cedula, nacionalidad, genero, direccion, correo, telefono))
            conn.commit()
            flash("Cliente agregado exitosamente.", "success")
        except Exception as e:
            conn.rollback()
            flash(f"Error al agregar cliente: {e}", "danger")
        finally:
            cursor.close()
            conn.close()

        return redirect(url_for('clientes'))
    return render_template('agregar_cliente.html')

@app.route('/editar_cliente/<int:id>', methods=['GET', 'POST'])
def editar_cliente(id):
    if not session.get('logged_in'):
        return redirect(url_for('login')) 
    conn = get_db_connection()
    cursor = conn.cursor()

    if request.method == 'POST':
        nombre = request.form['nombre']
        apellido = request.form['apellido']
        fecha_nacimiento = request.form['fecha_nacimiento']
        cedula = request.form['cedula']
        nacionalidad = request.form['nacionalidad']
        genero = request.form['genero']
        direccion = request.form['direccion']
        correo = request.form['correo']
        telefono = request.form['telefono']

        try:
            cursor.execute("""
                UPDATE Cliente
                SET 
                    Nombre = ?, Apellido = ?, Fecha_Nacimiento = ?, Cedula = ?, 
                    Nacionalidad = ?, Genero = ?, Direccion_cliente = ?, 
                    Correo = ?, Telefono_cliente = ?
                WHERE Id_Cliente = ?""",
                nombre, apellido, fecha_nacimiento, cedula, nacionalidad, 
                genero, direccion, correo, telefono, id
            )
            conn.commit()
            flash("Cliente actualizado correctamente.", "success")
        except Exception as e:
            conn.rollback()
            flash(f"Error al actualizar cliente: {e}", "danger")
        finally:
            cursor.close()
            conn.close()

        return redirect(url_for('clientes'))

    cursor.execute("SELECT * FROM Cliente WHERE Id_Cliente = ?", id)
    cliente = cursor.fetchone()
    cursor.close()
    conn.close()

    if cliente:
        return render_template('editar_cliente.html', cliente=cliente)
    else:
        flash("Cliente no encontrado.", "danger")
        return redirect(url_for('clientes'))

@app.route('/eliminar_cliente_confirmado/<int:id>', methods=['POST'])
def eliminar_cliente_confirmado(id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM dbo.Cliente WHERE Id_Cliente = ?", (id,))
    conn.commit()
    conn.close()
    return redirect(url_for('clientes'))

#EMPLEADOS
@app.route('/empleados')
def empleados():
    if not session.get('logged_in'):
        return redirect(url_for('login')) 
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("""SELECT        dbo.Empleado.Id_Empleado, dbo.Empleado.No_Cedula, dbo.Empleado.Nombre_Empleado, dbo.Empleado.Apellido_Empleado, dbo.Empleado.Fecha_Nacimiento_Empleado, dbo.Empleado.Genero_Empleado, 
                         dbo.Direccion_Empleado.Ubicacion_Exacta_Empleado, dbo.Empleado.Estado_Civil, dbo.Empleado.NumIns_Empleado, dbo.Empleado.Correo, dbo.Telefono_Empleado.Num_Telf, dbo.Cargo.Nombre_Cargo, 
                         dbo.Cargo.SalarioCargo, dbo.Estado.Descripcion
FROM            dbo.Empleado INNER JOIN
                         dbo.Estado ON dbo.Empleado.Id_Estado = dbo.Estado.Id_Estado INNER JOIN
                         dbo.Direccion_Empleado ON dbo.Empleado.Id_Empleado = dbo.Direccion_Empleado.Id_Empleado INNER JOIN
                         dbo.Cargo ON dbo.Empleado.Id_Cargo = dbo.Cargo.Id_Cargo INNER JOIN
                         dbo.Telefono_Empleado ON dbo.Empleado.Id_Empleado = dbo.Telefono_Empleado.Id_Empleado""")  
    empleados = cursor.fetchall()  

    conn.close()  
    return render_template('empleados.html', empleados=empleados)


@app.route('/agregar_empleado', methods=['GET', 'POST'])
def agregar_empleado():
    if not session.get('logged_in'):
        return redirect(url_for('login')) 
    if request.method == 'POST':
        nombre = request.form['nombre']
        apellido = request.form['apellido']
        fecha_nacimiento = request.form['fecha_nacimiento']
        cedula = request.form['cedula']
        estado_civil = request.form['estado_civil']
        correo = request.form['correo']
        num_ins = request.form['num_ins']
        genero = request.form['genero']
        cargo = int(request.form['cargo'])
        estado = int(request.form['estado'])

        conn = get_db_connection()
        cursor = conn.cursor()

        try:
            cursor.execute("""
                INSERT INTO Empleado (
                    Nombre_Empleado, Apellido_Empleado, Fecha_Nacimiento_Empleado,
                    Estado_Civil, No_Cedula, Correo, NumIns_Empleado, Genero_Empleado,
                    Id_Cargo, Id_Estado
                )
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            """, (nombre, apellido, fecha_nacimiento, estado_civil, cedula, correo,
            num_ins, genero, cargo, estado))
            conn.commit()
            flash("Empleado agregado correctamente.", "success")
        except Exception as e:
            conn.rollback()
            flash(f"Error al agregar empleado: {e}", "danger")
        finally:
            cursor.close()
            conn.close()

        return redirect(url_for('empleados')) 
    return render_template('agregar_empleado.html')

@app.route('/editar_empleado/<int:id>', methods=['GET', 'POST'])
def editar_empleado(id):
    if not session.get('logged_in'):
        return redirect(url_for('login')) 
    conn = get_db_connection()
    cursor = conn.cursor()

    if request.method == 'POST':
        nombre = request.form['nombre']
        apellido = request.form['apellido']
        fecha_nacimiento = request.form['fecha_nacimiento']
        estado_civil = request.form['estado_civil']
        cedula = request.form['cedula']
        correo = request.form['correo']
        numins = request.form['numins']
        id_record = request.form['id_record']
        genero = request.form['genero']
        id_cargo = request.form['id_cargo']
        id_estado = request.form['id_estado']

        try:
            cursor.execute("""
                UPDATE Empleado
                SET 
                    Nombre_Empleado = ?, Apellido_Empleado = ?, Fecha_Nacimiento_Empleado = ?, Estado_Civil = ?,
                    No_Cedula = ?, Correo = ?, NumIns_Empleado = ?, Id_Record_Policial = ?, Genero_Empleado = ?, 
                    Id_Cargo = ?, Id_Estado = ?
                WHERE Id_Empleado = ?""",
                nombre, apellido, fecha_nacimiento, estado_civil, cedula, correo, numins, id_record, genero, 
                id_cargo, id_estado, id
            )
            conn.commit()
            flash("Empleado actualizado correctamente.", "success")
        except Exception as e:
            conn.rollback()
            flash(f"Error al actualizar empleado: {e}", "danger")
        finally:
            cursor.close()
            conn.close()

        return redirect(url_for('empleados'))

    cursor.execute("SELECT * FROM Empleado WHERE Id_Empleado = ?", id)
    empleado = cursor.fetchone()
    cursor.close()
    conn.close()

    if empleado:
        return render_template('editar_empleado.html', empleado=empleado)
    else:
        flash("Empleado no encontrado.", "danger")
        return redirect(url_for('empleados'))

@app.route('/eliminar_empleado_confirmado/<int:id>', methods=['POST'])
def eliminar_empleado_confirmado(id):
    if not session.get('logged_in'):
        return redirect(url_for('login')) 
    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        cursor.execute("DELETE FROM Empleado WHERE Id_Empleado = ?", (id,))
        conn.commit()
        flash("Empleado eliminado correctamente.", "success")
    except Exception as e:
        conn.rollback()
        flash(f"Error al eliminar empleado: {e}", "danger")
    finally:
        cursor.close()
        conn.close()

    return redirect(url_for('empleados'))

@app.route('/habitacionesadmin')
def habitacionesadmin():
    if not session.get('logged_in'):
        return redirect(url_for('login')) 
    
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("""
SELECT        dbo.Habitacion.Id_Habitacion, dbo.Tipo_Habitacion.Nombre_TipoHab, dbo.Habitacion.Numero_Camas, dbo.Tipo_Habitacion.Precio_Habitacion, dbo.Estado.Descripcion
FROM            dbo.Habitacion INNER JOIN
                         dbo.Tipo_Habitacion ON dbo.Habitacion.Id_Tipo_Habitacion = dbo.Tipo_Habitacion.Id_Tipo_Habitacion INNER JOIN
                         dbo.Estado ON dbo.Habitacion.Id_Estado = dbo.Estado.Id_Estado
""")  
    habitaciones = cursor.fetchall()

    conn.close() 
    return render_template('habitacionesadmin.html', habitaciones=habitaciones)

@app.route('/reservacionesadmin')
def reservacionesadmin():
    if not session.get('logged_in'):
        return redirect(url_for('login')) 
    
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("""SELECT        dbo.Reservacion.Id_Reservacion, dbo.Cliente.Nombre, dbo.Cliente.Apellido, dbo.Habitacion.Num_Habitacion, dbo.Monto_Reserva.Costo_Total
FROM            dbo.Reservacion INNER JOIN
                         dbo.Cliente ON dbo.Reservacion.Id_Cliente = dbo.Cliente.Id_Cliente INNER JOIN
                         dbo.Habitacion ON dbo.Reservacion.Id_Habitacion = dbo.Habitacion.Id_Habitacion INNER JOIN
                         dbo.Servicios ON dbo.Reservacion.Id_Servicio = dbo.Servicios.Id_Servicio INNER JOIN
                         dbo.Monto_Reserva ON dbo.Reservacion.Id_Reservacion = dbo.Monto_Reserva.Id_Reservacion
""")  
    reservaciones = cursor.fetchall()

    conn.close() 
    return render_template('reservacionesadmin.html', reservaciones=reservaciones)

@app.route('/eliminar_reservacion/<int:id>', methods=['POST'])
def eliminar_reservacion(id):
    if not session.get('logged_in'):
        return redirect(url_for('login'))
    
    conn = get_db_connection()
    cursor = conn.cursor()
    
    try:
        cursor.execute("DELETE FROM Reservacion WHERE Id_Reservacion = ?", (id,))
        conn.commit()
        flash("Reservación eliminada con éxito.", "success")
    except Exception as e:
        conn.rollback()
        flash(f"Error al eliminar la reservación: {str(e)}", "danger")
    finally:
        conn.close()
    
    return redirect(url_for('reservacionesadmin'))


@app.route('/preguntasfrecuentes')
def pf():
   
    return render_template('pf.html')


@app.route('/reglasdelhotel')
def rh():
   
    return render_template('rght.html')


@app.route('/ubicaciondelhotel')
def uh():
   
    return render_template('uhl.html')


@app.route('/quejas')
def quejas():
    if not session.get('logged_in'):
        return redirect(url_for('login')) 
    
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("""
SELECT        dbo.Quejas.Id_Queja, dbo.Cliente.Nombre, dbo.Cliente.Apellido, dbo.Quejas.Descripcion_Queja, dbo.Quejas.Fecha_Queja
FROM            dbo.Quejas INNER JOIN
                         dbo.Cliente ON dbo.Quejas.Id_Cliente = dbo.Cliente.Id_Cliente
""")  
    quejas = cursor.fetchall()

    conn.close() 
    return render_template('quejas.html', quejas=quejas)

#  suscripciones
@app.route('/subscribe', methods=['GET', 'POST'])
def subscribe():
    if request.method == 'POST':
        email = request.form.get('email') 
        if not email:
            flash("Por favor, ingresa un correo válido.", "danger")
            return redirect('/subscribe')
        
        try:
            with get_db_connection() as conn:
                cursor = conn.cursor()
            
                cursor.execute("SELECT email FROM Subscriber WHERE email = ?", (email,))
                result = cursor.fetchone()
                
                if result:
                    flash("Este correo ya está suscrito.", "warning")
                else:
                    cursor.execute(
                        "INSERT INTO Subscriber (email) VALUES (?)",
                        (email,)
                    )
                    conn.commit()
                    flash("¡Gracias por suscribirte! Ahora recibirás nuestras promociones.", "success")
                    
        except pyodbc.Error as e:
            flash(f"Hubo un error al procesar tu solicitud: {str(e)}", "danger")
        
        return redirect('/subscribe')

    return render_template('subscribe.html')

@app.route('/suscriptores')
def suscriptores():
    if not session.get('logged_in'):
        return redirect(url_for('login')) 
    
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("""
    SELECT * FROM Subscriber
""")  
    suscriptores = cursor.fetchall()

    conn.close() 
    return render_template('suscriptores.html', suscriptores=suscriptores)

from flask import request, flash

@app.route('/eliminar_suscriptor/<int:id>', methods=['POST'])
def eliminar_suscriptor(id):
    if not session.get('logged_in'):
        return redirect(url_for('login'))
    
    conn = get_db_connection()
    cursor = conn.cursor()
    
    try:
        cursor.execute("DELETE FROM Subscriber WHERE id = ?", (id,))
        conn.commit()
        flash("Suscriptor eliminado con éxito.", "success")
    except Exception as e:
        conn.rollback()
        flash(f"Error al eliminar el suscriptor: {str(e)}", "danger")
    finally:
        conn.close()
    
    return redirect(url_for('suscriptores'))

#HABITACIONES
@app.route('/habitaciones')
def habitaciones():
   
    return render_template('habitaciones.html')

@app.route('/habitaciones/suite')
def suite():
   
    return render_template('hisuite.html')

@app.route('/habitaciones/familiar')
def familiar():
   
    return render_template('hfamiliar.html')

@app.route('/habitaciones/doble')
def doble():
   
    return render_template('hdoble.html')

@app.route('/habitaciones/pareja')
def pareja():
   
    return render_template('hpareja.html')

@app.route('/habitaciones/individual')
def individual():
   
    return render_template('hindividual.html')

if __name__ == "__main__":
    app.run(debug=True)

