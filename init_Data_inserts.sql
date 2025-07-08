-- Desactivar triggers de auditoría e IDs
ALTER TABLE categoria DISABLE TRIGGER trigger_categoria_auditoria;
ALTER TABLE carta DISABLE TRIGGER trigger_carta_auditoria;
ALTER TABLE plato DISABLE TRIGGER trigger_plato_auditoria;
ALTER TABLE region DISABLE TRIGGER trigger_region_auditoria;
ALTER TABLE usuario DISABLE TRIGGER trigger_usuario_auditoria;
ALTER TABLE ingrediente DISABLE TRIGGER trigger_ingrediente_auditoria;
ALTER TABLE venta DISABLE TRIGGER trigger_venta_auditoria;

-- Desactivar triggers de generación de IDs
ALTER TABLE carta DISABLE TRIGGER trigger_id_carta;
ALTER TABLE venta DISABLE TRIGGER trigger_generar_id_venta;
ALTER TABLE region DISABLE TRIGGER trigger_generar_id_region;



--
-- Data for Name: carta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.carta VALUES ('CARTA-202507-0001', 'come contento', '2025-07-02', '2025-07-04');
INSERT INTO public.carta VALUES ('CARTA-202507-0002', 'Ven y se contento', '2025-07-06', '2025-07-07');


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categoria VALUES (1, 'sopa');
INSERT INTO public.categoria VALUES (2, 'envuelto');
INSERT INTO public.categoria VALUES (3, 'caldo');
INSERT INTO public.categoria VALUES (4, 'típico');
INSERT INTO public.categoria VALUES (5, 'crema');
INSERT INTO public.categoria VALUES (6, 'pescado');
INSERT INTO public.categoria VALUES (7, 'embutido');
INSERT INTO public.categoria VALUES (8, 'bollos');
INSERT INTO public.categoria VALUES (9, 'mariscos');
INSERT INTO public.categoria VALUES (10, 'proteína');
INSERT INTO public.categoria VALUES (11, 'tortilla');
INSERT INTO public.categoria VALUES (12, 'tamal');
INSERT INTO public.categoria VALUES (13, 'bandeja');
INSERT INTO public.categoria VALUES (14, 'arroces');
INSERT INTO public.categoria VALUES (15, 'aperitivos');
INSERT INTO public.categoria VALUES (16, 'guarniciones');
INSERT INTO public.categoria VALUES (17, 'postres');
INSERT INTO public.categoria VALUES (18, 'bebida típica');
INSERT INTO public.categoria VALUES (19, 'harinas');
INSERT INTO public.categoria VALUES (20, 'estofados');
INSERT INTO public.categoria VALUES (21, 'salsas');
INSERT INTO public.categoria VALUES (22, 'Fritos');
INSERT INTO public.categoria VALUES (23, 'guiso');


--
-- Data for Name: unidad_medida; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.unidad_medida VALUES (1, 'gr');
INSERT INTO public.unidad_medida VALUES (2, 'ml');
INSERT INTO public.unidad_medida VALUES (3, 'und');


--
-- Data for Name: ingrediente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ingrediente VALUES (1, 'papa criolla', 1);
INSERT INTO public.ingrediente VALUES (2, 'papa pastusa', 1);
INSERT INTO public.ingrediente VALUES (3, 'papa sabanera', 1);
INSERT INTO public.ingrediente VALUES (4, 'mazorca', 1);
INSERT INTO public.ingrediente VALUES (5, 'carne res', 1);
INSERT INTO public.ingrediente VALUES (6, 'carne cerdo', 1);
INSERT INTO public.ingrediente VALUES (7, 'gallina', 1);
INSERT INTO public.ingrediente VALUES (8, 'cebolla larga', 1);
INSERT INTO public.ingrediente VALUES (9, 'cebolla cabezona', 1);
INSERT INTO public.ingrediente VALUES (10, 'ajo', 1);
INSERT INTO public.ingrediente VALUES (11, 'arveja', 1);
INSERT INTO public.ingrediente VALUES (12, 'habas', 1);
INSERT INTO public.ingrediente VALUES (14, 'alverja verde', 1);
INSERT INTO public.ingrediente VALUES (15, 'comino', 1);
INSERT INTO public.ingrediente VALUES (16, 'cilantro', 1);
INSERT INTO public.ingrediente VALUES (17, 'yuca', 1);
INSERT INTO public.ingrediente VALUES (18, 'ñame', 1);
INSERT INTO public.ingrediente VALUES (21, 'leche de coco', 2);
INSERT INTO public.ingrediente VALUES (22, 'coco rallado', 1);
INSERT INTO public.ingrediente VALUES (23, 'mojarra', 1);
INSERT INTO public.ingrediente VALUES (24, 'robalo', 1);
INSERT INTO public.ingrediente VALUES (25, 'pargo', 1);
INSERT INTO public.ingrediente VALUES (27, 'arroz ', 1);
INSERT INTO public.ingrediente VALUES (28, 'achiote', 1);
INSERT INTO public.ingrediente VALUES (29, 'ají dulce', 1);
INSERT INTO public.ingrediente VALUES (30, 'ají picante', 1);
INSERT INTO public.ingrediente VALUES (31, 'cebolla morada', 1);
INSERT INTO public.ingrediente VALUES (33, 'queso doble crema', 1);
INSERT INTO public.ingrediente VALUES (34, 'queso costeño', 1);
INSERT INTO public.ingrediente VALUES (35, 'queso campesino', 1);
INSERT INTO public.ingrediente VALUES (36, 'platano pinton', 1);
INSERT INTO public.ingrediente VALUES (20, 'plátano maduro', 1);
INSERT INTO public.ingrediente VALUES (37, 'camarón', 1);
INSERT INTO public.ingrediente VALUES (38, 'piangua', 1);
INSERT INTO public.ingrediente VALUES (39, 'jaiba', 1);
INSERT INTO public.ingrediente VALUES (40, 'chontaduro', 1);
INSERT INTO public.ingrediente VALUES (41, 'ají chombo', 1);
INSERT INTO public.ingrediente VALUES (42, 'bagre', 1);
INSERT INTO public.ingrediente VALUES (43, 'bocachico', 1);
INSERT INTO public.ingrediente VALUES (44, 'doncella', 1);
INSERT INTO public.ingrediente VALUES (45, 'copoazú', 1);
INSERT INTO public.ingrediente VALUES (46, 'arazá', 1);
INSERT INTO public.ingrediente VALUES (47, 'camu camu', 1);
INSERT INTO public.ingrediente VALUES (49, 'papa china', 1);
INSERT INTO public.ingrediente VALUES (50, 'castañas', 1);
INSERT INTO public.ingrediente VALUES (51, 'hormigas culonas', 1);
INSERT INTO public.ingrediente VALUES (52, 'carne chigüiro', 1);
INSERT INTO public.ingrediente VALUES (53, 'amarillo', 1);
INSERT INTO public.ingrediente VALUES (54, 'maíz', 1);
INSERT INTO public.ingrediente VALUES (55, 'queso llanero', 1);
INSERT INTO public.ingrediente VALUES (56, 'manteca de cerdo', 1);
INSERT INTO public.ingrediente VALUES (57, 'hojas de bijao', 3);
INSERT INTO public.ingrediente VALUES (58, 'agua', 2);
INSERT INTO public.ingrediente VALUES (59, 'leche', 2);
INSERT INTO public.ingrediente VALUES (62, 'vinagre de manzana', 2);
INSERT INTO public.ingrediente VALUES (60, 'pan', 3);
INSERT INTO public.ingrediente VALUES (64, 'vino manzana', 2);
INSERT INTO public.ingrediente VALUES (61, 'calao', 3);
INSERT INTO public.ingrediente VALUES (13, 'huevo', 3);
INSERT INTO public.ingrediente VALUES (63, 'vino uva', 2);
INSERT INTO public.ingrediente VALUES (48, 'aji negro', 1);
INSERT INTO public.ingrediente VALUES (65, 'aceite de oliva', 2);
INSERT INTO public.ingrediente VALUES (66, 'pollo', 1);
INSERT INTO public.ingrediente VALUES (67, 'salmón', 1);
INSERT INTO public.ingrediente VALUES (68, 'sal', 1);
INSERT INTO public.ingrediente VALUES (69, 'salchicha', 3);
INSERT INTO public.ingrediente VALUES (71, 'carne molida', 1);
INSERT INTO public.ingrediente VALUES (75, 'calabaza', 1);
INSERT INTO public.ingrediente VALUES (73, 'chorizo', 3);
INSERT INTO public.ingrediente VALUES (74, 'agüacate', 3);
INSERT INTO public.ingrediente VALUES (76, 'arepa antioqueña', 3);
INSERT INTO public.ingrediente VALUES (19, 'plátano verde', 3);
INSERT INTO public.ingrediente VALUES (77, 'aceite', 2);
INSERT INTO public.ingrediente VALUES (78, 'azúcar', 1);
INSERT INTO public.ingrediente VALUES (79, 'alcaparras', 1);
INSERT INTO public.ingrediente VALUES (80, 'crema de leche', 2);
INSERT INTO public.ingrediente VALUES (81, 'pimienta', 1);
INSERT INTO public.ingrediente VALUES (82, 'pimienta negra', 1);
INSERT INTO public.ingrediente VALUES (83, 'masa de maiz', 1);
INSERT INTO public.ingrediente VALUES (84, 'costilla de cerdo', 1);
INSERT INTO public.ingrediente VALUES (86, 'color', 1);
INSERT INTO public.ingrediente VALUES (87, 'longaniza', 3);
INSERT INTO public.ingrediente VALUES (88, 'acelga', 1);
INSERT INTO public.ingrediente VALUES (89, 'pan tostado', 1);
INSERT INTO public.ingrediente VALUES (90, 'coco', 3);
INSERT INTO public.ingrediente VALUES (91, 'uvas pasas', 1);
INSERT INTO public.ingrediente VALUES (93, 'langostino', 1);
INSERT INTO public.ingrediente VALUES (94, 'caracol', 1);
INSERT INTO public.ingrediente VALUES (95, 'ramas de chillangua', 3);
INSERT INTO public.ingrediente VALUES (96, 'frijol blanco', 1);
INSERT INTO public.ingrediente VALUES (70, 'frijol rojo', 1);
INSERT INTO public.ingrediente VALUES (97, 'frijol negro', 1);
INSERT INTO public.ingrediente VALUES (98, 'pescado de mar', 1);
INSERT INTO public.ingrediente VALUES (99, 'cachama', 1);
INSERT INTO public.ingrediente VALUES (100, 'sal gruesa', 1);
INSERT INTO public.ingrediente VALUES (101, 'aceituna', 1);
INSERT INTO public.ingrediente VALUES (102, 'hojas de plátano', 3);
INSERT INTO public.ingrediente VALUES (103, 'pescado tucuma', 1);
INSERT INTO public.ingrediente VALUES (104, 'yuca brava', 1);
INSERT INTO public.ingrediente VALUES (105, 'ají amazónico', 3);
INSERT INTO public.ingrediente VALUES (106, 'cilantro cimarrón', 1);
INSERT INTO public.ingrediente VALUES (107, 'caracola', 1);
INSERT INTO public.ingrediente VALUES (108, 'cangrejo negro', 1);
INSERT INTO public.ingrediente VALUES (109, 'jengibre', 1);
INSERT INTO public.ingrediente VALUES (110, 'curry', 1);
INSERT INTO public.ingrediente VALUES (111, 'tomillo', 1);
INSERT INTO public.ingrediente VALUES (112, 'polvo de hornear', 1);
INSERT INTO public.ingrediente VALUES (113, 'vainilla', 2);
INSERT INTO public.ingrediente VALUES (115, 'mantequilla', 1);
INSERT INTO public.ingrediente VALUES (116, 'canela', 1);
INSERT INTO public.ingrediente VALUES (117, 'harina de trigo', 1);
INSERT INTO public.ingrediente VALUES (118, 'chorizo antioqueño', 3);
INSERT INTO public.ingrediente VALUES (119, 'morcilla', 1);
INSERT INTO public.ingrediente VALUES (120, 'chicharron', 1);
INSERT INTO public.ingrediente VALUES (85, 'zanahoria', 3);
INSERT INTO public.ingrediente VALUES (121, 'tomate', 3);
INSERT INTO public.ingrediente VALUES (122, 'limón', 3);
INSERT INTO public.ingrediente VALUES (123, 'jugo de limón', 2);
INSERT INTO public.ingrediente VALUES (124, 'pescado amazónico', 1);


--
-- Data for Name: nivel_complejidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nivel_complejidad VALUES (1, 'fácil');
INSERT INTO public.nivel_complejidad VALUES (2, 'intermedio');
INSERT INTO public.nivel_complejidad VALUES (3, 'difícil');


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.region VALUES ('in_co', 'Insular', 'Roberto Silva');
INSERT INTO public.region VALUES ('pa_co', 'Pacífico', 'Carlos Rodríguez');
INSERT INTO public.region VALUES ('am_co', 'Amazonía', 'Luis García');
INSERT INTO public.region VALUES ('or_co', 'Orinoquía', 'Ana Martínez');
INSERT INTO public.region VALUES ('an_co', 'Andina', 'Diana López');
INSERT INTO public.region VALUES ('ca_co', 'Caribe', 'María González');


