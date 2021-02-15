--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.8
-- Dumped by pg_dump version 9.5.14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: btree_gist; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;


--
-- Name: EXTENSION btree_gist; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION btree_gist IS 'support for indexing common datatypes in GiST';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO ufuzkvvbfcklbmlhigws;

--
-- Name: meals; Type: TABLE; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

CREATE TABLE public.meals (
    id bigint NOT NULL,
    title character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    photo character varying,
    veggie boolean DEFAULT false,
    ingredients text,
    allergens character varying
);


ALTER TABLE public.meals OWNER TO ufuzkvvbfcklbmlhigws;

--
-- Name: meals_id_seq; Type: SEQUENCE; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

CREATE SEQUENCE public.meals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meals_id_seq OWNER TO ufuzkvvbfcklbmlhigws;

--
-- Name: meals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

ALTER SEQUENCE public.meals_id_seq OWNED BY public.meals.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    paid_at timestamp without time zone,
    serving_id bigint,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pro_expense boolean DEFAULT false
);


ALTER TABLE public.orders OWNER TO ufuzkvvbfcklbmlhigws;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO ufuzkvvbfcklbmlhigws;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO ufuzkvvbfcklbmlhigws;

--
-- Name: servings; Type: TABLE; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

CREATE TABLE public.servings (
    id bigint NOT NULL,
    best_before timestamp without time zone,
    price double precision,
    quantity integer,
    meal_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.servings OWNER TO ufuzkvvbfcklbmlhigws;

--
-- Name: servings_id_seq; Type: SEQUENCE; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

CREATE SEQUENCE public.servings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.servings_id_seq OWNER TO ufuzkvvbfcklbmlhigws;

--
-- Name: servings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

ALTER SEQUENCE public.servings_id_seq OWNED BY public.servings.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    admin boolean DEFAULT false,
    slack_name character varying,
    invitation_token character varying,
    invitation_created_at timestamp without time zone,
    invitation_sent_at timestamp without time zone,
    invitation_accepted_at timestamp without time zone,
    invitation_limit integer,
    invited_by_type character varying,
    invited_by_id bigint,
    invitations_count integer DEFAULT 0,
    slack_id character varying,
    pro_expenses boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO ufuzkvvbfcklbmlhigws;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO ufuzkvvbfcklbmlhigws;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

ALTER TABLE ONLY public.meals ALTER COLUMN id SET DEFAULT nextval('public.meals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

ALTER TABLE ONLY public.servings ALTER COLUMN id SET DEFAULT nextval('public.servings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2018-08-21 16:47:39.127592	2018-08-21 16:47:39.127592
\.


--
-- Data for Name: meals; Type: TABLE DATA; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

COPY public.meals (id, title, created_at, updated_at, photo, veggie, ingredients, allergens) FROM stdin;
1	Bœuf snacké à la moutarde violette & gratin	2018-08-22 13:10:53.822422	2018-08-22 13:10:53.822422	image/upload/v1534943457/tkciqoqblgipirrrxhri.jpg	f	Viande de boeuf français, crème liquide, lait français stérilisé, pomme de terre, artichaut, beurre, ciboulette, échalotte, huile de tournesol, moutarde violette, poivre, sel, sucre, thym, vin blanc	Lactose, moutarde, sulfite
2	Poulet, boulgour et carottes rôties, vinaigrette framboise	2018-08-22 13:11:43.722508	2018-08-22 13:11:43.722508	image/upload/v1534943504/zixgtv2hdtplmxbusv1s.jpg	f	Poulet français Bleu Blanc Coeur, boulgour, carottes, cranberry, noisette, coriandre fraîche, échalotte, huile d'olive AOP de Kalamata, huile de tournesol, huile de noisette, poivre, sel, vinaigre de framboise	Fruit à coque, gluten, sulfite
3	Emincé de poulet à la moutarde et poêlée de légumes	2018-08-22 13:12:30.298702	2018-08-22 13:12:30.298702	image/upload/v1534943550/ccjajnc8xi75keaxtgxp.jpg	f	Poulet français Bleu Blanc Coeur, crème liquide, pomme de terre grenaille, fond-de-volaille, carottes, épinard, oignon jaune, beurre, moutarde à l'ancienne, persil, poivre, sel, sucre	Lactose, gluten, moutarde
4	Roasted veggie salade & sauce à l'avocat	2018-08-22 13:13:24.300837	2018-08-22 13:13:24.300837	image/upload/v1534943604/urpymdlmzdljpfrgcyxw.jpg	t	Freekeh, patate-douce, céleri rave, poivron rouge, cebette, oignon rouge, avocat, jus de citron vert bio, coriandre, sel, poivre, crème de soja bio, huile d'olive AOP de Kalamata, huile de tournesol	Soja, sulfite, gluten, céleri
10	Nourish bowl aux 4 céréales, poulet doré & vinaigrette aux graines de chia	2018-09-04 08:04:27.356284	2018-09-04 08:04:27.356284	image/upload/v1536048267/iaozeqpcusdgqayczpqf.jpg	f	Poulet français Bleu Blanc Coeur, riz, orge, blé bio, épeautre, avocat, chou rave, pois chiche, jus de citron bio, orange, pomme granny, noix de cajou, huile d'olive AOP de Kalamata, huile de noix, graine de chia, ciboulette, miel, moutarde, sel, poivre	Arachide, fruit à coque, gluten, moutarde, sulfite
5	Curry de légumes, dahl de lentilles et riz basmati coco	2018-08-22 13:14:02.215911	2018-08-22 13:15:12.904538	image/upload/v1534943697/x8oy9rkvuj01jqy0ina5.jpg	t	Patate douce, carottes, chou fleur, oignon jaune, tomate bio, lait de coco, coriandre fraîche, curry, garam massala, gingembre, persil, piment fort, sel, poivre	
7	Linguine IGP alla puttanesca	2018-08-22 13:16:26.937794	2018-08-22 13:16:26.937794	image/upload/v1534943787/fhg4dqcocn3vzpzq4xkj.jpg	f	Anchois, grana padano AOP, ail, linguine IGP, tomate bio, câpres bio, huile d'olive AOP de Kalamata, olives, persil, poivre, sel, thym	Gluten, lactose, poisson
6	Patates douces fondantes aux épinards bio & tofu laqué	2018-08-22 13:15:49.730464	2018-08-22 13:16:36.578275	image/upload/v1534943750/krhzfiqhhdyki98ygxbu.jpg	t	Fromage frais, patate douce, tofu bio, épinard, oignon cébette, oignon rouge, coriandre fraîche, huile d'olive AOP de Kalamata, huile de tournesol, miel, poivre, sauce de tamari bio, sel, sésame	Lactose, sésame, soja, sulfite, gluten
8	Poulet doré, gratin dauphinois & ketchup maison	2018-09-04 08:03:23.562954	2018-09-04 08:03:23.562954	image/upload/v1536048204/vfvsjdcm5thnaa20hzqp.jpg	f	Poulet, lait, crème liquide, pomme de terre, tomate bio, champignon de Paris, oignon jaune, piment, romarin, persil, huile de tournesol, thym, vinaigre de vin rouge, sel, poivre, clou de girofle, beurre, sucre	Lactose, piment, sulfite
16	Poulet tikka massala	2018-09-10 15:07:53.37848	2018-09-10 15:07:53.37848	image/upload/v1536592073/tuhfujqztsiybjzccnhp.jpg	f	Poulet français Bleu Blanc Coeur, yaourt, ail, oignon rouge, poivron rouge, poivron vert, tomate bio, citron, jus de citron bio, amande bio, coriandre fraîche, cumin, curcuma, garam massala, gingembre, huile de tournesol, poivre, sel	Fruit à coque, lactose
12	Filet de dinde, pommes de terre sautées et brocolis	2018-09-04 08:05:37.323866	2018-09-04 08:05:37.323866	image/upload/v1536048337/sppret3ou3zb9pal17rh.jpg	f	Filet de dinde, pomme de terre, farine-de-ble, brocolis, oignon jaune, beurre, huile d'olive AOP de Kalamata, poivre, romarin, sel	Céleri, gluten, lactose
14	Green curry de crevettes	2018-09-04 08:06:48.604915	2018-09-04 08:06:48.604915	image/upload/v1536048409/xm1qjpydnjlifs6yri4b.jpg	f	Ail, courgette, lait de coco, crevettes, basilic thaï, coriandre fraîche, coriandre graine, cumin, curry vert, feuille de citron kaffir, huile de tournesol, nuoc mam, pousse de bambou, poivre, sel, sucre	Crustacé
11	Tiger Bowl aux boulettes de lentilles	2018-09-04 08:04:59.576186	2018-09-04 08:07:19.861307	image/upload/v1536048300/cw1re6hdaij6cb5wkzcf.jpg	t	Ail, blé bio, carottes, oignon cébette, épinard, pousse d'épinard, jus de citron bio, noix de cajou, crème de soja bio, curcuma, huile d'olive AOP de Kalamata, sel	Fruit à coque, gluten, soja
9	Tortelloni artisanaux aux épinard & basilic, sauce tomate	2018-09-04 08:03:53.748245	2018-09-04 08:07:37.941842	image/upload/v1536048234/s5ypr4fxur13vrsfkf4f.jpg	t	Grana padano AOP, ail, oignon rouge, épinard, tomate bio, basilic, huile d'olive AOP de Kalamata, huile de tournesol, poivre, sel, thym	Lactose, gluten
13	Curry de tofu bio et riz rouge	2018-09-04 08:06:09.016492	2018-09-04 08:07:49.432991	image/upload/v1536048369/g9moly9xnt4patvtkdtv.jpg	t	Lait-de-coco, ail, riz rouge thai, carottes, oignon jaune, poivron rouge, chou fleur, champignon de Paris, jus de citron vert bio, lait de coco, purée de mangue, piment rouge, bouillon de légumes, champignon, coriandre fraîche, curcuma, curry, gingembre, huile d'olive AOP de Kalamata, huile de tournesol, sel, tofu	Piment, soja, lactose
15	Fatteh aux pois-chiches & patates douces mijotés, riz aux oignons	2018-09-10 15:07:11.105405	2018-09-10 15:07:11.105405	image/upload/v1536592031/ede7fggjbwit4mownpll.jpg	t	Patate douce, pois chiche, oignon rouge, céleri branche, oignon jaune, jus de citron bio, cumin, huile d'olive AOP de Kalamata, tahini, persil, sel, poivre, yaourt de soja	Céleri, sésame, soja, céleri
17	Linguine al ragu	2018-09-10 15:08:25.095216	2018-09-10 15:08:25.095216	image/upload/v1536592105/lbflwezbcfn0jiihuwdg.jpg	f	Veau français, grana padano AOP, ail, linguine IGP, carottes, céleri, fenouil, oignon jaune, tomate bio, huile d'olive AOP de Kalamata, passata bio, persil, poivre, romarin, sel, thym	Gluten, lactose, céleri
18	Nouilles soba au poulet et petits légumes	2018-09-10 15:09:11.572924	2018-09-10 15:09:11.572924	image/upload/v1536592152/qa2xrcppxhronabhoyda.jpg	f	Poulet français Bleu Blanc Coeur, nouilles soba, carottes, courgette, poireau, poivron, jus de citron bio, basilic, huile d'olive AOP de Kalamata, huile de tournesol, poivre, sel	Gluten
19	Riz aux crevettes asiatique	2018-09-10 15:09:48.193129	2018-09-10 15:09:48.193129	image/upload/v1536592188/auhnjjchjp24g1eohxxk.jpg	f	Oeuf plein air, crevette, nuoc mam, mais, concombre, oignon cébette, petits pois, ciboulette, gingembre, huile de sésame bio, persil, poivre, sauce de tamari bio, sauce sriracha, sel	Crustacé, sésame, oeuf, poisson
20	Butter chicken, riz basmati bio, carotte tandoori	2018-09-17 14:33:59.127396	2018-09-17 14:33:59.127396	image/upload/v1537194839/jp7rjfeloibbssuwgkgb.jpg	f	Poulet français Bleu Blanc Coeur, yaourt, ail, carottes, oignon nouveau, tomate bio, noix de cajou, beurre, canelle, cardamome, coriandre fraîche, épice tandoori, garam massala, gingembre, piment doux, poivre, sel	Arachide, lactose, piment, fruits à coque
70	Sweet & sour tofu, riz basmati, brocoli & shiitaké	2018-10-09 08:26:28.758408	2018-10-09 08:26:28.758408	image/upload/v1539073589/rdfnkuidevyszheaxat0.jpg	t	Riz basmati, tofu, oignon cébette, brocolis, champignon shitaké, ail, piment rouge, sauce de tamari bio, gingembre, huile de sésame bio, sauce hoïsin, vinaigre de riz, sucre, ketchup	Sulfite, arachide, gluten, piment, sésame
31	Poulet libanais façon Chich Taouk	2018-09-25 10:02:24.140525	2018-09-25 10:02:24.140525	image/upload/v1537869744/pfmfydptksyk4gd9zmni.jpg	f	Filet de poulet bleu blanc coeur, yaourt, beurre, riz basmati bio, aubergine, ail, citron, piment, amande, sesame, sel, poivre, sumac, persil, huile de tournesol, thym, menthe, cannelle, cumin, zaatar	Lactose, piment, fruits à coque
21	Curry d'aubergine au lait de coco	2018-09-17 14:34:40.609377	2018-09-17 14:34:57.247082	image/upload/v1537194897/jvxnd6lsdds7jtlicpfh.jpg	f	Riz basmati bio, aubergine, oignon jaune, gingembre, ail, piment oiseau, concassé de tomate bio, poivre, sel, huile de tournesol, curcuma, coriandre fraîche, cardamome, lait-de-coco, huile de sésame bio	Sésame, piment
22	Blackened Saumon	2018-09-17 14:35:55.834038	2018-09-17 14:35:55.834038	image/upload/v1537194956/msshxia4litbqphufntr.jpg	f	Saumon d'Ecosse Label Rouge, pomme de terre, brocolis, citron, huile d'olive AOP de Kalamata, piment de cayenne, piment doux, piment fort, gingembre, origan, canelle, noix de muscade, épices cajun	Piment, poisson
23	Fagottini artisanaux à la crème d'épinard bio	2018-09-17 14:36:41.367924	2018-09-17 14:36:41.367924	image/upload/v1537195001/x0kgc7mevuh2sw6ltcna.jpg	t	Grana padano AOP, mascarpone, ail, fagottini, épinard, oignon jaune, huile d'olive AOP de Kalamata, huile de tournesol, persil, sauge	Gluten, lactose
24	Salade tiède de légumes rôtis & halloumi grillé	2018-09-17 14:37:30.121126	2018-09-17 14:37:30.121126	image/upload/v1537195050/ohzqbjbc7re6gwy3qidi.jpg	t	Halloumi, patate douce, pomme de terre grenaille, épinard, tomate cerise, betterave, grenade, jus de citron bio, cumin, huile d'olive AOP de Kalamata, menthe fraîche, miel, poivre, sel, huile de tournesol	Lactose
25	Assiette orientale au bœuf et noix	2018-09-17 14:38:17.228307	2018-09-17 14:38:17.228307	image/upload/v1537195097/wmaxsgmjpknsuphlgnfd.jpg	f	Viande de boeuf français, crème liquide, riz blanc bio, aubergine, oignon cébette, tomate bio, grenade, noix, noisette, cumin, huile de tournesol, moutarde, persil, poivre, sel, vinaigre de cidre	Lactose, fruits à coque
26	Risotto d'orge perlé au Sainte Maure de Touraine	2018-09-25 09:58:18.351154	2018-09-25 09:58:18.351154	image/upload/v1537869498/fikt6ihzlsdsahnwruzd.jpg	t	Crème épaisse, chèvre, orge perlé, ail, persil, huile de tournesol	Gluten, lactose
27	Linguine aux poivrons rôtis, chèvre & sauce tomate	2018-09-25 09:59:06.202175	2018-09-25 09:59:06.202175	image/upload/v1537869546/uke6twktotr7nz5d2jrk.jpg	t	Chèvre, mascarpone, linguine IGP, poivron rouge, poivron jaune, coulis de tomate, ail, sel, poivre, huile d'olive AOP de Kalamata, sucre, basilic	Gluten, lactose
28	Sweet Potato Bowl au cheddar, haricots rouges et crème d’avocat	2018-09-25 10:00:26.600582	2018-09-25 10:00:26.600582	image/upload/v1537869627/kx92d0bucgtvmtkbfa8x.jpg	t	Cheddar fermier, crème épaisse, patate douce, tortilla de blé, avocat, haricots rouges, oignon cébette, jus de citron bio, piment vert, coriandre fraîche, huile d'olive AOP de Kalamata, huile de tournesol, persil	Gluten, lactose, piment
29	Chili con carne	2018-09-25 10:01:09.542943	2018-09-25 10:01:09.542943	image/upload/v1537869670/iyudqs7bjozzkhwphzk7.jpg	f	Viande de boeuf français, crème liquide, oignon nouveau, poivron vert, poivron rouge, haricots rouges, tomate bio, ail, sel, poivre, cumin, poudre de chilli	Lactose
30	Poulet sauce satay, riz basmati & salade de radis noir	2018-09-25 10:01:46.962928	2018-09-25 10:01:46.962928	image/upload/v1537869707/ebtscwstusduzd7nkaik.jpg	f	Poulet français Bleu Blanc Coeur, nuoc mann, riz basmati bio, ail, échalote, concombre, jus de citron bio, menthe, piment rouge, cacahuète, graine de cumin, graine de coriandre, sel, curcuma, huile de tournesol, sucre, citronnelle, lait-de-coco	Arachide, piment, fruits à coque, poisson
61	Poulet, caponata d'aubergines et pâtes riso au citron	2018-10-02 07:50:42.98826	2018-10-02 07:50:42.98826	image/upload/v1538466644/xosykfgygnzcmlncb0yg.jpg	f	Poulet, pâte riso, tomate bio, aubergine, céleri branche, oignon jaune, ail, jus de citron bio, sel, poivre, persil, olive verte, vinaigre de vin rouge, sucre, huile d'olive AOP de Kalamata	Sulfite, gluten, céleri
62	Poulet korma	2018-10-02 07:51:18.190757	2018-10-02 07:51:18.190757	image/upload/v1538466678/clx1zvzwel5lufjd7nxg.jpg	f	Poulet français Bleu Blanc Coeur, yaourt, maïzena, oignon rouge, pistache, noix de cajou, amande emondée, cardamome, coriandre fraîche, curcuma, étoile de badiane, gingembre, huile de tournesol, laurier, poivre, sel, ail, gingembre frais, anis	Fruit à coque, lactose
63	Curry veggie aux pois chiches et épinards	2018-10-02 07:52:03.277139	2018-10-02 07:52:03.277139	image/upload/v1538466723/hkfkuiuknpeu5go0fmkh.jpg	t	Faisselle, riz blanc bio, épinard, oignon jaune, tomate bio, lait de coco, jus de citron bio, noix de cajou, sel, poivre, coriandre fraîche, curry, huile de tournesol, sucre	Sulfite, lactose, fruits à coque
64	Huevos rancheros	2018-10-02 07:52:48.12492	2018-10-02 07:52:48.12492	image/upload/v1538466768/vi4ptog9ftjracszkfue.jpg	t	Oeuf plein air, cheddar fermier, haricots rouges, tomate bio, piquillos, ail, jus de citron bio, poudre de chili, piment vert, sel, huile d'olive AOP de Kalamata, sucre, coriandre fraîche	Sulfite, lactose, piment, oeuf
65	Tajine de poulet, olives et citron confit	2018-10-02 07:53:30.099402	2018-10-02 07:53:30.099402	image/upload/v1538466810/hvlx0tmylxnijo6v5pi4.jpg	f	Poulet français Bleu Blanc Coeur, ail, semoule, carottes, oignon jaune, citron confit, gingembre, huile d'olive AOP de Kalamata, miel, persil plat, olive verte, poivre, raz el hanout, sel	Gluten
66	Lasagnes aux légumes et à la ricotta	2018-10-02 07:54:05.987795	2018-10-02 07:54:05.987795	image/upload/v1538466846/t2emnebzythn6fl4f8mg.jpg	t	Grana padano AOP, crème liquide, ricotta DOP, pâte à lasagne, coulis de tomate bio, oignon blanc, aubergine, courgette, graine de fenouil, huile d'olive AOP de Kalamata, passata bio, huile de tournesol	Sulfite, gluten, lactose
67	Saucisse grillée & volcan de sauce	2018-10-02 07:54:40.169563	2018-10-02 07:54:40.169563	image/upload/v1538466880/vz7kvchlqkmq9rgdz68n.jpg	f	Saucisse, porc Label Rouge, fond-de-volaille, beurre, pomme de terre, farine-de-ble, carottes, oignon jaune, noix-de-muscade, sel, poivre, huile de tournesol, laurier, persil, romarin, sucre, ail	Lactose, fruit à coque, gluten
68	Biryani aux légumes	2018-10-02 07:55:21.288446	2018-10-02 07:55:21.288446	image/upload/v1538466921/mfb7btcjcgbbvrgzgv3w.jpg	t	Faisselle, yaourt, pomme de terre, carottes, chou fleur, concentré de tomate bio, raisins secs, noix de cajou, beurre, coriandre fraîche, curcuma, échalotte, garam massala, gingembre, menthe fraîche, poivre, sel	Sulfite, lactose, fruits à coque
69	Bol de riz complet bio, œufs & légumes de saison	2018-10-02 07:55:59.671567	2018-10-02 07:55:59.671567	image/upload/v1538466960/ph6pqoayte5dix1gxxr0.jpg	t	Oeuf plein air, crème liquide, patate douce, chou fleur, chou vert, huile d'olive AOP de Kalamata, huile de tournesol, miel, poivre, sel, vinaigre balsamique, sauce de tamari bio, gomasio, cébette	Lactose, sésame, oeuf
71	Bœuf Chimichurri	2018-10-09 08:27:33.270375	2018-10-09 08:27:33.270375	image/upload/v1539073653/lpejokmvp1reo8avlinj.jpg	f	Viande de boeuf français, beurre, pomme de terre, carottes, oignon jaune, piment frais, coriandre fraîche, huile d'olive AOP de Kalamata, origan, paprika, persil, vinaigre de vin blanc	Lactose, sulfite, piment
72	Tortiglioni au chèvre, champignons et pousses d'épinard	2018-10-09 08:28:45.197595	2018-10-09 08:29:07.617607	image/upload/v1539073725/r4szbonfetehgntqv3qk.jpg	t	Chèvre, crème liquide, ail, tortiglioni, champignon de Paris, oignon jaune, épinard, noisette, beurre, huile de tournesol, poivre, sel	Fruit à coque, gluten, lactose
73	Boulettes de pois-chiches, semoule au citron, potimarron et chèvre	2018-10-09 08:30:23.949632	2018-10-09 08:30:23.949632	image/upload/v1539073824/wusktmd9wegiomw2g7nq.jpg	t	Chèvre, semoule, boulettes de pois-chiches bio (pois-chiches, riz, flocons de blé, poivrons rouges, huile de tournesol, chou-fleur, farine de blé, oignons, concentré de tomate, sel marin, ail, herbes de provence, cumin, poivre), oignon rouge, pois chiche, potimarron, ail, citron confit, jus de citron bio, sel, ciboulette, huile d'olive AOP de Kalamata, huile de tournesol, miel	Sulfite, gluten, lactose
74	Dahl indien, légumes rôtis, fromage blanc aux herbes	2018-10-09 08:31:21.396071	2018-10-09 08:31:21.396071	image/upload/v1539073881/j5dgjiax4zcqzswgxn06.jpg	t	Fromage blanc, lentilles corail, riz basmati, chou fleur, aubergine, oignon rouge, citron vert, tomate, piment frais, amande bio, ail, poudre de curry indien, piment-frais, coriandre fraîche, échalote, amande, lait-de-coco, sucre roux, huile d'olive AOP de Kalamata, gingembre, coriandre moulue	Sulfite, fruit à coque, lactose, piment
75	Poulet grillé thaï, riz basmati et salade de carottes et cacahuètes	2018-10-09 08:32:55.57128	2018-10-09 08:32:55.57128	image/upload/v1539073976/ixhbbipmzicgwl6awr2u.jpg	f	Poulet français Bleu Blanc Coeur, sauce nuoc mam, carottes, oignon cébette, radis noir, ail, jus de citron bio, citronnelle, cacahuètes, graines de coriandre, huile de sésame bio, pâte de tamarin, poivre, sauce huître, sauce sweet chili, sel, sucre roux	Arachide, poisson, sésame, gluten, crustacé, soja
\.


--
-- Name: meals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

SELECT pg_catalog.setval('public.meals_id_seq', 75, true);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

COPY public.orders (id, paid_at, serving_id, user_id, created_at, updated_at, pro_expense) FROM stdin;
49	2018-09-18 10:23:50.464678	20	32	2018-09-18 10:00:09.15181	2018-09-18 10:23:50.471789	f
19	2018-08-29 11:47:08.749288	7	23	2018-08-29 10:48:15.436816	2018-08-29 11:47:08.774109	f
16	2018-08-29 11:47:13.374148	5	6	2018-08-29 10:42:40.104408	2018-08-29 11:47:13.384901	f
5	2018-08-29 11:47:18.017899	4	6	2018-08-28 08:20:37.44895	2018-08-29 11:47:18.030203	f
15	2018-08-29 11:47:23.533862	7	21	2018-08-29 10:21:56.392787	2018-08-29 11:47:23.543114	f
4	2018-08-29 11:47:33.021065	5	8	2018-08-28 08:17:31.497849	2018-08-29 11:47:33.036586	f
7	2018-08-29 11:47:38.460385	1	15	2018-08-28 08:46:05.737904	2018-08-29 11:47:38.492579	f
3	2018-08-29 11:48:36.505999	7	5	2018-08-28 08:16:33.985149	2018-08-29 11:48:36.519213	f
2	2018-08-29 11:48:40.70696	5	5	2018-08-28 08:15:52.562105	2018-08-29 11:48:40.734173	f
1	2018-08-29 11:48:44.218664	4	5	2018-08-28 08:15:32.851514	2018-08-29 11:48:44.245475	f
21	2018-08-30 10:37:16.80565	4	20	2018-08-30 10:35:34.432021	2018-08-30 10:37:16.819527	f
20	2018-08-30 10:37:19.644737	6	20	2018-08-30 09:44:53.004997	2018-08-30 10:37:19.663565	f
13	2018-08-30 10:39:17.641987	5	1	2018-08-29 10:14:57.859146	2018-08-30 10:39:17.660196	f
17	2018-08-30 15:23:36.691253	6	22	2018-08-29 10:43:51.037508	2018-08-30 15:23:36.717584	f
12	2018-08-31 10:05:40.666599	1	16	2018-08-28 10:47:47.825906	2018-08-31 10:05:40.681514	f
11	2018-08-31 10:05:43.793613	6	16	2018-08-28 10:47:26.480756	2018-08-31 10:05:43.801393	f
8	2018-08-31 10:05:49.524717	3	3	2018-08-28 09:08:16.191885	2018-08-31 10:05:49.537015	f
9	2018-08-31 10:05:53.83125	1	3	2018-08-28 09:08:24.980273	2018-08-31 10:05:53.847953	f
18	2018-08-31 14:53:49.991179	2	11	2018-08-29 10:44:04.111649	2018-08-31 14:53:50.034516	f
24	2018-09-04 09:34:21.72803	3	1	2018-09-04 07:58:36.052289	2018-09-04 09:34:21.75185	f
23	2018-09-04 09:34:22.391956	2	25	2018-08-31 08:48:40.471351	2018-09-04 09:34:22.444308	f
22	2018-09-04 09:34:23.007677	3	1	2018-08-30 10:54:33.686951	2018-09-04 09:34:23.053892	f
14	2018-09-04 09:34:28.433663	6	1	2018-08-29 10:16:18.516007	2018-09-04 09:34:28.44457	f
10	2018-09-04 09:34:31.420903	2	1	2018-08-28 10:09:06.430046	2018-09-04 09:34:31.445146	f
32	2018-09-10 15:16:02.729965	11	1	2018-09-06 09:21:02.507972	2018-09-10 15:16:02.745249	f
31	2018-09-10 15:16:12.751508	12	14	2018-09-05 10:26:13.843027	2018-09-10 15:16:12.772087	f
30	2018-09-10 15:16:17.034158	14	14	2018-09-05 10:25:27.932442	2018-09-10 15:16:17.043527	f
29	2018-09-10 15:16:22.562055	9	1	2018-09-05 10:24:40.687672	2018-09-10 15:16:22.57203	f
36	2018-09-10 15:19:37.103552	10	27	2018-09-06 11:18:22.513972	2018-09-10 15:19:37.11548	f
35	2018-09-10 15:19:46.278925	10	19	2018-09-06 10:40:05.221876	2018-09-10 15:19:46.288615	f
34	2018-09-10 15:19:53.205832	11	12	2018-09-06 09:57:22.603124	2018-09-10 15:19:53.220966	f
26	2018-09-11 07:35:11.802419	13	15	2018-09-04 08:32:34.018017	2018-09-11 07:35:11.811857	f
25	2018-09-11 07:35:18.330802	8	15	2018-09-04 08:31:54.214453	2018-09-11 07:35:18.342971	f
27	2018-09-11 07:58:10.380369	8	1	2018-09-04 10:27:51.173381	2018-09-11 07:58:10.386827	f
28	2018-09-11 08:01:44.76165	9	2	2018-09-04 10:32:57.606859	2018-09-11 08:01:44.773519	f
38	2018-09-12 09:53:22.543115	18	14	2018-09-11 11:49:01.016201	2018-09-12 09:53:22.550484	f
40	2018-09-12 09:53:26.829663	18	1	2018-09-11 17:23:19.811783	2018-09-12 09:53:26.839907	f
41	2018-09-12 09:53:28.302814	15	1	2018-09-12 09:53:17.12987	2018-09-12 09:53:28.311583	f
37	2018-09-12 09:53:46.903409	15	5	2018-09-11 09:30:36.003932	2018-09-12 09:53:46.912247	f
44	2018-09-12 12:42:38.267335	17	29	2018-09-12 11:21:33.84231	2018-09-12 12:42:38.274581	f
33	2018-09-14 12:08:27.957671	12	25	2018-09-06 09:41:12.714433	2018-09-14 12:08:27.969665	f
46	2018-09-14 12:08:36.385499	15	30	2018-09-13 10:50:17.962874	2018-09-14 12:08:36.40265	f
47	2018-09-14 12:08:41.952122	16	1	2018-09-13 10:52:42.034605	2018-09-14 12:08:41.964259	f
39	2018-09-17 08:13:00.262808	19	2	2018-09-11 13:14:15.781233	2018-09-17 08:13:00.280241	f
43	2018-09-17 12:42:24.818703	18	15	2018-09-12 10:05:36.998036	2018-09-17 12:42:24.851916	f
48	2018-09-17 14:40:02.981981	16	14	2018-09-14 18:19:10.848616	2018-09-17 14:40:02.996571	f
42	2018-09-17 14:40:11.107517	17	14	2018-09-12 10:02:07.892399	2018-09-17 14:40:11.138544	f
51	2018-09-18 10:23:42.935186	21	14	2018-09-18 10:17:43.922679	2018-09-18 10:23:42.957807	f
52	2018-09-18 10:23:47.319888	20	1	2018-09-18 10:23:30.985831	2018-09-18 10:23:47.329696	f
58	2018-09-21 07:51:13.703453	23	1	2018-09-20 18:44:08.436675	2018-09-21 07:51:13.711535	f
55	2018-09-21 07:52:02.329571	26	2	2018-09-19 16:23:39.173153	2018-09-21 07:52:02.334377	f
54	2018-09-21 07:52:08.759177	25	1	2018-09-19 10:35:12.683266	2018-09-21 07:52:08.769823	f
59	2018-09-24 10:06:59.821409	24	1	2018-09-21 10:36:22.787896	2018-09-24 10:06:59.826655	f
53	2018-09-24 10:07:03.755295	23	14	2018-09-19 10:03:47.416291	2018-09-24 10:07:03.759849	f
56	2018-09-24 10:07:07.689621	22	14	2018-09-20 05:59:45.365727	2018-09-24 10:07:07.70191	f
45	2018-09-25 11:01:22.886646	19	29	2018-09-13 10:50:12.902465	2018-09-25 11:01:22.898791	f
60	2018-09-25 11:02:00.82236	27	14	2018-09-25 10:06:05.055427	2018-09-25 11:02:00.826766	f
61	2018-09-25 11:02:04.73473	31	14	2018-09-25 10:06:28.64418	2018-09-25 11:02:04.744038	f
66	2018-09-25 11:02:22.495862	33	14	2018-09-25 10:15:11.394144	2018-09-25 11:02:22.501977	f
65	2018-09-25 11:02:25.992351	30	29	2018-09-25 10:14:44.060471	2018-09-25 11:02:26.004325	f
50	2018-09-25 11:02:33.543764	21	15	2018-09-18 10:14:12.046533	2018-09-25 11:02:33.551584	f
57	2018-09-25 11:02:37.380141	22	15	2018-09-20 11:34:21.890999	2018-09-25 11:02:37.387514	f
62	2018-09-25 11:02:43.531654	31	15	2018-09-25 10:07:10.962889	2018-09-25 11:02:43.543085	f
68	2018-09-26 10:55:24.801505	30	30	2018-09-26 09:59:52.383993	2018-09-26 10:55:24.808595	f
69	2018-09-26 10:55:26.480783	29	1	2018-09-26 10:16:26.104121	2018-09-26 10:55:26.489276	f
67	2018-09-26 10:55:28.229433	32	1	2018-09-25 11:10:44.126863	2018-09-26 10:55:28.234421	f
64	2018-09-26 11:40:31.732972	27	2	2018-09-25 10:11:04.749326	2018-09-26 11:40:31.748987	f
63	2018-09-26 11:40:36.519761	28	2	2018-09-25 10:10:49.30685	2018-09-26 11:40:36.527107	f
102	2018-09-27 09:36:23.400719	33	32	2018-09-27 08:46:43.719206	2018-09-27 09:36:23.407157	f
103	2018-10-02 07:42:13.611928	32	1	2018-09-28 12:22:53.404821	2018-10-02 07:42:13.63293	f
108	2018-10-02 16:08:14.023417	70	12	2018-10-02 12:40:25.475115	2018-10-02 16:08:14.043045	f
106	2018-10-02 12:29:51.534395	66	65	2018-10-02 11:24:34.479205	2018-10-02 12:29:51.54479	t
104	2018-10-02 12:29:54.307179	73	1	2018-10-02 10:34:54.618186	2018-10-02 12:29:54.324633	f
105	2018-10-02 12:29:56.322168	72	1	2018-10-02 10:35:02.251667	2018-10-02 12:29:56.3388	f
107	2018-10-02 12:30:25.940399	67	12	2018-10-02 12:21:08.333765	2018-10-02 12:30:25.960634	t
6	2018-10-02 12:30:26.893663	5	12	2018-08-28 08:23:06.718941	2018-10-02 12:30:26.918019	f
111	2018-10-02 16:08:06.464438	71	14	2018-10-02 12:59:10.194529	2018-10-02 16:08:06.47264	f
110	2018-10-02 16:08:08.806324	72	14	2018-10-02 12:58:54.145425	2018-10-02 16:08:08.850478	f
109	2018-10-02 16:08:10.250316	69	14	2018-10-02 12:58:38.593053	2018-10-02 16:08:10.274935	f
113	2018-10-03 09:53:36.774042	71	1	2018-10-03 09:53:32.104341	2018-10-03 09:53:36.786062	f
114	2018-10-03 15:28:16.371422	74	5	2018-10-03 12:37:35.826525	2018-10-03 15:28:16.378898	t
115	2018-10-08 07:55:39.128186	68	1	2018-10-04 16:55:26.191473	2018-10-08 07:55:39.141034	f
118	\N	78	66	2018-10-10 07:32:19.944256	2018-10-10 07:32:19.944256	f
119	\N	82	15	2018-10-10 08:19:49.647225	2018-10-10 08:19:49.647225	f
117	2018-10-10 09:27:05.571128	79	2	2018-10-09 12:12:32.488834	2018-10-10 09:27:05.591304	t
116	2018-10-10 09:27:06.719674	81	2	2018-10-09 12:11:59.782798	2018-10-10 09:27:06.739464	t
112	2018-10-10 09:27:08.638513	66	2	2018-10-03 09:26:25.733276	2018-10-10 09:27:08.663337	t
120	2018-10-10 09:30:53.813511	77	1	2018-10-10 09:30:48.331242	2018-10-10 09:30:53.826707	f
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

SELECT pg_catalog.setval('public.orders_id_seq', 120, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

COPY public.schema_migrations (version) FROM stdin;
20180720132639
20180720145039
20180722152625
20180722153835
20180722164125
20180723133736
20180723153711
20180821103356
20180821154415
20180821165419
20180822121202
20180828195034
20180829133518
\.


--
-- Data for Name: servings; Type: TABLE DATA; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

COPY public.servings (id, best_before, price, quantity, meal_id, created_at, updated_at) FROM stdin;
1	2018-09-02 00:00:00	7	3	1	2018-08-28 08:09:23.425467	2018-08-28 08:09:23.425467
2	2018-09-02 00:00:00	7	3	2	2018-08-28 08:09:42.853951	2018-08-28 08:09:42.853951
3	2018-09-02 00:00:00	7	3	3	2018-08-28 08:10:02.21081	2018-08-28 08:10:02.21081
4	2018-08-31 00:00:00	7	3	4	2018-08-28 08:10:21.573136	2018-08-28 08:10:21.573136
5	2018-09-02 00:00:00	7	5	5	2018-08-28 08:10:34.839134	2018-08-28 08:10:34.839134
6	2018-09-02 00:00:00	7	4	6	2018-08-28 08:10:48.757348	2018-08-28 08:10:48.757348
7	2018-09-02 00:00:00	7	3	7	2018-08-28 08:11:07.522974	2018-08-28 08:11:07.522974
9	2018-09-09 00:00:00	7	2	9	2018-09-04 08:25:53.170822	2018-09-04 08:25:53.170822
12	2018-09-09 00:00:00	7	2	12	2018-09-04 08:27:48.39952	2018-09-04 08:27:48.39952
13	2018-09-09 00:00:00	7	1	13	2018-09-04 08:28:00.382492	2018-09-04 08:28:00.382492
14	2018-09-09 00:00:00	7	1	14	2018-09-04 08:28:13.982809	2018-09-04 08:28:13.982809
8	2018-09-07 00:00:00	7	2	8	2018-09-04 08:25:33.195872	2018-09-04 08:28:48.169997
11	2018-09-07 00:00:00	7	2	11	2018-09-04 08:27:32.237896	2018-09-04 08:28:54.573471
10	2018-09-07 00:00:00	7	2	10	2018-09-04 08:26:17.556043	2018-09-04 08:29:01.370141
16	2018-09-16 00:00:00	7	2	19	2018-09-11 07:56:27.040392	2018-09-11 07:56:27.040392
17	2018-09-14 00:00:00	7	2	18	2018-09-11 07:56:40.007562	2018-09-11 07:56:40.007562
15	2018-09-16 00:00:00	7	3	15	2018-09-11 07:56:13.135436	2018-09-11 07:57:15.648206
18	2018-09-16 00:00:00	7	3	16	2018-09-11 07:57:30.119619	2018-09-11 07:57:30.119619
19	2018-09-16 00:00:00	7	2	17	2018-09-11 07:57:46.860643	2018-09-11 07:57:46.860643
20	2018-09-23 00:00:00	7	2	20	2018-09-18 09:29:38.756092	2018-09-18 09:29:38.756092
21	2018-09-23 00:00:00	7	2	21	2018-09-18 09:29:54.090581	2018-09-18 09:29:54.090581
22	2018-09-23 00:00:00	7	2	22	2018-09-18 09:30:27.474035	2018-09-18 09:30:27.474035
23	2018-09-23 00:00:00	7	2	23	2018-09-18 09:30:43.057948	2018-09-18 09:30:43.057948
24	2018-09-23 00:00:00	7	2	2	2018-09-18 09:30:58.668905	2018-09-18 09:30:58.668905
25	2018-09-23 00:00:00	7	1	24	2018-09-18 09:31:13.558169	2018-09-18 09:31:13.558169
26	2018-09-23 00:00:00	7	1	25	2018-09-18 09:31:24.868111	2018-09-18 09:31:24.868111
27	2018-09-30 00:00:00	7	2	26	2018-09-25 10:02:45.003814	2018-09-25 10:02:45.003814
28	2018-09-30 00:00:00	7	1	27	2018-09-25 10:03:00.180609	2018-09-25 10:03:00.180609
29	2018-09-30 00:00:00	7	1	12	2018-09-25 10:03:26.598998	2018-09-25 10:03:26.598998
30	2018-09-30 00:00:00	7	2	28	2018-09-25 10:03:42.800271	2018-09-25 10:03:42.800271
31	2018-09-30 00:00:00	7	2	29	2018-09-25 10:03:58.984317	2018-09-25 10:03:58.984317
32	2018-09-28 00:00:00	7	2	30	2018-09-25 10:04:31.346949	2018-09-25 10:04:31.346949
33	2018-09-30 00:00:00	7	2	31	2018-09-25 10:04:49.420087	2018-09-25 10:04:49.420087
67	2018-10-06 00:00:00	7	1	62	2018-10-02 07:57:06.691757	2018-10-02 07:57:06.691757
68	2018-10-06 00:00:00	7	1	63	2018-10-02 07:57:22.978017	2018-10-02 07:57:22.978017
69	2018-10-06 00:00:00	7	1	64	2018-10-02 07:57:37.662418	2018-10-02 07:57:37.662418
70	2018-10-06 00:00:00	7	1	65	2018-10-02 07:57:51.410542	2018-10-02 07:57:51.410542
72	2018-10-06 00:00:00	7	2	67	2018-10-02 07:58:20.279564	2018-10-02 07:58:20.279564
73	2018-10-06 00:00:00	7	1	68	2018-10-02 07:58:35.534578	2018-10-02 07:58:35.534578
74	2018-10-06 00:00:00	7	1	69	2018-10-02 07:58:46.337603	2018-10-02 07:58:46.337603
71	2018-10-05 00:00:00	7	2	66	2018-10-02 07:58:05.511702	2018-10-02 09:34:43.438398
66	2018-10-05 00:00:00	7	2	61	2018-10-02 07:56:49.942059	2018-10-02 09:34:56.362566
75	2018-10-13 00:00:00	7	1	15	2018-10-09 08:25:35.398072	2018-10-09 08:25:35.398072
76	2018-10-13 00:00:00	7	1	70	2018-10-09 08:26:48.824232	2018-10-09 08:26:48.824232
77	2018-10-13 00:00:00	7	1	71	2018-10-09 08:27:46.794406	2018-10-09 08:27:46.794406
78	2018-10-13 00:00:00	7	1	25	2018-10-09 08:28:01.412702	2018-10-09 08:28:01.412702
79	2018-10-13 00:00:00	7	1	72	2018-10-09 08:29:26.911135	2018-10-09 08:29:26.911135
80	2018-10-13 00:00:00	7	1	3	2018-10-09 08:29:46.506349	2018-10-09 08:29:46.506349
82	2018-10-13 00:00:00	7	2	74	2018-10-09 08:31:38.186811	2018-10-09 08:31:38.186811
81	2018-10-12 00:00:00	7	2	73	2018-10-09 08:30:39.329681	2018-10-10 07:26:56.626751
83	2018-10-12 00:00:00	7	1	61	2018-10-09 08:31:58.176442	2018-10-10 07:27:08.392405
84	2018-10-12 00:00:00	7	1	75	2018-10-09 08:33:10.717061	2018-10-10 07:27:24.17447
\.


--
-- Name: servings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

SELECT pg_catalog.setval('public.servings_id_seq', 84, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, admin, slack_name, invitation_token, invitation_created_at, invitation_sent_at, invitation_accepted_at, invitation_limit, invited_by_type, invited_by_id, invitations_count, slack_id, pro_expenses) FROM stdin;
7	camille.lebruchec@gmail.com	$2a$11$uEi1S27NuBwSQ/VsaQAXEevs/p0mNTSPOSJqAhN4YoS0ondMlSzoi	\N	\N	\N	2	2018-08-30 11:47:58.741207	2018-08-28 08:15:47.837298	163.172.235.152	163.172.233.44	2018-08-28 08:15:47.749768	2018-08-30 11:47:58.746039	f	Camille Le Bruchec	\N	\N	\N	\N	\N	\N	\N	0	UBHRAJ00Z	f
4	julien.durillon@clever-cloud.com	$2a$11$sGF39mNrpY76ojbZVU4.7eIRbP5cegYcrw9DkLTi4PqfbCJCYM9I2	\N	\N	\N	1	2018-08-22 16:07:18.802157	2018-08-22 16:07:18.802157	163.172.233.43	163.172.233.43	2018-08-22 16:07:18.720899	2018-08-22 16:07:18.806021	f	Julien Durillon	\N	\N	\N	\N	\N	\N	\N	0	U1VURBN8G	f
16	contact@cecilitse.org	$2a$11$uaFmVXFig/I94xRTfU2J0.DRDeFPJBlsYRaiMPulu/xqI67dgl21y	\N	\N	\N	1	2018-08-28 10:44:39.881961	2018-08-28 10:44:39.881961	163.172.235.152	163.172.235.152	2018-08-28 10:44:39.873045	2018-08-28 10:44:39.886574	f	Cecile Veneziani	\N	\N	\N	\N	\N	\N	\N	0	U5RJ7TW65	f
31	bdepail@vente-privee.com	$2a$11$8s4QMTrBCNBfvNi9XgSAPu8Qii.4ay1mQIuXuOGIPRVMvyqoI1QrW	\N	\N	\N	1	2018-09-18 09:51:21.235009	2018-09-18 09:51:21.235009	163.172.235.153	163.172.235.153	2018-09-18 09:51:17.167711	2018-09-18 09:51:21.249094	f	Benoit Depail	\N	\N	\N	\N	\N	\N	\N	0	U8SDJ732L	f
26	g.logerot@nodya-group.com	$2a$11$gOA8PElFeS0efUAm3l69..szO1kou0ahhGGvaSixU/.rqODL2eQdu	\N	\N	\N	1	2018-09-03 05:50:37.259294	2018-09-03 05:50:37.259294	163.172.233.44	163.172.233.44	2018-09-03 05:50:34.402467	2018-09-03 05:50:37.263433	f	Guillaume LOGEROT	\N	\N	\N	\N	\N	\N	\N	0	U7VE9C4JY	f
17	alexandre.duval@clever-cloud.com	$2a$11$8nEKqt2wgQE9ro.6O6Ds8e5F/l59F2847xVG.JyTE3YuAR9cut8Yq	\N	\N	\N	2	2018-09-18 09:41:40.076826	2018-08-28 10:54:25.829333	163.172.235.152	163.172.235.153	2018-08-28 10:54:25.459181	2018-09-18 09:41:40.078663	f	Alexandre DUVAL	\N	\N	\N	\N	\N	\N	\N	0	U5TJY20BX	f
30	maxime@maxmyriam.com	$2a$11$TtXw9b3it2nhYjb.2WZqEOg37fewNcDe3dWiyXFEx0PN6dBjrdTA2	\N	\N	\N	4	2018-09-26 09:51:06.5434	2018-09-25 15:23:16.72822	163.172.233.43	163.172.235.152	2018-09-13 10:46:56.41406	2018-09-26 09:51:06.5473	f	Maxime Amieux	\N	\N	\N	\N	\N	\N	\N	0	UCNFD2CJZ	f
9	alexandre.berthaud@clever-cloud.com	$2a$11$lDAwe4OU2zB51WabrgasP.7SKqpxUWxQp6wljmY41ec/99bB/H4mm	\N	\N	\N	1	2018-08-28 08:17:50.221725	2018-08-28 08:17:50.221725	163.172.233.44	163.172.233.44	2018-08-28 08:17:49.311875	2018-08-28 08:17:50.236519	f	Alexandre Berthaud	\N	\N	\N	\N	\N	\N	\N	0	U1W0YBG1F	f
10	dfilipovic@vente-privee.com	$2a$11$ajFJOfqPSJ1fjWFG4fPhz.jLQea.aLLckNOwNO3eWYs3/d5LQ8X3m	\N	\N	\N	1	2018-08-28 08:18:12.833866	2018-08-28 08:18:12.833866	163.172.233.43	163.172.233.43	2018-08-28 08:18:11.371719	2018-08-28 08:18:12.84341	f	Dejan	\N	\N	\N	\N	\N	\N	\N	0	U9THRGZPW	f
11	enzomathe@gmail.com	$2a$11$hpiXzTOk1xmLXvm4Gw/p8uI/jxDZUss5D.gIzmE6IUtAH8IfPF8l.	\N	\N	\N	1	2018-08-28 08:21:11.33784	2018-08-28 08:21:11.33784	163.172.233.44	163.172.233.44	2018-08-28 08:21:06.877003	2018-08-28 08:21:11.347144	f	Mathe	\N	\N	\N	\N	\N	\N	\N	0	UBKTC65QF	f
12	lemairelr@gmail.com	$2a$11$E8wDgih2uTAHPNRPRNbL0eXxLnc9rW6S5xegmdfsvj7Kz143ucOB6	\N	\N	\N	1	2018-08-28 08:22:00.184198	2018-08-28 08:22:00.184198	163.172.233.43	163.172.233.43	2018-08-28 08:21:58.289601	2018-08-28 08:22:00.190003	f	Louis-René Lemaire	\N	\N	\N	\N	\N	\N	\N	0	U0V776PKM	f
18	jrampon@vente-privee.com	$2a$11$wge6Az1h8zsX5zR6ZpoFgue9pOBqqV.GS6AvcjnyznVWT53YiNv6S	\N	\N	\N	1	2018-08-28 12:42:54.806885	2018-08-28 12:42:54.806885	163.172.235.152	163.172.235.152	2018-08-28 12:42:52.870278	2018-08-28 12:42:54.810955	f	Julien Rampon	\N	\N	\N	\N	\N	\N	\N	0	U9B7H46N4	f
15	victor.engrand@clever-cloud.com	$2a$11$BdnIXHK6QJ6e5Ne7qnqHsO/9roYHgrpq6Ygmlje1XmX0.PdK7KsYK	\N	\N	\N	5	2018-09-26 10:18:17.090394	2018-09-20 11:33:40.248815	163.172.235.152	163.172.233.44	2018-08-28 08:45:00.382202	2018-09-26 10:18:17.092413	f	Victor Engrand	\N	\N	\N	\N	\N	\N	\N	0	U66CVVCCV	f
21	margaux@studiojosepho.com	$2a$11$mPJ6c2Pj.aTWYVSI.CtyrOEGcIDgnZjvFsGvGGssUvnolh6lC9JYy	\N	\N	\N	1	2018-08-29 10:21:16.598023	2018-08-29 10:21:16.598023	163.172.235.152	163.172.235.152	2018-08-29 10:21:15.29989	2018-08-29 10:21:16.602403	f	Margaux	\N	\N	\N	\N	\N	\N	\N	0	U9B7G8ZHB	f
22	grc.tmt@gmail.com	$2a$11$D2fE8w4ZfxYxSzFsGPfnN.sb/T2usMFGnqYaLOxrGZAphgtB616OG	\N	\N	\N	1	2018-08-29 10:43:18.888804	2018-08-29 10:43:18.888804	163.172.235.152	163.172.235.152	2018-08-29 10:43:16.501598	2018-08-29 10:43:18.898202	f	Timothée Garcia	\N	\N	\N	\N	\N	\N	\N	0	UC48R1D8R	f
23	leautemarine@yahoo.fr	$2a$11$iHWWbDVUr28O7Qh6bfYnE.87BcogYbQn4mY4FD6MnR05t3zYfJ6Li	\N	\N	\N	1	2018-08-29 10:44:56.011895	2018-08-29 10:44:56.011895	163.172.233.44	163.172.233.44	2018-08-29 10:44:55.763231	2018-08-29 10:44:56.02212	f	Marine_leWagon	\N	\N	\N	\N	\N	\N	\N	0	UBJUYU3PV	f
24	heydarkv@yahoo.fr	$2a$11$QivUwA1ZpNFiWSzbpomlNuteQW0QkBiF3I7.9bTNtMKIlKnMagyTK	\N	\N	\N	1	2018-08-29 10:53:30.392222	2018-08-29 10:53:30.392222	163.172.233.44	163.172.233.44	2018-08-29 10:53:30.227504	2018-08-29 10:53:30.401479	f	frederic kaveh	\N	\N	\N	\N	\N	\N	\N	0	UBM644Z2P	f
20	christophe.chaudey@gmail.com	$2a$11$.zqlbV55hJ8d6rXGRgQQP.AP/zggz5wg..Nb4gmsAujdkQERXbMRa	\N	\N	\N	4	2018-08-30 09:43:08.346587	2018-08-30 09:42:28.443923	163.172.235.153	163.172.235.153	2018-08-29 07:47:27.050336	2018-08-30 09:43:08.3504	f	Christophe Chaudey	\N	\N	\N	\N	\N	\N	\N	0	U6KJ2CCS0	f
19	mathieu.delrot@hdb-technology.com	$2a$11$osMvd0p.VaBR9F8QFsqCM.EpynMDmqrjZckBRgC0/QP9TiYhONT0C	\N	\N	\N	3	2018-09-06 10:38:38.117508	2018-08-30 15:33:31.949245	163.172.235.153	163.172.235.152	2018-08-29 07:47:21.568254	2018-09-06 10:38:38.121902	f	Mathieu DELROT	\N	\N	\N	\N	\N	\N	\N	0	U4ERJ2F7V	f
6	pierregabriel@me.com	$2a$11$JfbPPXEmTKo2Ep6nhoobbOPPwsEQPxdYyUrIn4bP2XxVQExJjsA.G	\N	\N	\N	2	2018-08-30 10:52:02.814923	2018-08-28 08:15:15.325423	163.172.233.43	163.172.235.153	2018-08-28 08:15:14.093343	2018-08-30 10:52:02.823012	f	Pierre Tissot	\N	\N	\N	\N	\N	\N	\N	0	UBHFBQSPK	f
25	geo.couprie@gmail.com	$2a$11$ndKhqkRRE.3Gp9IOVB0kc./7L0wm/T.V0skZC241uLo5b/BSjyRNC	\N	\N	\N	1	2018-08-31 08:48:07.145069	2018-08-31 08:48:07.145069	163.172.235.152	163.172.235.152	2018-08-31 08:48:06.625899	2018-08-31 08:48:07.147546	f	Geoffroy Couprie	\N	\N	\N	\N	\N	\N	\N	0	U1AV514G6	f
28	rneret@vente-privee.com	$2a$11$agdJBdXmGrx5PQXpKh73nO1J86nlPV5pvFygr5wbfou87BfUr67..	\N	\N	\N	1	2018-09-12 07:09:26.581314	2018-09-12 07:09:26.581314	163.172.235.153	163.172.235.153	2018-09-12 07:09:26.509974	2018-09-12 07:09:26.585633	f	Romain Néret	\N	\N	\N	\N	\N	\N	\N	0	UCP5T7R8A	f
29	kartsims@gmail.com	$2a$11$qaCtxqpf5gAMIsL6wh4FG.HeOp2SmQvxQi5sTAW42CSIcyVLigGAa	\N	\N	\N	1	2018-09-12 10:55:17.55067	2018-09-12 10:55:17.55067	163.172.235.153	163.172.235.153	2018-09-12 10:55:17.216241	2018-09-12 10:55:17.55276	f	Simon Tarchichi	\N	\N	\N	\N	\N	\N	\N	0	UCLAWLGF6	f
1	mariette.phulpin@dojogroup.co	$2a$11$kERY6zMK5UJw6JHdpXLCv.WXjFOWPisoLr5yAeVXRyXYqhMWSu.gG	\N	\N	\N	5	2018-09-28 10:08:20.701375	2018-09-14 12:08:16.144894	163.172.235.152	163.172.233.43	2018-08-22 12:57:34.370068	2018-09-28 10:08:20.710949	t	mariette_dojo	\N	2018-08-22 13:06:03.562408	2018-08-22 13:06:03.562408	2018-08-22 13:06:52.588951	\N	\N	\N	0	\N	f
32	etaque@gmail.com	$2a$11$FMC/QGCg7wh/2wo4SFKmxeuQ8ybroRZK/LXDecXDXdNt3YmmkkOI.	\N	\N	\N	1	2018-09-18 09:59:24.776119	2018-09-18 09:59:24.776119	163.172.235.153	163.172.235.153	2018-09-18 09:59:23.273123	2018-09-18 09:59:24.789087	f	Emilien Taque	\N	\N	\N	\N	\N	\N	\N	0	U5WBQFWAC	f
8	clement.nivolle@clever-cloud.com	$2a$11$h..dhS4J2tMFT3iF/zyh9usacIaCivZBXKeuRxymCfcHlmAahAZp6	\N	\N	\N	4	2018-10-02 08:52:02.164797	2018-09-25 10:06:01.00389	163.172.233.44	163.172.233.44	2018-08-28 08:16:05.611525	2018-10-02 08:52:02.168885	f	Clément Nivolle	\N	\N	\N	\N	\N	\N	\N	0	U1VV1HDCY	f
13	jmichy@vente-privee.com	$2a$11$ChYC1k2BoObkpmM4IpGCKu.NkqdeE85EgleMcconiZEiE9iB8Rt0i	\N	\N	\N	3	2018-10-02 09:36:59.785904	2018-09-27 08:20:05.730621	163.172.235.152	163.172.235.152	2018-08-28 08:27:08.349572	2018-10-02 09:36:59.792805	f	Jacky	\N	\N	\N	\N	\N	\N	\N	0	UALC31BGT	f
65	jmcuenin@metricsvalue.fr	$2a$11$YqawVkeBxFLpY87DHI3BReyOUE7Z2g7hUCzlfrFdRSZBwTEnS2NJG	\N	\N	\N	2	2018-10-04 10:43:56.344071	2018-10-02 11:23:58.744584	163.172.233.43	163.172.235.153	2018-10-02 11:23:58.60187	2018-10-04 10:43:56.348227	f	Cuenin Jean Marc	\N	\N	\N	\N	\N	\N	\N	0	UCMCKJSTG	f
27	quentin.adam@waxzce.org	$2a$11$ALZEjwB593DFakrMK1XGjeYpU0A2J8.tMDSSBHTNTvuW9oG2B4WCS	\N	\N	\N	2	2018-10-05 11:56:58.510286	2018-09-06 11:17:14.578794	163.172.233.43	163.172.235.153	2018-09-06 11:17:13.912191	2018-10-05 11:56:58.518146	f	Quentin Adam	\N	\N	\N	\N	\N	\N	\N	0	U1VJX4CR5	f
5	sharaiha.m@gmail.com	$2a$11$fwTRhvCt1QCrSpXwzGsVnu5dejiJ/0rY.qkfIp/q4TFUhnDjB4toW	\N	\N	\N	12	2018-10-03 12:37:24.005212	2018-10-02 09:44:39.73611	163.172.235.152	163.172.233.43	2018-08-28 08:15:05.468767	2018-10-03 12:37:24.008122	f	michaël_venteprivée	\N	\N	\N	\N	\N	\N	\N	0	U8WFB9NSX	f
14	terence.desclain@dojogroup.com	$2a$11$zpW4n8uxYVGWsiCs5YuJ0.zA2uT6MCxoAPeQvnx.6RgGe.Nb1hpdi	\N	\N	\N	9	2018-10-03 10:35:38.000398	2018-10-02 12:58:20.796338	163.172.233.43	163.172.233.43	2018-08-28 08:33:22.614928	2018-10-03 10:35:38.004376	f	Terence Desclain	\N	\N	\N	\N	\N	\N	\N	0	U15EBCDNK	f
3	nfilzi.webservices@gmail.com	$2a$11$0XGZj.JG.5eyr3f3TfmWU.87yfLcoASBXPBPvTeMd8rdIbya/02dW	\N	\N	\N	8	2018-10-04 13:04:29.114132	2018-09-12 13:45:54.674897	163.172.235.152	163.172.233.43	2018-08-22 13:08:23.968389	2018-10-04 13:04:55.763794	f	Nicolas Filzi	\N	\N	\N	\N	\N	\N	\N	0	U5PM266NT	t
2	guillaume.cabanel@gmail.com	$2a$11$lgAGYmwsFgAsP2cgmO983.QQITsrPCUcpJuQz6i08Wj4nC.TnF3tu	\N	\N	\N	12	2018-10-09 12:10:45.573866	2018-10-03 09:43:31.700326	163.172.235.153	163.172.233.44	2018-08-22 13:05:02.146908	2018-10-09 12:10:45.588647	f	Guillaume Cabanel	\N	\N	\N	\N	\N	\N	\N	0	U5N5G6QKS	t
66	dupont.corentin44@gmail.com	$2a$11$OFHgYScjknRQAm18XnRT.ujuIVJU0FTk7ctItZttttk9d.72rj9Z.	\N	\N	\N	1	2018-10-10 07:30:55.227709	2018-10-10 07:30:55.227709	163.172.233.43	163.172.233.43	2018-10-10 07:30:55.014899	2018-10-10 07:30:55.233613	f	Corentin DUPONT	\N	\N	\N	\N	\N	\N	\N	0	UCL5674AH	f
67	mlaigle@vente-privee.com	$2a$11$7rmFPebEJjJrdLD/4wCDN.Xf.x42O7QeiuYV0rFDFPb9U/LqjPKj2	\N	\N	\N	1	2018-10-10 07:32:16.961248	2018-10-10 07:32:16.961248	163.172.233.44	163.172.233.44	2018-10-10 07:32:16.943312	2018-10-10 07:32:16.969346	f	Mael Laigle	\N	\N	\N	\N	\N	\N	\N	0	UD8LFKQSD	f
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

SELECT pg_catalog.setval('public.users_id_seq', 67, true);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: meals_pkey; Type: CONSTRAINT; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

ALTER TABLE ONLY public.meals
    ADD CONSTRAINT meals_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: servings_pkey; Type: CONSTRAINT; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

ALTER TABLE ONLY public.servings
    ADD CONSTRAINT servings_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_orders_on_serving_id; Type: INDEX; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

CREATE INDEX index_orders_on_serving_id ON public.orders USING btree (serving_id);


--
-- Name: index_orders_on_user_id; Type: INDEX; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

CREATE INDEX index_orders_on_user_id ON public.orders USING btree (user_id);


--
-- Name: index_servings_on_meal_id; Type: INDEX; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

CREATE INDEX index_servings_on_meal_id ON public.servings USING btree (meal_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_invitation_token; Type: INDEX; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

CREATE UNIQUE INDEX index_users_on_invitation_token ON public.users USING btree (invitation_token);


--
-- Name: index_users_on_invitations_count; Type: INDEX; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

CREATE INDEX index_users_on_invitations_count ON public.users USING btree (invitations_count);


--
-- Name: index_users_on_invited_by_id; Type: INDEX; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

CREATE INDEX index_users_on_invited_by_id ON public.users USING btree (invited_by_id);


--
-- Name: index_users_on_invited_by_type_and_invited_by_id; Type: INDEX; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

CREATE INDEX index_users_on_invited_by_type_and_invited_by_id ON public.users USING btree (invited_by_type, invited_by_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: fk_rails_5562d6994b; Type: FK CONSTRAINT; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_5562d6994b FOREIGN KEY (serving_id) REFERENCES public.servings(id);


--
-- Name: fk_rails_7d75c0552b; Type: FK CONSTRAINT; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

ALTER TABLE ONLY public.servings
    ADD CONSTRAINT fk_rails_7d75c0552b FOREIGN KEY (meal_id) REFERENCES public.meals(id);


--
-- Name: fk_rails_f868b47f6a; Type: FK CONSTRAINT; Schema: public; Owner: ufuzkvvbfcklbmlhigws
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_f868b47f6a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

