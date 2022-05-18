INSERT INTO TIPO_PERSONA(nombreTipo, descripcion)
    VALUES
        ('Persona', 'Persona que no es ni pasajero ni empleado'),
        ('Pasajero', 'Persona que ha comprado al menos un boleto'),
        ('Empleado', 'Persona que trabaja para la aerolinea')
;

INSERT INTO TIPO_CUENTA(nombre, descripcion, recompensa, porcentajeCubierto)
    VALUES
        ('NORMAL', 'Tipo de cuenta que obtiene un cliente al crear una cuenta', 1, 0.25),
        ('ORO', 'Tipo de cuenta que se obtiene despues de dos años', 1.5, 0.5),
        ('PLATINO', 'Tipo de cuenta que se obtiene despues de muchos años viajando', 2, 1)
;

INSERT INTO TIPO_METODO_PAGO(nombre, descripcion)
    VALUES
        ('Efectivo', 'Pago con dinero en efectivo'),
        ('Tarjeta', 'Pago con tarjeta de credito o debito'),
        ('Paypal', 'Pago electronico por medio de paypal'),
        ('Millas', 'Pago usando las millas del pasajero')
;

INSERT INTO VARIABLE_GENERAL(nombre, valor, descripcion)
    VALUES
        ('Precio encargado chamaco', '35', ''),
        ('Max chamacos por supervisor', '2', ''),
        ('Peso maximo mascota', '30', ''),
        ('Precio mascota', '30', ''),
        ('Porcentaje aseguranza', '.20', ''),
        ('Max alto maleta mano', '25', ''),
        ('Max largo maleta mano', '30', ''),
        ('Max profundidad maleta mano', '50', ''),
        ('Peso maximo maleta documentada', '50', ''),
        ('Maximas maletas documentadas', '3', ''),
        ('Precio maleta 1', '50', ''),
        ('Precio maleta 2', '75', ''),
        ('Precio maleta 3', '100', ''),
        ('Limite boletos PC', '3', ''),
        ('Limite boletos CB', '3', ''),
        ('Limite boletos CE', '5', ''),
        ('Limite boletos EB', '5', ''),
        ('Descuento boleto PC', '0.05', ''),
        ('Descuento boleto CB', '0.03', ''),
        ('Descuento boleto CE', '0.025', ''),
        ('Descuento boleto EB', '0.025', ''),
        ('Precio wifi', '30', '')
;

INSERT INTO CLASE_VUELO(nombre, descripcion)
    VALUES
        ('Primera clase', 'Hay varos'),
        ('Clase negocios', 'La empresa tiene varos'),
        ('Clase economica', 'Medio hay varos'),
        ('Clase básica', 'Apenas y junte pal boleto')
;

INSERT INTO PAIS(nombre, nacionalidad, idiomaOficial)
    VALUES
        ('España', 'Español', 'Español'),
        ('Alemania', 'Aleman', 'Aleman'),
        ('Brasil', 'Brasileño', 'Portugués'),
        ('Francia', 'Francés', 'Francés'),
        ('Argentina', 'Argentino', 'Español'),
        ('Canadá', 'Canadiense', 'Ingles/Francés'),
        ('Estados Unidos', 'Gringo', 'Ingles'),
        ('Italia', 'Italiano', 'Italiano'),
        ('Portugal', 'Portugués', 'Portugués'),
        ('Rusia', 'Ruso', 'Ruso'),
        ('Guatemala', 'Guatemalteco', 'Español'),
        ('Inglaterra', 'Inglés', 'Ingles'),
        ('China', 'Chino', 'Chino'),
        ('Japón', 'Japonés', 'Japonés'),
        ('Chile', 'Chileno', 'Español'),
        ('Australia', 'Australiano', 'Ingles'),
        ('Bolivia', 'Boliviano', 'Español'),
        ('Colombia', 'Colombiano', 'Español'),
        ('Costa Rica', 'Costarricense', 'Español'),
        ('Cuba', 'Cubano', 'Español'),
        ('El Salvador', 'Salvadoreño', 'Español'),
        ('Honduras', 'Hondureño', 'Español'),
        ('Mexico', 'Mexicano', 'Español'),
        ('Nicaragua', 'Nicaraguense', 'Español'),
        ('Suiza', 'Sueco', 'Sueco')
;

INSERT INTO PERSONA (docIdentificacion, nombre, fechaNacimiento, genero, email)
    VALUES
        ('846-74-9231', 'Lalo Keslake', '1998-03-17', 'Masculino', 'lkeslake0@sciencedirect.com'),
        ('782-11-8926', 'Stefano Catford', '1994-12-16', 'Masculino', 'scatford1@sciencedaily.com'),
        ('508-06-2971', 'Ulrica Jeffries', '1986-01-31', 'Femenino', 'ujeffries2@webnode.com'),
        ('605-97-0735', 'Gaynor Abelovitz', '1999-02-10', 'Femenino', 'gabelovitz3@toplist.cz'),
        ('785-15-0822', 'Blinny Byrkmyr', '1989-06-18', 'Femenino', 'bbyrkmyr4@macromedia.com'),
        ('739-81-3283', 'Layney Baroch', '1993-08-04', 'Femenino', 'lbaroch5@nsw.gov.au'),
        ('706-98-3547', 'Mickie Jacobs', '1991-10-29', 'Masculino', 'mjacobs6@abc.net.au'),
        ('517-03-9373', 'Fielding Brennans', '1990-02-23', 'Masculino', 'fbrennans7@barnesandnoble.com'),
        ('302-76-4130', 'Lem Ganter', '1995-03-29', 'Masculino', 'lganter8@github.io'),
        ('152-95-2241', 'Ulla Knowlys', '1995-02-10', 'Femenino', 'uknowlys9@squarespace.com'),
        ('589-32-3898', 'Chrotoem Jeandeau', '1983-10-25', 'Masculino', 'cjeandeaua@nature.com'),
        ('806-54-4519', 'Ianthe Dodell', '2001-08-05', 'Femenino', 'idodellb@unc.edu'),
        ('288-96-9578', 'Wendel Ambrosio', '1989-10-12', 'Masculino', 'wambrosioc@webmd.com'),
        ('627-45-3225', 'Isabel Sawood', '2000-03-30', 'Femenino', 'isawoodd@zdnet.com'),
        ('750-10-9582', 'Gary Spurdon', '1993-12-04', 'Masculino', 'gspurdone@techcrunch.com'),
        ('103-40-0201', 'Hamel Osman', '1988-07-23', 'Masculino', 'hosmanf@ning.com'),
        ('562-32-8208', 'Milt Smitten', '2001-10-14', 'Masculino', 'msmitteng@hud.gov'),
        ('873-87-6725', 'Juliet Gary', '1999-08-31', 'Femenino', 'jgaryh@woothemes.com'),
        ('515-83-3503', 'Torrin Yegoshin', '1982-11-12', 'Masculino', 'tyegoshini@phoca.cz'),
        ('757-42-8367', 'Davida Cobbin', '1986-11-18', 'Femenino', 'dcobbinj@aboutads.info'),
        ('495-44-1709', 'Arleen Wallage', '1997-06-02', 'Femenino', 'awallagek@weibo.com'),
        ('321-88-1124', 'Clayborne Boreland', '1980-03-26', 'Masculino', 'cborelandl@abc.net.au'),
        ('868-67-1220', 'Harlan Lappine', '1998-03-04', 'Masculino', 'hlappinem@patch.com'),
        ('362-53-9038', 'Queenie Gergely', '1992-12-04', 'Femenino', 'qgergelyn@unc.edu'),
        ('461-54-9103', 'Frederigo Seel', '1989-05-25', 'Masculino', 'fseelo@tinyurl.com'),
        ('347-27-8492', 'Hew Paske', '1984-04-29', 'Masculino', 'hpaskep@mac.com'),
        ('304-88-7393', 'Gregg Croysdale', '1987-09-01', 'Masculino', 'gcroysdaleq@theglobeandmail.com'),
        ('163-27-6838', 'Ric MacAndrew', '1992-05-16', 'Masculino', 'rmacandrewr@xrea.com'),
        ('822-68-3247', 'Lew Wringe', '1998-04-24', 'Masculino', 'lwringes@ucla.edu'),
        ('681-18-3003', 'Riannon Barnsdall', '1990-04-19', 'Femenino', 'rbarnsdallt@constantcontact.com'),
        ('280-44-7059', 'Darrell Borg-Bartolo', '1990-06-17', 'Masculino', 'dborgbartolou@typepad.com'),
        ('434-14-0610', 'Clemmie Cufley', '1985-08-24', 'Masculino', 'ccufleyv@yandex.ru'),
        ('467-95-8409', 'Drona Whittenbury', '1996-11-13', 'Femenino', 'dwhittenburyw@apple.com'),
        ('520-14-3106', 'Ludovika Spencelayh', '1986-02-24', 'Femenino', 'lspencelayhx@admin.ch'),
        ('148-59-5781', 'Dirk Brownscombe', '1993-08-21', 'Masculino', 'dbrownscombey@odnoklassniki.ru'),
        ('719-83-2936', 'Deeanne Threadgould', '1988-01-10', 'Femenino', 'dthreadgouldz@people.com.cn'),
        ('384-07-8513', 'Madel Balsellie', '1994-05-09', 'Femenino', 'mbalsellie10@state.tx.us'),
        ('272-18-8642', 'Johan Paireman', '1994-08-01', 'Masculino', 'jpaireman11@smugmug.com'),
        ('617-74-4787', 'Johnny Jeremaes', '2000-11-26', 'Masculino', 'jjeremaes12@baidu.com'),
        ('606-72-6011', 'Sonnie Spawell', '1980-09-02', 'Masculino', 'sspawell13@senate.gov'),
        ('192-48-7726', 'Dalila Petrovsky', '1987-05-12', 'Femenino', 'dpetrovsky14@un.org'),
        ('439-97-6107', 'Cindra Halloway', '1985-07-02', 'Femenino', 'challoway15@drupal.org'),
        ('669-41-4387', 'Nathalia Furnell', '1993-05-21', 'Femenino', 'nfurnell16@weebly.com'),
        ('667-22-4514', 'Loralee Burgwin', '1997-07-09', 'Femenino', 'lburgwin17@stanford.edu'),
        ('743-06-3722', 'Cordell Scotchbrook', '1981-05-15', 'Masculino', 'cscotchbrook18@jimdo.com'),
        ('554-78-9069', 'Tibold Bartoszewicz', '1990-05-04', 'Masculino', 'tbartoszewicz19@ucoz.ru'),
        ('601-93-9358', 'Nappy Beynkn', '1994-05-06', 'Masculino', 'nbeynkn1a@apple.com'),
        ('631-23-7136', 'Henrieta Bickford', '1990-12-08', 'Femenino', 'hbickford1b@wikispaces.com'),
        ('100-54-5244', 'Charity McLeoid', '1996-03-05', 'Femenino', 'cmcleoid1c@t-online.de'),
        ('428-41-9175', 'Darci Hollow', '1985-08-07', 'Femenino', 'dhollow1d@uiuc.edu'),
        ('753-33-5190', 'Cassey Riches', '2006-04-10', 'Femenino', 'criches0@wp.com'),
        ('732-83-1960', 'Sheena Gabe', '2006-11-06', 'Femenino', 'sgabe1@about.me'),
        ('715-86-2292', 'Ignace Craster', '2007-06-30', 'Masculino', 'icraster2@businessweek.com'),
        ('792-18-8556', 'Norean Pechan', '2011-12-02', 'Femenino', 'npechan3@sohu.com'),
        ('682-50-4480', 'Blayne Strewther', '2006-12-22', 'Masculino', 'bstrewther4@tinyurl.com'),
        ('117-79-6054', 'Menard Calderbank', '2010-06-04', 'Masculino', 'mcalderbank5@lycos.com'),
        ('523-08-0085', 'Iain Batch', '2008-11-19', 'Masculino', 'ibatch6@jigsy.com'),
        ('401-04-3662', 'Guilbert Isgar', '2007-05-21', 'Masculino', 'gisgar7@devhub.com'),
        ('329-35-8590', 'Sammy Stonard', '2008-05-17', 'Femenino', 'sstonard8@xrea.com'),
        ('210-51-0720', 'Jacob Darke', '2008-02-21', 'Masculino', 'jdarke9@gov.uk'),
        ('643-71-9170', 'Lucinda Southwood', '2007-04-28', 'Femenino', 'lsouthwooda@scribd.com'),
        ('207-64-1195', 'Quill Rubroe', '2014-10-10', 'Masculino', 'qrubroeb@histats.com'),
        ('453-90-1166', 'Ronda Chelsom', '2012-04-22', 'Femenino', 'rchelsomc@trellian.com'),
        ('291-94-5122', 'Ruy McAllester', '2010-03-05', 'Masculino', 'rmcallesterd@icq.com'),
        ('683-27-5353', 'Ursola Dunbobin', '2013-04-27', 'Femenino', 'udunbobine@walmart.com')
