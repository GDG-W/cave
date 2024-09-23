# devfest24

[![Trigger Conference App Android/iOS Build](https://img.shields.io/badge/Trigger-Conference%20App%20Build-blue.svg)](https://github.com/gdg-w/cave/actions/workflows/conferenceapp.yaml)
[![Trigger Volunteer App Android/iOS Build](https://img.shields.io/badge/Trigger-Volunteer%20App%20Build-blue.svg)](https://github.com/gdg-w/cave/actions/workflows/volunteerapp.yaml)
[![Deploy Catalog](https://img.shields.io/badge/Deploy-Catalog-blue.svg)](https://github.com/gdg-w/cave/actions/workflows/catalog.yaml)

## Description
This repository contains the source code for the **DevFest24** mobile applications, including:
- **Conference App**: The official app for attendees of DevFest24, providing event schedules, speaker details, venue information, and more.
- **Volunteer App**: An app designed for volunteers to help manage tasks, schedules, and communications during DevFest24.
- **Cave Library**: A shared component library used by both the Conference and Volunteer apps to ensure a consistent design and behavior.

This monorepo is managed using **Melos** to handle interdependencies between packages efficiently.

# Getting Started
## - Fork the Repository

## - Clone Your Fork
```sh
git clone https://github.com/yourUserName/cave.git
```
## - Install Melos
```sh
dart pub global activate melos
```

## - Bootstrap the Repository
> Setting up the repository involves multiple steps, including installing dependencies, bootstrapping, and generating necessary files

### - Navigate to the cloned repository:
```sh
cd cave
```

### - Fetch and install dependencies for the project:
```sh
flutter pub get
```

### - Using Melos, bootstrap the project
> This step links inter-dependent packages in the repo, ensuring they work together seamlessly:
```sh
melos bootstrap
```

### - Generate any necessary build files
```sh
melos generate
```