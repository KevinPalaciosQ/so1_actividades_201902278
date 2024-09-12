# Actividad 6️⃣ – Procesos e Hilos 🧵

# 1. ¿Incluyendo el proceso inicial, cuantos procesos son creados por el siguiente programa?

### Explicación del programa

El programa llama a `fork()` tres veces. Cada vez que se llama a `fork()`, el número de procesos se duplica.

A continuación, mostramos los pasos:

```c
#include <stdio.h>
#include <unistd.h>

int main()
{
    fork();   // Primera llamada
    fork();   // Segunda llamada
    fork();   // Tercera llamada

    return 0;
}
```

```bash
# Inicialmente, tenemos solo el proceso original.
Proceso original (PID 1)

# Primera llamada a fork()
fork() es llamado por el proceso original (PID 1):
    - Se crea un proceso hijo.
    - Ahora tenemos 2 procesos.

Proceso original (PID 1)
Proceso hijo 1 (PID 2)

# Segunda llamada a fork()
fork() es llamado por ambos procesos:
    - El proceso original (PID 1) crea otro proceso.
    - El proceso hijo 1 (PID 2) también crea otro proceso.
    - Ahora tenemos 4 procesos.

Proceso original (PID 1)
Proceso hijo 1 (PID 2)
Proceso hijo 2 (PID 3)  # Creado por el proceso original
Proceso hijo 3 (PID 4)  # Creado por el proceso hijo 1

# Tercera llamada a fork()
fork() es llamado por los cuatro procesos:
    - Cada proceso actual (PID 1, 2, 3, 4) crea otro proceso.
    - Ahora tenemos 8 procesos.

Proceso original (PID 1)
Proceso hijo 1 (PID 2)
Proceso hijo 2 (PID 3)
Proceso hijo 3 (PID 4)
Proceso hijo 4 (PID 5)  # Creado por el proceso original
Proceso hijo 5 (PID 6)  # Creado por el proceso hijo 1
Proceso hijo 6 (PID 7)  # Creado por el proceso hijo 2
Proceso hijo 7 (PID 8)  # Creado por el proceso hijo 3

# Resultado final
# Incluyendo el proceso inicial, al final hay 8 procesos.
Total de procesos: 8

```

# 2. Utilizando un sistema Linux, escriba un programa en C que cree un proceso hijo (fork) que finalmente se convierta en un proceso zombie. Este proceso zombie debe permanecer en el sistema durante al menos 60 segundos.Los estados del proceso se pueden obtener del comando: ps -l

```c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main() {
    pid_t pid_hijo;

    // Intentar crear un proceso hijo
    if ((pid_hijo = fork()) == -1) {
        perror("Error al crear el proceso hijo");
        exit(EXIT_FAILURE);
    }

    if (pid_hijo == 0) {
        printf("Soy el proceso hijo con PID: %d\n", getpid());
        exit(EXIT_SUCCESS);
    } else {
        printf("Soy el proceso padre con PID: %d\n", getpid());
        printf("El proceso hijo (PID: %d) se convertirá en un zombie.\n", pid_hijo);

        // El padre duerme 60 segundos mientras el hijo está en estado zombie
        sleep(60);

        // Ahora el padre recolecta al proceso hijo zombie
        if (waitpid(pid_hijo, NULL, 0) == -1) {
            perror("Error al esperar al proceso hijo");
        } else {
            printf("El proceso hijo (PID: %d) fue recolectado.\n", pid_hijo);
        }
    }

    return 0;
}

```

## Compilación del programa

```bash
gcc -o zombie_program_alt zombie_program_alt.c

```

## Ejecución del programa

```bash
./zombie_program_alt
ps -l
```

# 3. Usando el siguiente código como referencia, completar el programa para que sea ejecutable y responder las siguientes preguntas:

- ¿Cuántos procesos únicos son creados?

```bash
6 procesos únicos
```

- ¿Cuántos hilos únicos son creados?

```bash
1 hilo
```
