# Conceptos de Sistemas Operativos ☝️🤓

## Tipos de Kernel y sus Diferencias
Existen varios tipos de kernel en los sistemas operativos, y cada uno tiene características únicas que afectan su funcionamiento:

- **Monolítico**: En este tipo de kernel, todos los servicios del sistema operativo (gestión de memoria, gestión de procesos, etc.) se ejecutan en un solo espacio de memoria. Es rápido pero menos seguro debido a la falta de aislamiento entre servicios.

- **Microkernel**: Aquí, solo las funciones básicas (como la comunicación entre procesos y la gestión de hardware) se ejecutan en el kernel, mientras que otros servicios se ejecutan en modo usuario. Esto mejora la seguridad y estabilidad, aunque puede ser menos eficiente en términos de rendimiento.

- **Exokernel**: Este tipo de kernel permite a las aplicaciones gestionar los recursos directamente, ofreciendo una alta flexibilidad y eficiencia, aunque es más complejo de desarrollar.

- **Híbrido**: Combina características de los kernels monolítico y microkernel, intentando obtener lo mejor de ambos mundos: rendimiento eficiente con una mayor estabilidad y seguridad.

## Modo Usuario 🆚 Modo Kernel
En los sistemas operativos, las operaciones se pueden ejecutar en dos modos:

- **Modo Kernel**: También conocido como modo privilegiado, es donde el sistema operativo tiene acceso completo al hardware del sistema. Aquí se ejecutan funciones críticas, como la gestión de memoria y dispositivos.

- **Modo Usuario**: En este modo, las aplicaciones tienen acceso limitado a los recursos del sistema. Esto protege el sistema operativo de posibles errores o acciones maliciosas provenientes de aplicaciones.

La principal diferencia es que el modo kernel tiene acceso a todo el sistema, mientras que el modo usuario está restringido para evitar daños al sistema.

## Interrupciones 🆚 Traps
Tanto las interrupciones como los traps son mecanismos utilizados por los sistemas operativos para manejar eventos y errores, pero funcionan de manera diferente:

- **Interrupciones**: Son señales enviadas por el hardware al procesador, indicando que un evento externo (como una solicitud de E/S) necesita ser atendido. El procesador pausa su ejecución actual para manejar la interrupción.

- **Traps**: Son interrupciones generadas por el propio software, a menudo como resultado de errores (como la división por cero) o para solicitar servicios del sistema operativo. Los traps son gestionados por el kernel para garantizar la correcta operación del sistema.

En resumen, las interrupciones son causadas por eventos externos, mientras que los traps son causados por el software en ejecución.