;

INSERT INTO PASAJERO (idPersona, pasaporte)
    VALUES
        (26, '432-63-9188'),
        (27, '114-10-1019'),
        (28, '459-79-5632'),
        (29, '607-23-1826'),
        (30, '156-66-1368'),
        (31, '562-65-7293'),
        (32, '110-49-6486'),
        (33, '780-95-7258'),
        (34, '454-68-5269'),
        (35, '797-37-2122'),
        (36, '477-79-4880'),
        (37, '262-97-3746'),
        (38, '397-31-2135'),
        (39, '841-64-5527'),
        (40, '308-54-4273'),
        (41, '708-56-0119'),
        (42, '369-01-5645'),
        (43, '133-22-6626'),
        (44, '513-33-2396'),
        (45, '321-11-8682'),
        (46, '264-07-7012'),
        (47, '107-68-2131'),
        (48, '356-99-0526'),
        (49, '352-16-1351'),
        (50, '263-25-7998'),
        (51, '553-45-2260'),
        (52, '718-68-2192'),
        (53, '417-60-3232'),
        (54, '802-73-9298'),
        (55, '824-90-8971'),
        (56, '462-41-4383'),
        (57, '887-97-6666'),
        (58, '493-93-8025'),
        (59, '137-69-8512'),
        (60, '551-44-2430'),
        (61, '337-02-4243'),
        (62, '796-53-4858'),
        (63, '291-76-4891'),
        (64, '328-51-1895'),
        (65, '437-05-7619')
;

INSERT INTO TELEFONO_PERSONA (telefono, idPersona)
    VALUES
        ('(456) 4709871', '1'),
        ('(651) 5503977', '2'),
        ('(681) 8190696', '3'),
        ('(600) 8234533', '4'),
        ('(117) 2940768', '5'),
        ('(323) 9740191', '6'),
        ('(947) 2372711', '7'),
        ('(777) 3940870', '8'),
        ('(680) 3338047', '9'),
        ('(670) 7029431', '10'),
        ('(232) 9572050', '11'),
        ('(932) 3802198', '12'),
        ('(370) 7254637', '13'),
        ('(148) 3082384', '14'),
        ('(645) 6775786', '15'),
        ('(427) 6503083', '16'),
        ('(677) 5090973', '17'),
        ('(138) 4984797', '18'),
        ('(360) 5681684', '19'),
        ('(471) 9749889', '20'),
        ('(316) 8296272', '21'),
        ('(925) 5968516', '22'),
        ('(472) 5706550', '23'),
        ('(343) 8492476', '24'),
        ('(607) 7601684', '25'),
        ('(622) 8443771', '26'),
        ('(384) 9001205', '27'),
        ('(293) 6584690', '28'),
        ('(847) 4318948', '29'),
        ('(619) 6110213', '30'),
        ('(211) 9699919', '31'),
        ('(421) 9407524', '32'),
        ('(544) 2735804', '33'),
        ('(939) 2085096', '34'),
        ('(779) 6262667', '35'),
        ('(474) 3079626', '36'),
        ('(807) 9658893', '37'),
        ('(427) 1863753', '38'),
        ('(113) 8488275', '39'),
        ('(134) 6808544', '40'),
        ('(136) 9497061', '41'),
        ('(700) 3474738', '42'),
        ('(424) 5853194', '43'),
        ('(112) 4795948', '44'),
        ('(680) 7124058', '45'),
        ('(373) 6526205', '46'),
        ('(417) 2900391', '47'),
        ('(567) 8175556', '48'),
        ('(920) 5409858', '49'),
        ('(519) 7593501', '50'),
        ('(901) 9510709', '21'), 
        ('(116) 8213089', '27'), 
        ('(784) 7138873', '17'), 
        ('(608) 8635064', '28'), 
        ('(687) 5745111', '22'), 
        ('(331) 7238025', '10'), 
        ('(222) 1686833', '30'), 
        ('(219) 9642687', '42'), 
        ('(937) 9976190', '40'), 
        ('(682) 2371391', '48'), 
        ('(699) 6409572', '33'), 
        ('(151) 5549451', '50'), 
        ('(744) 1025602', '13'), 
        ('(930) 9218814', '16'), 
        ('(287) 6786406', '35'), 
        ('(757) 3728092', '45'), 
        ('(677) 9536678', '11'), 
        ('(648) 3061646', '24'), 
        ('(210) 1857182', '4'), 
        ('(930) 6095862', '25'), 
        ('(158) 7033838', '43'), 
        ('(127) 1277456', '32'), 
        ('(915) 4967802', '1'), 
        ('(150) 8050357', '9'), 
        ('(333) 1641627', '37')
;

