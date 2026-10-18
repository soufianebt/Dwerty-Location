# Dwerty Location


## UNE PLATEFORME WEB POUR PUBLIER LES OFFRES DE LOGEMENT

**Description** : Dwerty location est un espace pour les résidents
marocains et non marocains ainsi que pour les touristes dans lequel ils peuvent chercher et trouver un bon logement qui
répond à leurs attentes.

**Technologies utilisées** : UML, JEE, HTML, CSS, JavaScript, JSP,
Mysql, HIBERNATE.

## Run With Docker

Install Docker Desktop with Linux containers enabled, then run from the project root:

```sh
docker compose up --build -d
```

Open http://localhost:8080. No local Java, Maven, Tomcat, or MySQL installation is needed.

The Dockerfile builds the WAR with Maven and Java 8, then deploys it at the root
of Tomcat 9. The application uses `javax.servlet` 4.0, so Tomcat 10+ is not
compatible without migration. Compose starts MySQL 8.4 and waits for a successful
database query before starting Tomcat. Hibernate creates/updates the tables on
the first database connection; the database initially contains no application data.

MySQL data and uploaded images use named volumes. MySQL is available only inside
the Compose network, not on a host port. The application is bound to localhost.

Optional settings can be placed in a `.env` file in the project root:

```dotenv
APP_PORT=8080
DB_PASSWORD=replace-with-a-strong-app-password
DB_ROOT_PASSWORD=replace-with-a-different-strong-root-password
```

Without overrides, Compose uses development-only passwords. This setup is for
local development, not production. MySQL initialization settings apply only to
a new database volume; changing passwords later also requires updating MySQL users.

```sh
docker compose logs -f app db
docker compose down
```

`down` preserves data. `docker compose down -v` permanently deletes both the
database and uploaded images.

Container settings override Hibernate's existing local defaults using `DB_URL`,
`DB_USERNAME`, `DB_PASSWORD`, and `DB_DIALECT`. `UPLOAD_DIR` sets the upload directory;
Compose points it at Tomcat's `/img` directory. Multipart temporary files use
Tomcat's temporary directory instead of a Windows-specific path.