--
-- Data for Name: plato; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.plato VALUES (10, 'Cocido boyacense', 'Sopa abundante y nutritiva típica del altiplano cundiboyacense. Es un plato de olla que combina múltiples carnes, verduras y tubérculos en un solo caldo sustancioso. Ideal para compartir en familia y perfecto para el clima frío de la región.', 'uploads/cocido_boyacense_20250706.jpg', 21000.00, true, 'an_co', 1, 2);
INSERT INTO public.plato VALUES (11, 'Changua', 'Sopa tradicional bogotana que se consume principalmente en el desayuno. Es una preparación sencilla pero reconfortante, hecha con leche, agua, huevo y cebolla larga. Se acompaña con pan tostado y representa la comida casera y económica de las familias capitalinas.', 'uploads/changua_20250706.jpg', 11000.00, true, 'an_co', 1, 1);
INSERT INTO public.plato VALUES (8, 'Ajiaco santafereño', 'Sopa espesa y cremosa considerada el plato más representativo de Bogotá. Se caracteriza por el uso de tres tipos diferentes de papas que le dan una textura única, y las guascas (hierba aromática) que le proporcionan su sabor distintivo. Es un plato de clima frío, reconfortante y muy nutritivo.', 'uploads/ajiaco_santafereno_20250706.jpg', 23000.00, true, 'an_co', 1, 1);
INSERT INTO public.plato VALUES (9, 'Tamales tolimenses', 'Envueltos en hojas de plátano, estos tamales son más grandes que los de otras regiones colombianas. La masa de maíz amarillo envuelve un relleno generoso de carnes, verduras y huevo. Es un plato tradicional para ocasiones especiales y fiestas familiares, requiere varias horas de preparación.', 'uploads/tamales_tolimenses_20250706.png', 22000.00, true, 'an_co', 4, 1);
INSERT INTO public.plato VALUES (27, 'Casabe', 'Pan plano y crujiente hecho con yuca brava procesada. Es un alimento básico de las comunidades indígenas amazónicas. Se prepara rallando la yuca, extrayendo el veneno y cocinando la harina en un budare hasta formar tortas delgadas.', 'uploads/casabe_20250706.jpg', 11000.00, true, 'am_co', 11, 2);
INSERT INTO public.plato VALUES (7, 'Bandeja paisa', '', 'uploads/bandeja_paisa_20250706.jpg', 28000.00, true, 'an_co', 4, 2);
INSERT INTO public.plato VALUES (12, 'sancocho de gallina', 'Sopa abundante y festiva, considerada el plato más representativo de la Costa Caribe. Se prepara con gallina criolla, múltiples verduras y tubérculos. Es el plato central de reuniones familiares y celebraciones, simbolizando la unión y la tradición costeña.', 'uploads/sancocho_de_gallina_20250706.jpg', 23000.00, true, 'ca_co', 1, 1);
INSERT INTO public.plato VALUES (13, 'Arroz con coco', 'Arroz dulce y aromático cocinado con leche de coco, típico de la costa Caribe. Tiene un sabor ligeramente dulce y una textura cremosa única. Se puede servir como acompañamiento o plato principal, y es especialmente popular en Cartagena y San Andrés.', 'uploads/arroz_con_coco_20250706.jpg', 9000.00, true, 'ca_co', 17, 2);
INSERT INTO public.plato VALUES (14, 'Arepa de huevo', 'Arepa frita rellena de huevo, originaria de la región Caribe. Se prepara con masa de maíz amarillo, se fríe hasta formar una especie de bolsa y se rellena con huevo crudo que se cocina en su interior. Es un desayuno muy popular y un antojito callejero típico.', 'uploads/arepa_de_huevo_20250706.jpg', 10000.00, true, 'ca_co', 11, 2);
INSERT INTO public.plato VALUES (16, 'Carimañolas', 'Fritos tradicionales costeños hechos con masa de yuca y rellenos de carne o queso. Tienen forma alargada y son dorados por fuera, suaves por dentro. Son muy populares como aperitivo o comida callejera, especialmente en Cartagena y el Caribe.', 'uploads/carimanolas_20250706.jpg', 7000.00, true, 'ca_co', 4, 1);
INSERT INTO public.plato VALUES (15, 'Cazuela de mariscos', 'Plato festivo que combina diversos mariscos en una preparación cremosa con leche de coco. Representa la abundancia marina del Caribe colombiano y se sirve en ocasiones especiales. Es un plato que requiere ingredientes frescos del mar.', 'uploads/cazuela_de_mariscos_20250706.jpg', 32000.00, true, 'in_co', 4, 3);
INSERT INTO public.plato VALUES (17, 'Sancocho de Pescado', 'Sopa tradicional de la costa Pacífica preparada con pescado fresco del mar, verduras y tubérculos. Se caracteriza por el uso de hierbas aromáticas locales como la chillangua. Es un plato que refleja la riqueza pesquera de la región.', 'uploads/sancocho_de_pescado_20250706.jpg', 30000.00, true, 'pa_co', 1, 2);
INSERT INTO public.plato VALUES (18, 'Arroz atollado', 'Arroz cremoso y sustancioso típico del Valle del Cauca. Se cocina con múltiples carnes y verduras hasta lograr una consistencia espesa. Las hojas de bijao le dan un aroma y sabor únicos. Es un plato festivo y familiar.', 'uploads/arroz_atollado_20250706.jpg', 20000.00, true, 'pa_co', 14, 2);
INSERT INTO public.plato VALUES (19, 'Encocado de jaiba', 'Plato afrodescendiente que combina jaiba en una salsa cremosa de coco. Es representativo de la gastronomía del Pacífico colombiano y refleja la influencia africana en la región. Se caracteriza por su sabor intenso y textura cremosa.', 'uploads/encocado_de_jaiba_20250706.jpg', 26000.00, true, 'pa_co', 4, 3);
INSERT INTO public.plato VALUES (20, 'Pusandao', 'Guiso contundente de frijoles con plátano, yuca y costilla ahumada. Es un plato tradicional afrocolombiano que representa la comida sustanciosa de las comunidades del Pacífico. Su nombre proviene del proceso de "pusar" o machacar los ingredientes.', 'uploads/pusandao_20250706.jpg', 16000.00, true, 'pa_co', 23, 2);
INSERT INTO public.plato VALUES (21, 'Pescado sudado', 'Preparación simple pero sabrosa donde el pescado se cocina al vapor con verduras y condimentos. Es una técnica tradicional que preserva el sabor natural del pescado mientras absorbe los aromas de las verduras y hierbas.', 'uploads/pescado_sudado_20250706.jpg', 22000.00, true, 'pa_co', 23, 2);
INSERT INTO public.plato VALUES (23, 'Mamona', 'Técnica ancestral de asado de ternera muy joven, cocinada lentamente en vara sobre brasas. Es el plato más emblemático de los Llanos Orientales y representa la cultura ganadera llanera. Se asa durante horas hasta lograr una carne tierna y jugosa.', 'uploads/mamona_20250706.jpg', 32000.00, true, 'or_co', 10, 2);
INSERT INTO public.plato VALUES (24, 'Cachama Asada', 'Pescado de río típico de los Llanos, asado a la parrilla o en brasas. La cachama es un pez de agua dulce muy apreciado en la región por su carne blanca y sabor suave. Se acompaña tradicionalmente con yuca y plátano.', 'uploads/cachama_asada_20250706.jpg', 17000.00, true, 'or_co', 6, 2);
INSERT INTO public.plato VALUES (25, 'Pisillo de Chigüiro', 'Carne de chigüiro (capibara) desmenuzada y salteada con condimentos. Es un plato tradicional de los Llanos que aprovecha la carne de este roedor nativo. Se prepara deshidratando y desmenuzando la carne, similar al tasajo.', 'uploads/pisillo_de_chiguiro_20250706.jpg', 38000.00, true, 'or_co', 10, 2);
INSERT INTO public.plato VALUES (26, 'Johnny Cake', 'Pan tradicional isleño, similar al pan de coco. Es esponjoso, ligeramente dulce y se prepara con leche de coco. Es un acompañamiento clásico para comidas y meriendas en San Andrés, heredado de la tradición culinaria anglo-caribeña.', 'uploads/johnny_cake_20250706.jpg', 12000.00, true, 'in_co', 19, 3);
INSERT INTO public.plato VALUES (28, 'Patarashca', 'Pescado envuelto en hojas de bijao y cocinado a la parrilla o al vapor. Es una técnica ancestral amazónica que mantiene la humedad del pescado mientras le da sabores de las hierbas aromáticas. El bijao actúa como papel de aluminio natural.', 'uploads/patarashca_20250706.jpg', 15000.00, true, 'am_co', 6, 1);
INSERT INTO public.plato VALUES (29, 'Empanada', 'Dumplings de harina de trigo, relleno de carne con especias y saborizantes', 'uploads/empanada_20250706.avif', 5000.00, true, 'an_co', 15, 2);


--
-- Data for Name: contener; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.contener VALUES (9, 6, 1.00, '');
INSERT INTO public.contener VALUES (9, 11, 1.00, '');
INSERT INTO public.contener VALUES (9, 15, 1.00, '');
INSERT INTO public.contener VALUES (9, 13, 1.00, '');
INSERT INTO public.contener VALUES (9, 66, 1.00, '');
INSERT INTO public.contener VALUES (9, 68, 1.00, '');
INSERT INTO public.contener VALUES (9, 83, 1.00, '');
INSERT INTO public.contener VALUES (9, 84, 1.00, '');
INSERT INTO public.contener VALUES (9, 86, 1.00, '');
INSERT INTO public.contener VALUES (9, 102, 1.00, '');
INSERT INTO public.contener VALUES (9, 85, 1.00, '');
INSERT INTO public.contener VALUES (10, 2, 1.00, '');
INSERT INTO public.contener VALUES (10, 4, 1.00, '');
INSERT INTO public.contener VALUES (10, 5, 1.00, '');
INSERT INTO public.contener VALUES (10, 8, 1.00, '');
INSERT INTO public.contener VALUES (10, 12, 1.00, '');
INSERT INTO public.contener VALUES (10, 16, 1.00, '');
INSERT INTO public.contener VALUES (10, 66, 1.00, '');
INSERT INTO public.contener VALUES (10, 68, 1.00, '');
INSERT INTO public.contener VALUES (10, 75, 1.00, '');
INSERT INTO public.contener VALUES (10, 84, 1.00, '');
INSERT INTO public.contener VALUES (10, 87, 1.00, '');
INSERT INTO public.contener VALUES (10, 88, 1.00, '');
INSERT INTO public.contener VALUES (11, 8, 1.00, '');
INSERT INTO public.contener VALUES (11, 16, 1.00, '');
INSERT INTO public.contener VALUES (11, 58, 1.00, '');
INSERT INTO public.contener VALUES (11, 59, 1.00, '');
INSERT INTO public.contener VALUES (11, 60, 1.00, '');
INSERT INTO public.contener VALUES (11, 13, 1.00, '');
INSERT INTO public.contener VALUES (11, 68, 1.00, '');
INSERT INTO public.contener VALUES (12, 4, 1.00, '');
INSERT INTO public.contener VALUES (12, 7, 2000.00, '');
INSERT INTO public.contener VALUES (12, 9, 1.00, '');
INSERT INTO public.contener VALUES (12, 10, 1.00, '');
INSERT INTO public.contener VALUES (12, 15, 1.00, '');
INSERT INTO public.contener VALUES (12, 16, 1.00, '');
INSERT INTO public.contener VALUES (12, 17, 1.00, '');
INSERT INTO public.contener VALUES (12, 18, 1.00, '');
INSERT INTO public.contener VALUES (12, 68, 1.00, '');
INSERT INTO public.contener VALUES (12, 75, 1.00, '');
INSERT INTO public.contener VALUES (12, 19, 1.00, '');
INSERT INTO public.contener VALUES (12, 86, 1.00, '');
INSERT INTO public.contener VALUES (13, 21, 1.00, '');
INSERT INTO public.contener VALUES (13, 27, 1.00, '');
INSERT INTO public.contener VALUES (13, 68, 1.00, '');
INSERT INTO public.contener VALUES (13, 78, 1.00, '');
INSERT INTO public.contener VALUES (13, 90, 1.00, '');
INSERT INTO public.contener VALUES (13, 91, 1.00, '');
INSERT INTO public.contener VALUES (14, 58, 1.00, '');
INSERT INTO public.contener VALUES (14, 13, 1.00, '');
INSERT INTO public.contener VALUES (14, 68, 1.00, '');
INSERT INTO public.contener VALUES (14, 77, 1.00, '');
INSERT INTO public.contener VALUES (14, 83, 1.00, '');
INSERT INTO public.contener VALUES (19, 8, 1.00, '');
INSERT INTO public.contener VALUES (19, 15, 1.00, '');
INSERT INTO public.contener VALUES (19, 21, 1.00, '');
INSERT INTO public.contener VALUES (19, 81, 1.00, '');
INSERT INTO public.contener VALUES (20, 16, 1.00, '');
INSERT INTO public.contener VALUES (20, 68, 1.00, '');
INSERT INTO public.contener VALUES (20, 84, 1.00, '');
INSERT INTO public.contener VALUES (21, 8, 1.00, '');
INSERT INTO public.contener VALUES (15, 19, 1.00, '');
INSERT INTO public.contener VALUES (15, 9, 1.00, '');
INSERT INTO public.contener VALUES (15, 93, 1.00, '');
INSERT INTO public.contener VALUES (15, 10, 1.00, '');
INSERT INTO public.contener VALUES (15, 94, 1.00, '');
INSERT INTO public.contener VALUES (15, 16, 1.00, '');
INSERT INTO public.contener VALUES (15, 98, 1.00, '');
INSERT INTO public.contener VALUES (15, 17, 1.00, '');
INSERT INTO public.contener VALUES (15, 18, 1.00, '');
INSERT INTO public.contener VALUES (15, 21, 1.00, '');
INSERT INTO public.contener VALUES (21, 16, 1.00, '');
INSERT INTO public.contener VALUES (21, 68, 1.00, '');
INSERT INTO public.contener VALUES (21, 81, 1.00, '');
INSERT INTO public.contener VALUES (21, 121, 1.00, '');
INSERT INTO public.contener VALUES (23, 100, 1.00, '');
INSERT INTO public.contener VALUES (24, 17, 1.00, '');
INSERT INTO public.contener VALUES (24, 19, 1.00, '');
INSERT INTO public.contener VALUES (24, 122, 1.00, '');
INSERT INTO public.contener VALUES (25, 10, 1.00, '');
INSERT INTO public.contener VALUES (25, 16, 1.00, '');
INSERT INTO public.contener VALUES (25, 52, 1.00, '');
INSERT INTO public.contener VALUES (25, 19, 1.00, '');
INSERT INTO public.contener VALUES (26, 13, 1.00, '');
INSERT INTO public.contener VALUES (26, 78, 1.00, '');
INSERT INTO public.contener VALUES (26, 113, 1.00, '');
INSERT INTO public.contener VALUES (26, 117, 1.00, '');
INSERT INTO public.contener VALUES (27, 104, 2000.00, '');
INSERT INTO public.contener VALUES (28, 10, 1.00, '');
INSERT INTO public.contener VALUES (28, 68, 1.00, '');
INSERT INTO public.contener VALUES (28, 106, 1.00, '');
INSERT INTO public.contener VALUES (29, 8, 1.00, '');
INSERT INTO public.contener VALUES (29, 65, 1.00, '');
INSERT INTO public.contener VALUES (29, 71, 1.00, '');
INSERT INTO public.contener VALUES (29, 117, 1.00, '');
INSERT INTO public.contener VALUES (15, 37, 1.00, '');
INSERT INTO public.contener VALUES (15, 39, 1.00, '');
INSERT INTO public.contener VALUES (7, 27, 1.00, '');
INSERT INTO public.contener VALUES (7, 13, 1.00, '');
INSERT INTO public.contener VALUES (7, 68, 1.00, '');
INSERT INTO public.contener VALUES (7, 71, 1.00, '');
INSERT INTO public.contener VALUES (7, 76, 1.00, '');
INSERT INTO public.contener VALUES (7, 19, 1.00, '');
INSERT INTO public.contener VALUES (7, 77, 1.00, '');
INSERT INTO public.contener VALUES (7, 70, 500.00, '');
INSERT INTO public.contener VALUES (7, 118, 1.00, '');
INSERT INTO public.contener VALUES (7, 119, 1.00, '');
INSERT INTO public.contener VALUES (8, 1, 1.00, '');
INSERT INTO public.contener VALUES (8, 2, 1.00, '');
INSERT INTO public.contener VALUES (8, 3, 1.00, '');
INSERT INTO public.contener VALUES (8, 4, 1.00, '');
INSERT INTO public.contener VALUES (8, 16, 1.00, '');
INSERT INTO public.contener VALUES (8, 66, 2000.00, '');
INSERT INTO public.contener VALUES (8, 68, 1.00, '');
INSERT INTO public.contener VALUES (8, 74, 1.00, '');
INSERT INTO public.contener VALUES (8, 79, 1.00, '');
INSERT INTO public.contener VALUES (8, 80, 1.00, '');
INSERT INTO public.contener VALUES (8, 81, 1.00, '');
INSERT INTO public.contener VALUES (19, 10, 1.00, '');
INSERT INTO public.contener VALUES (16, 8, 1.00, '');
INSERT INTO public.contener VALUES (16, 10, 1.00, '');
INSERT INTO public.contener VALUES (16, 15, 1.00, '');
INSERT INTO public.contener VALUES (16, 17, 1.00, '');
INSERT INTO public.contener VALUES (16, 13, 1.00, '');
INSERT INTO public.contener VALUES (16, 68, 1.00, '');
INSERT INTO public.contener VALUES (16, 71, 1.00, '');
INSERT INTO public.contener VALUES (17, 8, 1.00, '');
INSERT INTO public.contener VALUES (17, 10, 1.00, '');
INSERT INTO public.contener VALUES (17, 15, 1.00, '');
INSERT INTO public.contener VALUES (17, 16, 1.00, '');
INSERT INTO public.contener VALUES (17, 17, 1.00, '');
INSERT INTO public.contener VALUES (17, 18, 1.00, '');
INSERT INTO public.contener VALUES (17, 19, 1.00, '');
INSERT INTO public.contener VALUES (17, 95, 2.00, '');
INSERT INTO public.contener VALUES (17, 98, 1.00, '');
INSERT INTO public.contener VALUES (18, 6, 1.00, '');
INSERT INTO public.contener VALUES (18, 11, 1.00, '');
INSERT INTO public.contener VALUES (18, 27, 1.00, '');
INSERT INTO public.contener VALUES (18, 66, 1.00, '');
INSERT INTO public.contener VALUES (18, 73, 1.00, '');
INSERT INTO public.contener VALUES (18, 84, 1.00, '');
INSERT INTO public.contener VALUES (18, 85, 1.00, '');
INSERT INTO public.contener VALUES (19, 16, 1.00, '');
INSERT INTO public.contener VALUES (19, 39, 1.00, '');
INSERT INTO public.contener VALUES (20, 15, 1.00, '');
INSERT INTO public.contener VALUES (20, 17, 1.00, '');
INSERT INTO public.contener VALUES (20, 19, 1.00, '');
INSERT INTO public.contener VALUES (20, 70, 500.00, '');
INSERT INTO public.contener VALUES (21, 10, 1.00, '');
INSERT INTO public.contener VALUES (21, 17, 1.00, '');
INSERT INTO public.contener VALUES (21, 19, 1.00, '');
INSERT INTO public.contener VALUES (21, 98, 1.00, '');
INSERT INTO public.contener VALUES (23, 5, 1.00, '');
INSERT INTO public.contener VALUES (24, 10, 1.00, '');
INSERT INTO public.contener VALUES (24, 68, 1.00, '');
INSERT INTO public.contener VALUES (24, 99, 1.00, '');
INSERT INTO public.contener VALUES (25, 9, 1.00, '');
INSERT INTO public.contener VALUES (25, 15, 1.00, '');
INSERT INTO public.contener VALUES (25, 17, 1.00, '');
INSERT INTO public.contener VALUES (25, 68, 1.00, '');
INSERT INTO public.contener VALUES (26, 21, 1.00, '');
INSERT INTO public.contener VALUES (26, 68, 1.00, '');
INSERT INTO public.contener VALUES (26, 112, 1.00, '');
INSERT INTO public.contener VALUES (26, 115, 1.00, '');
INSERT INTO public.contener VALUES (27, 68, 30.00, '');
INSERT INTO public.contener VALUES (28, 9, 1.00, '');
INSERT INTO public.contener VALUES (28, 57, 1.00, '');
INSERT INTO public.contener VALUES (28, 81, 1.00, '');
INSERT INTO public.contener VALUES (28, 124, 1.00, '');
INSERT INTO public.contener VALUES (29, 10, 1.00, '');
INSERT INTO public.contener VALUES (29, 68, 1.00, '');
INSERT INTO public.contener VALUES (29, 86, 1.00, '');
INSERT INTO public.contener VALUES (29, 122, 1.00, '');


