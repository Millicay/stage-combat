create database stagecombat;

use stagecombat;

CREATE TABLE juego(id_juego INT PRIMARY KEY, nombre VARCHAR (60), volumen INT, alto_pantalla INT, ancho_pantalla INT);

CREATE TABLE setDialogos(idSetDialogos INT PRIMARY KEY not null auto_increment , dialogo_atacar VARCHAR(45), dialogo_atacado VARCHAR(45), dialogo_seleccion VARCHAR(45));

CREATE TABLE infoPersonaje(id_personaje INT auto_increment PRIMARY KEY, nombre VARCHAR (25), descripcion VARCHAR (255), vida INT, probabilidad_crit INT, ataque INT, defensa INT, estamina INT, sprites VARCHAR (255), sprites_atacado VARCHAR (255), sprite_atacar VARCHAR (255), sprite_estado_alterado VARCHAR (255), sprite_idle VARCHAR (255), idSetDialogos INT, foreign key (idSetDialogos) references setDialogos(idSetDialogos));

CREATE TABLE personajes(
 id_juego INT NOT NULL, 
 id_personaje INT NOT NULL, 
 FOREIGN KEY(id_juego) REFERENCES juego(id_juego),
 FOREIGN KEY(id_personaje) REFERENCES infoPersonaje(id_personaje)
);

CREATE TABLE habilidades(id_habilidad INT auto_increment PRIMARY KEY NOT NULL,
 nombre VARCHAR (45),
 descripcion VARCHAR (70),
 efecto_extra VARCHAR(45),
 coste_sp INT,
 texto_ejecutarse VARCHAR (70),
 tipo VARCHAR (45));

CREATE TABLE setsHabPJ(id_personaje INT NOT NULL, id_habilidades INT NOT NULL, FOREIGN KEY (id_personaje) REFERENCES infoPersonaje(id_personaje), FOREIGN KEY (id_habilidades) REFERENCES habilidades(id_habilidad));

CREATE TABLE infoBackground(idBackground INT PRIMARY KEY not null auto_increment, imagen VARCHAR (45), cancion VARCHAR (45));

CREATE TABLE backgrounds(idbackground INT not null,
 id_juego INT not null,
 FOREIGN KEY (id_juego) REFERENCES juego(id_juego),
 FOREIGN KEY (idbackground) REFERENCES infoBackground(idBackground));