INSERT INTO PAIS_PERSONA (idPais, idPersona)
    VALUES
        (5, '1'),
        (1, '2'),
        (19, '3'),
        (19, '4'),
        (13, '5'),
        (18, '6'),
        (6, '7'),
        (24, '8'),
        (14, '9'),
        (5, '10'),
        (15, '11'),
        (21, '12'),
        (8, '13'),
        (22, '14'),
        (10, '15'),
        (3, '16'),
        (12, '17'),
        (5, '18'),
        (22, '19'),
        (20, '20'),
        (18, '21'),
        (16, '22'),
        (5, '23'),
        (7, '24'),
        (23, '25'),
        (13, '26'),
        (11, '27'),
        (22, '28'),
        (24, '29'),
        (4, '30'),
        (22, '31'),
        (24, '32'),
        (15, '33'),
        (12, '34'),
        (6, '35'),
        (21, '36'),
        (18, '37'),
        (12, '38'),
        (7, '39'),
        (24, '40'),
        (20, '41'),
        (1, '42'),
        (25, '43'),
        (3, '44'),
        (16, '45'),
        (11, '46'),
        (9, '47'),
        (3, '48'),
        (1, '49'),
        (19, '50'),
        (14, '34'),
        (10, '17'),
        (5, '28'),
        (10, '5'),
        (6, '18'),
        (1, '50'),
        (1, '38'),
        (2, '3'),
        (11, '19'),
        (6, '37'),
        (20, '8'),
        (7, '20'),
        (3, '29'),
        (1, '48'),
        (20, '12'),
        (22, '33'),
        (22, '30'),
        (9, '43'),
        (16, '4'),
        (7, '42'),
        (1, 51),
        (24, 52),
        (7, 53),
        (14, 54),
        (2, 55),
        (15, 56),
        (24, 57),
        (22, 58),
        (14, 59),
        (9, 60),
        (12, 61),
        (10, 62),
        (13, 63),
        (8, 64),
        (2, 65)
;

INSERT INTO AEROPUERTO(nombre, direccion, idPais)
    VALUES
        ('AeropuertoEspaña1', 'DireccionEspaña', 1),
        ('AeropuertoEspaña2', 'DireccionEspaña', 1),
        ('AeropuertoAlemania1', 'DireccionAlemania', 2),
        ('AeropuertoAlemania2', 'DireccionAlemania', 2),
        ('AeropuertoBrasil1', 'DireccionBrasil', 3),
        ('AeropuertoBrasil2', 'DireccionBrasil', 3),
        ('AeropuertoFrancia1', 'DireccionFrancia', 4),
        ('AeropuertoFrancia2', 'DireccionFrancia', 4),
        ('AeropuertoArgentina1', 'DireccionArgentina', 5),
        ('AeropuertoArgentina2', 'DireccionArgentina', 5),
        ('AeropuertoCanadá1', 'DireccionCanadá', 6),
        ('AeropuertoCanadá2', 'DireccionCanadá', 6),
        ('AeropuertoEEUU1', 'DireccionEEUU', 7),
        ('AeropuertoEEUU2', 'DireccionEEUU', 7),
        ('AeropuertoItalia1', 'DireccionItalia', 8),
        ('AeropuertoItalia2', 'DireccionItalia', 8),
        ('AeropuertoPortugal1', 'DireccionPortugal', 9),
        ('AeropuertoPortugal2', 'DireccionPortugal', 9),
        ('AeropuertoRusia1', 'DireccionRusia', 10),
        ('AeropuertoRusia2', 'DireccionRusia', 10),
        ('AeropuertoGuatemala1', 'DireccionGuatemala', 11),
        ('AeropuertoGuatemala2', 'DireccionGuatemala', 11),
        ('AeropuertoInglaterra1', 'DireccionInglaterra', 12),
        ('AeropuertoInglaterra2', 'DireccionInglaterra', 12),
        ('AeropuertoChina1', 'DireccionChina', 13),
        ('AeropuertoChina2', 'DireccionChina', 13),
        ('AeropuertoJapón1', 'DireccionJapón', 14),
        ('AeropuertoJapón2', 'DireccionJapón', 14),
        ('AeropuertoChile1', 'DireccionChile', 15),
        ('AeropuertoChile2', 'DireccionChile', 15),
        ('AeropuertoAustralia1', 'DireccionAustralia', 16),
        ('AeropuertoAustralia2', 'DireccionAustralia', 16),
        ('AeropuertoBolivia1', 'DireccionBolivia', 17),
        ('AeropuertoBolivia2', 'DireccionBolivia', 17),
        ('AeropuertoColombia1', 'DireccionColombia', 18),
        ('AeropuertoColombia2', 'DireccionColombia', 18),
        ('AeropuertoCostaRica1', 'DireccionCostaRica', 19),
        ('AeropuertoCostaRica2', 'DireccionCostaRica', 19),
        ('AeropuertoCuba1', 'DireccionCuba', 20),
        ('AeropuertoCuba2', 'DireccionCuba', 20),
        ('AeropuertoElSalvador1', 'DireccionElSalvador', 21),
        ('AeropuertoElSalvador2', 'DireccionElSalvador', 21),
        ('AeropuertoHonduras1', 'DireccionHonduras', 22),
        ('AeropuertoHonduras2', 'DireccionHonduras', 22),
        ('AeropuertoMexico1', 'DireccionMexico', 23),
        ('AeropuertoMexico2', 'DireccionMexico', 23),
        ('AeropuertoNicaragua1', 'DireccionNicaragua', 24),
        ('AeropuertoNicaragua2', 'DireccionNicaragua', 24),
        ('AeropuertoSuiza1', 'DireccionSuiza', 25),
        ('AeropuertoSuiza2', 'DireccionSuiza', 25)
;

INSERT INTO AEROPUERTO_PLAN_VUELO(puertaDefecto, hora, horaAbordaje, idAeropuerto, tipoAeropuertoPlan)
    VALUES
        ('A', '08:00', '07:00', 21, 'Salida'),
        ('C', '14:00', '00:00', 28, 'Llegada'),
        ('B', '12:00', '11:00', 45, 'Salida'),
        ('D', '23:00', '00:00', 8, 'Llegada'),
        ('A', '07:00', '06:00', 31, 'Salida'),
        ('A', '15:00', '00:00', 38, 'Llegada'),
        ('F', '11:00', '10:00', 35, 'Salida'),
        ('E', '01:00', '00:00', 5, 'Llegada'),
        ('B', '09:00', '08:00', 9, 'Salida'),
        ('F', '21:30', '00:00', 44, 'Llegada'),
        ('A', '15:00', '14:00', 20, 'Salida'),
        ('E', '18:35', '00:00', 15, 'Llegada'),
        ('B', '10:00', '09:00', 18, 'Salida'),
        ('D', '12:39', '00:00', 49, 'Llegada'),
        ('D', '11:00', '10:00', 26, 'Salida'),
        ('G', '12:45', '00:00', 27, 'Llegada'),
        ('A', '05:00', '04:00', 14, 'Salida'),
        ('C', '00:16', '00:00', 33, 'Llegada'),
        ('B', '17:00', '16:00', 22, 'Salida'),
        ('C', '19:35', '00:00', 48, 'Llegada'),
        ('C', '06:00', '05:00', 21, 'Salida'),
        ('D', '06:12', '00:00', 16, 'Llegada'),
        ('A', '06:00', '05:00', 40, 'Salida'),
        ('B', '03:00', '00:00', 46, 'Llegada'),
        ('B', '11:00', '10:00', 24, 'Salida'),
        ('D', '12:43', '00:00', 4, 'Llegada'),
        ('E', '14:00', '13:00', 42, 'Salida'),
        ('B', '19:10', '00:00', 36, 'Llegada'),
        ('A', '15:00', '14:00', 30, 'Salida'),
        ('B', '18:37', '00:00', 6, 'Llegada'),
        ('A', '05:00', '04:00', 22, 'Salida'),
        ('A', '19:44', '00:00', 12, 'Llegada')
;

INSERT INTO TIPO_AVION(nombre, descripcion, numeroTripulantes, capacidadFilas, capacidadColumnas)
    VALUES
        ('A300', '264 pasajeros', 6, 33, 8),
        ('A318', '296 pasajeros', 8, 37, 8),
        ('A320', '456 pasajeros', 10, 57, 8),
        ('A330', '480 pasajeros', 10, 60, 8),
        ('A380', '520 pasajeros', 12, 65, 8),
        ('B737-300', '168 pasajeros', 4, 28, 6),
        ('B737-800', '180 pasajeros', 6, 30, 6),
        ('B737-900', '204 pasajeros', 8, 34, 6),
        ('B767', '282 pasajeros', 10, 47, 6),
        ('B777', '324 pasajeros', 10, 54, 6)
;

INSERT INTO DISTRIBUCION_ASIENTOS(filas, columnas, idClaseVuelo, idTipoAvion)
    VALUES
        (6, 6, 1, 1),
        (6, 6, 2, 1),
        (9, 8, 3, 1),
        (12, 8, 4, 1),

        (6, 6, 1, 2),
        (7, 6, 2, 2),
        (10, 8, 3, 2),
        (14, 8, 4, 2),

        (10, 6, 1, 3),
        (12, 6, 2, 3),
        (15, 8, 3, 3),
        (20, 8, 4, 3),

        (12, 6, 1, 4),
        (12, 6, 2, 4),
        (16, 8, 3, 4),
        (20, 8, 4, 4),

        (13, 6, 1, 5),
        (13, 6, 2, 5),
        (18, 8, 3, 5),
        (21, 8, 4, 5),

        (5, 4, 1, 6),
        (6, 4, 2, 6),
        (7, 6, 3, 6),
        (10, 6, 4, 6),

        (6, 4, 1, 7),
        (6, 4, 2, 7),
        (8, 6, 3, 7),
        (10, 6, 4, 7),

        (6, 4, 1, 8),
        (6, 4, 2, 8),
        (10, 6, 3, 8),
        (12, 6, 4, 8),

        (10, 4, 1, 9),
        (10, 4, 2, 9),
        (11, 6, 3, 9),
        (16, 6, 4, 9),

        (12, 4, 1, 10),
        (12, 4, 2, 10),
        (14, 6, 3, 10),
        (16, 6, 4, 10)