--
-- Data for Name: detallar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.detallar VALUES ('CARTA-202507-0002', 7);
INSERT INTO public.detallar VALUES ('CARTA-202507-0002', 8);
INSERT INTO public.detallar VALUES ('CARTA-202507-0002', 9);
INSERT INTO public.detallar VALUES ('CARTA-202507-0002', 10);
INSERT INTO public.detallar VALUES ('CARTA-202507-0002', 11);
INSERT INTO public.detallar VALUES ('CARTA-202507-0002', 12);
INSERT INTO public.detallar VALUES ('CARTA-202507-0002', 13);
INSERT INTO public.detallar VALUES ('CARTA-202507-0002', 14);
INSERT INTO public.detallar VALUES ('CARTA-202507-0002', 15);
INSERT INTO public.detallar VALUES ('CARTA-202507-0002', 16);
INSERT INTO public.detallar VALUES ('CARTA-202507-0002', 17);
INSERT INTO public.detallar VALUES ('CARTA-202507-0002', 18);
INSERT INTO public.detallar VALUES ('CARTA-202507-0002', 19);
INSERT INTO public.detallar VALUES ('CARTA-202507-0002', 20);
INSERT INTO public.detallar VALUES ('CARTA-202507-0002', 21);
INSERT INTO public.detallar VALUES ('CARTA-202507-0002', 23);
INSERT INTO public.detallar VALUES ('CARTA-202507-0002', 24);
INSERT INTO public.detallar VALUES ('CARTA-202507-0002', 25);
INSERT INTO public.detallar VALUES ('CARTA-202507-0002', 26);
INSERT INTO public.detallar VALUES ('CARTA-202507-0002', 27);
INSERT INTO public.detallar VALUES ('CARTA-202507-0002', 28);
INSERT INTO public.detallar VALUES ('CARTA-202507-0002', 29);
INSERT INTO public.detallar VALUES ('CARTA-202507-0001', 8);
INSERT INTO public.detallar VALUES ('CARTA-202507-0001', 11);
INSERT INTO public.detallar VALUES ('CARTA-202507-0001', 12);
INSERT INTO public.detallar VALUES ('CARTA-202507-0001', 13);
INSERT INTO public.detallar VALUES ('CARTA-202507-0001', 14);
INSERT INTO public.detallar VALUES ('CARTA-202507-0001', 16);
INSERT INTO public.detallar VALUES ('CARTA-202507-0001', 17);
INSERT INTO public.detallar VALUES ('CARTA-202507-0001', 18);
INSERT INTO public.detallar VALUES ('CARTA-202507-0001', 19);
INSERT INTO public.detallar VALUES ('CARTA-202507-0001', 29);


--
-- Data for Name: franja_horaria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.franja_horaria VALUES (1, 'Desayuno');
INSERT INTO public.franja_horaria VALUES (2, 'Almuerzo');
INSERT INTO public.franja_horaria VALUES (3, 'Cena');


--
-- Data for Name: venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.venta VALUES ('VENTA-20250705-CEN-0004', '2025-07-05 21:46:53.46713', 3);
INSERT INTO public.venta VALUES ('VENTA-20250705-CEN-0005', '2025-07-05 21:47:30.516439', 3);
INSERT INTO public.venta VALUES ('VENTA-20250705-CEN-0006', '2025-07-05 21:48:23.038395', 3);
INSERT INTO public.venta VALUES ('VENTA-20250705-CEN-0007', '2025-07-05 21:51:14.442212', 3);
INSERT INTO public.venta VALUES ('VENTA-20250705-CEN-   5', '2025-07-05 22:15:32.812847', 3);
INSERT INTO public.venta VALUES ('VENTA-20250705-CEN-   6', '2025-07-05 22:15:57.056567', 3);
INSERT INTO public.venta VALUES ('VENTA-20250705-CEN-   7', '2025-07-05 22:16:11.13305', 3);
INSERT INTO public.venta VALUES ('VENTA-20250705-CEN-   8', '2025-07-05 22:16:21.265125', 3);
INSERT INTO public.venta VALUES ('VENTA-20250705-CEN-   9', '2025-07-05 22:16:41.615156', 3);
INSERT INTO public.venta VALUES ('VENTA-20250705-CEN-  10', '2025-07-05 22:17:07.046799', 3);
INSERT INTO public.venta VALUES ('VENTA-20250705-CEN-  11', '2025-07-05 22:17:24.862755', 3);
INSERT INTO public.venta VALUES ('VENTA-20250705-CEN-  12', '2025-07-05 22:17:34.76809', 3);
INSERT INTO public.venta VALUES ('VENTA-20250705-CEN-  13', '2025-07-05 22:18:07.193522', 3);
INSERT INTO public.venta VALUES ('VENTA-20250705-CEN-  14', '2025-07-05 22:20:17.852706', 3);
INSERT INTO public.venta VALUES ('VENTA-20250705-CEN-  15', '2025-07-05 22:23:42.540769', 3);
INSERT INTO public.venta VALUES ('VENTA-20250705-DES-   1', '2025-07-05 22:25:44.207114', 1);
INSERT INTO public.venta VALUES ('VENTA-20250705-DES-   2', '2025-07-05 22:25:55.075815', 1);
INSERT INTO public.venta VALUES ('VENTA-20250705-DES-   3', '2025-07-05 22:26:09.379954', 1);
INSERT INTO public.venta VALUES ('VENTA-20250705-DES-   4', '2025-07-05 22:26:27.919255', 1);
INSERT INTO public.venta VALUES ('VENTA-20250705-DES-   5', '2025-07-05 22:26:39.794836', 1);
INSERT INTO public.venta VALUES ('VENTA-20250705-DES-   6', '2025-07-05 22:26:54.34842', 1);
INSERT INTO public.venta VALUES ('VENTA-20250705-DES-   7', '2025-07-05 22:26:54.635089', 1);
INSERT INTO public.venta VALUES ('VENTA-20250705-DES-   8', '2025-07-05 22:27:03.551077', 1);
INSERT INTO public.venta VALUES ('VENTA-20250705-DES-   9', '2025-07-05 22:27:15.308732', 1);
INSERT INTO public.venta VALUES ('VENTA-20250705-DES-  10', '2025-07-05 22:27:26.530201', 1);
INSERT INTO public.venta VALUES ('VENTA-20250705-DES-  11', '2025-07-05 22:27:36.910856', 1);
INSERT INTO public.venta VALUES ('VENTA-20250705-DES-  12', '2025-07-05 22:27:42.194632', 1);
INSERT INTO public.venta VALUES ('VENTA-20250705-DES-  13', '2025-07-05 22:27:54.575314', 1);
INSERT INTO public.venta VALUES ('VENTA-20250705-DES-  14', '2025-07-05 22:28:03.898192', 1);
INSERT INTO public.venta VALUES ('VENTA-20250705-DES-  15', '2025-07-05 22:28:13.907772', 1);
INSERT INTO public.venta VALUES ('VENTA-20250705-DES-  16', '2025-07-05 22:28:28.856395', 1);
INSERT INTO public.venta VALUES ('VENTA-20250705-DES-  17', '2025-07-05 22:28:38.71139', 1);
INSERT INTO public.venta VALUES ('VENTA-20250705-DES-  18', '2025-07-05 22:28:46.126248', 1);
INSERT INTO public.venta VALUES ('VENTA-20250705-DES-  19', '2025-07-05 22:28:57.700926', 1);
INSERT INTO public.venta VALUES ('VENTA-20250705-CEN-  16', '2025-07-05 22:29:07.881558', 3);
INSERT INTO public.venta VALUES ('VENTA-20250705-CEN-  17', '2025-07-05 22:29:08.14634', 3);
INSERT INTO public.venta VALUES ('VENTA-20250705-CEN-  18', '2025-07-05 22:29:17.734378', 3);
INSERT INTO public.venta VALUES ('VENTA-20250705-CEN-  19', '2025-07-05 22:29:28.599837', 3);
INSERT INTO public.venta VALUES ('VENTA-20250705-CEN-  20', '2025-07-05 22:29:32.609005', 3);
INSERT INTO public.venta VALUES ('VENTA-20250705-ALM-   1', '2025-07-05 22:30:46.98027', 2);
INSERT INTO public.venta VALUES ('VENTA-20250705-ALM-   2', '2025-07-05 22:30:51.830699', 2);
INSERT INTO public.venta VALUES ('VENTA-20250705-ALM-   3', '2025-07-05 22:30:52.002018', 2);
INSERT INTO public.venta VALUES ('VENTA-20250705-ALM-   4', '2025-07-05 22:31:11.372596', 2);
INSERT INTO public.venta VALUES ('VENTA-20250705-ALM-   5', '2025-07-05 22:31:21.176966', 2);
INSERT INTO public.venta VALUES ('VENTA-20250705-ALM-   6', '2025-07-05 22:31:25.847686', 2);
INSERT INTO public.venta VALUES ('VENTA-20250705-ALM-   7', '2025-07-05 22:31:36.877101', 2);
INSERT INTO public.venta VALUES ('VENTA-20250705-ALM-   8', '2025-07-05 22:31:45.546361', 2);
INSERT INTO public.venta VALUES ('VENTA-20250705-ALM-   9', '2025-07-05 22:31:56.099135', 2);
INSERT INTO public.venta VALUES ('VENTA-20250705-ALM-  10', '2025-07-05 22:32:04.111077', 2);
INSERT INTO public.venta VALUES ('VENTA-20250705-ALM-  11', '2025-07-05 22:32:09.776896', 2);
INSERT INTO public.venta VALUES ('VENTA-20250705-ALM-  12', '2025-07-05 22:32:16.300293', 2);
INSERT INTO public.venta VALUES ('VENTA-20250705-ALM-  13', '2025-07-05 22:32:27.060329', 2);
INSERT INTO public.venta VALUES ('VENTA-20250705-ALM-  14', '2025-07-05 22:32:35.012413', 2);
INSERT INTO public.venta VALUES ('VENTA-20250705-ALM-  15', '2025-07-05 22:32:44.113791', 2);
INSERT INTO public.venta VALUES ('VENTA-20250705-ALM-  16', '2025-07-05 22:32:52.476193', 2);
INSERT INTO public.venta VALUES ('VENTA-20250705-ALM-  17', '2025-07-05 22:33:03.110881', 2);
INSERT INTO public.venta VALUES ('VENTA-20250705-ALM-  18', '2025-07-05 22:33:10.622931', 2);
INSERT INTO public.venta VALUES ('VENTA-20250705-ALM-  19', '2025-07-05 22:33:22.185519', 2);
INSERT INTO public.venta VALUES ('VENTA-20250705-ALM-  20', '2025-07-05 22:33:30.651687', 2);
INSERT INTO public.venta VALUES ('VENTA-20250705-ALM-  21', '2025-07-05 22:33:36.965028', 2);
INSERT INTO public.venta VALUES ('VENTA-20250705-ALM-  22', '2025-07-05 22:33:46.909454', 2);
INSERT INTO public.venta VALUES ('VENTA-20250705-ALM-  23', '2025-07-05 22:33:55.373829', 2);
INSERT INTO public.venta VALUES ('VENTA-20250705-ALM-  24', '2025-07-05 22:34:10.40826', 2);
INSERT INTO public.venta VALUES ('VENTA-20250706-ALM-   1', '2025-07-06 16:29:22.032958', 2);
INSERT INTO public.venta VALUES ('VENTA-20250706-CEN-   1', '2025-07-06 21:00:36.947064', 3);
INSERT INTO public.venta VALUES ('VENTA-20250706-CEN-   2', '2025-07-06 21:10:58.052968', 3);
INSERT INTO public.venta VALUES ('VENTA-20250706-CEN-   3', '2025-07-06 21:13:11.17224', 3);
INSERT INTO public.venta VALUES ('VENTA-20250707-CEN-   1', '2025-07-07 01:10:11.045502', 3);
INSERT INTO public.venta VALUES ('VENTA-20250707-CEN-   2', '2025-07-07 01:14:18.823008', 3);
INSERT INTO public.venta VALUES ('VENTA-20250707-CEN-   3', '2025-07-07 01:15:09.544759', 3);
INSERT INTO public.venta VALUES ('VENTA-20250707-CEN-   4', '2025-07-07 01:16:16.350179', 3);
INSERT INTO public.venta VALUES ('VENTA-20250707-CEN-   5', '2025-07-07 01:25:49.56455', 3);


