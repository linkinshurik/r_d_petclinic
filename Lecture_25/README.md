## 1. Створити кластер EKS
Створив кластер через візард
Створив VPC, та 2 підмережі в двох різних регіонах
Створив користувача IAM та додав йому необхідних прав
Створив node group з двох нод 

## 1. Налаштувати kubectl для доступу до кластера
Оновив кубконфіг
`aws eks update-kubeconfig --name wh-k8s --region us-east-1`
Результат виводу `kubectl get nodes`

## 3. Розгорнути статичний вебсайт
Створення 
`static_site/config_map.yaml`
`static_site/deployment.yaml`
`static_site/service.yaml`

## 4. Створити PersistentVolumeClaim для збереження даних
`percistent_volume/storage.yaml`
`percistent_volume/pvc.yaml`
`percistent_volume/pod.yaml`

## 5. Запуск завдання за допомогою Job
`job/job.yaml`

## 6. Розгорнути тестовий застосунок
`app/deployment.yaml`
`app/service.yaml`

## 7. Робота з неймспейсами

## 8. Очистити ресурси

kubectl apply -f manifests/
watch -n2 kubectl get svc static-web

kubectl apply -f manifests/data-pvc.yaml -f manifests/pvc-tester-pod.yaml
kubectl exec pvc-tester -- tail /data/out.txt

kubectl apply -f manifests/hello-job.yaml
kubectl logs job/hello-job            

kubectl apply -f manifests/apache-deployment.yaml -f manifests/apache-service.yaml
kubectl get pods -l app=apache-demo -o wide

kubectl apply -f manifests/dev-namespace.yaml -f manifests/sleeper-deployment.yaml
kubectl -n dev get pods