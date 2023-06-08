# U.T.10---AEA-3---Proyecto-con-dispositivos-Mikrotik-inal-mbricos-Reales
Trabajo 3 de - Benjamin Medina Santana, Dayara Hernandez Perera y Mario Suarez Cabrera

En primer lugar lo que hicimos fue plantear el trabajo y ver sobre que tema lo ibamos a hacer, llegamos a la conclusion que como teniamos 3 routers MicroTik, 2 inalambricos y 1 que no era inalambrico, decidimos usar el que no es inalambrico, lo llamaremos principal, seria el que tendria todas las conecciones ya sea del Cliente PC que se ve en el dibujo, los 2 routers inalambricos conectados a el, asi mismo este router principal seria el que conecte toda la red de nuestra biblioteca a la puerta de enlace del router que sale en internet.

![Captura de pantalla 2023-06-05 174616](https://github.com/BenjaminMedinaSantana/U.T.10---AEA-3---Proyecto-con-dispositivos-Mikrotik-inal-mbricos-Reales/assets/135638842/ea2e97c1-c3a4-41d5-b15a-107b718df321)

Primero conectamos el router principal al ordenador por la boca de configuracion, para  ajustarle los p arametros necesarios, donde configuramos la IP de la red que ibamos a utilizar, y además lo conectamos al router principal de clase para que se le asignara IP por DHCP.

En la red invitados usaremos la IP 192.168.33.0, esta red será sin contraseña, de manera que cualquier ususario pueda unirse a esta red, ya que no son usuarios fijos. En la red empresa utilizaremos la IP 192.168.22.0, en esta red si se utilizará contraseña, aunque los PCs no tendrán IP fija ya que cada vez que se conecten a la red se le asignará una mediante DHCP distinta. En cambio en la sala de descanso al PC que hay conectado se le asignará la misma IP que llevan las interfaces de los routers estáticamente.

Después de configurar los routers con sus IPs, empezamos con la conexión de moviles en los routers, para ver que funciona correctamente. Y como observamos en las siguientes capturas, la conexión se realizó exitosamente. La red 22 se ve que se conecta perfectamente dando IP al igual que la 33

