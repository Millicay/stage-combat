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


INSERT INTO juego(id_juego, nombre, volumen, alto_pantalla, ancho_pantalla)
VALUES(1, 'Stage Combat', 100, 100, 100);

INSERT INTO setDialogos(dialogo_atacar, dialogo_atacado, dialogo_seleccion)
VALUES('te pego', 'me pegaron', 'me escogieron');

INSERT INTO infoPersonaje(nombre, descripcion, vida, probabilidad_crit, ataque, defensa, estamina, sprites, sprites_atacado, sprite_atacar, sprite_estado_alterado, sprite_idle, idSetDialogos)
VALUES('Row', 'Es row', 20, 35, 40, 50, 20, 'images/row.png', 'images/row_atacado.png', 'images/row_atacar.png', 'images/row_idle.png', 1);

INSERT INTO personajes(id_juego, id_personaje)
VALUES(1, 1);

INSERT INTO habilidades(nombre, descripcion, efecto_extra, coste_sp, texto_ejecutarse, tipo)
VALUES('Puñetazo', 'Da un puñetazo', 'congelado', 2, 'Le diste un puñetazo al oponente', 'dps');

INSERT INTO setsHabPJ(id_personaje, id_habilidades)
VALUES(1, 1);

INSERT INTO infoBackground(idBackground, imagen, cancion)
VALUES(1, 'images/fondoMesa.png', 'sounds/cancionMesa.mp3');

INSERT INTO backgrounds(idBackground, id_juego)
VALUES(1, 1);
