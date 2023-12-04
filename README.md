# Advent of Code 2023

Ce projet contient mes solutions pour l'événement [Advent of Code 2023](https://adventofcode.com/2023), réalisées en Ruby.

## Structure du Projet

Un répertoire par jour, avec un module Ruby dédié, un fichier "solver" qui appelle le module et renvoie le résultat, et un fichier d'input.
Un répertoire spec contenant les tests, avec un répertoire par jour à l'intérieur.

## Note de Difficulté

Pour chaque jour, j'ai attribué une note de difficulté basée sur mon expérience personnelle, sur une échelle de 1 à 5 étoiles :

- Jour 1 (partie 1) : ⭐⭐☆☆☆
- Jour 1 (partie 2) : ⭐⭐⭐☆☆
- Jour 2 (partie 1 et 2) : ⭐⭐☆☆☆
- Jour 3 (partie 1 et 2) : ⭐⭐⭐⭐⭐
- Jour 4 (partie 1) : ⭐⭐☆☆☆
- Jour 4 (partie 2) : ⭐⭐⭐☆☆

## Installation et Exécution

### Installation de RSpec

Avant d'exécuter les tests, assurez-vous d'avoir installé la gemme RSpec. Si ce n'est pas le cas, exécutez :

```bash
gem install rspec
```
Ou ajoutez RSpec à votre Gemfile et exécutez bundle install.
```bash
bundle install
```

### Lancer les Solutions

Pour exécuter les solutions, naviguez dans le dossier du jour correspondant et exécutez le script solver 

```bash
ruby day_01/day_01_solver.rb
```

### Exécuter les Tests

Pour exécuter les tests RSpec, utilisez :
```bash
rspec spec
```