;

INSERT INTO AVION(fechaAdquisicion, estado, idTipoAvion)
    VALUES
        ('2020-01-01', 'Disponible', 1),
        ('2020-01-01', 'Disponible', 2),
        ('2020-01-01', 'Disponible', 2),
        ('2020-01-01', 'Disponible', 3),
        ('2020-01-01', 'Disponible', 4),
        ('2020-01-01', 'Disponible', 5),
        ('2020-01-01', 'Disponible', 5),
        ('2020-01-01', 'Disponible', 6),
        ('2020-01-01', 'Disponible', 6),
        ('2020-01-01', 'Disponible', 7),
        ('2020-01-01', 'Disponible', 7),
        ('2020-01-01', 'Disponible', 8),
        ('2020-01-01', 'Disponible', 8),
        ('2020-01-01', 'Disponible', 9),
        ('2020-01-01', 'Disponible', 10),
        ('2020-01-01', 'Disponible', 10)
;

INSERT INTO PLAN_VUELO(distancia, idAeropuertoSalida, idAeropuertoLlegada, idTipoAvion)
    VALUES
        (7456.45, 1, 2, 10),
        (6935.74, 3, 4, 3),
        (8713.48, 5, 6, 5),
        (2785.61, 7, 8, 6),
        (3919.61, 9, 10, 8),
        (1492.53, 11, 12, 2),
        (1072.49, 13, 14, 7),
        (1893.32, 15, 16, 5),
        (4181.20, 17, 18, 8),
        (338.02, 19, 20, 6),
        (6039.73, 21, 22, 9),
        (1256.41, 23, 24, 7),
        (590.30, 25, 26, 4),
        (955.67, 27, 28, 1),
        (2593.60, 29, 30, 2),
        (2397.25, 31, 32, 10)
;


INSERT INTO DIA_PLAN_VUELO(dia, idPlanVuelo)
    VALUES
        ('Lunes', 1),
        ('Miercoles', 1),
        ('Viernes', 1),
        ('Martes', 2),
        ('Jueves', 2),
        ('Sabado', 2),
        ('Domingo', 3),
        ('Martes', 3),
        ('Sabado', 3),
        ('Domingo', 4),
        ('Miercoles', 4),
        ('Viernes', 4),
        ('Lunes', 5),
        ('Jueves', 5),
        ('Domingo', 6),
        ('Jueves', 6),
        ('Martes', 7),
        ('Jueves', 7),
        ('Sabado', 7),
        ('Lunes', 8),
        ('Miercoles', 8),
        ('Sabado', 8),
        ('Domingo', 9),
        ('Martes', 9),
        ('Jueves', 9),
        ('Lunes', 10),
        ('Martes', 10),
        ('Miercoles', 10),
        ('Jueves', 10),
        ('Martes', 11),
        ('Jueves', 11),
        ('Sabado', 11),
        ('Domingo', 12),
        ('Viernes', 12),
        ('Domingo', 13),
        ('Miercoles', 13),
        ('Viernes', 13),
        ('Lunes', 14),
        ('Martes', 14),
        ('Miercoles', 14),
        ('Martes', 15),
        ('Jueves', 15),
        ('Sabado', 15),
        ('Lunes', 16),
        ('Viernes', 16)
;

