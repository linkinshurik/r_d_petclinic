## Outputs
Bucket name - "my-cf-bucket-580389065683-us-east-1"
IP EC2 - 23.20.155.44

Покроково:
`aws cloudformation describe-stacks --stack-name HW28`
```
{
    "Stacks": [
        {
            "StackId": "arn:aws:cloudformation:us-east-1:580389065683:stack/HW28/a5e34f50-4a
1d-11f0-916c-0e8e7a04a763",
            "StackName": "HW28",
            "Description": "Infrastructure with VPC, EC2, IAM Role, and S3 Bucket",
            "CreationTime": "2025-06-15T19:19:24.704000+00:00",
            "RollbackConfiguration": {
                "RollbackTriggers": []
            },
            "StackStatus": "CREATE_COMPLETE",
            "DisableRollback": false,
            "NotificationARNs": [],
            "Capabilities": [
                "CAPABILITY_NAMED_IAM"
            ],
            "Outputs": [
                {
                    "OutputKey": "EC2PublicIP",
                    "OutputValue": "23.20.155.44",
                    "Description": "Public IP of EC2 Instance"
                },
                {
                    "OutputKey": "S3BucketName",
                    "OutputValue": "my-cf-bucket-580389065683-us-east-1",
                    "Description": "Name of S3 bucket"
                }
            ],
            "Tags": [],
            "EnableTerminationProtection": false,
            "DriftInformation": {
                "StackDriftStatus": "NOT_CHECKED"
            }
        }
    ]
}
```

`aws cloudformation detect-stack-drift --stack-name HW28`
```
{
    "StackDriftDetectionId": "eb8b6c70-4a1f-11f0-8ca6-0e9a65fcff33"
}
```

`aws cloudformation describe-stack-drift-detection-status --stack-drift-detection-id eb8b6c70-4a1f-11f0-8ca6-0e9a65fcff33`
```
{
    "StackId": "arn:aws:cloudformation:us-east-1:580389065683:stack/HW28/a5e34f50-4a1d-11f0-916c-0e8e7a04a763",
    "StackDriftDetectionId": "eb8b6c70-4a1f-11f0-8ca6-0e9a65fcff33",
    "StackDriftStatus": "IN_SYNC",
    "DetectionStatus": "DETECTION_COMPLETE",
    "DriftedStackResourceCount": 0,
    "Timestamp": "2025-06-15T19:35:40.471000+00:00"
}
```

Змінив `Bucket Versioning -> Suspend`
Після чого зробив запит на `drift detect` (скріншоти)

Видалення ресурсів:
`aws cloudformation delete-stack --stack-name HW28`