<div align="center">

  ![Inkstep Icon](assets/icon/inkstep.png)

</div>

<h1 align="center">
  <strong>Inkstep</strong>
</h1>

<h2 align="center">
  With you every step of the way.
</h2>

<h4 align="center">

[![CircleCI](https://circleci.com/gh/inkstep/inkstep-app.svg?style=svg)](https://circleci.com/gh/inkstep/inkstep-app)
[![Stars](https://img.shields.io/github/stars/inkstep/inkstep-app.svg?style=plasticr)](https://github.com/inkstep/inkstep-app/stargazers)
[![Last Commit](https://img.shields.io/github/last-commit/inkstep/inkstep-app.svg?style=plasticr)](https://github.com/inkstep/inkstep-app/commits/master)
[![GitHub issues](https://img.shields.io/github/issues-raw/inkstep/inkstep-app?style=flat)](https://github.com/inkstep/inkstep-app/issues)
[![GitHub pull requests](https://img.shields.io/github/issues-pr/inkstep/inkstep-app)](https://github.com/inkstep/inkstep-app/pulls)

</h4>


Mobile app designed to streamline the journey of your first tattoo, and be there like a friend throughout it.


https://docs.google.com/presentation/d/1opLx9JsFNvtbFvzewIrgcovOuTjsMMMpG0Z0BGvckRA/edit#slide=id.g584679832c_0_269


## :wrench: Technology

Built using the wonderful [Flutter](https://flutter.dev/).

## :gear: Installation

### Prerequistes
1. [Flutter](https://flutter.dev/docs/get-started/install/)
2. [Android Studio](https://developer.android.com/studio/)

```sh
# Go to your favourite directory and clone
git clone git@github.com:inkstep/inkstep-app.git inkstep/app
git clone git@github.com:inkstep/backend.git inkstep/backend

# Setup backend
cd backend

# Run using flutter
cd ../inkstep
flutter run -t lib/main_dev.dart
```

## :rocket: Running the code locally
```sh
flutter run -t lib/main_dev.dart # Run development build
flutter run -t lib/main_prod.dart # Run production build
```

```sh
flutter build apk -t lib/main_prod.dart
```


## :wave: Contributing
