Rapport                                                                                                           Liliya Sayfutdinova



# LibrarySarvlet✨
##### Målet med uppgiften var att  designa och utveckla en web applikation med hjälp  av JSP, Servlets, Hibernate  i Java med MVC pantern  för att hantera en bibliotekstjänst. 
Med hjälp av sökrutan skall man kunna söka efter böcker eller med title eller med author.
Som User/Admin besökare har möjlighet att logga in med ett användarnamn och lösenord eller registrera sig och loga ut.
Som inloggad användare/User har  möjlighet att låna och lämna tillbaka böcker via webbsidan, se en historik med alla tidigare lån, se lista med ännu ej återlämnade böcker - se när senaste återlämnings dag är, redigera info.
Som Admin man kan lägga till nya böcker, authors, category,users i biblioteket via ett formulär,
     söka efter användare, redigera användare,se en speciell användares nuvarande och tidigare       lån.


 ## Teknologi
I projektet användas följande teknologi 

##### Projektet byggt i Java i IntelliJ IDEA.

##### Databasen byggt med hjälp av  Postgres.

##### Docker kapslar in vår kod och alla dess beroenden i isolerade ”containers” som syftar till att automatisera processen för att skapa, distribuera och köra applikationer inuti isolerade miljöer, kända som "containers". 

##### JSP (JavaServer Pages) som  Presentation Layer inbäddar Java-kod direkt från HTML för att skapa dynamiskt innehåll.

##### Servlets som Controller Layer ansvarar för HTTP requests and responses, connecting av presentation layer till business logic.

##### Hibernate som Persistence Layer - ORM (Object-Relational Mapping) verktyg för  som underlättar interaktion med databasen.


##### MVC Pattern - Model-View-Controller (MVC) pattern to organize the codebase:
Model: Representerar data och applikationens regler. I Java är detta vanligtvis ett POJO (Plain Old Java Object) för att interagera med en databas med Hibernate.
View: The end-user interface, vanligtvis hanteras av JSP-filer som genererar HTML som skickas till användarens webbläsare.
Controller: ansvarar för HTTP requests and responses, connecting av presentation layer till business logic
I Projektet användas DTO som står för Data Transfer Object, vilket är ett designmönster. Programmet använder service, model, DAO/repository. Service är en Java-klass som innehåller Business Logic, inkapsling av applikationsfunktionalitet.


## Användarinteraktion:
Ett användargränssnitt där användare kan låna, lämna  tillbaka böcker.

## Att starta applicationen

För att köra applicationen behövs installeras Tomcat v.10, IntellijIdea Ultimate Edition, Docker, pgAdmin
När projektet oppnas, i projektverktygsfönstret i IntelliJIdea  leta upp en start gröntikonen för att köra programmet och väljer Kör  ”Tomcad 10.1.31”.
Man leta upp en docker-compose.yml fil och startar med  gröntikonen ”services”.


Den slutgiltiga applikationen  har paketerat och pushad till Docker Hub
 https://hub.docker.com/u/liliya87

Länken till den deployade appen https://librabysarvlet.onrender.com/
OBS! Det kan ta några minuter att öppna sidan tyvärr.

Inloggning som Admin
Username :  admin5
Password :  admin5

Inloggning som User
Username :  yuliya
Password :  1234
