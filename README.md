# Projet de groupe : Envoie d'email

## Installations

Istaller tous les gems :

```sh
$ bundle install
$ gem install twitter
```

Lancer le programme :

```sh
$ ruby app.rb
```

Coller votre fichier .env avec vos ID :

consumer_key="..."

consumer_secret="..."

access_token="..."

access_token_secret="..."

### Arborescence :

Envoi_email_en_masse_THP 
- .gitignore
- README.md
- Gemfile
- Gemfile.lock
- app.rb
- db
  - townhalls.json
- lib
  - app
    - townhalls_scrapper.rb
    - townhalls_mailer.rb
    - Twitter 
        - choper_handles_sur_internet.rb
        - enter_handles_in_json.rb
        - follow_gens_sur_twitter.rb
        - recup_nom_villes_du_json.rb
        - start_bot.rb
  - views
    - done.rb
    - index.rb

### Equipe :

- Gwen
- Nancy
- Joanne
- Jérémie
- Rid
- Louis
- Huguens

### Description du projet :

Nous avons décidé de sélectionner email et les twitters des mairies des départements Outre Mer de la Martinique, la Guyane et de La Réunion. Ils comptent à eux trois 80 mairies. Nous les avons follow avec le handle @Rubyaskip et envoyé un email de présentation de THP.
