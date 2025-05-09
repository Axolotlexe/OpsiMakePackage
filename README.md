# OpsiMakePackage

Automatisation du déploiement logiciel avec OPSI — Création et installation de paquets personnalisés.

## 🌟 Objectif

Ce projet vous guide dans la création d’un **paquet OPSI** permettant l’installation automatisée d’un logiciel sur un parc informatique à l’aide de la solution OPSI (Open PC Server Integration).

## 📦 Fonctionnalités

- Création structurée de paquets OPSI
- Utilisation de Windows Sandbox pour tester les installations silencieuses
- Génération automatique des scripts `install.opsiscript` et `uninstall.opsiscript`
- Déploiement sur serveur OPSI avec connexion SSH

## 📁 Structure d’un paquet OPSI

```
NomDuLogiciel/
│
├── CLIENT_DATA/                  # Contient les fichiers d’installation (ex: .exe)
│   └── install.opsiscript        # Script d'installation
│   └── uninstall.opsiscript      # Script de désinstallation
│
├── OPSI/
│   └── control                   # Métadonnées du paquet (nom, version, ID, etc.)
│
├── changelog.txt                 # Journal des modifications (optionnel)
└── icon.png                      # Icône du logiciel (optionnel)
```

## 🧰 Prérequis

- Windows 10/11 Pro ou Entreprise
- OPSI installé et configuré
- PowerShell (avec droits admin)
- Accès au serveur OPSI via SSH

## ⚙️ Étapes de création

### 1. Préparer l'environnement de test

- Activer **Windows Sandbox** via PowerShell :
  ```powershell
  Set-VMProcessor -VMName <NomVM> -ExposeVirtualizationExtensions $true
  Update-VMVersion -VMName <NomVM>
  ```
- Créer le dossier `C:\Utilitaires_OPSI`
- Lancer la sandbox via un fichier `.wsb`

### 2. Tester l’installation silencieuse

- Placer le fichier `.exe` dans `C:\Utilitaires_OPSI`
- Utiliser le script `OpsiMakePackage.bat` fourni pour tester le mode silencieux

### 3. Créer le paquet OPSI

- Générer les scripts `install.opsiscript` et `uninstall.opsiscript`
- Renseigner le fichier `control` avec les métadonnées
- Ajouter le fichier `variable.ins` si nécessaire

### 4. Installer le paquet dans OPSI

- Se connecter au serveur OPSI en SSH
- Copier le dossier du paquet dans `\\OPSI\workbench`
- Lancer l'installation via la console **Configed**

## 🔁 Désinstallation

Le script `uninstall.opsiscript` s’occupe de supprimer les fichiers et désinstaller le logiciel proprement.

## 📨 Besoin d’aide ?

Vous pouvez contacter :  
📧 **axence.pro@gmail.com**  

---

## 📄 Licence

Ce projet est distribué sous licence MIT.
