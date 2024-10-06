## Actividad 7️⃣

# Completely Fair Scheduler (CFS) en Linux

## 📋 **Características Principales del CFS**

- **Equidad**:
  - El CFS intenta asignar el tiempo de CPU de forma equitativa entre los procesos, manteniendo el **tiempo de ejecución** lo más balanceado posible.
- **Árbol Rojo-Negro**:
  - El CFS utiliza una **estructura de datos de árbol rojo-negro** para gestionar los procesos, lo que permite una búsqueda, inserción y eliminación eficientes en **O(log n)**.
- **Tiempo Virtual**:

  - Los procesos se ejecutan en función de un **reloj virtual**, donde cada proceso acumula "deuda de ejecución". Los procesos que han usado menos tiempo de CPU tienen **prioridad** para ejecutarse.

- **Latencia de programación mínima**:

  - El CFS garantiza que todos los procesos se ejecuten dentro de una **latencia mínima**, dividiendo el tiempo de CPU disponible entre todos los procesos activos.

- **Sin tiempos de espera fijos**:
  - A diferencia de otros algoritmos, el CFS no utiliza tiempos de espera fijos (como el **round-robin**), sino que ajusta dinámicamente el tiempo de ejecución de cada proceso.

## ⚙️ **Funcionamiento del CFS**

1. **Gestión de Procesos**:
   - Cada proceso tiene un **tiempo de ejecución ponderado**, lo que significa que los procesos con **menor prioridad** (procesos con más tiempo de ejecución) obtienen menos CPU en comparación con los procesos con **alta prioridad**.
2. **Asignación de Tiempo de CPU**:

   - Los procesos que han ejecutado menos se seleccionan primero, utilizando su **deuda en el reloj virtual** para determinar el próximo proceso a ejecutar.

3. **Adaptabilidad a la carga**:

   - El CFS es altamente **escalable** y funciona bien tanto con pocas tareas como con muchas, ya que ajusta automáticamente la asignación de CPU dependiendo del **número de procesos** activos.

4. **Preempción**:
   - Si un proceso de baja prioridad acumula más tiempo de CPU que otro proceso de mayor prioridad, el CFS **preempe** el proceso actual para darle CPU al proceso de mayor prioridad.

## 🚀 **Ventajas del CFS**

- Mejora la **justicia** en la asignación de CPU.
- Soporta una **alta escalabilidad**, ideal para sistemas multiusuario o multitarea.
- Evita la **injusticia** de los algoritmos de planificación tradicionales (FIFO, Round Robin).
