## Actividad 8️⃣

# Guía para Configurar un Ambiente Local de Kubernetes 🚀

## 1. Instalar un Ambiente Local de Kubernetes utilizando Minikube, Kind o Docker Desktop 🛠️

### Usando Minikube

1. **Instalar Minikube**:

   - Descarga Minikube desde [aquí](https://minikube.sigs.k8s.io/docs/start/). 📥
   - Sigue las instrucciones para tu sistema operativo.

2. **Iniciar Minikube**:

   ```bash
   minikube start
   ```

3. **Verificar el estado de Minikube**:
   ```bash
   minikube status
   ```

### Usando Kind

1. **Instalar Kind**:

   - Asegúrate de tener Docker instalado. 🐳
   - Instala Kind usando Go:

   ```bash
   go install sigs.k8s.io/kind@v0.11.1
   ```

2. **Crear un clúster**:

   ```bash
   kind create cluster
   ```

3. **Verificar el estado del clúster**:
   ```bash
   kubectl cluster-info --context kind-kind
   ```

### Usando Docker Desktop

1. **Instalar Docker Desktop**:

   - Descarga Docker Desktop desde [aquí](https://www.docker.com/products/docker-desktop). 🖥️
   - Asegúrate de habilitar la opción de Kubernetes en la configuración.

2. **Activar Kubernetes**:

   - Ve a `Settings` > `Kubernetes` y marca la opción para habilitar Kubernetes. ⚙️

3. **Verificar el estado de Kubernetes**:
   ```bash
   kubectl cluster-info
   ```

## 2. Desplegar un Contenedor de un Web Server (Apache o Nginx) en el Clúster de K8s Local 🌐

### Desplegando Nginx

1. **Crear un archivo de despliegue** llamado `nginx-deployment.yaml`:

   ```yaml
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: nginx-deployment
   spec:
     replicas: 2
     selector:
       matchLabels:
         app: nginx
     template:
       metadata:
         labels:
           app: nginx
       spec:
         containers:
           - name: nginx
             image: nginx:latest
             ports:
               - containerPort: 80
   ```

2. **Desplegar el contenedor**:

   ```bash
   kubectl apply -f nginx-deployment.yaml
   ```

3. **Verificar el estado del despliegue**:

   ```bash
   kubectl get deployments
   ```

4. **Exponer el servicio**:

   ```bash
   kubectl expose deployment nginx-deployment --type=NodePort --port=80
   ```

5. **Obtener la URL del servicio**:
   ```bash
   minikube service nginx-deployment --url
   ```

## 3. ¿Existen Nodos Masters y Workers en un Ambiente Local de Kubernetes? 🤔

En un ambiente local de Kubernetes, como el que se crea con Minikube o Kind, el clúster generalmente está compuesto por un solo nodo que actúa como **nodo master** y **worker**.

### Funcionamiento:

- **Nodo Master**: Se encarga de la gestión del clúster, coordinando las operaciones y decisiones del estado del clúster. 👨‍💻
- **Nodos Workers**: Ejecutan las aplicaciones y cargas de trabajo, como los contenedores de Nginx o Apache. 🧑‍💻

En un clúster local, como solo hay un nodo, este asume ambas funciones, lo que simplifica la configuración y permite una gestión más fácil para el desarrollo y las pruebas. Sin embargo, en un entorno de producción, se pueden tener múltiples nodos masters y workers para proporcionar alta disponibilidad y equilibrio de carga. ⚖️