INSERT INTO
    PRECIO_DIA_PLAN_VUELO(
        precioChamaco,
        precioAdulto,
        porcentajeAumentoChamaco,
        porcentajeAumentoAdulto,
        idClaseVuelo,
        idDiaPlanVuelo
    )
    VALUES
        (1450, 1500, 0.05, 0.05, 1, 1),
        (1250, 1300, 0.05, 0.05, 2, 1),
        (1150, 1200, 0.1, 0.1, 3, 1),
        (950, 1000, 0.1, 0.1, 4, 1),
        (1450, 1500, 0.05, 0.05, 1, 2),
        (1250, 1300, 0.05, 0.05, 2, 2),
        (1150, 1200, 0.1, 0.1, 3, 2),
        (950, 1000, 0.1, 0.1, 4, 2),
        (1450, 1500, 0.05, 0.05, 1, 3),
        (1250, 1300, 0.05, 0.05, 2, 3),
        (1150, 1200, 0.1, 0.1, 3, 3),
        (950, 1000, 0.1, 0.1, 4, 3),

        (1350, 1400, 0.05, 0.05, 1, 4),
        (1150, 1200, 0.05, 0.05, 2, 4),
        (950, 1000, 0.1, 0.1, 3, 4),
        (750, 800, 0.1, 0.1, 4, 4),
        (1350, 1400, 0.05, 0.05, 1, 5),
        (1150, 1200, 0.05, 0.05, 2, 5),
        (950, 1000, 0.1, 0.1, 3, 5),
        (750, 800, 0.1, 0.1, 4, 5),
        (1350, 1400, 0.05, 0.05, 1, 6),
        (1150, 1200, 0.05, 0.05, 2, 6),
        (950, 1000, 0.1, 0.1, 3, 6),
        (750, 800, 0.1, 0.1, 4, 6),

        (1700, 1750, 0.05, 0.05, 1, 7),
        (1500, 1550, 0.05, 0.05, 2, 7),
        (1300, 1350, 0.1, 0.1, 3, 7),
        (1100, 1150, 0.1, 0.1, 4, 7),
        (1700, 1750, 0.05, 0.05, 1, 8),
        (1500, 1550, 0.05, 0.05, 2, 8),
        (1300, 1350, 0.1, 0.1, 3, 8),
        (1100, 1150, 0.1, 0.1, 4, 8),
        (1700, 1750, 0.05, 0.05, 1, 9),
        (1500, 1550, 0.05, 0.05, 2, 9),
        (1300, 1350, 0.1, 0.1, 3, 9),
        (1100, 1150, 0.1, 0.1, 4, 9),

        (510, 560, 0.05, 0.05, 1, 10),
        (450, 500, 0.05, 0.05, 2, 10),
        (390, 420, 0.1, 0.1, 3, 10),
        (340, 380, 0.1, 0.1, 4, 10),
        (510, 560, 0.05, 0.05, 1, 11),
        (450, 500, 0.05, 0.05, 2, 11),
        (390, 420, 0.1, 0.1, 3, 11),
        (340, 380, 0.1, 0.1, 4, 11),
        (510, 560, 0.05, 0.05, 1, 12),
        (450, 500, 0.05, 0.05, 2, 12),
        (390, 420, 0.1, 0.1, 3, 12),
        (340, 380, 0.1, 0.1, 4, 12),

        (740, 790, 0.05, 0.05, 1, 13),
        (690, 720, 0.05, 0.05, 2, 13),
        (630, 680, 0.1, 0.1, 3, 13),
        (590, 630, 0.1, 0.1, 4, 13),
        (740, 790, 0.05, 0.05, 1, 14),
        (690, 720, 0.05, 0.05, 2, 14),
        (630, 680, 0.1, 0.1, 3, 14),
        (590, 630, 0.1, 0.1, 4, 14),

        (400, 450, 0.05, 0.05, 1, 15),
        (380, 420, 0.05, 0.05, 2, 15),
        (350, 380, 0.1, 0.1, 3, 15),
        (300, 340, 0.1, 0.1, 4, 15),
        (400, 450, 0.05, 0.05, 1, 16),
        (380, 420, 0.05, 0.05, 2, 16),
        (350, 380, 0.1, 0.1, 3, 16),
        (300, 340, 0.1, 0.1, 4, 16),

        (215, 265, 0.05, 0.05, 1, 17),
        (200, 235, 0.05, 0.05, 2, 17),
        (190, 210, 0.1, 0.1, 3, 17),
        (180, 200, 0.1, 0.1, 4, 17),
        (215, 265, 0.05, 0.05, 1, 18),
        (200, 235, 0.05, 0.05, 2, 18),
        (190, 210, 0.1, 0.1, 3, 18),
        (180, 200, 0.1, 0.1, 4, 18),
        (215, 265, 0.05, 0.05, 1, 19),
        (200, 235, 0.05, 0.05, 2, 19),
        (190, 210, 0.1, 0.1, 3, 19),
        (180, 200, 0.1, 0.1, 4, 19),

        (380, 430, 0.05, 0.05, 1, 20),
        (370, 400, 0.05, 0.05, 2, 20),
        (350, 380, 0.1, 0.1, 3, 20),
        (330, 350, 0.1, 0.1, 4, 20),
        (380, 430, 0.05, 0.05, 1, 21),
        (370, 400, 0.05, 0.05, 2, 21),
        (350, 380, 0.1, 0.1, 3, 21),
        (330, 350, 0.1, 0.1, 4, 21),
        (380, 430, 0.05, 0.05, 1, 22),
        (370, 400, 0.05, 0.05, 2, 22),
        (350, 380, 0.1, 0.1, 3, 22),
        (330, 350, 0.1, 0.1, 4, 22),

        (840, 890, 0.05, 0.05, 1, 23),
        (810, 840, 0.05, 0.05, 2, 23),
        (790, 810, 0.1, 0.1, 3, 23),
        (770, 790, 0.1, 0.1, 4, 23),
        (840, 890, 0.05, 0.05, 1, 24),
        (810, 840, 0.05, 0.05, 2, 24),
        (790, 810, 0.1, 0.1, 3, 24),
        (770, 790, 0.1, 0.1, 4, 24),
        (840, 890, 0.05, 0.05, 1, 25),
        (810, 840, 0.05, 0.05, 2, 25),
        (790, 810, 0.1, 0.1, 3, 25),
        (770, 790, 0.1, 0.1, 4, 25),

        (145, 160, 0.05, 0.05, 1, 26),
        (125, 145, 0.05, 0.05, 2, 26),
        (110, 125, 0.1, 0.1, 3, 26),
        (85, 100, 0.1, 0.1, 4, 26),
        (145, 160, 0.05, 0.05, 1, 27),
        (125, 145, 0.05, 0.05, 2, 27),
        (110, 125, 0.1, 0.1, 3, 27),
        (85, 100, 0.1, 0.1, 4, 27),
        (145, 160, 0.05, 0.05, 1, 28),
        (125, 145, 0.05, 0.05, 2, 28),
        (110, 125, 0.1, 0.1, 3, 28),
        (85, 100, 0.1, 0.1, 4, 28),
        (145, 160, 0.05, 0.05, 1, 29),
        (125, 145, 0.05, 0.05, 2, 29),
        (110, 125, 0.1, 0.1, 3, 29),
        (85, 100, 0.1, 0.1, 4, 29),

        (1215, 1300, 0.05, 0.05, 1, 30),
        (1120, 1200, 0.05, 0.05, 2, 30),
        (1000, 1100, 0.1, 0.1, 3, 30),
        (985, 1000, 0.1, 0.1, 4, 30),
        (1215, 1300, 0.05, 0.05, 1, 31),
        (1120, 1200, 0.05, 0.05, 2, 31),
        (1000, 1100, 0.1, 0.1, 3, 31),
        (985, 1000, 0.1, 0.1, 4, 31),
        (1215, 1300, 0.05, 0.05, 1, 32),
        (1120, 1200, 0.05, 0.05, 2, 32),
        (1000, 1100, 0.1, 0.1, 3, 32),
        (985, 1000, 0.1, 0.1, 4, 32),

        (250, 275, 0.05, 0.05, 1, 33),
        (225, 250, 0.05, 0.05, 2, 33),
        (210, 230, 0.1, 0.1, 3, 33),
        (195, 210, 0.1, 0.1, 4, 33),
        (250, 275, 0.05, 0.05, 1, 34),
        (225, 250, 0.05, 0.05, 2, 34),
        (210, 230, 0.1, 0.1, 3, 34),
        (195, 210, 0.1, 0.1, 4, 34),

        (140, 160, 0.05, 0.05, 1, 35),
        (120, 140, 0.05, 0.05, 2, 35),
        (105, 125, 0.1, 0.1, 3, 35),
        (100, 110, 0.1, 0.1, 4, 35),
        (140, 160, 0.05, 0.05, 1, 36),
        (120, 140, 0.05, 0.05, 2, 36),
        (105, 125, 0.1, 0.1, 3, 36),
        (100, 110, 0.1, 0.1, 4, 36),
        (140, 160, 0.05, 0.05, 1, 37),
        (120, 140, 0.05, 0.05, 2, 37),
        (105, 125, 0.1, 0.1, 3, 37),
        (100, 110, 0.1, 0.1, 4, 37),

        (230, 240, 0.05, 0.05, 1, 38),
        (205, 225, 0.05, 0.05, 2, 38),
        (190, 210, 0.1, 0.1, 3, 38),
        (180, 200, 0.1, 0.1, 4, 38),
        (230, 240, 0.05, 0.05, 1, 39),
        (205, 225, 0.05, 0.05, 2, 39),
        (190, 210, 0.1, 0.1, 3, 39),
        (180, 200, 0.1, 0.1, 4, 39),
        (230, 240, 0.05, 0.05, 1, 40),
        (205, 225, 0.05, 0.05, 2, 40),
        (190, 210, 0.1, 0.1, 3, 40),
        (180, 200, 0.1, 0.1, 4, 40),

        (515, 530, 0.05, 0.05, 1, 41),
        (490, 510, 0.05, 0.05, 2, 41),
        (475, 495, 0.1, 0.1, 3, 41),
        (455, 475, 0.1, 0.1, 4, 41),
        (515, 530, 0.05, 0.05, 1, 42),
        (490, 510, 0.05, 0.05, 2, 42),
        (475, 495, 0.1, 0.1, 3, 42),
        (455, 475, 0.1, 0.1, 4, 42),
        (515, 530, 0.05, 0.05, 1, 43),
        (490, 510, 0.05, 0.05, 2, 43),
        (475, 495, 0.1, 0.1, 3, 43),
        (455, 475, 0.1, 0.1, 4, 43),

        (490, 510, 0.05, 0.05, 1, 44),
        (475, 490, 0.05, 0.05, 2, 44),
        (435, 450, 0.1, 0.1, 3, 44),
        (390, 415, 0.1, 0.1, 4, 44),
        (490, 510, 0.05, 0.05, 1, 45),
        (475, 490, 0.05, 0.05, 2, 45),
        (435, 450, 0.1, 0.1, 3, 45),
        (390, 415, 0.1, 0.1, 4, 45)
;

INSERT INTO VUELO(estadoActual, fecha, idDiaPlanVuelo, idAvion)
    VALUES
        ('Agendado', '2022-03-07', 1, 15), -- Normal
        ('Agendado', '2022-03-16', 2, 15), -- Retrasado
        ('Agendado', '2022-03-25', 3, 16), -- Normal
        ('Agendado', '2022-03-22', 14, 12), -- Normal
        ('Agendado', '2022-03-24', 14, 13), -- Normal
        ('Agendado', '2022-04-10', 15, 2), -- Normal
        ('Agendado', '2022-04-14', 16, 3), -- Retrasado
        ('Agendado', '2022-04-17', 35, 5), -- Normal
        ('Agendado', '2022-04-24', 35, 5), -- Cancelado
        ('Agendado', '2022-04-29', 37, 5) -- Cancelado
;

UPDATE VUELO SET estadoActual='Cancelado' WHERE idVuelo=10;
UPDATE VUELO SET estadoActual='Cancelado' WHERE idVuelo=9;
UPDATE HIST_ESTADO_VUELO SET fechaHora='2022-04-30 22:47:21.987186' WHERE idHistEstadoVuelo=12;

INSERT INTO COMPRA(fechaHora, idPersona)
    VALUES
        (NOW(), 21),    
        (NOW(), 22),    
        (NOW(), 23),    
        (NOW(), 24),    
        (NOW(), 25),    
        (NOW(), 46),    
        (NOW(), 47),    
        (NOW(), 48),    
        (NOW(), 49),    
        (NOW(), 50)    
;

------------COMPRA 1----------------------------------------
INSERT INTO
    BOLETO(
        dia,
        fechaHora,
        costoAseguranza,
        descuento,
        isIdaVuelta,
        precio,
        estadoBoleto,
        idCompra,
        idClaseVuelo,
        idPersona,
        idAsiento,
        idVuelo
    )
    VALUES
        (getDiaByVuelo(1), NOW(), 0, 0, false, getPrecio(1, 1, 26), 'Vendido', 1, 1, 26, 3767, 1),
        (getDiaByVuelo(1), NOW(), 0, 0, false, getPrecio(1, 1, 27), 'Vendido', 1, 1, 27, 3768, 1),
        (getDiaByVuelo(1), NOW(), 0, 0, false, getPrecio(1, 1, 28), 'Vendido', 1, 1, 28, 3769, 1),
        (getDiaByVuelo(1), NOW(), 0, 0, false, getPrecio(1, 1, 29), 'Vendido', 1, 1, 29, 3770, 1),
        (getDiaByVuelo(1), NOW(), 0, 0, false, getPrecio(1, 1, 30), 'Vendido', 1, 1, 30, 3771, 1),
        (getDiaByVuelo(1), NOW(), 0, 0, false, getPrecio(1, 1, 31), 'Vendido', 1, 1, 31, 3772, 1),
        (getDiaByVuelo(1), NOW(), 0, 0, false, getPrecio(1, 1, 32), 'Vendido', 1, 1, 32, 3773, 1),
        (getDiaByVuelo(1), NOW(), 0, 0, false, getPrecio(1, 1, 33), 'Vendido', 1, 1, 33, 3774, 1),
        (getDiaByVuelo(1), NOW(), 0, 0, false, getPrecio(1, 1, 34), 'Vendido', 1, 1, 34, 3775, 1),
        (getDiaByVuelo(1), NOW(), 0, 0, false, getPrecio(1, 1, 35), 'Vendido', 1, 1, 35, 3776, 1),
        (getDiaByVuelo(1), NOW(), 0, 0, false, getPrecio(1, 1, 36), 'Vendido', 1, 1, 36, 3777, 1),
        (getDiaByVuelo(1), NOW(), 0, 0, false, getPrecio(1, 1, 37), 'Vendido', 1, 1, 37, 3778, 1),
        (getDiaByVuelo(1), NOW(), 0, 0, false, getPrecio(1, 1, 38), 'Vendido', 1, 1, 38, 3779, 1),
        (getDiaByVuelo(1), NOW(), 0, 0, false, getPrecio(1, 1, 39), 'Vendido', 1, 1, 39, 3780, 1),
        (getDiaByVuelo(1), NOW(), 0, 0, false, getPrecio(1, 1, 40), 'Vendido', 1, 1, 40, 3781, 1)
