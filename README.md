# ☁️ Azure Infrastructure avec Azure CLI

## 📋 Description

Ce projet a pour objectif d'automatiser le déploiement de plusieurs ressources Microsoft Azure à l'aide de scripts Bash et de l'Azure CLI.

Toutes les ressources sont créées automatiquement depuis des scripts afin de découvrir les principaux services Azure utilisés dans une infrastructure Cloud.

---

# 🏗️ Architecture

```
Azure Subscription
│
└── Resource Group (abenslimaneRG)
    │
    ├── Storage Account
    │
    ├── App Service Plan
    │
    ├── Web App
    │
    ├── Function App
    │
    └── Azure Container Instance
```

---

# 📂 Arborescence du projet

```
azure-infra-cli
│
├── scripts
│   ├── 00-variables.sh
│   ├── 01-login.sh
│   ├── 02-resource-group.sh
│   ├── 03-storage-account.sh
│   ├── 04-app-service.sh
│   ├── 05-function-app.sh
│   └── 06-container-instance.sh
│
└── README.md
```

---

# ⚙️ Variables utilisées

| Variable | Valeur |
|----------|---------|
| Région | France Central |
| Resource Group | abenslimaneRG |
| Runtime | PHP 8.2 |
| OS | Linux |

---

# 🚀 Déploiement

## 1. Connexion Azure

```bash
./scripts/01-login.sh
```

Connexion au portail Azure.

---

## 2. Création du Resource Group

```bash
./scripts/02-resource-group.sh
```

Création du groupe de ressources :

```
abenslimaneRG
```

---

## 3. Création du Storage Account

```bash
./scripts/03-storage-account.sh
```

Création du compte de stockage Azure.

Exemple :

```
stabdelcli6594
```

---

## 4. Création de l'App Service

```bash
./scripts/04-app-service.sh
```

Création :

- App Service Plan
- Web App

Exemple :

```
plan-abdel-cli
api-appservice-abdel-4158
```

---

## 5. Création de la Function App

```bash
./scripts/05-function-app.sh
```

Création d'une Azure Function.

> Selon le type de plan utilisé, cette étape peut nécessiter un plan compatible avec Azure Functions.

---

## 6. Création d'un Azure Container Instance

```bash
./scripts/06-container-instance.sh
```

Déploiement d'un conteneur Docker dans Azure Container Instance.

---

# 🌐 Vérification

Toutes les ressources ont été vérifiées depuis :

- Azure Portal
- Azure CLI

Commande utilisée :

```bash
az resource list --resource-group abenslimaneRG --output table
```

---

# 📸 Résultat

L'application Web est accessible publiquement :

```
https://api-appservice-abdel-4158.azurewebsites.net
```

Une page HTML personnalisée a été déployée afin de vérifier le bon fonctionnement de l'App Service.

---

# 🛠️ Technologies utilisées

- Azure CLI
- Bash
- Microsoft Azure
- Azure App Service
- Azure Storage Account
- Azure Function
- Azure Container Instance

---

# 🎯 Objectifs pédagogiques

Au cours de ce TP, j'ai appris à :

- utiliser Azure CLI
- automatiser le déploiement de ressources Azure
- utiliser des variables Bash
- créer plusieurs services Azure
- déployer une application Web
- vérifier les ressources depuis le portail Azure
- comprendre l'architecture PaaS Azure

---

# 👨‍💻 Auteur

**Abdel Benslimane**

Formation Administrateur Systèmes DevOps – École Cloud Microsoft by Simplon

2026