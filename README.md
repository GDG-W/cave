# devfest24

A new Flutter project.


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