;

UPDATE COMPRA SET estado='Facturada' WHERE idCompra=1;
INSERT INTO DETALLE_PAGO(porcentajePagado, idCompra, idTipoPago) VALUES(1, 1, 1);

UPDATE VUELO SET estadoActual='Preparando' WHERE idVuelo=1;
UPDATE VUELO SET estadoActual='Abordaje' WHERE idVuelo=1;
UPDATE VUELO SET estadoActual='Despegue' WHERE idVuelo=1;
UPDATE VUELO SET estadoActual='En vuelo' WHERE idVuelo=1;
UPDATE VUELO SET estadoActual='Aterrizaje' WHERE idVuelo=1;
UPDATE VUELO SET estadoActual='Desbordaje' WHERE idVuelo=1;
UPDATE VUELO SET estadoActual='Finalizado' WHERE idVuelo=1;

------------COMPRA 2----------------------------------------
INSERT INTO
    BOLETO(
        dia,
        fechaHora,
        costoAseguranza,
        descuento,
        isIdaVuelta,
        precio,
        estadoBoleto,
        idCompra,
        idClaseVuelo,
        idPersona,
        idAsiento,
        idVuelo
    )
    VALUES
        (getDiaByVuelo(2), NOW(), 0, 0, false, getPrecio(2, 1, 26), 'Vendido', 2, 1, 26, 3767, 2),
        (getDiaByVuelo(2), NOW(), 0, 0, false, getPrecio(2, 1, 27), 'Vendido', 2, 1, 27, 3768, 2),
        (getDiaByVuelo(2), NOW(), 0, 0, false, getPrecio(2, 1, 28), 'Vendido', 2, 1, 28, 3769, 2),
        (getDiaByVuelo(2), NOW(), 0, 0, false, getPrecio(2, 1, 29), 'Vendido', 2, 1, 29, 3770, 2),
        (getDiaByVuelo(2), NOW(), 0, 0, false, getPrecio(2, 1, 30), 'Vendido', 2, 1, 30, 3771, 2),
        (getDiaByVuelo(2), NOW(), 0, 0, false, getPrecio(2, 1, 31), 'Vendido', 2, 1, 31, 3772, 2),
        (getDiaByVuelo(2), NOW(), 0, 0, false, getPrecio(2, 1, 32), 'Vendido', 2, 1, 32, 3773, 2),
        (getDiaByVuelo(2), NOW(), 0, 0, false, getPrecio(2, 1, 33), 'Vendido', 2, 1, 33, 3774, 2),
        (getDiaByVuelo(2), NOW(), 0, 0, false, getPrecio(2, 1, 34), 'Vendido', 2, 1, 34, 3775, 2),
        (getDiaByVuelo(2), NOW(), 0, 0, false, getPrecio(2, 1, 35), 'Vendido', 2, 1, 35, 3776, 2),
        (getDiaByVuelo(2), NOW(), 0, 0, false, getPrecio(2, 1, 36), 'Vendido', 2, 1, 36, 3777, 2),
        (getDiaByVuelo(2), NOW(), 0, 0, false, getPrecio(2, 1, 37), 'Vendido', 2, 1, 37, 3778, 2),
        (getDiaByVuelo(2), NOW(), 0, 0, false, getPrecio(2, 1, 38), 'Vendido', 2, 1, 38, 3779, 2),
        (getDiaByVuelo(2), NOW(), 0, 0, false, getPrecio(2, 1, 39), 'Vendido', 2, 1, 39, 3780, 2),
        (getDiaByVuelo(2), NOW(), 0, 0, false, getPrecio(2, 1, 40), 'Vendido', 2, 1, 40, 3781, 2)
;

UPDATE COMPRA SET estado='Facturada' WHERE idCompra=2;
INSERT INTO DETALLE_PAGO(porcentajePagado, idCompra, idTipoPago) VALUES(1, 2, 1);

UPDATE VUELO SET estadoActual='Preparando' WHERE idVuelo=2;
UPDATE VUELO SET estadoActual='Abordaje' WHERE idVuelo=2;
UPDATE VUELO SET estadoActual='Retrasado' WHERE idVuelo=2;
UPDATE VUELO SET estadoActual='Despegue' WHERE idVuelo=2;
UPDATE VUELO SET estadoActual='En vuelo' WHERE idVuelo=2;
UPDATE VUELO SET estadoActual='Aterrizaje' WHERE idVuelo=2;
UPDATE VUELO SET estadoActual='Desbordaje' WHERE idVuelo=2;
UPDATE VUELO SET estadoActual='Finalizado' WHERE idVuelo=2;

------------COMPRA 3----------------------------------------
INSERT INTO
    BOLETO(
        dia,
        fechaHora,
        costoAseguranza,
        descuento,
        isIdaVuelta,
        precio,
        estadoBoleto,
        idCompra,
        idClaseVuelo,
        idPersona,
        idAsiento,
        idVuelo
    )
    VALUES
        (getDiaByVuelo(3), NOW(), 0, 0, false, getPrecio(3, 1, 26), 'Vendido', 3, 1, 26, 4043, 3),
        (getDiaByVuelo(3), NOW(), 0, 0, false, getPrecio(3, 1, 27), 'Vendido', 3, 1, 27, 4044, 3),
        (getDiaByVuelo(3), NOW(), 0, 0, false, getPrecio(3, 1, 28), 'Vendido', 3, 1, 28, 4045, 3),
        (getDiaByVuelo(3), NOW(), 0, 0, false, getPrecio(3, 1, 29), 'Vendido', 3, 1, 29, 4046, 3),
        (getDiaByVuelo(3), NOW(), 0, 0, false, getPrecio(3, 1, 30), 'Vendido', 3, 1, 30, 4047, 3),
        (getDiaByVuelo(3), NOW(), 0, 0, false, getPrecio(3, 1, 31), 'Vendido', 3, 1, 31, 4048, 3),
        (getDiaByVuelo(3), NOW(), 0, 0, false, getPrecio(3, 1, 32), 'Vendido', 3, 1, 32, 4049, 3),
        (getDiaByVuelo(3), NOW(), 0, 0, false, getPrecio(3, 1, 33), 'Vendido', 3, 1, 33, 4050, 3),
        (getDiaByVuelo(3), NOW(), 0, 0, false, getPrecio(3, 1, 34), 'Vendido', 3, 1, 34, 4051, 3),
        (getDiaByVuelo(3), NOW(), 0, 0, false, getPrecio(3, 1, 35), 'Vendido', 3, 1, 35, 4052, 3),
        (getDiaByVuelo(3), NOW(), 0, 0, false, getPrecio(3, 1, 36), 'Vendido', 3, 1, 36, 4053, 3),
        (getDiaByVuelo(3), NOW(), 0, 0, false, getPrecio(3, 1, 37), 'Vendido', 3, 1, 37, 4054, 3),
        (getDiaByVuelo(3), NOW(), 0, 0, false, getPrecio(3, 1, 38), 'Vendido', 3, 1, 38, 4055, 3),
        (getDiaByVuelo(3), NOW(), 0, 0, false, getPrecio(3, 1, 39), 'Vendido', 3, 1, 39, 4056, 3),
        (getDiaByVuelo(3), NOW(), 0, 0, false, getPrecio(3, 1, 40), 'Vendido', 3, 1, 40, 4057, 3)
;

UPDATE COMPRA SET estado='Facturada' WHERE idCompra=3;
INSERT INTO DETALLE_PAGO(porcentajePagado, idCompra, idTipoPago) VALUES(1, 3, 1);

UPDATE VUELO SET estadoActual='Preparando' WHERE idVuelo=3;
UPDATE VUELO SET estadoActual='Abordaje' WHERE idVuelo=3;
UPDATE VUELO SET estadoActual='Despegue' WHERE idVuelo=3;
UPDATE VUELO SET estadoActual='En vuelo' WHERE idVuelo=3;
UPDATE VUELO SET estadoActual='Aterrizaje' WHERE idVuelo=3;
UPDATE VUELO SET estadoActual='Desbordaje' WHERE idVuelo=3;
UPDATE VUELO SET estadoActual='Finalizado' WHERE idVuelo=3;

