## 1. Створити кластер EKS
Створив кластер через візард
Створив VPC, та 2 підмережі в двох різних регіонах
Створив користувача IAM та додав йому необхідних прав
Створив node group з двох нод 
    Отримав помилку. Перестворення нод груп чи самого кластера, побавившись правами та нетворк рулами - не дало результатів.

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
`kubectl apply -f persistent_volume/storage.yaml`
`kubectl apply -f persistent_volume/pvc.yaml`
`kubectl apply -f persistent_volume/pod.yaml`
Перевірка
`kubectl exec pvc-tester -- tail /data/out.txt`
Sun Jun 15 13:54:40 UTC 2025

## 5. Запуск завдання за допомогою Job
`kubectl apply -f job/job.yaml`
Перевірка
`kubectl logs job/hello-job`
Hello from EKS!

## 6. Розгорнути тестовий застосунок
`kubectl apply -f app/deployment.yaml`
`kubectl apply -f app/service.yaml`
Перевірка
`kubectl get pods -l app=apache-demo`
apache-demo-55bbd658bb-d6jf9   1/1     Running   0          22s   10.244.0.7   minikube   <none>           <none>
apache-demo-55bbd658bb-pwjbl   1/1     Running   0          22s   10.244.0.6   minikube   <none>           <none>

## 7. Робота з неймспейсами
`kubectl apply -f namespaces/namespace.yaml`
`kubectl apply -f namespaces/deployment.yaml`
Перевірка
`kubectl -n dev get pods`
NAME                       READY   STATUS    RESTARTS   AGE
sleeper-7cf565f598-8gpbt   1/1     Running   0          16s
sleeper-7cf565f598-c99qt   1/1     Running   0          16s
sleeper-7cf565f598-ngwcs   1/1     Running   0          16s
sleeper-7cf565f598-r8fvf   1/1     Running   0          16s
sleeper-7cf565f598-rwdzd   1/1     Running   0          16s
## 8. Очистити ресурси

EKS кластер, Node group, VPC, subnets - видалено