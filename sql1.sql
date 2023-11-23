Create database Magazin;
use  Magazin;
create table Agence(
Num_agence int primary key,
Nom varchar(32),
ville varchar(22),
actif varchar(16)
);

create table Client(
num_client int primary key,
nom varchar(32),
ville varchar(24)

);

create table Compte(
num_compte int primary key,
num_agence int,

num_client int,
solde int,
foreign key (num_agence) References Agence(num_agence),
foreign key (num_client) References client(num_client)
);

 

create table Emprunt(

Num_emprunt int primary key,

num_agence int,

num_client int,

Montant int,

foreign key (num_agence) References Agence(num_agence),

foreign key (num_client) References Client(num_client)

);

insert into Client( num_client,nom,ville) values

(1,'Arame','DAKAR'),

(2,'Dieyla','THIES'),

(3,'Dieyna','DIOURBEL'),

(4,'Aicha','DIOURBEL'),

(5,'Ahmad','RUFISQUE'),

(6,'BB','Touba');

 

insert into agence (num_agence,nom,ville,actif) values

(10,'CBAO','DAKAR','3'),

(20,'BCEAO','THIES','6'),

(30,'BDK','DAKAR','8'),

(40,'BCIS','Stloius','12'),

(50,'coris','Touba','15');

 

insert into  Compte (num_compte,num_agence,num_client,solde) values

(14,10,1,14500000),

(15,20,4,3450000),

(17,30,3,2300000),

(18,10,2,1200),

(19,20,1,2000);

 

 

  select*from Client;

    select*from compte;

    select*from emprunt;

      select*from agence;

      select distinct Client.num_client,Client.nom,Client.Ville

from Client

Inner join Compte on Client.num_client=compte.num_client

Inner join Agence on compte.num_agence=Agence.num_agence

where Agence.ville='Thies';

  select distinct Client.Num_client,Client.Nom,Client.ville

from Client

inner join Compte on Client.Num_Client=Compte.Num_Client

inner join Agence on Compte.Num_Agence=Agence.Num_Agence

inner join Emprunt on Client.Num_Client=Emprunt.Num_Client

Where Agence.Ville='Diourbel'or Emprunt.Num_client=Client.num_client AND client.ville='Diourbel';

 




SELECT DISTINCT Client.Num_client, Client.Nom, Client.Ville

FROM Client

INNER JOIN Compte ON Client.Num_client = Compte.Num_client

LEFT JOIN Emprunt ON Client.Num_client = Emprunt.Num_client
WHERE Compte.Num_agence IN (SELECT Num_agence FROM Agence WHERE Ville = 'Touba')
AND Emprunt.Num_emprunt IS NOT NULL;

 

--Clients ayant un compte et nom de la ville où ils habitent


 

--Clients ayant un compte et nom de la ville où ils habitent

 

 

 

--Clients ayant un compte dans une agence où "Client 5" a un emprunt;
SELECT DISTINCT Client.Num_client, Client.Nom, Client.Ville
FROM Client
INNER JOIN Compte ON Client.Num_client = Compte.Num_client
INNER JOIN Agence ON Compte.Num_agence = Agence.Num_agence
WHERE Agence.Num_agence IN (
    SELECT Num_agence
    FROM Compte
    WHERE Num_client = 5
);

--Solde moyen des comptes clients des agences dont le solde moyen est supérieur à 7000
SELECT AVG(Compte.Solde) AS SoldeMoyen
FROM Agence
INNER JOIN Compte ON Agence.Num_agence = Compte.Num_agence
GROUP BY Agence.Num_agence
HAVING AVG(Compte.Solde) > 100000;

 



 