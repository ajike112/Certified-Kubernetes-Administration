
Docker Flags, Deep Dive into Dockerfile, and Exposing Containers 

---

## **Using Custom Dockerfile Names and Understanding the Docker Build Process**

Docker normally expects a file named **Dockerfile**, but you can use custom names whenever you need separate builds—for example, development vs. production. This gives you more flexibility and keeps complex projects organized.

### **Why Use Custom Dockerfile Names?**

- **Environment‑specific builds:**  
  Files like `Dockerfile.dev` or `Dockerfile.prod` help separate development and production configurations.

- **Multi‑service projects:**  
  Different services may require different Dockerfiles, making custom names essential.

- **Clarity and maintainability:**  
  Explicit names make it easier for teams to understand each file’s purpose.

---

## **Building an Image with a Custom Dockerfile**

Use the `-f` flag to point Docker to a specific Dockerfile.

### **Command Format**

```
docker build -t <image-name> -f <path-to-custom-dockerfile> <build-context>
```

### **Flag Breakdown**

- **`-t <image-name>`** — Assigns a name or tag to the built image.  
- **`-f <path>`** — Specifies the custom Dockerfile to use.  
- **`<build-context>`** — Directory containing all files needed for the build.

---

## **Understanding the Build Context**

The build context is the directory Docker sends to the daemon during the build. Any file you reference with `COPY` or `ADD` must exist inside this context.

### **Key Notes**

- Docker **cannot access files outside** the build context.  
- Use a **`.dockerignore`** file to exclude unnecessary files and reduce build time.  
- The Dockerfile can live **outside** the build context as long as you specify it with `-f`.

### **Example: Custom Dockerfile + Custom Context**

```
docker build -t entry-image -f /path/to/custom-dockerfile /path/to/build-context
```

---

## **CMD vs ENTRYPOINT vs RUN**

These three instructions serve different roles in a Dockerfile.

### **Purpose Comparison**

| Aspect | CMD | ENTRYPOINT | RUN |
|--------|------|------------|------|
| **Purpose** | Default command when container starts | Command that always runs when container starts | Executes commands during image build |
| **Execution Time** | Runtime | Runtime | Build time |
| **Override Behavior** | Fully overridable | Only arguments can be appended (unless `--entrypoint` is used) | Not overridable; baked into image |
| **Form Support** | Shell + Exec | Exec only | Shell + Exec |
| **Common Use** | Start app server or script | Enforce a specific startup command | Install packages, configure environment |

### **Examples**

- **CMD (exec form)**  
  `CMD ["python", "app.py"]`

- **ENTRYPOINT (exec form)**  
  `ENTRYPOINT ["python", "app.py"]`

- **RUN (shell form)**  
  `RUN apt-get update && apt-get install -y python3`

### **Chaining Behavior**

- Only **one CMD** is allowed; the last one wins.  
- ENTRYPOINT can be paired with CMD to supply default arguments.  
- Multiple RUN commands are allowed; each creates a new image layer.

---

## **Common Docker Commands**

### **Container Management**

- List all containers:  
  `docker ps -a`

- Inspect metadata:  
  `docker inspect <container_id>`  
  `docker inspect <image_id>`

- View running processes:  
  `docker top <container_id>`

- Stop/start containers:  
  `docker stop <id>`  
  `docker start <id>`

- Stop all running containers:  
  `docker stop $(docker ps -q)`

- Restart a container:  
  `docker restart <id>`

- Remove a container:  
  `docker rm <id>`

- Remove all stopped containers:  
  `docker container prune`

### **Image Management**

- Remove an image:  
  `docker rmi <image_id>`

- Remove unused images (including dangling):  
  `docker image prune -a`

---

## **Conclusion**

Using custom Dockerfile names and understanding how `docker build` works gives you more control over how images are created. Mastering CMD, ENTRYPOINT, and RUN helps you define predictable container behavior, while knowing essential Docker commands improves your workflow across development and deployment.

These concepts form the foundation for building scalable, modular, and optimized Docker environments—skills that become even more valuable as your projects grow.

---