# vuetorial

Ceci est l'exercice pratique accompagnant le premier atelier Vue.js de Synbioz.

## Mise en route

- Clonez ce dépôt
- Créez une branche à votre nom

Le travail demandé est à effectuer dans le fichier `index.html`, qui contient pour l'instant une structure de page basique.

## What you gonna do

Le but de l'exercice est de réaliser un client basique pour une API de "votebox", située à l'URL https://neemzy.org/votebox.

| Endpoint         | Description                      | Body de la requête    | Format de la réponse       |
| ---------------- | -------------------------------- | --------------------- | -------------------------- |
| `GET /`          | Récupère la liste des features   | (aucun)               | `[{ id, feature, score }]` |
| `POST /`         | Ajoute une nouvelle feature      | `{ feature: String }` | `{ id, feature, score }`   |
| `POST /up/:id`   | Upvote la feature à l'id donné   | (aucun)               | `{ id, feature, score }`   |
| `POST /down/:id` | Downvote la feature à l'id donné | (aucun)               | `{ id, feature, score }`   |

## Considérations générales

- Les interactions avec le serveur se feront via la librairie [Axios](https://github.com/axios/axios) (déjà inclue dans `index.html`). Il est possible (et recommandé) de l'instancier en lui passant l'URL de base en paramètre pour éviter de la répéter à chaque appel.
- Un piège récurrent de JavaScript concerne le **contexte** des fonctions anonymes, utilisées par exemple avec Axios. Voici un exemple :

```js
axios.get('...')
  .then(function(response) {
    this.features = response.data;
  });
```

Le code ci-dessus ne fonctionnera pas puisque par défaut, `this` à l'intérieur d'une fonction anonyme référence ladite fonction elle-même, hors ici nous souhaitons faire référence à l'instance de Vue.js : il est donc nécessaire d'**attacher** la fonction au contexte courant lors de sa déclaration, de la manière suivante :

```js
axios.get('...')
  .then(function(response) {
    this.features = response.data;
  }.bind(this)); // changement de contexte
```

## Exercices

### Exercice 1 : afficher la liste des features

Mettez en place une application Vue.js sommaire permettant de récupérer et afficher la liste des features (sous forme d'`<ul>` / `<li>` par exemple).

Points de vigilance :

- Inutile d'organiser le code en composants pour l'instant, ce sera pour la quatrième et dernière étape
- Attention à l'utilisation de `:key` lors de l'affichage en boucle

### Exercice 2 : pouvoir voter pour une feature

Ajoutez pour chaque feature un bouton d'upvote et un bouton de downvote.

Points de vigilance :

- Les données affichées doivent être mises à jour d'après la réponse de l'API
- Factoriser le code entre les deux "sens" de vote

### Exercice 3 : pouvoir ajouter une feature

Ajoutez un petit formulaire permettant de soumettre une nouvelle feature.

Points de vigilance :

- Gérer le cas d'erreur (champ vide) ; l'API répondra `400` en cas d'appel invalide
- Pour améliorer l'UX, il faudra vider le champ en cas d'enregistrement réussi

### Exercice 4 : refactoring en composants

Refactorez le code écrit jusqu'ici pour en dégager trois composants : une feature, la liste des features et le formulaire de soumission.

Points de vigilance :

- Séparation des responsabilités (l'app communique avec le serveur, les composants gèrent leur fonctionnement interne)
- Encapsulation (utilisation des `props` et d'un bus d'évènements pour le passage des infos)
