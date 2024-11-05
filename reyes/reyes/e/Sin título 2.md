1. Crear Solicitud (Usuario)

El proceso comienza cuando el usuario crea una solicitud de material.

Una vez creada la solicitud, esta se registra en la base de datos.

  

2. Guardar Solicitud (Sistema)

El sistema guarda la solicitud y esta queda en estado `Pendiente`.

  

3. Notificar al Almacén (Sistema)

El sistema envía una notificación al almacén para que revisen la solicitud.

  

4. Recibir Notificación (Almacén)

El almacén recibe una notificación sobre la solicitud y tiene varias acciones posibles:

  

- Aprobar la solicitud

- Rechazar la solicitud

  

5. Acciones en el Almacén

Rechazar Solicitud: Si el almacén rechaza la solicitud, el sistema cambia su estado a [Rechazada] y notifica al usuario.

Aprobar Solicitud: Si el almacén aprueba la solicitud, se confirma que la entrega del material está disponible.

  

6. Acciones del Sistema

Cancelar: Si la solicitud es cancelada por el usuario en cualquier momento, esta pasa al estado de [Cancelada].

Expirar: Si la solicitud llega a la hora de entrega programada y no se ha procesado, el sistema la marca como [Expirada].

  

7. Entrega del Material (Almacén)

Si la solicitud ha sido aprobada, el almacén entrega el material y confirma la entrega en el sistema.

  

8. Recoger Material (Usuario)

Una vez que el material está disponible, el usuario lo recoge y el sistema marca la solicitud como [Entregada].

  

9. Notificación al Usuario

El sistema envía un correo al usuario con la información del estado de la solicitud, ya sea que haya sido cancelada, rechazada, o entregada.

  

10. Finalización

El proceso concluye cuando el usuario recibe una notificación final sobre el estado de su solicitud, tras lo cual el flujo se detiene.