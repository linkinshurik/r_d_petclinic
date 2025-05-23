# Встановлюємо та запускаємо minikube
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-darwin-arm64
sudo install minikube-darwin-arm64 /usr/local/bin/minikube
minikube start

# 1. Створіть PersistentVolumeClaim (PVC) для зберігання даних Redis. Кожен под у StatefulSet використовуватиме свій окремий том для зберігання даних.
redis-statefulset.yaml
`kubectl apply -f redis-pvc.yaml`

В результаті маємо 2 інстанси в Stateful Sets

# 2. Створіть StatefulSet для Redis із налаштуваннями для запуску двох реплік. Кожна репліка повинна мати стабільне ім’я та доступ до постійного тому.
redis-statefulset-2.yaml
`kubectl apply -f redis-statefulset.yaml`

# 3. Створіть Service для Redis: Service для StatefulSet потрібен для доступу до Redis. Використовуйте тип Service ClusterIP для внутрішньої взаємодії між подами.
redis-service.yaml
`kubectl apply -f redis-service.yaml`

В Network -> Services з'явився redis-svc

# 4. Перевірка роботи: після створення StatefulSet перевірте, чи запущені поди (kubectl get pods) і чи мають вони стабільні імена, наприклад, redis-0, redis-1. Застосовуйте команду kubectl exec для підключення до кожного пода та перевірки збереження даних між перезапусками.

kubectl get pods
NAME      READY   STATUS    RESTARTS   AGE
redis-0   1/1     Running   0          66m
redis-1   1/1     Running   0          66m

Підключаємось до редісу
`kubectl exec -it redis-0 -- redis-cli`

127.0.0.1:6379> SET test 123
OK
127.0.0.1:6379> GET test
"123"

Перезавантажуємо поду 
`kubectl delete pod redis-0`
`kubectl exec -it redis-0 -- redis-cli`
127.0.0.1:6379> GET test
"123"

# 2. Завдання
Файл конфігурації
falco-daemonset.yaml

`kubectl apply -f falco-daemonset.yaml`

Falco з'явився в Daemon Sets в неймспейсі `kube-system` в Lens
або команда
`kubectl get pods -l app=falco -n kube-system`
NAME          READY   STATUS    RESTARTS   AGE
falco-dhfg6   1/1     Running   0          4m9s

# Виконайте команду для перегляду логів одного з подів Falco
`kubectl logs -l app=falco -n kube-system`
2025-05-23T19:35:03+0000: System info: Linux version 6.10.14-linuxkit (root@buildkitsandbox) (gcc (Alpine 13.2.1_git20240309) 13.2.1 20240309, GNU ld (GNU Binutils) 2.42) #1 SMP PREEMPT_DYNAMIC Thu Mar 20 16:36:58 UTC 2025
2025-05-23T19:35:03+0000: Loading rules from:
2025-05-23T19:35:04+0000:    /etc/falco/falco_rules.yaml | schema validation: ok
2025-05-23T19:35:05+0000:    /etc/falco/falco_rules.local.yaml | schema validation: none
2025-05-23T19:35:05+0000: The chosen syscall buffer dimension is: 8388608 bytes (8 MBs)
2025-05-23T19:35:05+0000: Starting health webserver with threadiness 8, listening on 0.0.0.0:8765
2025-05-23T19:35:05+0000: Loaded event sources: syscall
2025-05-23T19:35:05+0000: Enabled event sources: syscall
2025-05-23T19:35:05+0000: Opening 'syscall' source with modern BPF probe.
2025-05-23T19:35:05+0000: One ring buffer every '2' CPUs.