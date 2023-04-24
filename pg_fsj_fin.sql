--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-04-25 00:33:15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16560)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16559)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 214
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 217 (class 1259 OID 16567)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16566)
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_id_seq OWNER TO postgres;

--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 216
-- Name: image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;


--
-- TOC entry 219 (class 1259 OID 16574)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16573)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 218
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 221 (class 1259 OID 16581)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16580)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO postgres;

--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 220
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- TOC entry 223 (class 1259 OID 16590)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16600)
-- Name: product_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);


ALTER TABLE public.product_cart OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16599)
-- Name: product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_cart_id_seq OWNER TO postgres;

--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 224
-- Name: product_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;


--
-- TOC entry 222 (class 1259 OID 16589)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 222
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 3198 (class 2604 OID 16563)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3199 (class 2604 OID 16570)
-- Name: image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);


--
-- TOC entry 3200 (class 2604 OID 16577)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3201 (class 2604 OID 16584)
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- TOC entry 3202 (class 2604 OID 16593)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 3203 (class 2604 OID 16603)
-- Name: product_cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);


--
-- TOC entry 3368 (class 0 OID 16560)
-- Dependencies: 215
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name) FROM stdin;
1	Мебель
2	Одежда
3	Бытовая техника
\.


--
-- TOC entry 3370 (class 0 OID 16567)
-- Dependencies: 217
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.image (id, file_name, product_id) FROM stdin;
1	0328a73e-893e-4946-9712-33d378400027.1.jpg	1
2	72eae59d-65cd-4d7d-bf91-6a84d34a3483.2.jpg	1
3	46a18c41-a14e-4e80-8037-b019ef7668b7.3.jpg	1
4	cafcf6b6-c6fb-43d0-84f0-ccd7101dc0e3.4.jpg	1
5	1b7dc7aa-1e62-4384-a3c8-f62e4ebc101a.5.jpg	1
6	cb943d42-4e5d-40be-8d22-3223a4cf8ab8.1.jpg	2
7	6843d748-af04-4adc-b3ce-70b7583f5f6f.2.jpg	2
8	be88766a-a8f5-43da-bc4f-227b1fce255d.3.jpg	2
9	feece201-3b28-47ee-8d43-27916f80ebd5.4.jpg	2
10	13f886b0-e337-45d2-bfc8-d211fc8c3f21.5.jpg	2
11	918f2bfa-1509-429f-817c-b431f3678dae.1.jpeg	3
12	e815187b-6f2f-4b59-854a-4c0490627c8f.2.jpg	3
13	a57e8f2f-2e77-419c-802b-b588e497700a.3.jpg	3
14	7381d7e4-673e-4d2b-bbfb-2ec15d5a46ac.4.jpg	3
15	3765f37c-6b00-4da4-9a21-1d2a20fb1edb.5.jpg	3
16	881be769-1a78-4f54-86ff-5d461d5f0eff.1.jpg	4
17	5d96656e-14fe-44e2-a509-e7cc8ed09ad7.2.jpg	4
18	d865a4c4-fc60-4018-9ae1-3ee0a69f4893.3.jpg	4
19	34365cd0-9157-4d15-84e2-66b0823192f5.4.jpg	4
20	98c2da1a-765d-4b5f-b5af-7bcfab9570d8.5.jpg	4
21	ba2e8fd7-35ba-420b-84ec-22840a094993.1.jpg	5
22	e9014f30-5436-4063-8e76-f1cbea803a2e.2.jpg	5
23	bad28691-f199-4e35-a89f-b32ea9f8cca7.3.jpg	5
24	767c194b-5183-4815-9238-c98a750db6ef.4.jpg	5
25	278e4598-4a26-44a0-8571-f84228328c56.5.jpg	5
26	f6c9f9a2-3a02-40fc-b48b-3b8117d406a9.1 (1).jpg	6
27	031f2df5-5b19-4820-9e7d-9d24ba8606c8.2.jpg	6
28	0926e278-d5d5-4382-aaf5-bd2941effe72.3.jpg	6
29	78b69246-2443-45e4-ad70-7b2ccaa24bcb.4.jpg	6
30	973687e7-1750-4898-9f12-74c704a9330d.5.jpg	6
31	69d722c8-70e6-4553-ab05-2de71465ebc2.1 .jpeg	7
32	d06d4e32-3744-4408-9fce-6e9cb95af1b3.2.jpg	7
33	dee8b81e-c0e5-442a-aa67-f0495718fad4.3.jpg	7
34	1181af65-88ab-4f34-92ce-7357ff26ce90.4.jpg	7
35	b6bd380b-410c-49f9-a4bf-749ee3ebb399.5.jpg	7
36	dd5b28c4-770e-4dd2-aec5-8bb7e8a6004e.1.jpg	8
37	276a6d49-7706-4268-a1e8-4e1e5744fb0f.2.jpeg	8
38	4419bf47-adb2-47dc-9d16-015396bc395a.3.jpg	8
39	bfe22c85-f12a-41fb-b85b-d311cbf3c2ff.4.jpeg	8
40	461f0872-f89f-450f-bb0d-ced63476aa03.5.jpg	8
41	bad091f4-5c7c-4767-b00b-30ba23f16ae1.1.jpg	9
42	a0ae8e32-a14d-4e41-8f68-e7172ed87212.2.jpg	9
43	aec26068-b6a7-46f5-b46b-d12bdcd195d9.3.jpg	9
44	6a53638b-4a2f-438e-95cc-ced7431a67c9.4.jpg	9
45	2a54271c-db57-4b9b-8e88-e9d5538b2679.5.jpg	9
\.


