--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

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
-- Name: game_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game_sessions (
    id bigint NOT NULL,
    expidition_succeed boolean NOT NULL,
    map_id bigint NOT NULL,
    created date NOT NULL,
    date date NOT NULL,
    classic_rules boolean NOT NULL
);


ALTER TABLE public.game_sessions OWNER TO postgres;

--
-- Name: api_gamesession_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_gamesession_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_gamesession_id_seq OWNER TO postgres;

--
-- Name: api_gamesession_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_gamesession_id_seq OWNED BY public.game_sessions.id;


--
-- Name: game_sessions_players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game_sessions_players (
    id bigint NOT NULL,
    gamesession_id bigint NOT NULL,
    player_id bigint NOT NULL
);


ALTER TABLE public.game_sessions_players OWNER TO postgres;

--
-- Name: api_gamesession_players_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_gamesession_players_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_gamesession_players_id_seq OWNER TO postgres;

--
-- Name: api_gamesession_players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_gamesession_players_id_seq OWNED BY public.game_sessions_players.id;


--
-- Name: maps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maps (
    id bigint NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.maps OWNER TO postgres;

--
-- Name: api_map_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_map_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_map_id_seq OWNER TO postgres;

--
-- Name: api_map_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_map_id_seq OWNED BY public.maps.id;


--
-- Name: match_results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.match_results (
    id bigint NOT NULL,
    is_thrall boolean NOT NULL,
    score smallint NOT NULL,
    game_session_id bigint NOT NULL,
    player_id bigint NOT NULL,
    role_id bigint NOT NULL,
    CONSTRAINT api_matchresults_score_check CHECK ((score >= 0))
);


ALTER TABLE public.match_results OWNER TO postgres;

--
-- Name: api_matchresults_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_matchresults_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_matchresults_id_seq OWNER TO postgres;

--
-- Name: api_matchresults_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_matchresults_id_seq OWNED BY public.match_results.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    id bigint NOT NULL,
    nickname character varying(50) NOT NULL
);


ALTER TABLE public.players OWNER TO postgres;

--
-- Name: api_player_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_player_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_player_id_seq OWNER TO postgres;

--
-- Name: api_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_player_id_seq OWNED BY public.players.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: api_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_role_id_seq OWNER TO postgres;

--
-- Name: api_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_role_id_seq OWNED BY public.roles.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: game_sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_sessions ALTER COLUMN id SET DEFAULT nextval('public.api_gamesession_id_seq'::regclass);


--
-- Name: game_sessions_players id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_sessions_players ALTER COLUMN id SET DEFAULT nextval('public.api_gamesession_players_id_seq'::regclass);


--
-- Name: maps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maps ALTER COLUMN id SET DEFAULT nextval('public.api_map_id_seq'::regclass);


--
-- Name: match_results id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_results ALTER COLUMN id SET DEFAULT nextval('public.api_matchresults_id_seq'::regclass);