--
-- Data for Name: facturar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-0004', 12, 1, 23000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-0004', 7, 1, 28000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-0004', 8, 1, 23000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-0004', 13, 1, 9000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-0005', 25, 1, 38000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-0005', 13, 1, 9000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-0005', 8, 1, 23000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-0005', 14, 1, 10000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-0006', 21, 1, 22000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-0006', 8, 2, 23000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-0006', 9, 1, 22000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-0006', 20, 2, 16000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-0006', 15, 1, 32000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-0006', 19, 1, 26000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-0006', 27, 1, 11000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-0006', 28, 1, 15000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-0007', 11, 1, 11000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-0007', 9, 2, 22000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-0007', 8, 1, 23000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-0007', 17, 1, 30000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-0007', 19, 1, 26000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-0007', 12, 1, 23000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-   5', 13, 2, 9000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-   5', 9, 1, 22000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-   5', 21, 1, 22000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-   5', 15, 2, 32000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-   5', 27, 1, 11000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-   5', 26, 1, 12000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-   5', 7, 1, 28000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-   5', 8, 1, 23000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-   5', 17, 1, 30000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-   6', 7, 1, 28000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-   6', 18, 1, 20000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-   7', 17, 1, 30000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-   7', 20, 1, 16000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-   7', 28, 1, 15000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-   8', 9, 1, 22000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-   8', 8, 1, 23000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-   8', 7, 1, 28000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-   9', 13, 2, 9000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-   9', 15, 1, 32000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-   9', 14, 1, 10000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  10', 26, 1, 12000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  10', 15, 1, 32000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  10', 11, 1, 11000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  10', 10, 1, 21000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  11', 27, 1, 11000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  11', 14, 1, 10000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  11', 12, 1, 23000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  11', 16, 1, 7000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  12', 8, 2, 23000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  12', 9, 1, 22000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  13', 7, 1, 28000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  13', 25, 1, 38000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  13', 19, 1, 26000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  13', 27, 1, 11000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  14', 16, 1, 7000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  14', 15, 1, 32000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  14', 14, 1, 10000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  14', 27, 2, 11000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  14', 28, 2, 15000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  15', 8, 1, 23000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  15', 27, 1, 11000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  15', 28, 1, 15000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-   1', 7, 1, 28000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-   1', 14, 1, 10000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-   1', 15, 1, 32000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-   2', 16, 1, 7000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-   2', 23, 2, 32000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-   3', 15, 1, 32000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-   4', 24, 1, 17000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-   4', 15, 1, 32000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-   4', 23, 1, 32000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-   4', 8, 1, 23000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-   5', 26, 1, 12000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-   5', 18, 1, 20000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-   6', 26, 1, 12000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-   6', 27, 1, 11000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-   7', 26, 1, 12000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-   6', 28, 1, 15000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-   7', 27, 1, 11000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-   7', 28, 1, 15000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-   8', 9, 1, 22000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-   8', 8, 1, 23000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-   9', 15, 3, 32000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-  10', 10, 1, 21000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-  10', 9, 1, 22000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-  10', 24, 1, 17000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-  11', 16, 1, 7000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-  11', 19, 1, 26000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-  12', 15, 1, 32000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-  13', 14, 1, 10000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-  13', 18, 1, 20000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-  13', 20, 1, 16000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-  14', 20, 2, 16000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-  15', 18, 2, 20000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-  16', 25, 1, 38000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-  16', 19, 1, 26000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-  17', 23, 1, 32000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-  17', 9, 1, 22000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-  18', 14, 1, 10000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-  18', 12, 1, 23000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-  19', 24, 1, 17000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-  19', 15, 1, 32000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-DES-  19', 13, 1, 9000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  16', 26, 2, 12000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  17', 26, 2, 12000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  18', 18, 1, 20000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  18', 25, 1, 38000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  19', 13, 1, 9000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  19', 8, 1, 23000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-CEN-  20', 7, 1, 28000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-   1', 8, 1, 23000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-   2', 14, 1, 10000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-   3', 14, 1, 10000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-   4', 10, 1, 21000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-   4', 12, 2, 23000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-   4', 11, 1, 11000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-   4', 9, 1, 22000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-   5', 27, 1, 11000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-   5', 28, 1, 15000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-   6', 27, 1, 11000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-   7', 23, 2, 32000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-   8', 12, 1, 23000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-   8', 9, 1, 22000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-   9', 18, 2, 20000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-   9', 8, 1, 23000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  10', 17, 1, 30000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  10', 14, 1, 10000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  11', 7, 2, 28000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  12', 8, 1, 23000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  12', 9, 1, 22000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  13', 13, 1, 9000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  13', 14, 1, 10000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  14', 15, 1, 32000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  14', 21, 1, 22000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  15', 27, 1, 11000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  15', 21, 1, 22000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  16', 19, 1, 26000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  16', 24, 1, 17000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  17', 18, 1, 20000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  17', 21, 2, 22000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  18', 19, 1, 26000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  18', 14, 1, 10000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  19', 28, 1, 15000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  19', 9, 1, 22000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  19', 15, 1, 32000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  20', 23, 1, 32000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  20', 8, 1, 23000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  21', 15, 1, 32000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  22', 23, 1, 32000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  22', 14, 1, 10000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  23', 20, 1, 16000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  23', 18, 1, 20000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  24', 27, 1, 11000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  24', 28, 1, 15000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250705-ALM-  24', 23, 1, 32000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250706-ALM-   1', 9, 1, 22000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250706-ALM-   1', 8, 1, 23000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250706-ALM-   1', 14, 1, 10000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250706-ALM-   1', 12, 1, 23000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250706-ALM-   1', 16, 1, 7000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250706-ALM-   1', 19, 1, 26000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250706-ALM-   1', 17, 1, 30000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250706-CEN-   3', 11, 1, 1.00);
INSERT INTO public.facturar VALUES ('VENTA-20250706-CEN-   3', 7, 3, 1.00);
INSERT INTO public.facturar VALUES ('VENTA-20250707-CEN-   3', 13, 1, 9000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250707-CEN-   3', 14, 1, 10000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250707-CEN-   4', 18, 1, 20000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250707-CEN-   5', 25, 1, 38000.00);
INSERT INTO public.facturar VALUES ('VENTA-20250707-CEN-   5', 28, 1, 15000.00);


--
-- Data for Name: historial_carta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.historial_carta VALUES (1, 'CARTA-202506-0001', 'Ven y se contento', '2025-06-07', '2025-07-05', 'INSERT', '2025-07-05 09:36:15.588968');
INSERT INTO public.historial_carta VALUES (2, 'CARTA-202507-0001', 'Carta Promocional', '2025-07-05', '2025-07-11', 'INSERT', '2025-07-05 09:42:05.60588');
INSERT INTO public.historial_carta VALUES (3, 'CARTA-202507-0001', 'Carta Promocional', '2025-07-05', '2025-07-10', 'UPDATE', '2025-07-05 09:49:00.595577');
INSERT INTO public.historial_carta VALUES (4, 'CARTA-202507-0002', 'Nueva EnCarta', '2025-07-25', '2025-08-15', 'INSERT', '2025-07-05 09:49:26.577618');
INSERT INTO public.historial_carta VALUES (5, 'CARTA-202506-0001', 'Ven y se contento', '2025-06-07', '2025-07-05', 'DELETE', '2025-07-05 09:51:43.114371');
INSERT INTO public.historial_carta VALUES (6, 'CARTA-202507-0002', 'Nueva EnCarta', '2025-07-25', '2025-08-15', 'DELETE', '2025-07-05 09:51:45.493325');
INSERT INTO public.historial_carta VALUES (7, 'CARTA-202506-0001', 'Ven y se contento', '2025-06-12', '2025-07-05', 'INSERT', '2025-07-05 09:52:14.089045');
INSERT INTO public.historial_carta VALUES (8, 'CARTA-202506-0001', 'Ven y se contento', '2025-06-12', '2025-07-05', 'DELETE', '2025-07-05 09:53:12.646457');
INSERT INTO public.historial_carta VALUES (9, 'CARTA-202506-0001', 'Ven y se contento', '2025-06-05', '2025-07-19', 'INSERT', '2025-07-05 09:53:20.80454');
INSERT INTO public.historial_carta VALUES (10, 'CARTA-202506-0001', 'Ven y se contento', '2025-06-05', '2025-07-19', 'DELETE', '2025-07-05 09:54:57.835696');
INSERT INTO public.historial_carta VALUES (11, 'CARTA-202506-0001', 'Ven y se contento', '2025-06-05', '2025-07-19', 'INSERT', '2025-07-05 09:55:05.50832');
INSERT INTO public.historial_carta VALUES (12, 'CARTA-202507-0002', 'Ven y se contento2', '2025-07-12', '2025-07-25', 'INSERT', '2025-07-05 09:55:53.498634');
INSERT INTO public.historial_carta VALUES (13, 'CARTA-202506-0001', 'Ven y se contento', '2025-06-05', '2025-07-19', 'DELETE', '2025-07-05 09:58:49.283127');
INSERT INTO public.historial_carta VALUES (14, 'CARTA-202507-0002', 'Ven y se contento2', '2025-07-12', '2025-07-25', 'DELETE', '2025-07-05 09:58:50.457891');
INSERT INTO public.historial_carta VALUES (15, 'CARTA-202507-0002', 'Ven y se contento', '2025-07-05', '2025-07-19', 'INSERT', '2025-07-05 09:58:57.655986');
INSERT INTO public.historial_carta VALUES (16, 'CARTA-202507-0002', 'Ven y se contento', '2025-07-05', '2025-07-19', 'DELETE', '2025-07-05 10:02:29.335338');
INSERT INTO public.historial_carta VALUES (17, 'CARTA-202507-0002', 'Ven y se contento', '2025-07-01', '2025-07-26', 'INSERT', '2025-07-05 10:02:37.663406');
INSERT INTO public.historial_carta VALUES (18, 'CARTA-202507-0003', 'Changüa', '2025-07-09', '2025-08-08', 'INSERT', '2025-07-05 10:02:54.431386');
INSERT INTO public.historial_carta VALUES (19, 'CARTA-202507-0002', 'Ven y se contento', '2025-07-01', '2025-07-26', 'DELETE', '2025-07-05 10:03:34.56748');
INSERT INTO public.historial_carta VALUES (20, 'CARTA-202507-0004', 'Ven y se contento', '2025-07-12', '2025-07-19', 'INSERT', '2025-07-05 10:20:56.488328');
INSERT INTO public.historial_carta VALUES (21, 'CARTA-202507-0004', 'Ven y se contento', '2025-07-12', '2025-07-19', 'UPDATE', '2025-07-05 10:24:15.193042');
INSERT INTO public.historial_carta VALUES (22, 'CARTA-202507-0004', 'Ven y se contento', '2025-07-12', '2025-07-19', 'DELETE', '2025-07-05 10:24:28.833127');
INSERT INTO public.historial_carta VALUES (23, 'CARTA-202507-0001', 'Carta Promocional', '2025-07-05', '2025-07-10', 'DELETE', '2025-07-05 10:24:29.637084');
INSERT INTO public.historial_carta VALUES (24, 'CARTA-202507-0003', 'Changüa', '2025-07-09', '2025-08-08', 'DELETE', '2025-07-05 10:24:30.318272');
INSERT INTO public.historial_carta VALUES (25, 'CARTA-202507-0001', 'come contento', '2025-07-05', '2025-07-06', 'INSERT', '2025-07-05 10:41:57.645721');
INSERT INTO public.historial_carta VALUES (26, 'CARTA-202507-0001', 'come contento', '2025-07-05', '2025-07-06', 'UPDATE', '2025-07-06 16:20:32.573854');
INSERT INTO public.historial_carta VALUES (27, 'CARTA-202507-0001', 'come contento', '2025-07-05', '2025-07-06', 'UPDATE', '2025-07-06 17:22:47.058001');
INSERT INTO public.historial_carta VALUES (28, 'CARTA-202507-0001', 'come contento', '2025-07-05', '2025-07-06', 'UPDATE', '2025-07-06 17:23:21.222192');
INSERT INTO public.historial_carta VALUES (29, 'CARTA-202507-0001', 'come contento', '2025-07-02', '2025-07-04', 'UPDATE', '2025-07-06 21:35:50.164307');
INSERT INTO public.historial_carta VALUES (30, 'CARTA-202507-0002', 'Ven y se contento', '2025-07-06', '2025-07-07', 'INSERT', '2025-07-06 21:36:26.094387');
INSERT INTO public.historial_carta VALUES (31, 'CARTA-202507-0001', 'come contento', '2025-07-02', '2025-07-04', 'UPDATE', '2025-07-06 23:00:42.166513');
INSERT INTO public.historial_carta VALUES (32, 'CARTA-202507-0002', 'Ven y se contento', '2025-07-06', '2025-07-07', 'UPDATE', '2025-07-06 23:01:30.676856');
INSERT INTO public.historial_carta VALUES (33, 'CARTA-202507-0002', 'Ven y se contento', '2025-07-06', '2025-07-07', 'UPDATE', '2025-07-06 23:08:40.10759');


--
-- Data for Name: historial_categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.historial_categoria VALUES (1, 1, 'sopa', 'INSERT', '2025-07-04 19:13:48.220699');
INSERT INTO public.historial_categoria VALUES (2, 2, 'envuelto', 'INSERT', '2025-07-04 19:13:59.814609');
INSERT INTO public.historial_categoria VALUES (3, 3, 'caldo', 'INSERT', '2025-07-04 19:14:03.818495');
INSERT INTO public.historial_categoria VALUES (4, 4, 'típico', 'INSERT', '2025-07-04 19:14:16.831');
INSERT INTO public.historial_categoria VALUES (5, 5, 'crema', 'INSERT', '2025-07-04 19:15:39.95056');
INSERT INTO public.historial_categoria VALUES (6, 6, 'pescado', 'INSERT', '2025-07-04 19:16:29.825846');
INSERT INTO public.historial_categoria VALUES (7, 7, 'embutido', 'INSERT', '2025-07-04 19:16:43.147785');
INSERT INTO public.historial_categoria VALUES (8, 8, 'bollos', 'INSERT', '2025-07-04 19:16:57.444801');
INSERT INTO public.historial_categoria VALUES (9, 9, 'mariscos', 'INSERT', '2025-07-04 19:17:19.594147');
INSERT INTO public.historial_categoria VALUES (10, 10, 'proteína', 'INSERT', '2025-07-04 19:17:47.469099');
INSERT INTO public.historial_categoria VALUES (11, 11, 'tortilla', 'INSERT', '2025-07-04 19:18:13.560819');
INSERT INTO public.historial_categoria VALUES (12, 12, 'tamal', 'INSERT', '2025-07-04 19:18:22.604748');
INSERT INTO public.historial_categoria VALUES (13, 13, 'bandeja', 'INSERT', '2025-07-04 19:20:16.236593');
INSERT INTO public.historial_categoria VALUES (14, 14, 'arroces', 'INSERT', '2025-07-04 19:20:38.157351');
INSERT INTO public.historial_categoria VALUES (15, 15, 'aperitivos', 'INSERT', '2025-07-04 19:20:46.370058');
INSERT INTO public.historial_categoria VALUES (16, 16, 'guarniciones', 'INSERT', '2025-07-04 19:21:13.994446');
INSERT INTO public.historial_categoria VALUES (17, 17, 'postres', 'INSERT', '2025-07-04 19:21:19.575589');
INSERT INTO public.historial_categoria VALUES (18, 18, 'bebida típica', 'INSERT', '2025-07-04 19:21:27.149444');
INSERT INTO public.historial_categoria VALUES (19, 19, 'harinas', 'INSERT', '2025-07-04 19:21:33.137736');
INSERT INTO public.historial_categoria VALUES (20, 20, 'estofados', 'INSERT', '2025-07-04 19:21:40.970916');
INSERT INTO public.historial_categoria VALUES (21, 21, 'salsas', 'INSERT', '2025-07-04 19:22:01.54842');
INSERT INTO public.historial_categoria VALUES (22, 22, 'Fritos', 'INSERT', '2025-07-05 12:24:01.964394');
INSERT INTO public.historial_categoria VALUES (23, 23, 'guiso', 'INSERT', '2025-07-05 12:33:42.228965');


--
-- Data for Name: historial_ingrediente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.historial_ingrediente VALUES (1, 1, 'papa criolla', 1, 'INSERT', '2025-07-04 19:00:15.464503');
INSERT INTO public.historial_ingrediente VALUES (2, 2, 'papa pastusa', 1, 'INSERT', '2025-07-04 19:00:25.859005');
INSERT INTO public.historial_ingrediente VALUES (3, 3, 'papa sabanera', 1, 'INSERT', '2025-07-04 19:00:34.764489');
INSERT INTO public.historial_ingrediente VALUES (4, 4, 'mazorca', 1, 'INSERT', '2025-07-04 19:00:41.959381');
INSERT INTO public.historial_ingrediente VALUES (5, 5, 'carne res', 1, 'INSERT', '2025-07-04 19:00:48.913238');
INSERT INTO public.historial_ingrediente VALUES (6, 6, 'carne cerdo', 1, 'INSERT', '2025-07-04 19:00:53.892524');
INSERT INTO public.historial_ingrediente VALUES (7, 7, 'gallina', 1, 'INSERT', '2025-07-04 19:01:11.002124');
INSERT INTO public.historial_ingrediente VALUES (8, 8, 'cebolla larga', 1, 'INSERT', '2025-07-04 19:01:19.347776');
INSERT INTO public.historial_ingrediente VALUES (9, 9, 'cebolla cabezona', 1, 'INSERT', '2025-07-04 19:01:25.910998');
INSERT INTO public.historial_ingrediente VALUES (10, 10, 'ajo', 1, 'INSERT', '2025-07-04 19:01:35.61743');
INSERT INTO public.historial_ingrediente VALUES (11, 11, 'arveja', 1, 'INSERT', '2025-07-04 19:01:41.27242');
INSERT INTO public.historial_ingrediente VALUES (12, 12, 'habas', 1, 'INSERT', '2025-07-04 19:02:00.070763');
INSERT INTO public.historial_ingrediente VALUES (13, 13, 'huevo', 1, 'INSERT', '2025-07-04 19:02:09.089535');
INSERT INTO public.historial_ingrediente VALUES (14, 14, 'alverja verde', 1, 'INSERT', '2025-07-04 19:02:18.938205');
INSERT INTO public.historial_ingrediente VALUES (15, 15, 'comino', 1, 'INSERT', '2025-07-04 19:02:24.533945');
INSERT INTO public.historial_ingrediente VALUES (16, 16, 'cilantro', 1, 'INSERT', '2025-07-04 19:02:31.668802');
INSERT INTO public.historial_ingrediente VALUES (17, 17, 'yuca', 1, 'INSERT', '2025-07-04 19:02:57.586212');
INSERT INTO public.historial_ingrediente VALUES (18, 18, 'ñame', 1, 'INSERT', '2025-07-04 19:03:07.488671');
INSERT INTO public.historial_ingrediente VALUES (19, 19, 'platano', 1, 'INSERT', '2025-07-04 19:03:12.623632');
INSERT INTO public.historial_ingrediente VALUES (20, 19, 'platano verde', 1, 'UPDATE', '2025-07-04 19:03:27.038729');
INSERT INTO public.historial_ingrediente VALUES (21, 20, 'platano maduro', 1, 'INSERT', '2025-07-04 19:03:44.053251');
INSERT INTO public.historial_ingrediente VALUES (22, 21, 'leche de coco', 2, 'INSERT', '2025-07-04 19:04:18.173958');
INSERT INTO public.historial_ingrediente VALUES (23, 22, 'coco rallado', 1, 'INSERT', '2025-07-04 19:04:25.436754');
INSERT INTO public.historial_ingrediente VALUES (24, 23, 'mojarra', 1, 'INSERT', '2025-07-04 19:04:34.74202');
INSERT INTO public.historial_ingrediente VALUES (25, 24, 'robalo', 1, 'INSERT', '2025-07-04 19:04:39.017111');
INSERT INTO public.historial_ingrediente VALUES (26, 25, 'pargo', 1, 'INSERT', '2025-07-04 19:04:43.278653');
INSERT INTO public.historial_ingrediente VALUES (27, 26, 'mariscos', 1, 'INSERT', '2025-07-04 19:04:49.646254');
INSERT INTO public.historial_ingrediente VALUES (28, 27, 'arroz ', 1, 'INSERT', '2025-07-04 19:04:59.621386');
INSERT INTO public.historial_ingrediente VALUES (29, 28, 'achiote', 1, 'INSERT', '2025-07-04 19:05:17.402338');
INSERT INTO public.historial_ingrediente VALUES (30, 29, 'ají dulce', 1, 'INSERT', '2025-07-04 19:05:28.852515');
INSERT INTO public.historial_ingrediente VALUES (31, 30, 'ají picante', 1, 'INSERT', '2025-07-04 19:05:40.63853');
INSERT INTO public.historial_ingrediente VALUES (32, 31, 'cebolla morada', 1, 'INSERT', '2025-07-04 19:05:45.722391');
INSERT INTO public.historial_ingrediente VALUES (33, 32, 'limon', 1, 'INSERT', '2025-07-04 19:05:50.949901');
INSERT INTO public.historial_ingrediente VALUES (34, 33, 'queso doble crema', 1, 'INSERT', '2025-07-04 19:05:57.12154');
INSERT INTO public.historial_ingrediente VALUES (35, 34, 'queso costeño', 1, 'INSERT', '2025-07-04 19:06:02.76292');
INSERT INTO public.historial_ingrediente VALUES (36, 35, 'queso campesino', 1, 'INSERT', '2025-07-04 19:06:10.286415');
INSERT INTO public.historial_ingrediente VALUES (37, 36, 'platano pinton', 1, 'INSERT', '2025-07-04 19:06:24.836876');
INSERT INTO public.historial_ingrediente VALUES (38, 19, 'plátano', 1, 'UPDATE', '2025-07-04 19:06:52.227943');
INSERT INTO public.historial_ingrediente VALUES (39, 20, 'plátano maduro', 1, 'UPDATE', '2025-07-04 19:07:02.220009');
INSERT INTO public.historial_ingrediente VALUES (40, 37, 'camarón', 1, 'INSERT', '2025-07-04 19:07:29.627382');
INSERT INTO public.historial_ingrediente VALUES (41, 38, 'piangua', 1, 'INSERT', '2025-07-04 19:07:34.965674');
INSERT INTO public.historial_ingrediente VALUES (42, 39, 'jaiba', 1, 'INSERT', '2025-07-04 19:07:40.649735');
INSERT INTO public.historial_ingrediente VALUES (43, 26, 'mariscos', 1, 'DELETE', '2025-07-04 19:07:45.703748');
INSERT INTO public.historial_ingrediente VALUES (44, 40, 'chontaduro', 1, 'INSERT', '2025-07-04 19:07:58.833652');
INSERT INTO public.historial_ingrediente VALUES (45, 41, 'ají chombo', 1, 'INSERT', '2025-07-04 19:08:11.003808');
INSERT INTO public.historial_ingrediente VALUES (46, 42, 'bagre', 1, 'INSERT', '2025-07-04 19:08:20.521301');
INSERT INTO public.historial_ingrediente VALUES (47, 43, 'bocachico', 1, 'INSERT', '2025-07-04 19:08:30.279479');
INSERT INTO public.historial_ingrediente VALUES (48, 44, 'doncella', 1, 'INSERT', '2025-07-04 19:08:35.119478');
INSERT INTO public.historial_ingrediente VALUES (49, 45, 'copoazú', 1, 'INSERT', '2025-07-04 19:09:02.32351');
INSERT INTO public.historial_ingrediente VALUES (50, 46, 'arazá', 1, 'INSERT', '2025-07-04 19:09:07.72665');
INSERT INTO public.historial_ingrediente VALUES (51, 47, 'camu camu', 1, 'INSERT', '2025-07-04 19:09:17.011101');
INSERT INTO public.historial_ingrediente VALUES (52, 48, 'Ají negro', 1, 'INSERT', '2025-07-04 19:09:26.290376');
INSERT INTO public.historial_ingrediente VALUES (53, 49, 'papa china', 1, 'INSERT', '2025-07-04 19:09:33.41222');
INSERT INTO public.historial_ingrediente VALUES (54, 50, 'castañas', 1, 'INSERT', '2025-07-04 19:09:40.105301');
INSERT INTO public.historial_ingrediente VALUES (55, 51, 'hormigas culonas', 1, 'INSERT', '2025-07-04 19:09:49.910312');
INSERT INTO public.historial_ingrediente VALUES (56, 52, 'carne chigüiro', 1, 'INSERT', '2025-07-04 19:10:21.336055');
INSERT INTO public.historial_ingrediente VALUES (57, 53, 'amarillo', 1, 'INSERT', '2025-07-04 19:10:32.707363');
INSERT INTO public.historial_ingrediente VALUES (58, 54, 'maíz', 1, 'INSERT', '2025-07-04 19:10:53.731909');
INSERT INTO public.historial_ingrediente VALUES (59, 55, 'queso llanero', 1, 'INSERT', '2025-07-04 19:11:07.000228');
INSERT INTO public.historial_ingrediente VALUES (60, 56, 'manteca de cerdo', 1, 'INSERT', '2025-07-04 19:11:15.52111');
INSERT INTO public.historial_ingrediente VALUES (61, 57, 'hojas de bijao', 1, 'INSERT', '2025-07-04 19:11:27.925099');
INSERT INTO public.historial_ingrediente VALUES (62, 57, 'hojas de bijao', 2, 'UPDATE', '2025-07-04 19:11:39.545369');
INSERT INTO public.historial_ingrediente VALUES (63, 57, 'hojas de bijao', 3, 'UPDATE', '2025-07-04 19:11:56.264039');
INSERT INTO public.historial_ingrediente VALUES (64, 58, 'agua', 2, 'INSERT', '2025-07-04 21:17:52.187772');
INSERT INTO public.historial_ingrediente VALUES (65, 59, 'leche', 2, 'INSERT', '2025-07-04 21:17:57.495082');
INSERT INTO public.historial_ingrediente VALUES (66, 60, 'pan', 1, 'INSERT', '2025-07-04 21:18:02.192194');
INSERT INTO public.historial_ingrediente VALUES (67, 61, 'calao', 1, 'INSERT', '2025-07-04 21:18:11.124874');
INSERT INTO public.historial_ingrediente VALUES (68, 62, 'vinagre de manzana', 2, 'INSERT', '2025-07-04 21:49:59.309488');
INSERT INTO public.historial_ingrediente VALUES (69, 60, 'pan', 3, 'UPDATE', '2025-07-04 21:50:08.934469');
INSERT INTO public.historial_ingrediente VALUES (70, 63, 'vina uva', 2, 'INSERT', '2025-07-04 21:50:14.814785');
INSERT INTO public.historial_ingrediente VALUES (71, 64, 'vino manzana', 2, 'INSERT', '2025-07-04 21:50:21.706535');
INSERT INTO public.historial_ingrediente VALUES (72, 61, 'calao', 3, 'UPDATE', '2025-07-04 21:50:41.767088');
INSERT INTO public.historial_ingrediente VALUES (73, 13, 'huevo', 3, 'UPDATE', '2025-07-04 21:50:51.452255');
INSERT INTO public.historial_ingrediente VALUES (74, 63, 'vino uva', 2, 'UPDATE', '2025-07-04 22:19:10.672503');
INSERT INTO public.historial_ingrediente VALUES (75, 48, 'aji negro', 1, 'UPDATE', '2025-07-04 22:44:21.230367');
INSERT INTO public.historial_ingrediente VALUES (76, 65, 'aceite de oliva', 2, 'INSERT', '2025-07-04 23:22:16.054365');
INSERT INTO public.historial_ingrediente VALUES (77, 66, 'pollo', 1, 'INSERT', '2025-07-05 09:24:24.466003');
INSERT INTO public.historial_ingrediente VALUES (78, 67, 'salmon', 1, 'INSERT', '2025-07-05 09:24:30.21245');
INSERT INTO public.historial_ingrediente VALUES (79, 67, 'salmón', 1, 'UPDATE', '2025-07-05 09:25:06.782331');
INSERT INTO public.historial_ingrediente VALUES (80, 68, 'sal', 1, 'INSERT', '2025-07-05 09:25:10.80068');
INSERT INTO public.historial_ingrediente VALUES (81, 69, 'salchicha', 3, 'INSERT', '2025-07-05 09:26:43.929451');
INSERT INTO public.historial_ingrediente VALUES (82, 70, 'frijoles rojos', 1, 'INSERT', '2025-07-05 10:33:56.578721');
INSERT INTO public.historial_ingrediente VALUES (83, 71, 'carne molida', 1, 'INSERT', '2025-07-05 10:34:10.873205');
INSERT INTO public.historial_ingrediente VALUES (84, 72, 'chicharron', 1, 'INSERT', '2025-07-05 10:34:30.390234');
INSERT INTO public.historial_ingrediente VALUES (85, 73, 'chorizo', 1, 'INSERT', '2025-07-05 10:34:47.131175');
INSERT INTO public.historial_ingrediente VALUES (86, 74, 'agüacate', 1, 'INSERT', '2025-07-05 10:35:07.960798');
INSERT INTO public.historial_ingrediente VALUES (87, 75, 'calabaza', 1, 'INSERT', '2025-07-05 10:35:47.694629');
INSERT INTO public.historial_ingrediente VALUES (88, 72, 'chicharron', 1, 'DELETE', '2025-07-05 10:51:35.319415');
INSERT INTO public.historial_ingrediente VALUES (89, 73, 'chorizo', 3, 'UPDATE', '2025-07-05 10:52:48.798808');
INSERT INTO public.historial_ingrediente VALUES (90, 74, 'agüacate', 3, 'UPDATE', '2025-07-05 10:53:30.021681');
INSERT INTO public.historial_ingrediente VALUES (91, 76, 'arepa antioqueña', 3, 'INSERT', '2025-07-05 10:54:21.870558');
INSERT INTO public.historial_ingrediente VALUES (92, 19, 'plátano verde', 3, 'UPDATE', '2025-07-05 10:55:00.459372');
INSERT INTO public.historial_ingrediente VALUES (93, 77, 'aceite', 2, 'INSERT', '2025-07-05 10:55:28.104359');
INSERT INTO public.historial_ingrediente VALUES (94, 78, 'azúcar', 1, 'INSERT', '2025-07-05 10:56:14.68505');
INSERT INTO public.historial_ingrediente VALUES (95, 79, 'alcaparras', 1, 'INSERT', '2025-07-05 10:56:42.411596');
INSERT INTO public.historial_ingrediente VALUES (96, 80, 'crema de leche', 2, 'INSERT', '2025-07-05 10:56:52.522645');
INSERT INTO public.historial_ingrediente VALUES (97, 81, 'pimienta', 1, 'INSERT', '2025-07-05 10:57:06.685875');
INSERT INTO public.historial_ingrediente VALUES (98, 82, 'pimienta negra', 1, 'INSERT', '2025-07-05 10:57:12.858953');
INSERT INTO public.historial_ingrediente VALUES (99, 83, 'masa de maiz', 1, 'INSERT', '2025-07-05 10:57:27.867941');
INSERT INTO public.historial_ingrediente VALUES (100, 84, 'costilla de cerdo', 1, 'INSERT', '2025-07-05 10:57:42.862352');
INSERT INTO public.historial_ingrediente VALUES (101, 85, 'zanahoria', 1, 'INSERT', '2025-07-05 10:58:02.173512');
INSERT INTO public.historial_ingrediente VALUES (102, 86, 'color', 1, 'INSERT', '2025-07-05 10:58:35.39131');
INSERT INTO public.historial_ingrediente VALUES (103, 87, 'longaniza', 3, 'INSERT', '2025-07-05 10:58:49.621482');
INSERT INTO public.historial_ingrediente VALUES (104, 88, 'acelga', 1, 'INSERT', '2025-07-05 10:59:09.79074');
INSERT INTO public.historial_ingrediente VALUES (105, 89, 'pan tostado', 1, 'INSERT', '2025-07-05 10:59:37.805786');
INSERT INTO public.historial_ingrediente VALUES (106, 90, 'coco', 3, 'INSERT', '2025-07-05 11:00:16.624526');
INSERT INTO public.historial_ingrediente VALUES (107, 91, 'uvas pasas', 1, 'INSERT', '2025-07-05 11:00:56.032639');
INSERT INTO public.historial_ingrediente VALUES (108, 92, 'camaron', 1, 'INSERT', '2025-07-05 11:01:19.655863');
INSERT INTO public.historial_ingrediente VALUES (109, 92, 'camaron', 1, 'DELETE', '2025-07-05 11:01:30.546927');
INSERT INTO public.historial_ingrediente VALUES (110, 93, 'langostino', 1, 'INSERT', '2025-07-05 11:02:49.710635');
INSERT INTO public.historial_ingrediente VALUES (111, 94, 'caracol', 1, 'INSERT', '2025-07-05 11:03:10.163293');
INSERT INTO public.historial_ingrediente VALUES (112, 95, 'ramas de chillangua', 3, 'INSERT', '2025-07-05 11:04:39.40605');
INSERT INTO public.historial_ingrediente VALUES (113, 96, 'frijol blanco', 1, 'INSERT', '2025-07-05 11:06:15.464217');
INSERT INTO public.historial_ingrediente VALUES (114, 70, 'frijol rojo', 1, 'UPDATE', '2025-07-05 11:06:30.217147');
INSERT INTO public.historial_ingrediente VALUES (115, 97, 'frijol negro', 1, 'INSERT', '2025-07-05 11:06:54.490672');
INSERT INTO public.historial_ingrediente VALUES (116, 98, 'pescado', 1, 'INSERT', '2025-07-05 11:07:31.772935');
INSERT INTO public.historial_ingrediente VALUES (117, 98, 'pescado de mar', 1, 'UPDATE', '2025-07-05 11:07:49.393066');
INSERT INTO public.historial_ingrediente VALUES (118, 99, 'cachama', 1, 'INSERT', '2025-07-05 11:08:10.183771');
INSERT INTO public.historial_ingrediente VALUES (119, 100, 'sal gruesa', 1, 'INSERT', '2025-07-05 11:09:00.612443');
INSERT INTO public.historial_ingrediente VALUES (120, 101, 'aceituna', 1, 'INSERT', '2025-07-05 11:09:28.846613');
INSERT INTO public.historial_ingrediente VALUES (121, 102, 'hojas de plátano', 3, 'INSERT', '2025-07-05 11:10:14.621859');
INSERT INTO public.historial_ingrediente VALUES (122, 103, 'pescado tucuma', 1, 'INSERT', '2025-07-05 11:11:28.745983');
INSERT INTO public.historial_ingrediente VALUES (123, 104, 'yuca brava', 1, 'INSERT', '2025-07-05 11:12:28.223198');
INSERT INTO public.historial_ingrediente VALUES (124, 105, 'ají amazónico', 3, 'INSERT', '2025-07-05 11:13:03.787307');
INSERT INTO public.historial_ingrediente VALUES (125, 106, 'cilantro cimarrón', 1, 'INSERT', '2025-07-05 11:13:40.161027');
INSERT INTO public.historial_ingrediente VALUES (126, 107, 'caracola', 1, 'INSERT', '2025-07-05 11:15:10.099154');
INSERT INTO public.historial_ingrediente VALUES (127, 108, 'cangrejo negro', 1, 'INSERT', '2025-07-05 11:16:55.017505');
INSERT INTO public.historial_ingrediente VALUES (128, 109, 'jengibre', 1, 'INSERT', '2025-07-05 11:23:25.658789');
INSERT INTO public.historial_ingrediente VALUES (129, 110, 'curry', 1, 'INSERT', '2025-07-05 11:23:48.963055');
INSERT INTO public.historial_ingrediente VALUES (130, 111, 'tomillo', 1, 'INSERT', '2025-07-05 11:23:58.438492');
INSERT INTO public.historial_ingrediente VALUES (131, 112, 'polvo de hornear', 1, 'INSERT', '2025-07-05 11:24:25.083006');
INSERT INTO public.historial_ingrediente VALUES (132, 113, 'vainilla', 2, 'INSERT', '2025-07-05 11:24:39.972634');
INSERT INTO public.historial_ingrediente VALUES (133, 114, 'jugo de limón', 2, 'INSERT', '2025-07-05 11:25:32.570896');
INSERT INTO public.historial_ingrediente VALUES (134, 115, 'mantequilla', 1, 'INSERT', '2025-07-05 11:31:42.552368');
INSERT INTO public.historial_ingrediente VALUES (135, 116, 'canela', 1, 'INSERT', '2025-07-05 11:31:51.444227');
INSERT INTO public.historial_ingrediente VALUES (136, 117, 'harina de trigo', 1, 'INSERT', '2025-07-05 11:32:11.681598');
INSERT INTO public.historial_ingrediente VALUES (137, 118, 'chorizo antioqueño', 3, 'INSERT', '2025-07-05 11:33:07.910285');
INSERT INTO public.historial_ingrediente VALUES (138, 119, 'morcilla', 1, 'INSERT', '2025-07-05 11:33:25.341086');
INSERT INTO public.historial_ingrediente VALUES (139, 120, 'chicharron', 1, 'INSERT', '2025-07-05 11:40:22.753417');
INSERT INTO public.historial_ingrediente VALUES (140, 85, 'zanahoria', 3, 'UPDATE', '2025-07-05 11:55:30.180469');
INSERT INTO public.historial_ingrediente VALUES (141, 121, 'tomate', 3, 'INSERT', '2025-07-05 12:39:47.708353');
INSERT INTO public.historial_ingrediente VALUES (142, 122, 'limón', 3, 'INSERT', '2025-07-05 12:52:01.298778');
INSERT INTO public.historial_ingrediente VALUES (143, 122, 'limón', 3, 'UPDATE', '2025-07-05 12:53:54.561632');
INSERT INTO public.historial_ingrediente VALUES (144, 114, 'jugo de limón', 2, 'DELETE', '2025-07-05 13:19:24.02979');
INSERT INTO public.historial_ingrediente VALUES (145, 32, 'limon', 1, 'DELETE', '2025-07-05 13:21:56.637017');
INSERT INTO public.historial_ingrediente VALUES (146, 123, 'jugo de limón', 2, 'INSERT', '2025-07-05 13:22:18.46452');
INSERT INTO public.historial_ingrediente VALUES (147, 124, 'pescado amazónico', 1, 'INSERT', '2025-07-05 13:26:05.608852');


--
-- Data for Name: historial_plato; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.historial_plato VALUES (1, 2, 'Changüa', 'Caldo del diablo', '', 10000.00, true, 'an_co', 3, 1, 'INSERT', '2025-07-04 22:17:34.999435');
INSERT INTO public.historial_plato VALUES (2, 3, 'Sopa de gato', 'Ningún gato es lastimado en la elaboración de este plato', '', 15000.00, true, 'an_co', 3, 1, 'INSERT', '2025-07-05 09:26:28.14734');
INSERT INTO public.historial_plato VALUES (3, 4, 'Huevo ranchero', 'Huevo con salchicha y arroz', '', 8500.00, true, 'an_co', 15, 1, 'INSERT', '2025-07-05 09:27:39.484863');
INSERT INTO public.historial_plato VALUES (4, 2, 'Changüa', 'Caldo del diablo', '', 10000.00, true, 'an_co', 3, 1, 'DELETE', '2025-07-05 10:27:17.084386');
INSERT INTO public.historial_plato VALUES (5, 4, 'Huevo ranchero', 'Huevo con salchicha y arroz', '', 8500.00, true, 'an_co', 15, 1, 'DELETE', '2025-07-05 10:27:18.135617');
INSERT INTO public.historial_plato VALUES (6, 3, 'Sopa de gato', 'Ningún gato es lastimado en la elaboración de este plato', '', 15000.00, true, 'an_co', 3, 1, 'DELETE', '2025-07-05 10:27:18.952171');
INSERT INTO public.historial_plato VALUES (7, 5, 'sancocho de gallina', '', 'dato', 22000.00, true, 'ca_co', 4, 2, 'INSERT', '2025-07-05 10:38:13.405725');
INSERT INTO public.historial_plato VALUES (8, 6, 'sancocho de pescado', '', 'dato', 23000.00, true, 'pa_co', 1, 1, 'INSERT', '2025-07-05 10:41:28.332256');
INSERT INTO public.historial_plato VALUES (9, 5, 'sancocho de gallina', '', 'dato', 22000.00, true, 'ca_co', 4, 2, 'DELETE', '2025-07-05 10:51:10.889908');
INSERT INTO public.historial_plato VALUES (10, 6, 'sancocho de pescado', '', 'dato', 23000.00, true, 'pa_co', 1, 1, 'DELETE', '2025-07-05 10:51:12.564607');
INSERT INTO public.historial_plato VALUES (11, 7, 'Bandeja paisa', '', 'dato', 28000.00, true, 'an_co', 4, 2, 'INSERT', '2025-07-05 11:45:24.570548');
INSERT INTO public.historial_plato VALUES (12, 8, 'Ajiaco santafereño', 'Sopa espesa y cremosa considerada el plato más representativo de Bogotá. Se caracteriza por el uso de tres tipos diferentes de papas que le dan una textura única, y las guascas (hierba aromática) que le proporcionan su sabor distintivo. Es un plato de clima frío, reconfortante y muy nutritivo.', '', 23000.00, true, 'an_co', 1, 1, 'INSERT', '2025-07-05 11:51:54.89456');
INSERT INTO public.historial_plato VALUES (13, 9, 'Tamales tolimenses', 'Envueltos en hojas de plátano, estos tamales son más grandes que los de otras regiones colombianas. La masa de maíz amarillo envuelve un relleno generoso de carnes, verduras y huevo. Es un plato tradicional para ocasiones especiales y fiestas familiares, requiere varias horas de preparación.', 'dato', 22000.00, true, 'an_co', 4, 1, 'INSERT', '2025-07-05 11:58:23.879321');
INSERT INTO public.historial_plato VALUES (14, 10, 'Cocido boyacense', 'Sopa abundante y nutritiva típica del altiplano cundiboyacense. Es un plato de olla que combina múltiples carnes, verduras y tubérculos en un solo caldo sustancioso. Ideal para compartir en familia y perfecto para el clima frío de la región.', 'dato', 21000.00, true, 'an_co', 1, 2, 'INSERT', '2025-07-05 12:01:25.649209');
INSERT INTO public.historial_plato VALUES (15, 11, 'Changüa', 'Sopa tradicional bogotana que se consume principalmente en el desayuno. Es una preparación sencilla pero reconfortante, hecha con leche, agua, huevo y cebolla larga. Se acompaña con pan tostado y representa la comida casera y económica de las familias capitalinas.', 'dato', 11000.00, true, 'an_co', 1, 1, 'INSERT', '2025-07-05 12:04:36.330509');
INSERT INTO public.historial_plato VALUES (16, 12, 'sancocho de gallina', 'Sopa abundante y festiva, considerada el plato más representativo de la Costa Caribe. Se prepara con gallina criolla, múltiples verduras y tubérculos. Es el plato central de reuniones familiares y celebraciones, simbolizando la unión y la tradición costeña.', 'dato', 23000.00, true, 'ca_co', 1, 1, 'INSERT', '2025-07-05 12:07:05.720002');
INSERT INTO public.historial_plato VALUES (17, 13, 'Arroz con coco', 'Arroz dulce y aromático cocinado con leche de coco, típico de la costa Caribe. Tiene un sabor ligeramente dulce y una textura cremosa única. Se puede servir como acompañamiento o plato principal, y es especialmente popular en Cartagena y San Andrés.', 'dato', 9000.00, true, 'ca_co', 17, 2, 'INSERT', '2025-07-05 12:10:11.85573');
INSERT INTO public.historial_plato VALUES (18, 14, 'Arepa de huevo', 'Arepa frita rellena de huevo, originaria de la región Caribe. Se prepara con masa de maíz amarillo, se fríe hasta formar una especie de bolsa y se rellena con huevo crudo que se cocina en su interior. Es un desayuno muy popular y un antojito callejero típico.', 'dato', 10000.00, true, 'ca_co', 11, 2, 'INSERT', '2025-07-05 12:16:37.712221');
INSERT INTO public.historial_plato VALUES (19, 15, 'Cazuela de mariscos', 'Plato festivo que combina diversos mariscos en una preparación cremosa con leche de coco. Representa la abundancia marina del Caribe colombiano y se sirve en ocasiones especiales. Es un plato que requiere ingredientes frescos del mar.', 'dato', 32000.00, true, 'in_co', 4, 3, 'INSERT', '2025-07-05 12:20:39.498552');
INSERT INTO public.historial_plato VALUES (20, 16, 'Carimañolas', 'Fritos tradicionales costeños hechos con masa de yuca y rellenos de carne o queso. Tienen forma alargada y son dorados por fuera, suaves por dentro. Son muy populares como aperitivo o comida callejera, especialmente en Cartagena y el Caribe.', 'dato', 7000.00, true, 'ca_co', 4, 1, 'INSERT', '2025-07-05 12:23:14.899959');
INSERT INTO public.historial_plato VALUES (21, 17, 'Sancocho de Pescado', 'Sopa tradicional de la costa Pacífica preparada con pescado fresco del mar, verduras y tubérculos. Se caracteriza por el uso de hierbas aromáticas locales como la chillangua. Es un plato que refleja la riqueza pesquera de la región.', 'dato', 30000.00, true, 'pa_co', 1, 2, 'INSERT', '2025-07-05 12:28:11.235801');
INSERT INTO public.historial_plato VALUES (22, 18, 'Arroz atollado', 'Arroz cremoso y sustancioso típico del Valle del Cauca. Se cocina con múltiples carnes y verduras hasta lograr una consistencia espesa. Las hojas de bijao le dan un aroma y sabor únicos. Es un plato festivo y familiar.', 'dato', 20000.00, true, 'pa_co', 14, 2, 'INSERT', '2025-07-05 12:30:39.746182');
INSERT INTO public.historial_plato VALUES (23, 19, 'Encocado de jaiba', 'Plato afrodescendiente que combina jaiba en una salsa cremosa de coco. Es representativo de la gastronomía del Pacífico colombiano y refleja la influencia africana en la región. Se caracteriza por su sabor intenso y textura cremosa.', 'dato', 26000.00, true, 'pa_co', 4, 3, 'INSERT', '2025-07-05 12:33:12.274187');
INSERT INTO public.historial_plato VALUES (24, 20, 'Pusandao', 'Guiso contundente de frijoles con plátano, yuca y costilla ahumada. Es un plato tradicional afrocolombiano que representa la comida sustanciosa de las comunidades del Pacífico. Su nombre proviene del proceso de "pusar" o machacar los ingredientes.', 'dato', 16000.00, true, 'pa_co', 23, 2, 'INSERT', '2025-07-05 12:37:04.397073');
INSERT INTO public.historial_plato VALUES (25, 21, 'Pescado sudado', 'Preparación simple pero sabrosa donde el pescado se cocina al vapor con verduras y condimentos. Es una técnica tradicional que preserva el sabor natural del pescado mientras absorbe los aromas de las verduras y hierbas.', 'dato', 22000.00, true, 'pa_co', 23, 2, 'INSERT', '2025-07-05 12:44:38.090475');
INSERT INTO public.historial_plato VALUES (26, 22, 'Mamona', 'Técnica ancestral de asado de ternera muy joven, cocinada lentamente en vara sobre brasas. Es el plato más emblemático de los Llanos Orientales y representa la cultura ganadera llanera. Se asa durante horas hasta lograr una carne tierna y jugosa.', 'dato', 31000.00, true, 'or_co', 10, 2, 'INSERT', '2025-07-05 12:47:07.095185');
INSERT INTO public.historial_plato VALUES (27, 22, 'Mamona', 'Técnica ancestral de asado de ternera muy joven, cocinada lentamente en vara sobre brasas. Es el plato más emblemático de los Llanos Orientales y representa la cultura ganadera llanera. Se asa durante horas hasta lograr una carne tierna y jugosa.', 'dato', 31000.00, true, 'or_co', 10, 2, 'DELETE', '2025-07-05 12:47:38.711334');
INSERT INTO public.historial_plato VALUES (28, 23, 'Mamona', 'Técnica ancestral de asado de ternera muy joven, cocinada lentamente en vara sobre brasas. Es el plato más emblemático de los Llanos Orientales y representa la cultura ganadera llanera. Se asa durante horas hasta lograr una carne tierna y jugosa.', 'dato', 32000.00, true, 'or_co', 10, 2, 'INSERT', '2025-07-05 12:50:27.816199');
INSERT INTO public.historial_plato VALUES (29, 24, 'Cachama Asada', 'Pescado de río típico de los Llanos, asado a la parrilla o en brasas. La cachama es un pez de agua dulce muy apreciado en la región por su carne blanca y sabor suave. Se acompaña tradicionalmente con yuca y plátano.', 'dato', 17000.00, true, 'or_co', 6, 2, 'INSERT', '2025-07-05 12:57:00.580123');
INSERT INTO public.historial_plato VALUES (30, 25, 'Pisillo de Chigüiro', 'Carne de chigüiro (capibara) desmenuzada y salteada con condimentos. Es un plato tradicional de los Llanos que aprovecha la carne de este roedor nativo. Se prepara deshidratando y desmenuzando la carne, similar al tasajo.', 'dato', 38000.00, true, 'or_co', 10, 2, 'INSERT', '2025-07-05 12:59:11.616866');
INSERT INTO public.historial_plato VALUES (31, 26, 'Johnny Cake', 'Pan tradicional isleño, similar al pan de coco. Es esponjoso, ligeramente dulce y se prepara con leche de coco. Es un acompañamiento clásico para comidas y meriendas en San Andrés, heredado de la tradición culinaria anglo-caribeña.', 'dato', 12000.00, true, 'in_co', 19, 3, 'INSERT', '2025-07-05 13:02:31.186266');
INSERT INTO public.historial_plato VALUES (32, 27, 'Casabe', 'Pan plano y crujiente hecho con yuca brava procesada. Es un alimento básico de las comunidades indígenas amazónicas. Se prepara rallando la yuca, extrayendo el veneno y cocinando la harina en un budare hasta formar tortas delgadas.', 'dato', 11000.00, true, 'am_co', 11, 2, 'INSERT', '2025-07-05 13:25:10.020781');
INSERT INTO public.historial_plato VALUES (33, 28, 'Patarashca', 'Pescado envuelto en hojas de bijao y cocinado a la parrilla o al vapor. Es una técnica ancestral amazónica que mantiene la humedad del pescado mientras le da sabores de las hierbas aromáticas. El bijao actúa como papel de aluminio natural.', 'dato', 15000.00, true, 'am_co', 6, 1, 'INSERT', '2025-07-05 13:28:08.585817');
INSERT INTO public.historial_plato VALUES (34, 29, 'Empanada', 'Dumplings de harina de trigo, relleno de carne con especias y saborizantes', '', 5000.00, true, 'an_co', 15, 2, 'INSERT', '2025-07-06 17:22:28.519424');
INSERT INTO public.historial_plato VALUES (35, 7, 'Bandeja paisa', '', 'uploads\bandeja_paisa_20250706.jpg', 28000.00, true, 'an_co', 4, 2, 'UPDATE', '2025-07-06 22:34:15.134402');
INSERT INTO public.historial_plato VALUES (36, 7, 'Bandeja paisa', '', 'uploads\bandeja_paisa_20250706.jpg', 28000.00, true, 'an_co', 4, 2, 'UPDATE', '2025-07-06 22:36:15.570653');
INSERT INTO public.historial_plato VALUES (37, 7, 'Bandeja paisa', '', 'uploads\bandeja_paisa_20250706.jpg', 28000.00, true, 'an_co', 4, 2, 'UPDATE', '2025-07-06 22:38:11.9767');
INSERT INTO public.historial_plato VALUES (38, 8, 'Ajiaco santafereño', 'Sopa espesa y cremosa considerada el plato más representativo de Bogotá. Se caracteriza por el uso de tres tipos diferentes de papas que le dan una textura única, y las guascas (hierba aromática) que le proporcionan su sabor distintivo. Es un plato de clima frío, reconfortante y muy nutritivo.', 'uploads\ajiaco_santafereno_20250706.avif', 23000.00, true, 'an_co', 1, 1, 'UPDATE', '2025-07-06 22:38:25.650899');
INSERT INTO public.historial_plato VALUES (39, 9, 'Tamales tolimenses', 'Envueltos en hojas de plátano, estos tamales son más grandes que los de otras regiones colombianas. La masa de maíz amarillo envuelve un relleno generoso de carnes, verduras y huevo. Es un plato tradicional para ocasiones especiales y fiestas familiares, requiere varias horas de preparación.', 'uploads\tamales_tolimenses_20250706.png', 22000.00, true, 'an_co', 4, 1, 'UPDATE', '2025-07-06 22:38:37.552796');
INSERT INTO public.historial_plato VALUES (40, 10, 'Cocido boyacense', 'Sopa abundante y nutritiva típica del altiplano cundiboyacense. Es un plato de olla que combina múltiples carnes, verduras y tubérculos en un solo caldo sustancioso. Ideal para compartir en familia y perfecto para el clima frío de la región.', 'uploads\cocido_boyacense_20250706.jpg', 21000.00, true, 'an_co', 1, 2, 'UPDATE', '2025-07-06 22:38:50.18911');
INSERT INTO public.historial_plato VALUES (41, 26, 'Johnny Cake', 'Pan tradicional isleño, similar al pan de coco. Es esponjoso, ligeramente dulce y se prepara con leche de coco. Es un acompañamiento clásico para comidas y meriendas en San Andrés, heredado de la tradición culinaria anglo-caribeña.', 'uploads\johnny_cake_20250706.jpg', 12000.00, true, 'in_co', 19, 3, 'UPDATE', '2025-07-06 22:39:22.240446');
INSERT INTO public.historial_plato VALUES (42, 7, 'Bandeja paisa', '', 'uploads/bandeja_paisa_20250706.jpg', 28000.00, true, 'an_co', 4, 2, 'UPDATE', '2025-07-06 22:59:13.696325');
INSERT INTO public.historial_plato VALUES (43, 8, 'Ajiaco santafereño', 'Sopa espesa y cremosa considerada el plato más representativo de Bogotá. Se caracteriza por el uso de tres tipos diferentes de papas que le dan una textura única, y las guascas (hierba aromática) que le proporcionan su sabor distintivo. Es un plato de clima frío, reconfortante y muy nutritivo.', 'uploads/ajiaco_santafereno_20250706.jpg', 23000.00, true, 'an_co', 1, 1, 'UPDATE', '2025-07-06 22:59:32.379598');
INSERT INTO public.historial_plato VALUES (44, 9, 'Tamales tolimenses', 'Envueltos en hojas de plátano, estos tamales son más grandes que los de otras regiones colombianas. La masa de maíz amarillo envuelve un relleno generoso de carnes, verduras y huevo. Es un plato tradicional para ocasiones especiales y fiestas familiares, requiere varias horas de preparación.', 'uploads/tamales_tolimenses_20250706.png', 22000.00, true, 'an_co', 4, 1, 'UPDATE', '2025-07-06 23:01:56.239989');
INSERT INTO public.historial_plato VALUES (45, 10, 'Cocido boyacense', 'Sopa abundante y nutritiva típica del altiplano cundiboyacense. Es un plato de olla que combina múltiples carnes, verduras y tubérculos en un solo caldo sustancioso. Ideal para compartir en familia y perfecto para el clima frío de la región.', 'uploads/cocido_boyacense_20250706.jpg', 21000.00, true, 'an_co', 1, 2, 'UPDATE', '2025-07-06 23:02:09.853782');
INSERT INTO public.historial_plato VALUES (46, 11, 'Changua', 'Sopa tradicional bogotana que se consume principalmente en el desayuno. Es una preparación sencilla pero reconfortante, hecha con leche, agua, huevo y cebolla larga. Se acompaña con pan tostado y representa la comida casera y económica de las familias capitalinas.', 'uploads/changua_20250706.jpg', 11000.00, true, 'an_co', 1, 1, 'UPDATE', '2025-07-06 23:02:25.375637');
INSERT INTO public.historial_plato VALUES (47, 12, 'sancocho de gallina', 'Sopa abundante y festiva, considerada el plato más representativo de la Costa Caribe. Se prepara con gallina criolla, múltiples verduras y tubérculos. Es el plato central de reuniones familiares y celebraciones, simbolizando la unión y la tradición costeña.', 'uploads/sancocho_de_gallina_20250706.jpg', 23000.00, true, 'ca_co', 1, 1, 'UPDATE', '2025-07-06 23:02:37.283899');
INSERT INTO public.historial_plato VALUES (48, 13, 'Arroz con coco', 'Arroz dulce y aromático cocinado con leche de coco, típico de la costa Caribe. Tiene un sabor ligeramente dulce y una textura cremosa única. Se puede servir como acompañamiento o plato principal, y es especialmente popular en Cartagena y San Andrés.', 'uploads/arroz_con_coco_20250706.jpg', 9000.00, true, 'ca_co', 17, 2, 'UPDATE', '2025-07-06 23:02:47.715116');
INSERT INTO public.historial_plato VALUES (49, 14, 'Arepa de huevo', 'Arepa frita rellena de huevo, originaria de la región Caribe. Se prepara con masa de maíz amarillo, se fríe hasta formar una especie de bolsa y se rellena con huevo crudo que se cocina en su interior. Es un desayuno muy popular y un antojito callejero típico.', 'uploads/arepa_de_huevo_20250706.jpg', 10000.00, true, 'ca_co', 11, 2, 'UPDATE', '2025-07-06 23:02:58.959099');
INSERT INTO public.historial_plato VALUES (50, 15, 'Cazuela de mariscos', 'Plato festivo que combina diversos mariscos en una preparación cremosa con leche de coco. Representa la abundancia marina del Caribe colombiano y se sirve en ocasiones especiales. Es un plato que requiere ingredientes frescos del mar.', 'uploads/cazuela_de_mariscos_20250706.jpg', 32000.00, true, 'in_co', 4, 3, 'UPDATE', '2025-07-06 23:03:12.718868');
INSERT INTO public.historial_plato VALUES (51, 15, 'Cazuela de mariscos', 'Plato festivo que combina diversos mariscos en una preparación cremosa con leche de coco. Representa la abundancia marina del Caribe colombiano y se sirve en ocasiones especiales. Es un plato que requiere ingredientes frescos del mar.', 'uploads/cazuela_de_mariscos_20250706.jpg', 32000.00, true, 'in_co', 4, 3, 'UPDATE', '2025-07-06 23:03:13.67318');
INSERT INTO public.historial_plato VALUES (52, 16, 'Carimañolas', 'Fritos tradicionales costeños hechos con masa de yuca y rellenos de carne o queso. Tienen forma alargada y son dorados por fuera, suaves por dentro. Son muy populares como aperitivo o comida callejera, especialmente en Cartagena y el Caribe.', 'uploads/carimanolas_20250706.jpg', 7000.00, true, 'ca_co', 4, 1, 'UPDATE', '2025-07-06 23:03:32.893612');
INSERT INTO public.historial_plato VALUES (53, 17, 'Sancocho de Pescado', 'Sopa tradicional de la costa Pacífica preparada con pescado fresco del mar, verduras y tubérculos. Se caracteriza por el uso de hierbas aromáticas locales como la chillangua. Es un plato que refleja la riqueza pesquera de la región.', 'uploads/sancocho_de_pescado_20250706.jpg', 30000.00, true, 'pa_co', 1, 2, 'UPDATE', '2025-07-06 23:03:45.636008');
INSERT INTO public.historial_plato VALUES (54, 18, 'Arroz atollado', 'Arroz cremoso y sustancioso típico del Valle del Cauca. Se cocina con múltiples carnes y verduras hasta lograr una consistencia espesa. Las hojas de bijao le dan un aroma y sabor únicos. Es un plato festivo y familiar.', 'uploads/arroz_atollado_20250706.jpg', 20000.00, true, 'pa_co', 14, 2, 'UPDATE', '2025-07-06 23:04:20.39089');
INSERT INTO public.historial_plato VALUES (55, 19, 'Encocado de jaiba', 'Plato afrodescendiente que combina jaiba en una salsa cremosa de coco. Es representativo de la gastronomía del Pacífico colombiano y refleja la influencia africana en la región. Se caracteriza por su sabor intenso y textura cremosa.', 'uploads/encocado_de_jaiba_20250706.jpg', 26000.00, true, 'pa_co', 4, 3, 'UPDATE', '2025-07-06 23:04:48.445457');
INSERT INTO public.historial_plato VALUES (56, 20, 'Pusandao', 'Guiso contundente de frijoles con plátano, yuca y costilla ahumada. Es un plato tradicional afrocolombiano que representa la comida sustanciosa de las comunidades del Pacífico. Su nombre proviene del proceso de "pusar" o machacar los ingredientes.', 'uploads/pusandao_20250706.jpg', 16000.00, true, 'pa_co', 23, 2, 'UPDATE', '2025-07-06 23:05:01.342054');
INSERT INTO public.historial_plato VALUES (57, 21, 'Pescado sudado', 'Preparación simple pero sabrosa donde el pescado se cocina al vapor con verduras y condimentos. Es una técnica tradicional que preserva el sabor natural del pescado mientras absorbe los aromas de las verduras y hierbas.', 'uploads/pescado_sudado_20250706.jpg', 22000.00, true, 'pa_co', 23, 2, 'UPDATE', '2025-07-06 23:05:15.390218');
INSERT INTO public.historial_plato VALUES (58, 23, 'Mamona', 'Técnica ancestral de asado de ternera muy joven, cocinada lentamente en vara sobre brasas. Es el plato más emblemático de los Llanos Orientales y representa la cultura ganadera llanera. Se asa durante horas hasta lograr una carne tierna y jugosa.', 'uploads/mamona_20250706.jpg', 32000.00, true, 'or_co', 10, 2, 'UPDATE', '2025-07-06 23:05:36.147592');
INSERT INTO public.historial_plato VALUES (59, 24, 'Cachama Asada', 'Pescado de río típico de los Llanos, asado a la parrilla o en brasas. La cachama es un pez de agua dulce muy apreciado en la región por su carne blanca y sabor suave. Se acompaña tradicionalmente con yuca y plátano.', 'uploads/cachama_asada_20250706.jpg', 17000.00, true, 'or_co', 6, 2, 'UPDATE', '2025-07-06 23:05:48.070999');
INSERT INTO public.historial_plato VALUES (60, 25, 'Pisillo de Chigüiro', 'Carne de chigüiro (capibara) desmenuzada y salteada con condimentos. Es un plato tradicional de los Llanos que aprovecha la carne de este roedor nativo. Se prepara deshidratando y desmenuzando la carne, similar al tasajo.', 'uploads/pisillo_de_chiguiro_20250706.jpg', 38000.00, true, 'or_co', 10, 2, 'UPDATE', '2025-07-06 23:06:02.072977');
INSERT INTO public.historial_plato VALUES (61, 26, 'Johnny Cake', 'Pan tradicional isleño, similar al pan de coco. Es esponjoso, ligeramente dulce y se prepara con leche de coco. Es un acompañamiento clásico para comidas y meriendas en San Andrés, heredado de la tradición culinaria anglo-caribeña.', 'uploads/johnny_cake_20250706.jpg', 12000.00, true, 'in_co', 19, 3, 'UPDATE', '2025-07-06 23:06:15.234225');
INSERT INTO public.historial_plato VALUES (62, 27, 'Casabe', 'Pan plano y crujiente hecho con yuca brava procesada. Es un alimento básico de las comunidades indígenas amazónicas. Se prepara rallando la yuca, extrayendo el veneno y cocinando la harina en un budare hasta formar tortas delgadas.', 'uploads/casabe_20250706.jpg', 11000.00, true, 'am_co', 11, 2, 'UPDATE', '2025-07-06 23:06:29.245021');
INSERT INTO public.historial_plato VALUES (63, 28, 'Patarashca', 'Pescado envuelto en hojas de bijao y cocinado a la parrilla o al vapor. Es una técnica ancestral amazónica que mantiene la humedad del pescado mientras le da sabores de las hierbas aromáticas. El bijao actúa como papel de aluminio natural.', 'uploads/patarashca_20250706.jpg', 15000.00, true, 'am_co', 6, 1, 'UPDATE', '2025-07-06 23:06:40.606908');
INSERT INTO public.historial_plato VALUES (64, 29, 'Empanada', 'Dumplings de harina de trigo, relleno de carne con especias y saborizantes', 'uploads/empanada_20250706.avif', 5000.00, true, 'an_co', 15, 2, 'UPDATE', '2025-07-06 23:07:32.623718');


--
-- Data for Name: historial_region; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.historial_region VALUES (1, 'pa_co', 'Pacífico', 'Carlos Rodríguez', 'UPDATE', '2025-07-05 09:09:56.365586');
INSERT INTO public.historial_region VALUES (2, 'or_co', 'Orinoqía', 'Ana Martínez', 'UPDATE', '2025-07-05 09:10:18.567119');
INSERT INTO public.historial_region VALUES (3, 'am_co', 'Amazonía', 'Luis García', 'UPDATE', '2025-07-05 09:12:19.819911');
INSERT INTO public.historial_region VALUES (4, 'or_co', 'Orinoquía', 'Ana Martínez', 'UPDATE', '2025-07-05 09:12:41.254582');
INSERT INTO public.historial_region VALUES (5, 'an_co', 'Andina', 'Diana López', 'UPDATE', '2025-07-05 09:12:59.582778');
INSERT INTO public.historial_region VALUES (6, 'ca_co', 'Caribe', 'María González', 'UPDATE', '2025-07-05 09:13:21.345441');


--
-- Data for Name: historial_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.historial_usuario VALUES (1, 2, 'Nore', 'scrypt:32768:8:1$nodRk8x3dEYOmKaI$ca0433d141540beffa3654533b4a0cf9964b929b1b8103826cef5db3d7ffb9062501a6be5292c122d29088316b39fb583c52672248bc1f8a3e2027f73ca9993e', 'admin', 'INSERT', '2025-07-04 19:33:30.118547');


--
-- Data for Name: historial_venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.historial_venta VALUES (1, 'VENTA-20250705-CEN-0001', '2025-07-05 21:28:36.118279', 3, 'INSERT', '2025-07-05 21:28:36.118279');
INSERT INTO public.historial_venta VALUES (2, 'VENTA-20250705-CEN-0002', '2025-07-05 21:31:47.498001', 3, 'INSERT', '2025-07-05 21:31:47.498001');
INSERT INTO public.historial_venta VALUES (3, 'VENTA-20250705-CEN-0003', '2025-07-05 21:32:27.233514', 3, 'INSERT', '2025-07-05 21:32:27.233514');
INSERT INTO public.historial_venta VALUES (4, 'VENTA-20250705-CEN-0004', '2025-07-05 21:46:53.46713', 3, 'INSERT', '2025-07-05 21:46:53.46713');
INSERT INTO public.historial_venta VALUES (5, 'VENTA-20250705-CEN-0005', '2025-07-05 21:47:30.516439', 3, 'INSERT', '2025-07-05 21:47:30.516439');
INSERT INTO public.historial_venta VALUES (6, 'VENTA-20250705-CEN-0006', '2025-07-05 21:48:23.038395', 3, 'INSERT', '2025-07-05 21:48:23.038395');
INSERT INTO public.historial_venta VALUES (7, 'VENTA-20250705-CEN-0007', '2025-07-05 21:51:14.442212', 3, 'INSERT', '2025-07-05 21:51:14.442212');
INSERT INTO public.historial_venta VALUES (8, 'VENTA-20250705-CEN-0001', '2025-07-05 21:28:36.118279', 3, 'DELETE', '2025-07-05 22:03:21.74778');
INSERT INTO public.historial_venta VALUES (9, 'VENTA-20250705-CEN-0002', '2025-07-05 21:31:47.498001', 3, 'DELETE', '2025-07-05 22:03:24.856516');
INSERT INTO public.historial_venta VALUES (10, 'VENTA-20250705-CEN-0003', '2025-07-05 21:32:27.233514', 3, 'DELETE', '2025-07-05 22:03:28.320615');
INSERT INTO public.historial_venta VALUES (11, 'VENTA-20250705-CEN-   5', '2025-07-05 22:15:32.812847', 3, 'INSERT', '2025-07-05 22:15:32.812847');
INSERT INTO public.historial_venta VALUES (12, 'VENTA-20250705-CEN-   6', '2025-07-05 22:15:57.056567', 3, 'INSERT', '2025-07-05 22:15:57.056567');
INSERT INTO public.historial_venta VALUES (13, 'VENTA-20250705-CEN-   7', '2025-07-05 22:16:11.13305', 3, 'INSERT', '2025-07-05 22:16:11.13305');
INSERT INTO public.historial_venta VALUES (14, 'VENTA-20250705-CEN-   8', '2025-07-05 22:16:21.265125', 3, 'INSERT', '2025-07-05 22:16:21.265125');
INSERT INTO public.historial_venta VALUES (15, 'VENTA-20250705-CEN-   9', '2025-07-05 22:16:41.615156', 3, 'INSERT', '2025-07-05 22:16:41.615156');
INSERT INTO public.historial_venta VALUES (16, 'VENTA-20250705-CEN-  10', '2025-07-05 22:17:07.046799', 3, 'INSERT', '2025-07-05 22:17:07.046799');
INSERT INTO public.historial_venta VALUES (17, 'VENTA-20250705-CEN-  11', '2025-07-05 22:17:24.862755', 3, 'INSERT', '2025-07-05 22:17:24.862755');
INSERT INTO public.historial_venta VALUES (18, 'VENTA-20250705-CEN-  12', '2025-07-05 22:17:34.76809', 3, 'INSERT', '2025-07-05 22:17:34.76809');
INSERT INTO public.historial_venta VALUES (19, 'VENTA-20250705-CEN-  13', '2025-07-05 22:18:07.193522', 3, 'INSERT', '2025-07-05 22:18:07.193522');
INSERT INTO public.historial_venta VALUES (20, 'VENTA-20250705-CEN-  14', '2025-07-05 22:20:17.852706', 3, 'INSERT', '2025-07-05 22:20:17.852706');
INSERT INTO public.historial_venta VALUES (21, 'VENTA-20250705-CEN-  15', '2025-07-05 22:23:42.540769', 3, 'INSERT', '2025-07-05 22:23:42.540769');
INSERT INTO public.historial_venta VALUES (22, 'VENTA-20250705-DES-   1', '2025-07-05 22:25:44.207114', 1, 'INSERT', '2025-07-05 22:25:44.207114');
INSERT INTO public.historial_venta VALUES (23, 'VENTA-20250705-DES-   2', '2025-07-05 22:25:55.075815', 1, 'INSERT', '2025-07-05 22:25:55.075815');
INSERT INTO public.historial_venta VALUES (24, 'VENTA-20250705-DES-   3', '2025-07-05 22:26:09.379954', 1, 'INSERT', '2025-07-05 22:26:09.379954');
INSERT INTO public.historial_venta VALUES (25, 'VENTA-20250705-DES-   4', '2025-07-05 22:26:27.919255', 1, 'INSERT', '2025-07-05 22:26:27.919255');
INSERT INTO public.historial_venta VALUES (26, 'VENTA-20250705-DES-   5', '2025-07-05 22:26:39.794836', 1, 'INSERT', '2025-07-05 22:26:39.794836');
INSERT INTO public.historial_venta VALUES (27, 'VENTA-20250705-DES-   6', '2025-07-05 22:26:54.34842', 1, 'INSERT', '2025-07-05 22:26:54.34842');
INSERT INTO public.historial_venta VALUES (28, 'VENTA-20250705-DES-   7', '2025-07-05 22:26:54.635089', 1, 'INSERT', '2025-07-05 22:26:54.635089');
INSERT INTO public.historial_venta VALUES (29, 'VENTA-20250705-DES-   8', '2025-07-05 22:27:03.551077', 1, 'INSERT', '2025-07-05 22:27:03.551077');
INSERT INTO public.historial_venta VALUES (30, 'VENTA-20250705-DES-   9', '2025-07-05 22:27:15.308732', 1, 'INSERT', '2025-07-05 22:27:15.308732');
INSERT INTO public.historial_venta VALUES (31, 'VENTA-20250705-DES-  10', '2025-07-05 22:27:26.530201', 1, 'INSERT', '2025-07-05 22:27:26.530201');
INSERT INTO public.historial_venta VALUES (32, 'VENTA-20250705-DES-  11', '2025-07-05 22:27:36.910856', 1, 'INSERT', '2025-07-05 22:27:36.910856');
INSERT INTO public.historial_venta VALUES (33, 'VENTA-20250705-DES-  12', '2025-07-05 22:27:42.194632', 1, 'INSERT', '2025-07-05 22:27:42.194632');
INSERT INTO public.historial_venta VALUES (34, 'VENTA-20250705-DES-  13', '2025-07-05 22:27:54.575314', 1, 'INSERT', '2025-07-05 22:27:54.575314');
INSERT INTO public.historial_venta VALUES (35, 'VENTA-20250705-DES-  14', '2025-07-05 22:28:03.898192', 1, 'INSERT', '2025-07-05 22:28:03.898192');
INSERT INTO public.historial_venta VALUES (36, 'VENTA-20250705-DES-  15', '2025-07-05 22:28:13.907772', 1, 'INSERT', '2025-07-05 22:28:13.907772');
INSERT INTO public.historial_venta VALUES (37, 'VENTA-20250705-DES-  16', '2025-07-05 22:28:28.856395', 1, 'INSERT', '2025-07-05 22:28:28.856395');
INSERT INTO public.historial_venta VALUES (38, 'VENTA-20250705-DES-  17', '2025-07-05 22:28:38.71139', 1, 'INSERT', '2025-07-05 22:28:38.71139');
INSERT INTO public.historial_venta VALUES (39, 'VENTA-20250705-DES-  18', '2025-07-05 22:28:46.126248', 1, 'INSERT', '2025-07-05 22:28:46.126248');
INSERT INTO public.historial_venta VALUES (40, 'VENTA-20250705-DES-  19', '2025-07-05 22:28:57.700926', 1, 'INSERT', '2025-07-05 22:28:57.700926');
INSERT INTO public.historial_venta VALUES (41, 'VENTA-20250705-CEN-  16', '2025-07-05 22:29:07.881558', 3, 'INSERT', '2025-07-05 22:29:07.881558');
INSERT INTO public.historial_venta VALUES (42, 'VENTA-20250705-CEN-  17', '2025-07-05 22:29:08.14634', 3, 'INSERT', '2025-07-05 22:29:08.14634');
INSERT INTO public.historial_venta VALUES (43, 'VENTA-20250705-CEN-  18', '2025-07-05 22:29:17.734378', 3, 'INSERT', '2025-07-05 22:29:17.734378');
INSERT INTO public.historial_venta VALUES (44, 'VENTA-20250705-CEN-  19', '2025-07-05 22:29:28.599837', 3, 'INSERT', '2025-07-05 22:29:28.599837');
INSERT INTO public.historial_venta VALUES (45, 'VENTA-20250705-CEN-  20', '2025-07-05 22:29:32.609005', 3, 'INSERT', '2025-07-05 22:29:32.609005');
INSERT INTO public.historial_venta VALUES (46, 'VENTA-20250705-ALM-   1', '2025-07-05 22:30:46.98027', 2, 'INSERT', '2025-07-05 22:30:46.98027');
INSERT INTO public.historial_venta VALUES (47, 'VENTA-20250705-ALM-   2', '2025-07-05 22:30:51.830699', 2, 'INSERT', '2025-07-05 22:30:51.830699');
INSERT INTO public.historial_venta VALUES (48, 'VENTA-20250705-ALM-   3', '2025-07-05 22:30:52.002018', 2, 'INSERT', '2025-07-05 22:30:52.002018');
INSERT INTO public.historial_venta VALUES (49, 'VENTA-20250705-ALM-   4', '2025-07-05 22:31:11.372596', 2, 'INSERT', '2025-07-05 22:31:11.372596');
INSERT INTO public.historial_venta VALUES (50, 'VENTA-20250705-ALM-   5', '2025-07-05 22:31:21.176966', 2, 'INSERT', '2025-07-05 22:31:21.176966');
INSERT INTO public.historial_venta VALUES (51, 'VENTA-20250705-ALM-   6', '2025-07-05 22:31:25.847686', 2, 'INSERT', '2025-07-05 22:31:25.847686');
INSERT INTO public.historial_venta VALUES (52, 'VENTA-20250705-ALM-   7', '2025-07-05 22:31:36.877101', 2, 'INSERT', '2025-07-05 22:31:36.877101');
INSERT INTO public.historial_venta VALUES (53, 'VENTA-20250705-ALM-   8', '2025-07-05 22:31:45.546361', 2, 'INSERT', '2025-07-05 22:31:45.546361');
INSERT INTO public.historial_venta VALUES (54, 'VENTA-20250705-ALM-   9', '2025-07-05 22:31:56.099135', 2, 'INSERT', '2025-07-05 22:31:56.099135');
INSERT INTO public.historial_venta VALUES (55, 'VENTA-20250705-ALM-  10', '2025-07-05 22:32:04.111077', 2, 'INSERT', '2025-07-05 22:32:04.111077');
INSERT INTO public.historial_venta VALUES (56, 'VENTA-20250705-ALM-  11', '2025-07-05 22:32:09.776896', 2, 'INSERT', '2025-07-05 22:32:09.776896');
INSERT INTO public.historial_venta VALUES (57, 'VENTA-20250705-ALM-  12', '2025-07-05 22:32:16.300293', 2, 'INSERT', '2025-07-05 22:32:16.300293');
INSERT INTO public.historial_venta VALUES (58, 'VENTA-20250705-ALM-  13', '2025-07-05 22:32:27.060329', 2, 'INSERT', '2025-07-05 22:32:27.060329');
INSERT INTO public.historial_venta VALUES (59, 'VENTA-20250705-ALM-  14', '2025-07-05 22:32:35.012413', 2, 'INSERT', '2025-07-05 22:32:35.012413');
INSERT INTO public.historial_venta VALUES (60, 'VENTA-20250705-ALM-  15', '2025-07-05 22:32:44.113791', 2, 'INSERT', '2025-07-05 22:32:44.113791');
INSERT INTO public.historial_venta VALUES (61, 'VENTA-20250705-ALM-  16', '2025-07-05 22:32:52.476193', 2, 'INSERT', '2025-07-05 22:32:52.476193');
INSERT INTO public.historial_venta VALUES (62, 'VENTA-20250705-ALM-  17', '2025-07-05 22:33:03.110881', 2, 'INSERT', '2025-07-05 22:33:03.110881');
INSERT INTO public.historial_venta VALUES (63, 'VENTA-20250705-ALM-  18', '2025-07-05 22:33:10.622931', 2, 'INSERT', '2025-07-05 22:33:10.622931');
INSERT INTO public.historial_venta VALUES (64, 'VENTA-20250705-ALM-  19', '2025-07-05 22:33:22.185519', 2, 'INSERT', '2025-07-05 22:33:22.185519');
INSERT INTO public.historial_venta VALUES (65, 'VENTA-20250705-ALM-  20', '2025-07-05 22:33:30.651687', 2, 'INSERT', '2025-07-05 22:33:30.651687');
INSERT INTO public.historial_venta VALUES (66, 'VENTA-20250705-ALM-  21', '2025-07-05 22:33:36.965028', 2, 'INSERT', '2025-07-05 22:33:36.965028');
INSERT INTO public.historial_venta VALUES (67, 'VENTA-20250705-ALM-  22', '2025-07-05 22:33:46.909454', 2, 'INSERT', '2025-07-05 22:33:46.909454');
INSERT INTO public.historial_venta VALUES (68, 'VENTA-20250705-ALM-  23', '2025-07-05 22:33:55.373829', 2, 'INSERT', '2025-07-05 22:33:55.373829');
INSERT INTO public.historial_venta VALUES (69, 'VENTA-20250705-ALM-  24', '2025-07-05 22:34:10.40826', 2, 'INSERT', '2025-07-05 22:34:10.40826');
INSERT INTO public.historial_venta VALUES (70, 'VENTA-20250706-ALM-   1', '2025-07-06 16:29:22.032958', 2, 'INSERT', '2025-07-06 16:29:22.032958');
INSERT INTO public.historial_venta VALUES (71, 'VENTA-20250706-CEN-   1', '2025-07-06 21:00:36.947064', 3, 'INSERT', '2025-07-06 21:00:36.947064');
INSERT INTO public.historial_venta VALUES (72, 'VENTA-20250706-CEN-   2', '2025-07-06 21:10:58.052968', 3, 'INSERT', '2025-07-06 21:10:58.052968');
INSERT INTO public.historial_venta VALUES (73, 'VENTA-20250706-CEN-   3', '2025-07-06 21:13:11.17224', 3, 'INSERT', '2025-07-06 21:13:11.17224');
INSERT INTO public.historial_venta VALUES (74, 'VENTA-20250707-CEN-   1', '2025-07-07 01:10:11.045502', 3, 'INSERT', '2025-07-07 01:10:11.045502');
INSERT INTO public.historial_venta VALUES (75, 'VENTA-20250707-CEN-   2', '2025-07-07 01:14:18.823008', 3, 'INSERT', '2025-07-07 01:14:18.823008');
INSERT INTO public.historial_venta VALUES (76, 'VENTA-20250707-CEN-   3', '2025-07-07 01:15:09.544759', 3, 'INSERT', '2025-07-07 01:15:09.544759');
INSERT INTO public.historial_venta VALUES (77, 'VENTA-20250707-CEN-   4', '2025-07-07 01:16:16.350179', 3, 'INSERT', '2025-07-07 01:16:16.350179');
INSERT INTO public.historial_venta VALUES (78, 'VENTA-20250707-CEN-   5', '2025-07-07 01:25:49.56455', 3, 'INSERT', '2025-07-07 01:25:49.56455');


--
-- Data for Name: ofrecer; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuario VALUES (1, 'Master', 'pbkdf2:sha256:1000000$qOhsubRV$60bb580f7208152de0e259188fd6bef65695d64b8fa891d8106d28cb91b84e28', 'admin');
INSERT INTO public.usuario VALUES (2, 'Nore', 'scrypt:32768:8:1$nodRk8x3dEYOmKaI$ca0433d141540beffa3654533b4a0cf9964b929b1b8103826cef5db3d7ffb9062501a6be5292c122d29088316b39fb583c52672248bc1f8a3e2027f73ca9993e', 'admin');


--============ INSERTS A==============---


--=== REACTIVACION DE TRIGGERS ===---
-- Activar triggers de auditoría e IDs
ALTER TABLE categoria ENABLE TRIGGER trigger_categoria_auditoria;
ALTER TABLE carta ENABLE TRIGGER trigger_carta_auditoria;
ALTER TABLE plato ENABLE TRIGGER trigger_plato_auditoria;
ALTER TABLE region ENABLE TRIGGER trigger_region_auditoria;
ALTER TABLE usuario ENABLE TRIGGER trigger_usuario_auditoria;
ALTER TABLE ingrediente ENABLE TRIGGER trigger_ingrediente_auditoria;
ALTER TABLE venta ENABLE TRIGGER trigger_venta_auditoria;

-- Activar triggers de generación de IDs
ALTER TABLE carta ENABLE TRIGGER trigger_id_carta;
ALTER TABLE venta ENABLE TRIGGER trigger_generar_id_venta;
ALTER TABLE region ENABLE TRIGGER trigger_generar_id_region;