--
-- TOC entry 3372 (class 0 OID 16574)
-- Dependencies: 219
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, count, date_time, number, price, status, person_id, product_id) FROM stdin;
1	1	2023-04-24 22:57:02.265293	e70eee73-5d08-4103-b809-8d0c0ad27469	3960	1	1	1
2	1	2023-04-24 22:57:02.295094	e70eee73-5d08-4103-b809-8d0c0ad27469	2520	1	1	2
\.


--
-- TOC entry 3374 (class 0 OID 16581)
-- Dependencies: 221
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person (id, login, password, role) FROM stdin;
1	user1	$2a$10$OlwD20EPNicvWe98jQTIFeWhKUiLQM.VLCy2ZEoJY97vmuEK8fWZ2	ROLE_USER
3	admin2	$2a$10$7igl7usVrkqJlQt6uhAmru45YavhfvO9CNNf7WIEBJAINXCrAgWa2	ROLE_USER
2	admin1	$2a$10$Z6lYs/o4EJT5hHjNc9ytmuvPv9Dv1crYYqZZsW7wayWjSPZsqpsAC	ROLE_ADMIN
\.


--
-- TOC entry 3376 (class 0 OID 16590)
-- Dependencies: 223
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, date_time, description, price, seller, title, warehouse, category_id) FROM stdin;
1	2023-04-24 21:31:37.658401	Размеры (ШхГхВ): 75,2х43х75 см. Комод неотъемлемая часть мебели квартиры или дома. Комод деревянный Ксения станет надежным помощником в хранении вещей. Комод для хранения представлен в нескольких цветах: белый, крафт белый, серый, дуб сонома и бук, что позволит вписать в интерьер комнаты и сочетать с другой мебелью в доме. Комод для вещей идет в двух вариантах: с ручками и без них. Во втором варианте в комоде убраны ручки и удлинен фасад, за который и происходит открывание. Универсальность тумбы позволяет использовать ее, как детскую мебель в комнате вашего ребенка, в четырех больших ящиках поместятся игрушки и вещи. Поставьте его вместе с письменным столом Альянс арт. 100243145 в детской и он станет помощником в хранении учебников, тетрадей и канцелярии. В спальне он выступит как тумба для ТВ. А поставив в прихожей, комод Ксения будет сочетаться с обувницей Грация арт. 114272890 и настенной вешалкой Глория арт. 73452816. Мебельная фабрика «Стендмебель» использует только высококачественные материалы и фурнитуру, мы заботимся о наших покупателях и хотим, чтобы наша мебель прослужила Вам как можно дольше. Мы делаем все возможное, чтобы наша продукция доезжала даже в самые дальние уголки нашей страны целой и радовало Вас, для этого мы упаковываем нашу продукцию в картон, а по периметру укрепляем упаковку пенопластом. Для сборки Вам понадобится отвертка или шуроповерт, ключ шестигранник идет в комплекте. Гарантия: 12 месяцев	3960	Стендмебель - фабрика мебели	Стендмебель Комод с ящиками Ксения СТМ для вещей	Коледино	1
2	2023-04-24 21:35:06.048132	Размеры (ШхГхВ): 60х25,6х75 смНаша обувница Джулия станет прекрасным решением для удобного хранения обуви в прихожей, создав комфорт и чистоту в Вашем доме. Основное преимущество данной модели - её компактные размеры, позволяющие сэкономить несколько квадратных метров пола прихожей даже небольшой квартиры, обувная полка подойдет для хранения мужской, женской и детской обуви. Благодаря классическому дизайну, универсальности и актуальным цветовым решениям этажерка для обуви отлично дополнит Ваш комплект мебели любого стиля. Обувница в прихожую или как ее еще называют, галошница оснащена изолированной полочкой под аксессуары, которая станет незаменимой для домашних мелочей, ключей, перчаток, шапок, шарфов или предметов по уходу за обувью. В закрытом состоянии используйте её, чтобы поставить сумочку или пакет, положить зонт. Обувница белая, как и другие цвета имеет три наклонные полки для обуви в прихожую общей вместимостью до 9 пар обуви. Обувница для обуви сделана из сертифицированных и высококачественных ЛДСП, поэтому она прослужит Вам не один год. Собрать полки для обуви легко в домашних условиях. К набору прилагается подробная инструкция по сборке. Габаритные размеры обувницы (ШхВхГ) 60х25,6х75 см. Так же предлагаем другие наши товары бренда Стендмебель: Вешалка Глория артикул 73452816, Обувница Дина артикул 73474145, Вешалка Грация-2 артикул 112396129.	2520	Стендмебель - фабрика мебели	Стендмебель Обувница Джулия СТМ, тумба для обуви	Коледино	1
3	2023-04-24 21:36:09.430822	Размеры (ШхГхВ): 100х38,6х74,6 см Компьютерный стол Софи привлекает своей функциональностью, строгим дизайном и высоким уровнем прочности. Наш стол выполнен в трех цветах поэтому для него найдется место в любой комнате Вашего дома. Может использоваться как детский, компьютерный столик для учебы и отдыха или в кабинет и использовать его как рабочий стол. Вы можете расставить на него косметику и использовать как туалетный столик в спальню. В открытые полочки можно положить не только любимые книги и игрушки, но и различную мелочь для дома. Так же стол отлично впишется в любой офис и станет удобным рабочим местом для сотрудника. Модели обладают стандартной высотой, которая обеспечит вам и вашему ребенку комфортную посадку. Для стола используются сертифицированные, высококачественные ЛДСП, поэтому наша мебель прослужит вам не один год. К набору прилагается подробная инструкция по сборке.	3000	Стендмебель - фабрика мебели	Стендмебель Стол письменный Софи СТМ, компьютерный	Коледино	1
4	2023-04-24 21:37:14.475455	Джинсы молодежные на лето и осень - незаменимая вещь современного модного базового мужского гардероба. Удобные и функциональные - эти штаны брюки используются в качестве рабочей одежды, для дома, для спорта, для бега. Разнообразие моделей джинсовых брюк широкое: трубы, бананы, бойфренды, джоггеры, slim, бриджи, мотоджинсы. Особой популярностью пользуются прямые и зауженные к низу классические джинсы со средней и высокой посадкой. В коллекции бренда EREMES представлены синие голубые джинсы для мужчин высокого роста ( до 190 см), отлично сочетаются с рубашкой, толстовкой, худи, пиджаком и водолазкой. Модель штанов классического прямого кроя, застежка молния и шарнирная пуговица, накладные карманы сзади, штаны не зауженные, без флиса. Идеальная посадка обеспечена за счет точных лекал с фабрик Турции. Штаны подойдут обладателям больших размеров и высоким мальчикам подросткам. В них удобно водить автомобиль и мотоцикл. Мужские брюки комфортно носить в летний период. Подарок любимому другу папе. Турецкие джинсы мужские прямые широкие штаны классика брюки для невысоких мужская одежда для мальчиков рваные американки брюки с карманами без утепления скинни осень зима casual слоучи момы из плотного денима skinny с потертостями спортивки оверсайз стрейч светлые узкие молодежные слим большие зимние потертые по бокам больших размеров летние брюки	1450	EREMES	Eremes Джинсы мужские прямые классические	Коледино	2
5	2023-04-24 21:38:12.940655	Футболка мужская хлопок спортивная однотонная базовая модная свободная пляжная с коротким рукавом. Стильная хлопковая футболка классического кроя - это вещь унисекс, которая подойдет и мужчинам, и женщинам. СОСТАВ: ХЛОПОК 100% ПЛОТНОСТЬ 180 гр/мк в. Молодежная женская и мужская футболка выполнена из плотной хлопковой ткани и имеет круглый вырез горловины. Удлиненная футболка подходит для отдыха, туризма и занятий спортом: фитнеса, йоги, бега и тренировок в зале. В ней можно отправиться на прогулку в город. Базовая футболка вписывается в школьную форму и офисный стиль. Ее можно носить дома или надеть в школу и на работу в офис под пиджак. Трикотажная футболка оптимальна для носки летом. Она является базовой вещью и будет прекрасно сочетаться со всеми вещами в вашем гардеробе, в том числе в стиле оверсайз. Красивая футболка подойдет парням и девушкам любого роста - высоким и невысоким. Ее могут носить взрослые и подростки. В ассортименте большой выбор ярких цветов. Вы можете подарить ее на день рождения любимому мужу, маме, брату или папе. У нас есть акции и распродажи, вы можете купить наши товары в подарок со скидкой!	338	UZcotton	UZcotton Футболка мужская хлопок спортивная однотонная базовая	Коледино	2
6	2023-04-24 21:39:09.16099	Мужская футбольная куртка для тренировок в прохладную погоду. Утепленная модель дополнена стегаными вставками на подкладке и рукавах. Застежка на молнию и глубокий прилегающий капюшон. Современный приталенный крой.	11249	ВАЙЛДБЕРРИЗ	adidas Куртка	Коледино	2
7	2023-04-24 22:04:28.314267	Описание: **5 в 1: Планетарный миксер с 3-мя насадками, Блендер, Мясорубка. Технология SmartMIX - прибор автоматически подбирает оптимальную мощность работы для каждого вида и количества ингредиентов. Технология PROtect+ защита двигателя от перегрева.** Надёжная конструкция со стальными шестернями. Планетарное вращение насадок. Чаша из нержавеющей стали. Объем чаши 5 л. 6 скоростных режимов. Плавная регулировка скорости. Импульсивный режим. Венчик для взбивания. Насадка для смешивания. Крюк для замешивания теста. Крышка чаши для добавления ингредиентов. Мясорубка: 2 диска из нержавеющей стали (5 и 7 мм). Кувшин блендера из высокопрочного стекла объемом 1,5 л.Низкий уровень шума. Система безопасного включения. Защита двигателя от перегрева. Отсек для намотки сетевого шнура. Прорезиненные ножки. Мощность: 1100 Вт.	10999	ВАЙЛДБЕРРИЗ	Polaris Планетарный миксер / Кухонная машина PKM 1104, (POLARIS)	Коледино	3
8	2023-04-24 22:05:23.977319	Беспроводной ручной портативный пылесос отлично подойдет для уборки различных помещений. В комплекте присутствуют фильтр, вертикальный стакан или контейнер для воды, есть насадки, но набор идет без мешка. Присутствует 3 бака для воды. В одном вода очищается, в другом - хранится в чистом виде, а в третий - поступает грязная. Также есть функция самоочистки пылесоса. И сухая, и влажная уборка с ним станут намного проще и быстрее. Щетка имеет мощный аккумулятор и работает на батарейка. Компактный мобильный пылесос может использоваться как швабра. Моющий прибор хорошо подойдет для уборки шерсти с дивана, чистки ковров, для пыли и грязи, или просто для мытья полов. Мобильный аккумуляторный пылесос очень хороший помощник для дома.	17995	Официальный магазин Polaris	Redkey Вертикальный пылесос , моющий пылесос	Коледино	3
9	2023-04-24 22:06:22.705612	Новая стиральная машина ATLANT серии INTENSE EXPERT имеет уникальный дизайн, который прекрасно дополнит любой интерьер своим внешним видом. С помощью новых сенсорных технологий достаточно легкого касания для выбора функций и программ. Светодиодные индикаторы и сегментный дисплей машины размещены на панели управления под небольшим углом, что облегчает визуальное восприятие отображаемой информации о работе машины. Благодаря интеллектуальным программам она не только интуитивно понятна в управлении, но и обеспечивает превосходные результаты стирки при низком потреблении воды и электроэнергии. Кроме того, действует увеличенная гарантия 5 лет на двигатель.	33615	ВАЙЛДБЕРРИЗ	ATLANT Стиральная машина CMA-80 C 1214-01	Коледино	3
\.