--
-- Name: players id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players ALTER COLUMN id SET DEFAULT nextval('public.api_player_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.api_role_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_permission VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO public.auth_permission VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO public.auth_permission VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO public.auth_permission VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO public.auth_permission VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO public.auth_permission VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO public.auth_permission VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO public.auth_permission VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO public.auth_permission VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO public.auth_permission VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO public.auth_permission VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO public.auth_permission VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO public.auth_permission VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO public.auth_permission VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO public.auth_permission VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO public.auth_permission VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO public.auth_permission VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO public.auth_permission VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO public.auth_permission VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO public.auth_permission VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO public.auth_permission VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO public.auth_permission VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO public.auth_permission VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO public.auth_permission VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO public.auth_permission VALUES (25, 'Can add player', 7, 'add_player');
INSERT INTO public.auth_permission VALUES (26, 'Can change player', 7, 'change_player');
INSERT INTO public.auth_permission VALUES (27, 'Can delete player', 7, 'delete_player');
INSERT INTO public.auth_permission VALUES (28, 'Can view player', 7, 'view_player');
INSERT INTO public.auth_permission VALUES (29, 'Can add game session', 8, 'add_gamesession');
INSERT INTO public.auth_permission VALUES (30, 'Can change game session', 8, 'change_gamesession');
INSERT INTO public.auth_permission VALUES (31, 'Can delete game session', 8, 'delete_gamesession');
INSERT INTO public.auth_permission VALUES (32, 'Can view game session', 8, 'view_gamesession');
INSERT INTO public.auth_permission VALUES (33, 'Can add match results', 9, 'add_matchresults');
INSERT INTO public.auth_permission VALUES (34, 'Can change match results', 9, 'change_matchresults');
INSERT INTO public.auth_permission VALUES (35, 'Can delete match results', 9, 'delete_matchresults');
INSERT INTO public.auth_permission VALUES (36, 'Can view match results', 9, 'view_matchresults');
INSERT INTO public.auth_permission VALUES (37, 'Can add role', 10, 'add_role');
INSERT INTO public.auth_permission VALUES (38, 'Can change role', 10, 'change_role');
INSERT INTO public.auth_permission VALUES (39, 'Can delete role', 10, 'delete_role');
INSERT INTO public.auth_permission VALUES (40, 'Can view role', 10, 'view_role');
INSERT INTO public.auth_permission VALUES (41, 'Can add map', 11, 'add_map');
INSERT INTO public.auth_permission VALUES (42, 'Can change map', 11, 'change_map');
INSERT INTO public.auth_permission VALUES (43, 'Can delete map', 11, 'delete_map');
INSERT INTO public.auth_permission VALUES (44, 'Can view map', 11, 'view_map');
INSERT INTO public.auth_permission VALUES (45, 'Can add match result', 9, 'add_matchresult');
INSERT INTO public.auth_permission VALUES (46, 'Can change match result', 9, 'change_matchresult');
INSERT INTO public.auth_permission VALUES (47, 'Can delete match result', 9, 'delete_matchresult');
INSERT INTO public.auth_permission VALUES (48, 'Can view match result', 9, 'view_matchresult');


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_user VALUES (1, 'pbkdf2_sha256$260000$n1IoyCfKKWF7YZ5c7UjskZ$SmEEYBEGxZwAkLpYp/R1xH+NOtXMVqn1mu8yPowBX4s=', '2021-07-10 18:57:15.059491+03', true, 'admin', '', '', 'admin@mail.ru', true, true, '2021-07-10 18:57:05.231491+03');


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_admin_log VALUES (1, '2021-07-10 19:11:25.519991+03', '7', 'ElGaucho', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log VALUES (2, '2021-07-10 19:11:40.66999+03', '1', 'GameSession object (1)', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (3, '2021-07-10 19:14:09.734251+03', '1', 'MatchResult object (1)', 1, '[{"added": {}}]', 9, 1);
INSERT INTO public.django_admin_log VALUES (4, '2021-07-10 19:19:35.189662+03', '2', 'MatchResult object (2)', 1, '[{"added": {}}]', 9, 1);
INSERT INTO public.django_admin_log VALUES (5, '2021-07-10 19:19:57.344652+03', '3', 'MatchResult object (3)', 1, '[{"added": {}}]', 9, 1);
INSERT INTO public.django_admin_log VALUES (6, '2021-07-10 19:20:01.347652+03', '3', 'MatchResult object (3)', 2, '[]', 9, 1);
INSERT INTO public.django_admin_log VALUES (7, '2021-07-10 19:21:15.383653+03', '4', 'MatchResult object (4)', 1, '[{"added": {}}]', 9, 1);
INSERT INTO public.django_admin_log VALUES (8, '2021-07-10 19:21:25.285152+03', '3', 'MatchResult object (3)', 2, '[{"changed": {"fields": ["Score"]}}]', 9, 1);
INSERT INTO public.django_admin_log VALUES (9, '2021-07-10 19:26:05.311651+03', '2', 'The Approach (2)', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (10, '2021-07-10 19:27:01.818151+03', '5', 'The Approach (2) - Rezolventa', 1, '[{"added": {}}]', 9, 1);
INSERT INTO public.django_admin_log VALUES (11, '2021-07-10 19:28:51.607154+03', '6', 'The Approach (2) - Fundaypro', 1, '[{"added": {}}]', 9, 1);
INSERT INTO public.django_admin_log VALUES (12, '2021-07-10 19:29:09.424655+03', '7', 'The Approach (2) - ElGaucho', 1, '[{"added": {}}]', 9, 1);
INSERT INTO public.django_admin_log VALUES (13, '2021-07-10 19:29:24.914664+03', '8', 'The Approach (2) - Fogu', 1, '[{"added": {}}]', 9, 1);
INSERT INTO public.django_admin_log VALUES (14, '2021-07-10 19:30:12.469152+03', '9', 'The Approach (2) - NOOB', 1, '[{"added": {}}]', 9, 1);
INSERT INTO public.django_admin_log VALUES (15, '2021-07-10 19:31:06.283151+03', '5', 'The Approach (2) - Rezolventa', 2, '[{"changed": {"fields": ["Score"]}}]', 9, 1);
INSERT INTO public.django_admin_log VALUES (16, '2021-07-10 19:31:15.866152+03', '6', 'The Approach (2) - Fundaypro', 2, '[{"changed": {"fields": ["Score"]}}]', 9, 1);
INSERT INTO public.django_admin_log VALUES (17, '2021-07-10 19:31:26.965652+03', '7', 'The Approach (2) - ElGaucho', 2, '[{"changed": {"fields": ["Score"]}}]', 9, 1);
INSERT INTO public.django_admin_log VALUES (18, '2021-07-10 19:31:54.175151+03', '6', 'The Approach (2) - Fundaypro', 2, '[{"changed": {"fields": ["Is thrall", "Score"]}}]', 9, 1);
INSERT INTO public.django_admin_log VALUES (19, '2021-07-10 19:32:00.204652+03', '8', 'The Approach (2) - Fogu', 2, '[{"changed": {"fields": ["Score"]}}]', 9, 1);
INSERT INTO public.django_admin_log VALUES (20, '2021-07-10 19:32:10.976152+03', '6', 'The Approach (2) - Fundaypro', 2, '[{"changed": {"fields": ["Score"]}}]', 9, 1);
INSERT INTO public.django_admin_log VALUES (21, '2021-07-10 23:59:07.421572+03', '3', 'The Summit (3)', 1, '[{"added": {}}, {"added": {"name": "match result", "object": "The Summit (3) - Rezolventa"}}, {"added": {"name": "match result", "object": "The Summit (3) - Fogu"}}, {"added": {"name": "match result", "object": "The Summit (3) - Fundaypro"}}, {"added": {"name": "match result", "object": "The Summit (3) - NOOB"}}, {"added": {"name": "match result", "object": "The Summit (3) - Chimichanga"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (22, '2021-07-11 00:02:15.641098+03', '3', 'The Summit (3)', 2, '[{"changed": {"name": "match result", "object": "The Summit (3) - Chimichanga", "fields": ["Role"]}}, {"changed": {"name": "match result", "object": "The Summit (3) - Fogu", "fields": ["Role"]}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (23, '2021-07-11 00:05:25.772073+03', '4', 'The Summit (4)', 1, '[{"added": {}}, {"added": {"name": "match result", "object": "The Summit (4) - Rezolventa"}}, {"added": {"name": "match result", "object": "The Summit (4) - Fogu"}}, {"added": {"name": "match result", "object": "The Summit (4) - Chimichanga"}}, {"added": {"name": "match result", "object": "The Summit (4) - NOOB"}}, {"added": {"name": "match result", "object": "The Summit (4) - Fundaypro"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (24, '2021-07-11 00:23:36.9418+03', '5', 'The Summit (5)', 1, '[{"added": {}}, {"added": {"name": "match result", "object": "The Summit (5) - Andatr"}}, {"added": {"name": "match result", "object": "The Summit (5) - Fundaypro"}}, {"added": {"name": "match result", "object": "The Summit (5) - Fogu"}}, {"added": {"name": "match result", "object": "The Summit (5) - Rezolventa"}}, {"added": {"name": "match result", "object": "The Summit (5) - Chimichanga"}}, {"added": {"name": "match result", "object": "The Summit (5) - NOOB"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (25, '2021-07-11 00:30:06.211586+03', '5', 'The Summit (5)', 2, '[{"changed": {"name": "match result", "object": "The Summit (5) - Andatr", "fields": ["Role"]}}, {"changed": {"name": "match result", "object": "The Summit (5) - Chimichanga", "fields": ["Role"]}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (26, '2021-07-11 00:30:29.853551+03', '6', 'The Summit (6)', 1, '[{"added": {}}, {"added": {"name": "match result", "object": "The Summit (6) - NOOB"}}, {"added": {"name": "match result", "object": "The Summit (6) - Fundaypro"}}, {"added": {"name": "match result", "object": "The Summit (6) - Andatr"}}, {"added": {"name": "match result", "object": "The Summit (6) - Fogu"}}, {"added": {"name": "match result", "object": "The Summit (6) - Rezolventa"}}, {"added": {"name": "match result", "object": "The Summit (6) - Chimichanga"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (27, '2021-07-11 00:32:46.754924+03', '7', 'The Summit (7)', 1, '[{"added": {}}, {"added": {"name": "match result", "object": "The Summit (7) - NOOB"}}, {"added": {"name": "match result", "object": "The Summit (7) - Fundaypro"}}, {"added": {"name": "match result", "object": "The Summit (7) - Fogu"}}, {"added": {"name": "match result", "object": "The Summit (7) - Chimichanga"}}, {"added": {"name": "match result", "object": "The Summit (7) - Andatr"}}, {"added": {"name": "match result", "object": "The Summit (7) - Rezolventa"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (28, '2021-07-11 00:43:27.856865+03', '7', 'The Summit (7)', 2, '[{"changed": {"fields": ["Date"]}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (29, '2021-07-11 00:43:34.46466+03', '6', 'The Summit (6)', 2, '[{"changed": {"fields": ["Date"]}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (30, '2021-07-11 00:43:40.185116+03', '5', 'The Summit (5)', 2, '[{"changed": {"fields": ["Date"]}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (31, '2021-07-11 00:45:05.637083+03', '4', 'The Summit (4)', 2, '[{"changed": {"fields": ["Date"]}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (32, '2021-07-11 00:45:39.386572+03', '4', 'The Summit (4)', 2, '[{"changed": {"fields": ["Date"]}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (33, '2021-07-11 00:45:47.3236+03', '3', 'The Summit (3)', 2, '[{"changed": {"fields": ["Date"]}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (34, '2021-07-11 00:46:07.407571+03', '2', 'The Approach (2)', 2, '[{"changed": {"fields": ["Date"]}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (35, '2021-07-11 00:46:13.852065+03', '1', 'The Approach (1)', 2, '[{"changed": {"fields": ["Date"]}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (36, '2021-07-11 00:49:32.309369+03', '2', 'The Approach (2)', 2, '[{"changed": {"name": "match result", "object": "The Approach (2) - NOOB", "fields": ["Score"]}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (37, '2021-07-11 00:53:18.794556+03', '8', 'The Summit (8)', 1, '[{"added": {}}, {"added": {"name": "match result", "object": "The Summit (8) - NOOB"}}, {"added": {"name": "match result", "object": "The Summit (8) - Fundaypro"}}, {"added": {"name": "match result", "object": "The Summit (8) - Fogu"}}, {"added": {"name": "match result", "object": "The Summit (8) - Andatr"}}, {"added": {"name": "match result", "object": "The Summit (8) - Chimichanga"}}, {"added": {"name": "match result", "object": "The Summit (8) - Rezolventa"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (38, '2021-07-11 00:55:06.54761+03', '9', 'The Summit (9)', 1, '[{"added": {}}, {"added": {"name": "match result", "object": "The Summit (9) - NOOB"}}, {"added": {"name": "match result", "object": "The Summit (9) - Andatr"}}, {"added": {"name": "match result", "object": "The Summit (9) - Fogu"}}, {"added": {"name": "match result", "object": "The Summit (9) - Rezolventa"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (39, '2021-07-11 00:58:42.042687+03', '10', 'The Summit (10)', 1, '[{"added": {}}, {"added": {"name": "match result", "object": "The Summit (10) - NOOB"}}, {"added": {"name": "match result", "object": "The Summit (10) - Andatr"}}, {"added": {"name": "match result", "object": "The Summit (10) - Fogu"}}, {"added": {"name": "match result", "object": "The Summit (10) - Rezolventa"}}, {"added": {"name": "match result", "object": "The Summit (10) - Chimichanga"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (40, '2021-07-11 01:08:16.027164+03', '11', 'The Summit (11)', 1, '[{"added": {}}, {"added": {"name": "match result", "object": "The Summit (11) - NOOB"}}, {"added": {"name": "match result", "object": "The Summit (11) - Andatr"}}, {"added": {"name": "match result", "object": "The Summit (11) - Fogu"}}, {"added": {"name": "match result", "object": "The Summit (11) - Fundaypro"}}, {"added": {"name": "match result", "object": "The Summit (11) - Rezolventa"}}, {"added": {"name": "match result", "object": "The Summit (11) - Chimichanga"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (41, '2021-07-11 01:16:48.200888+03', '12', 'The Summit (12)', 1, '[{"added": {}}, {"added": {"name": "match result", "object": "The Summit (12) - NOOB"}}, {"added": {"name": "match result", "object": "The Summit (12) - Fundaypro"}}, {"added": {"name": "match result", "object": "The Summit (12) - Andatr"}}, {"added": {"name": "match result", "object": "The Summit (12) - Fogu"}}, {"added": {"name": "match result", "object": "The Summit (12) - Rezolventa"}}, {"added": {"name": "match result", "object": "The Summit (12) - Chimichanga"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (42, '2021-07-11 23:20:22.09459+03', '8', 'Octaharon', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log VALUES (43, '2021-07-11 23:23:45.752685+03', '13', 'The Summit (13)', 1, '[{"added": {}}, {"added": {"name": "match result", "object": "The Summit (13) - Octaharon"}}, {"added": {"name": "match result", "object": "The Summit (13) - Fundaypro"}}, {"added": {"name": "match result", "object": "The Summit (13) - Fogu"}}, {"added": {"name": "match result", "object": "The Summit (13) - Rezolventa"}}, {"added": {"name": "match result", "object": "The Summit (13) - NOOB"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (44, '2021-07-11 23:27:08.810644+03', '14', 'The Summit (14)', 1, '[{"added": {}}, {"added": {"name": "match result", "object": "The Summit (14) - NOOB"}}, {"added": {"name": "match result", "object": "The Summit (14) - Octaharon"}}, {"added": {"name": "match result", "object": "The Summit (14) - Fundaypro"}}, {"added": {"name": "match result", "object": "The Summit (14) - Fogu"}}, {"added": {"name": "match result", "object": "The Summit (14) - Rezolventa"}}, {"added": {"name": "match result", "object": "The Summit (14) - Chimichanga"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (45, '2021-07-12 01:01:52.398003+03', '15', 'The Summit (15)', 1, '[{"added": {}}, {"added": {"name": "match result", "object": "The Summit (15) - NOOB"}}, {"added": {"name": "match result", "object": "The Summit (15) - Fogu"}}, {"added": {"name": "match result", "object": "The Summit (15) - Fundaypro"}}, {"added": {"name": "match result", "object": "The Summit (15) - Chimichanga"}}, {"added": {"name": "match result", "object": "The Summit (15) - Rezolventa"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (46, '2021-07-12 01:02:17.098015+03', '15', 'The Summit (15)', 2, '[{"changed": {"fields": ["Expidition succeed"]}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (47, '2021-07-12 01:05:52.866933+03', '16', 'The Summit (16)', 1, '[{"added": {}}, {"added": {"name": "match result", "object": "The Summit (16) - NOOB"}}, {"added": {"name": "match result", "object": "The Summit (16) - Fundaypro"}}, {"added": {"name": "match result", "object": "The Summit (16) - Fogu"}}, {"added": {"name": "match result", "object": "The Summit (16) - Chimichanga"}}, {"added": {"name": "match result", "object": "The Summit (16) - Andatr"}}, {"added": {"name": "match result", "object": "The Summit (16) - Rezolventa"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (48, '2021-07-12 01:07:34.417503+03', '17', 'The Summit (17)', 1, '[{"added": {}}, {"added": {"name": "match result", "object": "The Summit (17) - NOOB"}}, {"added": {"name": "match result", "object": "The Summit (17) - Fundaypro"}}, {"added": {"name": "match result", "object": "The Summit (17) - Fogu"}}, {"added": {"name": "match result", "object": "The Summit (17) - Chimichanga"}}, {"added": {"name": "match result", "object": "The Summit (17) - Andatr"}}, {"added": {"name": "match result", "object": "The Summit (17) - Rezolventa"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (49, '2021-07-12 01:08:43.118994+03', '17', 'The Summit (17)', 2, '[{"changed": {"fields": ["Classic rules"]}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (50, '2021-07-12 01:08:50.148018+03', '16', 'The Summit (16)', 2, '[{"changed": {"fields": ["Classic rules"]}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (51, '2021-07-13 00:06:27.482934+03', '18', 'The Summit (18)', 1, '[{"added": {}}, {"added": {"name": "match result", "object": "The Summit (18) - Fundaypro"}}, {"added": {"name": "match result", "object": "The Summit (18) - Fogu"}}, {"added": {"name": "match result", "object": "The Summit (18) - Rezolventa"}}, {"added": {"name": "match result", "object": "The Summit (18) - NOOB"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (52, '2021-07-13 00:08:07.668946+03', '19', 'The Summit (19)', 1, '[{"added": {}}, {"added": {"name": "match result", "object": "The Summit (19) - NOOB"}}, {"added": {"name": "match result", "object": "The Summit (19) - Fogu"}}, {"added": {"name": "match result", "object": "The Summit (19) - Fundaypro"}}, {"added": {"name": "match result", "object": "The Summit (19) - Rezolventa"}}, {"added": {"name": "match result", "object": "The Summit (19) - Chimichanga"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (53, '2021-07-13 00:10:02.59073+03', '20', 'The Summit (20)', 1, '[{"added": {}}, {"added": {"name": "match result", "object": "The Summit (20) - NOOB"}}, {"added": {"name": "match result", "object": "The Summit (20) - Fundaypro"}}, {"added": {"name": "match result", "object": "The Summit (20) - Fogu"}}, {"added": {"name": "match result", "object": "The Summit (20) - Rezolventa"}}, {"added": {"name": "match result", "object": "The Summit (20) - Chimichanga"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (54, '2021-07-13 00:10:41.010623+03', '19', 'The Summit (19)', 2, '[]', 8, 1);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_content_type VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type VALUES (2, 'auth', 'permission');
INSERT INTO public.django_content_type VALUES (3, 'auth', 'group');
INSERT INTO public.django_content_type VALUES (4, 'auth', 'user');
INSERT INTO public.django_content_type VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type VALUES (6, 'sessions', 'session');
INSERT INTO public.django_content_type VALUES (7, 'api', 'player');
INSERT INTO public.django_content_type VALUES (8, 'api', 'gamesession');
INSERT INTO public.django_content_type VALUES (10, 'api', 'role');
INSERT INTO public.django_content_type VALUES (11, 'api', 'map');
INSERT INTO public.django_content_type VALUES (9, 'api', 'matchresult');


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_migrations VALUES (1, 'contenttypes', '0001_initial', '2021-07-10 15:43:02.048927+03');
INSERT INTO public.django_migrations VALUES (2, 'auth', '0001_initial', '2021-07-10 15:43:02.559428+03');
INSERT INTO public.django_migrations VALUES (3, 'admin', '0001_initial', '2021-07-10 15:43:02.66693+03');
INSERT INTO public.django_migrations VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2021-07-10 15:43:02.68193+03');
INSERT INTO public.django_migrations VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2021-07-10 15:43:02.69843+03');
INSERT INTO public.django_migrations VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2021-07-10 15:43:02.72643+03');
INSERT INTO public.django_migrations VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2021-07-10 15:43:02.740928+03');
INSERT INTO public.django_migrations VALUES (8, 'auth', '0003_alter_user_email_max_length', '2021-07-10 15:43:02.756942+03');
INSERT INTO public.django_migrations VALUES (9, 'auth', '0004_alter_user_username_opts', '2021-07-10 15:43:02.774444+03');
INSERT INTO public.django_migrations VALUES (10, 'auth', '0005_alter_user_last_login_null', '2021-07-10 15:43:02.825927+03');
INSERT INTO public.django_migrations VALUES (11, 'auth', '0006_require_contenttypes_0002', '2021-07-10 15:43:02.842429+03');
INSERT INTO public.django_migrations VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2021-07-10 15:43:02.856445+03');
INSERT INTO public.django_migrations VALUES (13, 'auth', '0008_alter_user_username_max_length', '2021-07-10 15:43:02.914432+03');
INSERT INTO public.django_migrations VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2021-07-10 15:43:02.931428+03');
INSERT INTO public.django_migrations VALUES (15, 'auth', '0010_alter_group_name_max_length', '2021-07-10 15:43:02.950929+03');
INSERT INTO public.django_migrations VALUES (16, 'auth', '0011_update_proxy_permissions', '2021-07-10 15:43:02.98194+03');
INSERT INTO public.django_migrations VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2021-07-10 15:43:03.007929+03');
INSERT INTO public.django_migrations VALUES (18, 'sessions', '0001_initial', '2021-07-10 15:43:03.150931+03');
INSERT INTO public.django_migrations VALUES (19, 'api', '0001_initial', '2021-07-10 17:48:43.036865+03');
INSERT INTO public.django_migrations VALUES (20, 'api', '0002_auto_20210710_1754', '2021-07-10 17:54:04.991969+03');
INSERT INTO public.django_migrations VALUES (21, 'api', '0003_auto_20210710_1905', '2021-07-10 19:05:51.218992+03');
INSERT INTO public.django_migrations VALUES (22, 'api', '0004_auto_20210711_0042', '2021-07-11 00:42:56.54807+03');
INSERT INTO public.django_migrations VALUES (23, 'api', '0005_auto_20210711_1424', '2021-07-11 14:24:10.123472+03');
INSERT INTO public.django_migrations VALUES (24, 'api', '0006_auto_20210712_0108', '2021-07-12 01:08:33.099981+03');


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_session VALUES ('ebjhb3e1po6fwbnjrd4xmyi0rfeh10jw', '.eJxVjDEOwjAMRe-SGUU0VpyEkZ0zRI7t0AJqpaadKu4OlTrA-t97fzOZ1qXPa9M5D2IupjOn360QP3XcgTxovE-Wp3GZh2J3xR602dsk-roe7t9BT63_1oVTrCwcg68qFZI4SqoFVABDJcQkjI4AILJzHrsYz4oBOvBaMJr3BxpWOFM:1m2FLv:uniaZ1HcxQbbeRmol74qpOcld3XNQ0rxMeB5qIcWYV4', '2021-07-24 18:57:15.092493+03');


--
-- Data for Name: game_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.game_sessions VALUES (7, false, 2, '2021-07-11', '2021-07-09', true);
INSERT INTO public.game_sessions VALUES (6, false, 2, '2021-07-11', '2021-07-09', true);
INSERT INTO public.game_sessions VALUES (5, false, 2, '2021-07-11', '2021-07-09', true);
INSERT INTO public.game_sessions VALUES (4, false, 2, '2021-07-11', '2021-07-07', true);
INSERT INTO public.game_sessions VALUES (3, true, 2, '2021-07-11', '2021-07-07', true);
INSERT INTO public.game_sessions VALUES (1, true, 1, '2021-07-11', '2021-07-06', true);
INSERT INTO public.game_sessions VALUES (2, false, 1, '2021-07-11', '2021-07-06', true);
INSERT INTO public.game_sessions VALUES (8, false, 2, '2021-07-11', '2021-07-09', true);
INSERT INTO public.game_sessions VALUES (9, false, 2, '2021-07-11', '2021-07-10', true);
INSERT INTO public.game_sessions VALUES (10, false, 2, '2021-07-11', '2021-07-10', true);
INSERT INTO public.game_sessions VALUES (11, false, 2, '2021-07-11', '2021-07-10', true);
INSERT INTO public.game_sessions VALUES (12, true, 2, '2021-07-11', '2021-07-10', true);
INSERT INTO public.game_sessions VALUES (13, true, 2, '2021-07-11', '2021-07-11', true);
INSERT INTO public.game_sessions VALUES (14, false, 2, '2021-07-11', '2021-07-11', true);
INSERT INTO public.game_sessions VALUES (15, true, 2, '2021-07-11', '2021-07-11', true);
INSERT INTO public.game_sessions VALUES (17, false, 2, '2021-07-11', '2021-07-11', false);
INSERT INTO public.game_sessions VALUES (16, false, 2, '2021-07-11', '2021-07-11', false);
INSERT INTO public.game_sessions VALUES (18, false, 2, '2021-07-12', '2021-07-12', true);
INSERT INTO public.game_sessions VALUES (20, false, 2, '2021-07-12', '2021-07-12', true);
INSERT INTO public.game_sessions VALUES (19, false, 2, '2021-07-12', '2021-07-12', true);


--
-- Data for Name: game_sessions_players; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.game_sessions_players VALUES (1, 1, 1);
INSERT INTO public.game_sessions_players VALUES (2, 1, 3);
INSERT INTO public.game_sessions_players VALUES (3, 1, 4);
INSERT INTO public.game_sessions_players VALUES (4, 1, 7);
INSERT INTO public.game_sessions_players VALUES (5, 2, 1);
INSERT INTO public.game_sessions_players VALUES (6, 2, 2);
INSERT INTO public.game_sessions_players VALUES (7, 2, 4);
INSERT INTO public.game_sessions_players VALUES (8, 2, 5);
INSERT INTO public.game_sessions_players VALUES (9, 2, 7);
INSERT INTO public.game_sessions_players VALUES (10, 3, 1);
INSERT INTO public.game_sessions_players VALUES (11, 3, 2);
INSERT INTO public.game_sessions_players VALUES (12, 3, 3);
INSERT INTO public.game_sessions_players VALUES (13, 3, 4);
INSERT INTO public.game_sessions_players VALUES (14, 3, 5);
INSERT INTO public.game_sessions_players VALUES (15, 4, 1);
INSERT INTO public.game_sessions_players VALUES (16, 4, 2);
INSERT INTO public.game_sessions_players VALUES (17, 4, 3);
INSERT INTO public.game_sessions_players VALUES (18, 4, 4);
INSERT INTO public.game_sessions_players VALUES (19, 4, 5);
INSERT INTO public.game_sessions_players VALUES (20, 5, 1);
INSERT INTO public.game_sessions_players VALUES (21, 5, 2);
INSERT INTO public.game_sessions_players VALUES (22, 5, 3);
INSERT INTO public.game_sessions_players VALUES (23, 5, 4);
INSERT INTO public.game_sessions_players VALUES (24, 5, 5);
INSERT INTO public.game_sessions_players VALUES (25, 5, 6);
INSERT INTO public.game_sessions_players VALUES (26, 6, 1);
INSERT INTO public.game_sessions_players VALUES (27, 6, 2);
INSERT INTO public.game_sessions_players VALUES (28, 6, 3);
INSERT INTO public.game_sessions_players VALUES (29, 6, 4);
INSERT INTO public.game_sessions_players VALUES (30, 6, 5);
INSERT INTO public.game_sessions_players VALUES (31, 6, 6);
INSERT INTO public.game_sessions_players VALUES (32, 7, 1);
INSERT INTO public.game_sessions_players VALUES (33, 7, 2);
INSERT INTO public.game_sessions_players VALUES (34, 7, 3);
INSERT INTO public.game_sessions_players VALUES (35, 7, 4);
INSERT INTO public.game_sessions_players VALUES (36, 7, 5);
INSERT INTO public.game_sessions_players VALUES (37, 7, 6);
INSERT INTO public.game_sessions_players VALUES (38, 8, 1);
INSERT INTO public.game_sessions_players VALUES (39, 8, 2);
INSERT INTO public.game_sessions_players VALUES (40, 8, 3);
INSERT INTO public.game_sessions_players VALUES (41, 8, 4);
INSERT INTO public.game_sessions_players VALUES (42, 8, 5);
INSERT INTO public.game_sessions_players VALUES (43, 8, 6);
INSERT INTO public.game_sessions_players VALUES (44, 9, 1);
INSERT INTO public.game_sessions_players VALUES (45, 9, 2);
INSERT INTO public.game_sessions_players VALUES (46, 9, 4);
INSERT INTO public.game_sessions_players VALUES (47, 9, 6);
INSERT INTO public.game_sessions_players VALUES (48, 10, 1);
INSERT INTO public.game_sessions_players VALUES (49, 10, 2);
INSERT INTO public.game_sessions_players VALUES (50, 10, 3);
INSERT INTO public.game_sessions_players VALUES (51, 10, 4);
INSERT INTO public.game_sessions_players VALUES (52, 10, 6);
INSERT INTO public.game_sessions_players VALUES (53, 11, 1);
INSERT INTO public.game_sessions_players VALUES (54, 11, 2);
INSERT INTO public.game_sessions_players VALUES (55, 11, 3);
INSERT INTO public.game_sessions_players VALUES (56, 11, 4);
INSERT INTO public.game_sessions_players VALUES (57, 11, 5);
INSERT INTO public.game_sessions_players VALUES (58, 11, 6);
INSERT INTO public.game_sessions_players VALUES (59, 12, 1);
INSERT INTO public.game_sessions_players VALUES (60, 12, 2);
INSERT INTO public.game_sessions_players VALUES (61, 12, 3);
INSERT INTO public.game_sessions_players VALUES (62, 12, 4);
INSERT INTO public.game_sessions_players VALUES (63, 12, 5);
INSERT INTO public.game_sessions_players VALUES (64, 12, 6);
INSERT INTO public.game_sessions_players VALUES (65, 13, 1);
INSERT INTO public.game_sessions_players VALUES (66, 13, 2);
INSERT INTO public.game_sessions_players VALUES (67, 13, 4);
INSERT INTO public.game_sessions_players VALUES (68, 13, 5);
INSERT INTO public.game_sessions_players VALUES (69, 13, 8);
INSERT INTO public.game_sessions_players VALUES (70, 14, 1);
INSERT INTO public.game_sessions_players VALUES (71, 14, 2);
INSERT INTO public.game_sessions_players VALUES (72, 14, 3);
INSERT INTO public.game_sessions_players VALUES (73, 14, 4);
INSERT INTO public.game_sessions_players VALUES (74, 14, 5);
INSERT INTO public.game_sessions_players VALUES (75, 14, 8);
INSERT INTO public.game_sessions_players VALUES (76, 15, 1);
INSERT INTO public.game_sessions_players VALUES (77, 15, 2);
INSERT INTO public.game_sessions_players VALUES (78, 15, 3);
INSERT INTO public.game_sessions_players VALUES (79, 15, 4);
INSERT INTO public.game_sessions_players VALUES (80, 15, 5);
INSERT INTO public.game_sessions_players VALUES (81, 16, 1);
INSERT INTO public.game_sessions_players VALUES (82, 16, 2);
INSERT INTO public.game_sessions_players VALUES (83, 16, 3);
INSERT INTO public.game_sessions_players VALUES (84, 16, 4);
INSERT INTO public.game_sessions_players VALUES (85, 16, 5);
INSERT INTO public.game_sessions_players VALUES (86, 16, 6);
INSERT INTO public.game_sessions_players VALUES (87, 17, 1);
INSERT INTO public.game_sessions_players VALUES (88, 17, 2);
INSERT INTO public.game_sessions_players VALUES (89, 17, 3);
INSERT INTO public.game_sessions_players VALUES (90, 17, 4);
INSERT INTO public.game_sessions_players VALUES (91, 17, 5);
INSERT INTO public.game_sessions_players VALUES (92, 17, 6);
INSERT INTO public.game_sessions_players VALUES (93, 18, 1);
INSERT INTO public.game_sessions_players VALUES (94, 18, 2);
INSERT INTO public.game_sessions_players VALUES (95, 18, 4);
INSERT INTO public.game_sessions_players VALUES (96, 18, 5);
INSERT INTO public.game_sessions_players VALUES (97, 19, 1);
INSERT INTO public.game_sessions_players VALUES (98, 19, 2);
INSERT INTO public.game_sessions_players VALUES (99, 19, 3);
INSERT INTO public.game_sessions_players VALUES (100, 19, 4);
INSERT INTO public.game_sessions_players VALUES (101, 19, 5);
INSERT INTO public.game_sessions_players VALUES (102, 20, 1);
INSERT INTO public.game_sessions_players VALUES (103, 20, 2);
INSERT INTO public.game_sessions_players VALUES (104, 20, 3);
INSERT INTO public.game_sessions_players VALUES (105, 20, 4);
INSERT INTO public.game_sessions_players VALUES (106, 20, 5);


--
-- Data for Name: maps; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.maps VALUES (1, 'The Approach');
INSERT INTO public.maps VALUES (2, 'The Summit');


--
-- Data for Name: match_results; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.match_results VALUES (1, false, 2166, 1, 1, 7);
INSERT INTO public.match_results VALUES (2, true, 1020, 1, 4, 4);
INSERT INTO public.match_results VALUES (4, false, 5078, 1, 2, 5);
INSERT INTO public.match_results VALUES (3, false, 3935, 1, 7, 3);
INSERT INTO public.match_results VALUES (5, false, 4124, 2, 1, 7);
INSERT INTO public.match_results VALUES (7, false, 393, 2, 7, 6);
INSERT INTO public.match_results VALUES (8, false, 3580, 2, 2, 5);
INSERT INTO public.match_results VALUES (6, true, 3062, 2, 5, 3);
INSERT INTO public.match_results VALUES (10, false, 2893, 3, 1, 7);
INSERT INTO public.match_results VALUES (12, false, 2604, 3, 5, 3);
INSERT INTO public.match_results VALUES (13, false, 2652, 3, 4, 4);
INSERT INTO public.match_results VALUES (14, true, 1463, 3, 3, 6);
INSERT INTO public.match_results VALUES (11, false, 6023, 3, 2, 5);
INSERT INTO public.match_results VALUES (15, false, 0, 4, 1, 7);
INSERT INTO public.match_results VALUES (16, false, 0, 4, 2, 5);
INSERT INTO public.match_results VALUES (17, false, 0, 4, 3, 6);
INSERT INTO public.match_results VALUES (18, false, 0, 4, 4, 4);
INSERT INTO public.match_results VALUES (19, true, 0, 4, 5, 3);
INSERT INTO public.match_results VALUES (21, false, 3412, 5, 5, 3);
INSERT INTO public.match_results VALUES (22, false, 2453, 5, 2, 6);
INSERT INTO public.match_results VALUES (23, true, 3074, 5, 1, 7);
INSERT INTO public.match_results VALUES (25, false, 2609, 5, 4, 4);
INSERT INTO public.match_results VALUES (20, true, 1987, 5, 6, 5);
INSERT INTO public.match_results VALUES (24, false, 788, 5, 3, 1);
INSERT INTO public.match_results VALUES (26, false, 332, 6, 4, 4);
INSERT INTO public.match_results VALUES (27, false, 1280, 6, 5, 3);
INSERT INTO public.match_results VALUES (28, false, 564, 6, 6, 5);
INSERT INTO public.match_results VALUES (29, false, 280, 6, 2, 6);
INSERT INTO public.match_results VALUES (30, true, 2713, 6, 1, 7);
INSERT INTO public.match_results VALUES (31, true, 2066, 6, 3, 1);
INSERT INTO public.match_results VALUES (32, false, 877, 7, 4, 4);
INSERT INTO public.match_results VALUES (33, true, 2690, 7, 5, 3);
INSERT INTO public.match_results VALUES (34, false, 584, 7, 2, 6);
INSERT INTO public.match_results VALUES (35, true, 1990, 7, 3, 1);
INSERT INTO public.match_results VALUES (36, false, 586, 7, 6, 5);
INSERT INTO public.match_results VALUES (37, false, 860, 7, 1, 7);
INSERT INTO public.match_results VALUES (9, false, 1651, 2, 4, 4);
INSERT INTO public.match_results VALUES (38, false, 1371, 8, 4, 4);
INSERT INTO public.match_results VALUES (39, true, 2369, 8, 5, 3);
INSERT INTO public.match_results VALUES (40, false, 72, 8, 2, 6);
INSERT INTO public.match_results VALUES (41, false, 581, 8, 6, 5);
INSERT INTO public.match_results VALUES (42, false, 543, 8, 3, 1);
INSERT INTO public.match_results VALUES (43, true, 2495, 8, 1, 7);
INSERT INTO public.match_results VALUES (44, false, 2315, 9, 4, 2);
INSERT INTO public.match_results VALUES (45, false, 1475, 9, 6, 7);
INSERT INTO public.match_results VALUES (46, false, 4224, 9, 2, 6);
INSERT INTO public.match_results VALUES (47, true, 2390, 9, 1, 3);
INSERT INTO public.match_results VALUES (48, true, 2118, 10, 4, 2);
INSERT INTO public.match_results VALUES (49, false, 2342, 10, 6, 7);
INSERT INTO public.match_results VALUES (50, false, 4158, 10, 2, 6);
INSERT INTO public.match_results VALUES (51, false, 4979, 10, 1, 3);
INSERT INTO public.match_results VALUES (52, false, 2316, 10, 3, 5);
INSERT INTO public.match_results VALUES (53, false, 1080, 11, 4, 2);
INSERT INTO public.match_results VALUES (54, false, 271, 11, 6, 7);
INSERT INTO public.match_results VALUES (55, true, 3002, 11, 2, 6);
INSERT INTO public.match_results VALUES (56, false, 2339, 11, 5, 4);
INSERT INTO public.match_results VALUES (57, false, 1449, 11, 1, 3);
INSERT INTO public.match_results VALUES (58, true, 1684, 11, 3, 1);
INSERT INTO public.match_results VALUES (59, true, 1408, 12, 4, 2);
INSERT INTO public.match_results VALUES (60, true, 612, 12, 5, 4);
INSERT INTO public.match_results VALUES (61, false, 1009, 12, 6, 7);
INSERT INTO public.match_results VALUES (62, false, 5516, 12, 2, 1);
INSERT INTO public.match_results VALUES (63, false, 6360, 12, 1, 3);
INSERT INTO public.match_results VALUES (64, false, 2645, 12, 3, 5);
INSERT INTO public.match_results VALUES (65, true, 2160, 13, 8, 5);
INSERT INTO public.match_results VALUES (66, false, 3507, 13, 5, 7);
INSERT INTO public.match_results VALUES (67, false, 3289, 13, 2, 6);
INSERT INTO public.match_results VALUES (68, false, 5717, 13, 1, 1);
INSERT INTO public.match_results VALUES (69, false, 2428, 13, 4, 2);
INSERT INTO public.match_results VALUES (70, false, 1441, 14, 4, 2);
INSERT INTO public.match_results VALUES (71, false, 2579, 14, 8, 5);
INSERT INTO public.match_results VALUES (72, false, 4933, 14, 5, 7);
INSERT INTO public.match_results VALUES (73, false, 2201, 14, 2, 8);
INSERT INTO public.match_results VALUES (74, true, 3198, 14, 1, 1);
INSERT INTO public.match_results VALUES (75, true, 3185, 14, 3, 6);
INSERT INTO public.match_results VALUES (76, false, 4298, 15, 4, 2);
INSERT INTO public.match_results VALUES (77, false, 2714, 15, 2, 7);
INSERT INTO public.match_results VALUES (78, false, 4708, 15, 5, 3);
INSERT INTO public.match_results VALUES (79, false, 3279, 15, 3, 6);
INSERT INTO public.match_results VALUES (80, true, 2610, 15, 1, 1);
INSERT INTO public.match_results VALUES (81, false, 855, 16, 4, 2);
INSERT INTO public.match_results VALUES (82, true, 3583, 16, 5, 3);
INSERT INTO public.match_results VALUES (83, true, 2320, 16, 2, 7);
INSERT INTO public.match_results VALUES (84, false, 2494, 16, 3, 6);
INSERT INTO public.match_results VALUES (85, false, 2166, 16, 6, 5);
INSERT INTO public.match_results VALUES (86, false, 3247, 16, 1, 1);
INSERT INTO public.match_results VALUES (87, false, 381, 17, 4, 2);
INSERT INTO public.match_results VALUES (88, false, 3855, 17, 5, 3);
INSERT INTO public.match_results VALUES (89, false, 3099, 17, 2, 7);
INSERT INTO public.match_results VALUES (90, true, 989, 17, 3, 6);
INSERT INTO public.match_results VALUES (91, true, 2561, 17, 6, 5);
INSERT INTO public.match_results VALUES (92, false, 4235, 17, 1, 1);
INSERT INTO public.match_results VALUES (93, true, 3177, 18, 5, 3);
INSERT INTO public.match_results VALUES (94, false, 2160, 18, 2, 6);
INSERT INTO public.match_results VALUES (95, false, 4866, 18, 1, 1);
INSERT INTO public.match_results VALUES (96, false, 2541, 18, 4, 2);
INSERT INTO public.match_results VALUES (97, false, 2427, 19, 4, 2);
INSERT INTO public.match_results VALUES (98, false, 4334, 19, 2, 5);
INSERT INTO public.match_results VALUES (99, false, 3347, 19, 5, 3);
INSERT INTO public.match_results VALUES (100, true, 4953, 19, 1, 1);
INSERT INTO public.match_results VALUES (101, false, 1618, 19, 3, 7);
INSERT INTO public.match_results VALUES (102, false, 2183, 20, 4, 2);
INSERT INTO public.match_results VALUES (103, true, 4252, 20, 5, 3);
INSERT INTO public.match_results VALUES (104, false, 3151, 20, 2, 5);
INSERT INTO public.match_results VALUES (105, false, 7367, 20, 1, 1);
INSERT INTO public.match_results VALUES (106, false, 2536, 20, 3, 7);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.players VALUES (1, 'Rezolventa');
INSERT INTO public.players VALUES (2, 'Fogu');
INSERT INTO public.players VALUES (3, 'Chimichanga');
INSERT INTO public.players VALUES (4, 'NOOB');
INSERT INTO public.players VALUES (5, 'Fundaypro');
INSERT INTO public.players VALUES (6, 'Andatr');
INSERT INTO public.players VALUES (7, 'ElGaucho');
INSERT INTO public.players VALUES (8, 'Octaharon');


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles VALUES (1, 'Captain');
INSERT INTO public.roles VALUES (2, 'Chaplain');
INSERT INTO public.roles VALUES (3, 'Ship''s Cook');
INSERT INTO public.roles VALUES (4, 'Doctor');
INSERT INTO public.roles VALUES (5, 'Engineer');
INSERT INTO public.roles VALUES (6, 'Hunter');
INSERT INTO public.roles VALUES (7, 'Royal Marine');
INSERT INTO public.roles VALUES (8, 'Navigator');


--
-- Name: api_gamesession_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_gamesession_id_seq', 20, true);


--
-- Name: api_gamesession_players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_gamesession_players_id_seq', 106, true);


--
-- Name: api_map_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_map_id_seq', 2, true);


--
-- Name: api_matchresults_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_matchresults_id_seq', 106, true);


--
-- Name: api_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_player_id_seq', 8, true);


--
-- Name: api_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_role_id_seq', 8, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 54, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- Name: game_sessions api_gamesession_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_sessions
    ADD CONSTRAINT api_gamesession_pkey PRIMARY KEY (id);


--
-- Name: game_sessions_players api_gamesession_players_gamesession_id_player_id_ddbd5c80_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_sessions_players
    ADD CONSTRAINT api_gamesession_players_gamesession_id_player_id_ddbd5c80_uniq UNIQUE (gamesession_id, player_id);


--
-- Name: game_sessions_players api_gamesession_players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_sessions_players
    ADD CONSTRAINT api_gamesession_players_pkey PRIMARY KEY (id);


--
-- Name: maps api_map_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maps
    ADD CONSTRAINT api_map_pkey PRIMARY KEY (id);


--
-- Name: match_results api_matchresults_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_results
    ADD CONSTRAINT api_matchresults_pkey PRIMARY KEY (id);


--
-- Name: players api_player_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT api_player_pkey PRIMARY KEY (id);


--
-- Name: roles api_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT api_role_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: api_gamesession_map_id_3dd88dd4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_gamesession_map_id_3dd88dd4 ON public.game_sessions USING btree (map_id);


--
-- Name: api_gamesession_players_gamesession_id_553a3f61; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_gamesession_players_gamesession_id_553a3f61 ON public.game_sessions_players USING btree (gamesession_id);


--
-- Name: api_gamesession_players_player_id_6712ad4c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_gamesession_players_player_id_6712ad4c ON public.game_sessions_players USING btree (player_id);


--
-- Name: api_matchresults_game_session_id_8d4bd364; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_matchresults_game_session_id_8d4bd364 ON public.match_results USING btree (game_session_id);


--
-- Name: api_matchresults_player_id_8455061d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_matchresults_player_id_8455061d ON public.match_results USING btree (player_id);


--
-- Name: api_matchresults_role_id_bf539a3e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_matchresults_role_id_bf539a3e ON public.match_results USING btree (role_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: game_sessions api_gamesession_map_id_3dd88dd4_fk_api_map_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_sessions
    ADD CONSTRAINT api_gamesession_map_id_3dd88dd4_fk_api_map_id FOREIGN KEY (map_id) REFERENCES public.maps(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_sessions_players api_gamesession_play_gamesession_id_553a3f61_fk_api_games; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_sessions_players
    ADD CONSTRAINT api_gamesession_play_gamesession_id_553a3f61_fk_api_games FOREIGN KEY (gamesession_id) REFERENCES public.game_sessions(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_sessions_players api_gamesession_players_player_id_6712ad4c_fk_api_player_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_sessions_players
    ADD CONSTRAINT api_gamesession_players_player_id_6712ad4c_fk_api_player_id FOREIGN KEY (player_id) REFERENCES public.players(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: match_results api_matchresults_game_session_id_8d4bd364_fk_api_gamesession_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_results
    ADD CONSTRAINT api_matchresults_game_session_id_8d4bd364_fk_api_gamesession_id FOREIGN KEY (game_session_id) REFERENCES public.game_sessions(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: match_results api_matchresults_player_id_8455061d_fk_api_player_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_results
    ADD CONSTRAINT api_matchresults_player_id_8455061d_fk_api_player_id FOREIGN KEY (player_id) REFERENCES public.players(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: match_results api_matchresults_role_id_bf539a3e_fk_api_role_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_results
    ADD CONSTRAINT api_matchresults_role_id_bf539a3e_fk_api_role_id FOREIGN KEY (role_id) REFERENCES public.roles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

