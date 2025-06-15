## 1. Створити кластер EKS
Створив кластер через візард
Створив VPC, та 2 підмережі в двох різних регіонах
Створив користувача IAM та додав йому необхідних прав
Створив node group з двох нод 
    Отримав помилку. Перестворення нод груп чи самого кластера - не дало результатів.

    NodeCreationFailure Instances failed to join the kubernetes cluster
        i-0c20a745ce0539c4e
        i-0c292abe4fb9bc49a

## 1. Налаштувати kubectl для доступу до кластера
Оновив кубконфіг
`aws eks update-kubeconfig --name wh-k8s --region us-east-1`
Доступ присутній. Але нод по причині описаній вище - немає :(
Далі вирішив продовжувати з minikube

## 3. Розгорнути статичний вебсайт
Створення 
`kubectl apply -f static_site/config_map.yaml`
`kubectl apply -f static_site/deployment.yaml`
`kubectl apply -f static_site/service.yaml`

Отримати IP
`kubectl get svc static-web`
static-web   LoadBalancer   10.111.15.80   <pending>     80:31331/TCP   100s
для мого сценарію
`minikube service static-web`

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