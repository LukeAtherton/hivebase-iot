#Hivebase.io IoT Platform Components

Common infrastructure services and launch configuration for the Hivebase.io IoT Platform.

- [Infrastructure Services](#infrastructure-services)
  - [Cloud Config](#cloud-config)
  - [Database](#database-!(mongodb))
  - [Message Queue](#message-queue-!(rabbitmq))
  - [Dynamic Reverse Proxy](#dynamic-reverse-proxy-!(vulcand))
  - [Healthcheck](#healthcheck-service) 
  - [Authentication](#authentication-service)
  - [Email](#email-service)
  - [Uploads](#upload-service)
- [Application Services](#application-services)
  - [Frontend](#frontend)
  - [Profiles](#profiles-service)
  - [Devices](#devices-service)

#Infrastructure Services

##Cloud Config

Dev (single node):

`$ make dev-stack-launch`

HA Cluster (3 nodes):

`$ make ha-stack-launch`

The load balancer will rely on the healthcheck app being up before the instances register as healthy.

***TODO: There are some security group changes needed that aren't yet reflected in the config.***

##Database (mongodb)

`$ make db-launch`

***NOTE: Single node config only - for multi-node use separate db cluster or hosted solution e.g. [MongoDB Cloud](https://www.mongodb.com/cloud).***

##Message Queue (rabbitmq)

Hanldes async communication between processes.

`$ make mq-launch`

##Dynamic Reverse Proxy (vulcand)

Allows api service composition and load balancing / failover.

`$ make proxy-launch`

##Healthcheck Service
###[LukeAtherton/healthchecker](https://github.com/lukeatherton/healthchecker) [![Circle CI](https://circleci.com/gh/LukeAtherton/healthchecker.svg?style=svg)](https://circleci.com/gh/LukeAtherton/healthchecker)

Outputs HTTP:200 OK on :8888/healthcheck for load-balancer healthcheck.

`$ make launch healthchecker`

##Authentication Service
###[LukeAtherton/authenticator](https://github.com/lukeatherton/authenticator) [![Circle CI](https://circleci.com/gh/LukeAtherton/authenticator.svg?style=svg)](https://circleci.com/gh/LukeAtherton/authenticator)

Provides a basic user authentication API. This service provides authenticated users with a signed [JWT](https://en.wikipedia.org/wiki/JSON_Web_Token) which can be used to access other API services. Other services use the authenticator public key to check the JWT signature.

`$ make launch authenticator`

##Email Service
###[LukeAtherton/mailer](https://github.com/lukeatherton/mailer) [![Circle CI](https://circleci.com/gh/LukeAtherton/mailer.svg?style=svg&circle-token=1302a58fba3f2058d98ab54193e2fa8a56f064a2)](https://circleci.com/gh/LukeAtherton/mailer)

Connects to the MQ and handles events which trigger emails via Mailgun.

`$ make launch mailer`

##Upload Service
###[LukeAtherton/uploader](https://github.com/lukeatherton/uploader) [![Circle CI](https://circleci.com/gh/LukeAtherton/uploader.svg?style=svg&circle-token=72983e496b0320dd0cdad245c20dac4b3fde6e71)](https://circleci.com/gh/LukeAtherton/uploader)

Exposes a basic image upload API and stores the files on S3.

`$ make launch uploader `

#Application Services

##Frontend
###[LukeAtherton/hivebase-frontend](https://github.com/lukeatherton/hivebase-frontend) [![Circle CI](https://circleci.com/gh/LukeAtherton/authenticator.svg?style=svg&circle-token=c5583f407a248a5f1ef88dbe18d0c7b71593e041)](https://circleci.com/gh/LukeAtherton/authenticator)

Frontend Web Application for Hivebase.io platform.

`$ make launch hivebase-frontend `

##Profiles Service
###[LukeAtherton/hivebase-profiles](https://github.com/lukeatherton/hivebase-profiles) [![Circle CI](https://circleci.com/gh/LukeAtherton/hivebase-profiles.svg?style=svg&circle-token=e28bec88b5b1ba273986e9adceb59381789fe85c)](https://circleci.com/gh/LukeAtherton/hivebase-profiles)

User profile API for hivebase.io platform.

`$ make launch hivebase-profiles `

##Devices Service 
###[LukeAtherton/hivebase-devices](https://github.com/lukeatherton/hivebase-devices) [![Circle CI](https://circleci.com/gh/LukeAtherton/hivebase-devices.svg?style=svg&circle-token=a3616bf73a117a1fc4aaba68564aadc970d9d235)](https://circleci.com/gh/LukeAtherton/hivebase-devices)

Devices API for hivebase.io platform.

`$ make launch hivebase-devices `