------------COMPRA 4----------------------------------------
INSERT INTO
    BOLETO(
        dia,
        fechaHora,
        costoAseguranza,
        descuento,
        isIdaVuelta,
        precio,
        estadoBoleto,
        idCompra,
        idClaseVuelo,
        idPersona,
        idAsiento,
        idVuelo
    )
    VALUES
        (getDiaByVuelo(4), NOW(), 0, 0, false, getPrecio(4, 1, 26), 'Vendido', 4, 1, 26, 3165, 4),
        (getDiaByVuelo(4), NOW(), 0, 0, false, getPrecio(4, 1, 27), 'Vendido', 4, 1, 27, 3166, 4),
        (getDiaByVuelo(4), NOW(), 0, 0, false, getPrecio(4, 1, 28), 'Vendido', 4, 1, 28, 3167, 4),
        (getDiaByVuelo(4), NOW(), 0, 0, false, getPrecio(4, 1, 29), 'Vendido', 4, 1, 29, 3168, 4),
        (getDiaByVuelo(4), NOW(), 0, 0, false, getPrecio(4, 1, 30), 'Vendido', 4, 1, 30, 3169, 4),
        (getDiaByVuelo(4), NOW(), 0, 0, false, getPrecio(4, 1, 31), 'Vendido', 4, 1, 31, 3170, 4),
        (getDiaByVuelo(4), NOW(), 0, 0, false, getPrecio(4, 1, 32), 'Vendido', 4, 1, 32, 3171, 4),
        (getDiaByVuelo(4), NOW(), 0, 0, false, getPrecio(4, 1, 33), 'Vendido', 4, 1, 33, 3172, 4),
        (getDiaByVuelo(4), NOW(), 0, 0, false, getPrecio(4, 1, 34), 'Vendido', 4, 1, 34, 3173, 4),
        (getDiaByVuelo(4), NOW(), 0, 0, false, getPrecio(4, 1, 35), 'Vendido', 4, 1, 35, 3174, 4),
        (getDiaByVuelo(4), NOW(), 0, 0, false, getPrecio(4, 1, 36), 'Vendido', 4, 1, 36, 3175, 4),
        (getDiaByVuelo(4), NOW(), 0, 0, false, getPrecio(4, 1, 37), 'Vendido', 4, 1, 37, 3176, 4),
        (getDiaByVuelo(4), NOW(), 0, 0, false, getPrecio(4, 1, 38), 'Vendido', 4, 1, 38, 3177, 4),
        (getDiaByVuelo(4), NOW(), 0, 0, false, getPrecio(4, 1, 39), 'Vendido', 4, 1, 39, 3178, 4),
        (getDiaByVuelo(4), NOW(), 0, 0, false, getPrecio(4, 1, 40), 'Vendido', 4, 1, 40, 3179, 4)
;

UPDATE COMPRA SET estado='Facturada' WHERE idCompra=4;
INSERT INTO DETALLE_PAGO(porcentajePagado, idCompra, idTipoPago) VALUES(1, 4, 1);

UPDATE VUELO SET estadoActual='Preparando' WHERE idVuelo=4;
UPDATE VUELO SET estadoActual='Abordaje' WHERE idVuelo=4;
UPDATE VUELO SET estadoActual='Despegue' WHERE idVuelo=4;
UPDATE VUELO SET estadoActual='En vuelo' WHERE idVuelo=4;
UPDATE VUELO SET estadoActual='Aterrizaje' WHERE idVuelo=4;
UPDATE VUELO SET estadoActual='Desbordaje' WHERE idVuelo=4;
UPDATE VUELO SET estadoActual='Finalizado' WHERE idVuelo=4;

------------COMPRA 5----------------------------------------
INSERT INTO
    BOLETO(
        dia,
        fechaHora,
        costoAseguranza,
        descuento,
        isIdaVuelta,
        precio,
        estadoBoleto,
        idCompra,
        idClaseVuelo,
        idPersona,
        idAsiento,
        idVuelo
    )
    VALUES
        (getDiaByVuelo(5), NOW(), 0, 0, false, getPrecio(5, 1, 26), 'Vendido', 5, 1, 26, 3345, 5),
        (getDiaByVuelo(5), NOW(), 0, 0, false, getPrecio(5, 1, 27), 'Vendido', 5, 1, 27, 3346, 5),
        (getDiaByVuelo(5), NOW(), 0, 0, false, getPrecio(5, 1, 28), 'Vendido', 5, 1, 28, 3347, 5),
        (getDiaByVuelo(5), NOW(), 0, 0, false, getPrecio(5, 1, 29), 'Vendido', 5, 1, 29, 3348, 5),
        (getDiaByVuelo(5), NOW(), 0, 0, false, getPrecio(5, 1, 30), 'Vendido', 5, 1, 30, 3349, 5),
        (getDiaByVuelo(5), NOW(), 0, 0, false, getPrecio(5, 1, 31), 'Vendido', 5, 1, 31, 3350, 5),
        (getDiaByVuelo(5), NOW(), 0, 0, false, getPrecio(5, 1, 32), 'Vendido', 5, 1, 32, 3351, 5),
        (getDiaByVuelo(5), NOW(), 0, 0, false, getPrecio(5, 1, 33), 'Vendido', 5, 1, 33, 3352, 5),
        (getDiaByVuelo(5), NOW(), 0, 0, false, getPrecio(5, 1, 34), 'Vendido', 5, 1, 34, 3353, 5),
        (getDiaByVuelo(5), NOW(), 0, 0, false, getPrecio(5, 1, 35), 'Vendido', 5, 1, 35, 3354, 5),
        (getDiaByVuelo(5), NOW(), 0, 0, false, getPrecio(5, 1, 36), 'Vendido', 5, 1, 36, 3355, 5),
        (getDiaByVuelo(5), NOW(), 0, 0, false, getPrecio(5, 1, 37), 'Vendido', 5, 1, 37, 3356, 5),
        (getDiaByVuelo(5), NOW(), 0, 0, false, getPrecio(5, 1, 38), 'Vendido', 5, 1, 38, 3357, 5),
        (getDiaByVuelo(5), NOW(), 0, 0, false, getPrecio(5, 1, 39), 'Vendido', 5, 1, 39, 3358, 5),
        (getDiaByVuelo(5), NOW(), 0, 0, false, getPrecio(5, 1, 40), 'Vendido', 5, 1, 40, 3359, 5)
;

UPDATE COMPRA SET estado='Facturada' WHERE idCompra=5;
INSERT INTO DETALLE_PAGO(porcentajePagado, idCompra, idTipoPago) VALUES(1, 5, 1);

UPDATE VUELO SET estadoActual='Preparando' WHERE idVuelo=5;
UPDATE VUELO SET estadoActual='Abordaje' WHERE idVuelo=5;
UPDATE VUELO SET estadoActual='Despegue' WHERE idVuelo=5;
UPDATE VUELO SET estadoActual='En vuelo' WHERE idVuelo=5;
UPDATE VUELO SET estadoActual='Aterrizaje' WHERE idVuelo=5;
UPDATE VUELO SET estadoActual='Desbordaje' WHERE idVuelo=5;
UPDATE VUELO SET estadoActual='Finalizado' WHERE idVuelo=5;

------------COMPRA 6----------------------------------------
INSERT INTO
    BOLETO(
        dia,
        fechaHora,
        costoAseguranza,
        descuento,
        isIdaVuelta,
        precio,
        estadoBoleto,
        idCompra,
        idClaseVuelo,
        idPersona,
        idAsiento,
        idVuelo
    )
    VALUES
        (getDiaByVuelo(6), NOW(), 0, 0, false, getPrecio(6, 1, 26), 'Vendido', 6, 1, 26, 241, 6),
        (getDiaByVuelo(6), NOW(), 0, 0, false, getPrecio(6, 1, 27), 'Vendido', 6, 1, 27, 242, 6),
        (getDiaByVuelo(6), NOW(), 0, 0, false, getPrecio(6, 1, 28), 'Vendido', 6, 1, 28, 243, 6),
        (getDiaByVuelo(6), NOW(), 0, 0, false, getPrecio(6, 1, 29), 'Vendido', 6, 1, 29, 244, 6),
        (getDiaByVuelo(6), NOW(), 0, 0, false, getPrecio(6, 1, 40), 'Vendido', 6, 1, 40, 245, 6),
        (getDiaByVuelo(6), NOW(), 0, 0, false, getPrecio(6, 1, 41), 'Vendido', 6, 1, 41, 246, 6),
        (getDiaByVuelo(6), NOW(), 0, 0, false, getPrecio(6, 1, 42), 'Vendido', 6, 1, 42, 247, 6),
        (getDiaByVuelo(6), NOW(), 0, 0, false, getPrecio(6, 1, 43), 'Vendido', 6, 1, 43, 248, 6),
        (getDiaByVuelo(6), NOW(), 0, 0, false, getPrecio(6, 1, 44), 'Vendido', 6, 1, 44, 249, 6),
        (getDiaByVuelo(6), NOW(), 0, 0, false, getPrecio(6, 1, 45), 'Vendido', 6, 1, 45, 250, 6),
        (getDiaByVuelo(6), NOW(), 0, 0, false, getPrecio(6, 1, 46), 'Vendido', 6, 1, 46, 251, 6),
        (getDiaByVuelo(6), NOW(), 0, 0, false, getPrecio(6, 1, 47), 'Vendido', 6, 1, 47, 252, 6),
        (getDiaByVuelo(6), NOW(), 0, 0, false, getPrecio(6, 1, 48), 'Vendido', 6, 1, 48, 253, 6),
        (getDiaByVuelo(6), NOW(), 0, 0, false, getPrecio(6, 1, 49), 'Vendido', 6, 1, 49, 254, 6),
        (getDiaByVuelo(6), NOW(), 0, 0, false, getPrecio(6, 1, 50), 'Vendido', 6, 1, 50, 255, 6)
