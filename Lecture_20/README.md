# Встановлюємо та запускаємо minikube
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-darwin-arm64
sudo install minikube-darwin-arm64 /usr/local/bin/minikube
minikube start

# 1. Створіть PersistentVolumeClaim (PVC) для зберігання даних Redis. Кожен под у StatefulSet використовуватиме свій окремий том для зберігання даних.
redis-statefulset.yaml
`kubectl apply -f redis-statefulset.yaml`

В результаті маємо 2 інстанси в Stateful Sets

# 2. Створіть StatefulSet для Redis із налаштуваннями для запуску двох реплік. Кожна репліка повинна мати стабільне ім’я та доступ до постійного тому.
redis-statefulset-2.yaml
`kubectl apply -f redis-statefulset.yaml`