--
-- TOC entry 3378 (class 0 OID 16600)
-- Dependencies: 225
-- Data for Name: product_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_cart (id, person_id, product_id) FROM stdin;
\.


--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 214
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 3, true);


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 216
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 45, true);


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 218
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 2, true);


--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 220
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 3, true);


--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 224
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 2, true);


--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 222
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 9, true);


--
-- TOC entry 3206 (class 2606 OID 16565)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3208 (class 2606 OID 16572)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 16579)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 16588)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3218 (class 2606 OID 16605)
-- Name: product_cart product_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3214 (class 2606 OID 16598)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3216 (class 2606 OID 16607)
-- Name: product uk_qka6vxqdy1dprtqnx9trdd47c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);


--
-- TOC entry 3220 (class 2606 OID 16613)
-- Name: orders fk1b0m4muwx1t377w9if3w6wwqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3222 (class 2606 OID 16623)
-- Name: product fk1mtsbur82frn64de7balymq9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3221 (class 2606 OID 16618)
-- Name: orders fk787ibr3guwp6xobrpbofnv7le; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3219 (class 2606 OID 16608)
-- Name: image fkgpextbyee3uk9u6o2381m7ft1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3223 (class 2606 OID 16633)
-- Name: product_cart fkhpnrxdy3jhujameyod08ilvvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3224 (class 2606 OID 16628)
-- Name: product_cart fksgnkc1ko2i1o9yr2p63ysq3rn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);


-- Completed on 2023-04-25 00:33:16

--
-- PostgreSQL database dump complete
--