;

UPDATE COMPRA SET estado='Facturada' WHERE idCompra=6;
INSERT INTO DETALLE_PAGO(porcentajePagado, idCompra, idTipoPago) VALUES(1, 6, 1);

UPDATE VUELO SET estadoActual='Preparando' WHERE idVuelo=6;
UPDATE VUELO SET estadoActual='Abordaje' WHERE idVuelo=6;
UPDATE VUELO SET estadoActual='Despegue' WHERE idVuelo=6;
UPDATE VUELO SET estadoActual='En vuelo' WHERE idVuelo=6;
UPDATE VUELO SET estadoActual='Aterrizaje' WHERE idVuelo=6;
UPDATE VUELO SET estadoActual='Desbordaje' WHERE idVuelo=6;
UPDATE VUELO SET estadoActual='Finalizado' WHERE idVuelo=6;

------------COMPRA 7----------------------------------------
INSERT INTO
    BOLETO(
        dia,
        fechaHora,
        costoAseguranza,
        descuento,
        isIdaVuelta,
        precio,
        estadoBoleto,
        idCompra,
        idClaseVuelo,
        idPersona,
        idAsiento,
        idVuelo
    )
    VALUES
        (getDiaByVuelo(7), NOW(), 0, 0, false, getPrecio(7, 1, 26), 'Vendido', 7, 1, 26, 511, 7),
        (getDiaByVuelo(7), NOW(), 0, 0, false, getPrecio(7, 1, 27), 'Vendido', 7, 1, 27, 512, 7),
        (getDiaByVuelo(7), NOW(), 0, 0, false, getPrecio(7, 1, 28), 'Vendido', 7, 1, 28, 513, 7),
        (getDiaByVuelo(7), NOW(), 0, 0, false, getPrecio(7, 1, 29), 'Vendido', 7, 1, 29, 514, 7),
        (getDiaByVuelo(7), NOW(), 0, 0, false, getPrecio(7, 1, 40), 'Vendido', 7, 1, 40, 515, 7),
        (getDiaByVuelo(7), NOW(), 0, 0, false, getPrecio(7, 1, 41), 'Vendido', 7, 1, 41, 516, 7),
        (getDiaByVuelo(7), NOW(), 0, 0, false, getPrecio(7, 1, 42), 'Vendido', 7, 1, 42, 517, 7),
        (getDiaByVuelo(7), NOW(), 0, 0, false, getPrecio(7, 1, 43), 'Vendido', 7, 1, 43, 518, 7),
        (getDiaByVuelo(7), NOW(), 0, 0, false, getPrecio(7, 1, 44), 'Vendido', 7, 1, 44, 519, 7),
        (getDiaByVuelo(7), NOW(), 0, 0, false, getPrecio(7, 1, 45), 'Vendido', 7, 1, 45, 520, 7),
        (getDiaByVuelo(7), NOW(), 0, 0, false, getPrecio(7, 1, 46), 'Vendido', 7, 1, 46, 522, 7),
        (getDiaByVuelo(7), NOW(), 0, 0, false, getPrecio(7, 1, 47), 'Vendido', 7, 1, 47, 523, 7),
        (getDiaByVuelo(7), NOW(), 0, 0, false, getPrecio(7, 1, 48), 'Vendido', 7, 1, 48, 524, 7),
        (getDiaByVuelo(7), NOW(), 0, 0, false, getPrecio(7, 1, 49), 'Vendido', 7, 1, 49, 525, 7),
        (getDiaByVuelo(7), NOW(), 0, 0, false, getPrecio(7, 1, 50), 'Vendido', 7, 1, 50, 521, 7)
;

UPDATE COMPRA SET estado='Facturada' WHERE idCompra=7;
INSERT INTO DETALLE_PAGO(porcentajePagado, idCompra, idTipoPago) VALUES(1, 7, 1);

UPDATE VUELO SET estadoActual='Preparando' WHERE idVuelo=7;
UPDATE VUELO SET estadoActual='Abordaje' WHERE idVuelo=7;
UPDATE VUELO SET estadoActual='Retrasado' WHERE idVuelo=7;
UPDATE VUELO SET estadoActual='Despegue' WHERE idVuelo=7;
UPDATE VUELO SET estadoActual='En vuelo' WHERE idVuelo=7;
UPDATE VUELO SET estadoActual='Aterrizaje' WHERE idVuelo=7;
UPDATE VUELO SET estadoActual='Desbordaje' WHERE idVuelo=7;
UPDATE VUELO SET estadoActual='Finalizado' WHERE idVuelo=7;

------------COMPRA 8----------------------------------------
INSERT INTO
    BOLETO(
        dia,
        fechaHora,
        costoAseguranza,
        descuento,
        isIdaVuelta,
        precio,
        estadoBoleto,
        idCompra,
        idClaseVuelo,
        idPersona,
        idAsiento,
        idVuelo
    )
    VALUES
        (getDiaByVuelo(8), NOW(), 0, 0, false, getPrecio(8, 1, 26), 'Vendido', 8, 1, 26, 1193, 8),
        (getDiaByVuelo(8), NOW(), 0, 0, false, getPrecio(8, 1, 27), 'Vendido', 8, 1, 27, 1194, 8),
        (getDiaByVuelo(8), NOW(), 0, 0, false, getPrecio(8, 1, 28), 'Vendido', 8, 1, 28, 1195, 8),
        (getDiaByVuelo(8), NOW(), 0, 0, false, getPrecio(8, 1, 29), 'Vendido', 8, 1, 29, 1196, 8),
        (getDiaByVuelo(8), NOW(), 0, 0, false, getPrecio(8, 1, 40), 'Vendido', 8, 1, 40, 1197, 8),
        (getDiaByVuelo(8), NOW(), 0, 0, false, getPrecio(8, 1, 41), 'Vendido', 8, 1, 41, 1198, 8),
        (getDiaByVuelo(8), NOW(), 0, 0, false, getPrecio(8, 1, 42), 'Vendido', 8, 1, 42, 1199, 8),
        (getDiaByVuelo(8), NOW(), 0, 0, false, getPrecio(8, 1, 43), 'Vendido', 8, 1, 43, 1200, 8),
        (getDiaByVuelo(8), NOW(), 0, 0, false, getPrecio(8, 1, 44), 'Vendido', 8, 1, 44, 1201, 8),
        (getDiaByVuelo(8), NOW(), 0, 0, false, getPrecio(8, 1, 45), 'Vendido', 8, 1, 45, 1202, 8),
        (getDiaByVuelo(8), NOW(), 0, 0, false, getPrecio(8, 1, 46), 'Vendido', 8, 1, 46, 1204, 8),
        (getDiaByVuelo(8), NOW(), 0, 0, false, getPrecio(8, 1, 47), 'Vendido', 8, 1, 47, 1205, 8),
        (getDiaByVuelo(8), NOW(), 0, 0, false, getPrecio(8, 1, 48), 'Vendido', 8, 1, 48, 1206, 8),
        (getDiaByVuelo(8), NOW(), 0, 0, false, getPrecio(8, 1, 49), 'Vendido', 8, 1, 49, 1207, 8),
        (getDiaByVuelo(8), NOW(), 0, 0, false, getPrecio(8, 1, 50), 'Vendido', 8, 1, 50, 1203, 8)
;

UPDATE COMPRA SET estado='Facturada' WHERE idCompra=8;
INSERT INTO DETALLE_PAGO(porcentajePagado, idCompra, idTipoPago) VALUES(1, 8, 1);

UPDATE VUELO SET estadoActual='Preparando' WHERE idVuelo=8;
UPDATE VUELO SET estadoActual='Abordaje' WHERE idVuelo=8;
UPDATE VUELO SET estadoActual='Despegue' WHERE idVuelo=8;
UPDATE VUELO SET estadoActual='En vuelo' WHERE idVuelo=8;
UPDATE VUELO SET estadoActual='Aterrizaje' WHERE idVuelo=8;
UPDATE VUELO SET estadoActual='Desbordaje' WHERE idVuelo=8;
UPDATE VUELO SET estadoActual='Finalizado' WHERE idVuelo=8;


