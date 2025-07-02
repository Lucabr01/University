--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 17.2

-- Started on 2025-06-24 17:39:37

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 927 (class 1247 OID 459372)
-- Name: TipoNoti; Type: TYPE; Schema: public; Owner: luca
--

CREATE TYPE public."TipoNoti" AS ENUM (
    'NewEvent',
    'NewMessage',
    'NewAlert'
);


ALTER TYPE public."TipoNoti" OWNER TO luca;

--
-- TOC entry 882 (class 1247 OID 434479)
-- Name: flag_dom; Type: DOMAIN; Schema: public; Owner: luca
--

CREATE DOMAIN public.flag_dom AS character varying(10)
	CONSTRAINT flag_dom_check CHECK (((VALUE)::text = ANY ((ARRAY['OTH'::character varying, 'REJ'::character varying, 'RSTO'::character varying, 'RSTOS0'::character varying, 'RSTR'::character varying, 'S0'::character varying, 'S1'::character varying, 'S2'::character varying, 'S3'::character varying, 'SF'::character varying, 'SH'::character varying])::text[])));


ALTER DOMAIN public.flag_dom OWNER TO luca;

--
-- TOC entry 920 (class 1247 OID 442835)
-- Name: label_domain; Type: DOMAIN; Schema: public; Owner: luca
--

CREATE DOMAIN public.label_domain AS character varying(10)
	CONSTRAINT label_domain_check CHECK (((VALUE)::text = ANY (ARRAY[('R2L'::character varying)::text, ('Probe'::character varying)::text, ('DoS'::character varying)::text, ('Anomaly'::character varying)::text, ('Normal'::character varying)::text])));


ALTER DOMAIN public.label_domain OWNER TO luca;

--
-- TOC entry 898 (class 1247 OID 434680)
-- Name: notifica_status_dom; Type: DOMAIN; Schema: public; Owner: luca
--

CREATE DOMAIN public.notifica_status_dom AS character varying(10)
	CONSTRAINT notifica_status_dom_check CHECK (((VALUE)::text = ANY ((ARRAY['DaLeggere'::character varying, 'Letta'::character varying, 'Risolta'::character varying])::text[])));


ALTER DOMAIN public.notifica_status_dom OWNER TO luca;

--
-- TOC entry 874 (class 1247 OID 434473)
-- Name: protocol_type_dom; Type: DOMAIN; Schema: public; Owner: luca
--

CREATE DOMAIN public.protocol_type_dom AS character varying(10)
	CONSTRAINT protocol_type_dom_check CHECK (((VALUE)::text = ANY ((ARRAY['tcp'::character varying, 'udp'::character varying, 'icmp'::character varying])::text[])));


ALTER DOMAIN public.protocol_type_dom OWNER TO luca;

--
-- TOC entry 878 (class 1247 OID 434476)
-- Name: service_dom; Type: DOMAIN; Schema: public; Owner: luca
--

CREATE DOMAIN public.service_dom AS character varying(20)
	CONSTRAINT service_dom_check CHECK (((VALUE)::text = ANY ((ARRAY['aol'::character varying, 'auth'::character varying, 'bgp'::character varying, 'courier'::character varying, 'csnet_ns'::character varying, 'ctf'::character varying, 'daytime'::character varying, 'discard'::character varying, 'domain'::character varying, 'domain_u'::character varying, 'echo'::character varying, 'eco_i'::character varying, 'ecr_i'::character varying, 'efs'::character varying, 'exec'::character varying, 'finger'::character varying, 'ftp'::character varying, 'ftp_data'::character varying, 'gopher'::character varying, 'harvest'::character varying, 'hostnames'::character varying, 'http'::character varying, 'http_2784'::character varying, 'http_443'::character varying, 'http_8001'::character varying, 'imap4'::character varying, 'IRC'::character varying, 'iso_tsap'::character varying, 'klogin'::character varying, 'kshell'::character varying, 'ldap'::character varying, 'link'::character varying, 'login'::character varying, 'mtp'::character varying, 'name'::character varying, 'netbios_dgm'::character varying, 'netbios_ns'::character varying, 'netbios_ssn'::character varying, 'netstat'::character varying, 'nnsp'::character varying, 'nntp'::character varying, 'ntp_u'::character varying, 'other'::character varying, 'pm_dump'::character varying, 'pop_2'::character varying, 'pop_3'::character varying, 'printer'::character varying, 'private'::character varying, 'red_i'::character varying, 'remote_job'::character varying, 'rje'::character varying, 'shell'::character varying, 'smtp'::character varying, 'sql_net'::character varying, 'ssh'::character varying, 'sunrpc'::character varying, 'supdup'::character varying, 'systat'::character varying, 'telnet'::character varying, 'tftp_u'::character varying, 'tim_i'::character varying, 'time'::character varying, 'urh_i'::character varying, 'urp_i'::character varying, 'uucp'::character varying, 'uucp_path'::character varying, 'vmnet'::character varying, 'whois'::character varying, 'X11'::character varying, 'Z39_50'::character varying])::text[])));


ALTER DOMAIN public.service_dom OWNER TO luca;

--
-- TOC entry 930 (class 1247 OID 459380)
-- Name: tiponoti; Type: TYPE; Schema: public; Owner: luca
--

CREATE TYPE public.tiponoti AS ENUM (
    'NewEvent',
    'NewMessage',
    'NewAlert'
);


ALTER TYPE public.tiponoti OWNER TO luca;

--
-- TOC entry 248 (class 1255 OID 442924)
-- Name: check_traffico_isa_completeness(); Type: FUNCTION; Schema: public; Owner: luca
--

CREATE FUNCTION public.check_traffico_isa_completeness() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    cnt integer;
BEGIN
    -- Verifica quanti record nelle tabelle trafficolegit e trafficoanomalo hanno lo stesso oid
    SELECT 
         (CASE WHEN EXISTS(SELECT 1 FROM public.trafficolegit WHERE oid = NEW.oid) THEN 1 ELSE 0 END) +
         (CASE WHEN EXISTS(SELECT 1 FROM public.trafficoanomalo WHERE oid = NEW.oid) THEN 1 ELSE 0 END)
    INTO cnt;
    
    IF cnt <> 1 THEN
       RAISE EXCEPTION 'Disjoint completeness violation: Traffico row with oid % must be in exactly one subtype table, found count = %', NEW.oid, cnt;
    END IF;
    
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.check_traffico_isa_completeness() OWNER TO luca;

--
-- TOC entry 247 (class 1255 OID 442726)
-- Name: check_user_completeness_function(); Type: FUNCTION; Schema: public; Owner: luca
--

CREATE FUNCTION public.check_user_completeness_function() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM operatoreIDS WHERE matr = NEW.matricola)
       AND NOT EXISTS (SELECT 1 FROM operatoreAS WHERE matr = NEW.matricola) THEN
        RAISE EXCEPTION 'Completeness constraint violation: User % must belong to at least one role (operatoreIDS or operatoreAS)', NEW.matricola;
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.check_user_completeness_function() OWNER TO luca;

--
-- TOC entry 260 (class 1255 OID 459370)
-- Name: chk_message_authorized(); Type: FUNCTION; Schema: public; Owner: luca
--

CREATE FUNCTION public.chk_message_authorized() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_assigned_op INTEGER;
    v_event_op    INTEGER;
BEGIN
    -----------------------------------------------------------------
    -- ①  Operatore IDS assegnato sull’evento
    -----------------------------------------------------------------
    SELECT assigned_op
      INTO v_assigned_op
      FROM assigned_event
     WHERE evento_id = NEW.aevento_id;     -- PK di assigned_event

    IF NOT FOUND THEN
        RAISE EXCEPTION
          'Evento % non presente in assigned_event', NEW.aevento_id;
    END IF;

    -----------------------------------------------------------------
    -- ②  Operatore AS che ha aperto l’evento
    -----------------------------------------------------------------
    SELECT operatore
      INTO v_event_op
      FROM evento
     WHERE id = NEW.aevento_id;            -- PK di evento

    IF NOT FOUND THEN
        RAISE EXCEPTION
          'Evento % non presente in evento', NEW.aevento_id;
    END IF;

    -----------------------------------------------------------------
    -- ③  Controllo di autorizzazione
    -----------------------------------------------------------------
    IF NEW.from_op = v_assigned_op OR NEW.from_op = v_event_op THEN
        RETURN NEW;                        -- tutto ok
    END IF;

    RAISE EXCEPTION
      'Operatore % non autorizzato per evento % (ammessi: IDS %, AS %)',
      NEW.from_op, NEW.aevento_id, v_assigned_op, v_event_op;
END;
$$;


ALTER FUNCTION public.chk_message_authorized() OWNER TO luca;

--
-- TOC entry 245 (class 1255 OID 434646)
-- Name: mark_anomaly_handled(); Type: FUNCTION; Schema: public; Owner: luca
--

CREATE FUNCTION public.mark_anomaly_handled() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Se l'evento è legato a un record in TrafficoAnomalo, aggiornalo
    IF NEW.data IS NOT NULL THEN
        UPDATE TrafficoAnomalo 
        SET handled = TRUE 
        WHERE oid = NEW.data;
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.mark_anomaly_handled() OWNER TO luca;

--
-- TOC entry 246 (class 1255 OID 434648)
-- Name: prevent_modification_if_closed(); Type: FUNCTION; Schema: public; Owner: luca
--

CREATE FUNCTION public.prevent_modification_if_closed() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF OLD.closed = TRUE THEN
        RAISE EXCEPTION 'L evento è chiuso e non può essere modificato';
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.prevent_modification_if_closed() OWNER TO luca;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 243 (class 1259 OID 475808)
-- Name: adminstuff; Type: TABLE; Schema: public; Owner: luca
--

CREATE TABLE public.adminstuff (
    oid integer NOT NULL,
    maxopenevents integer,
    sensorsalloff boolean NOT NULL,
    messageafterclosure boolean NOT NULL
);


ALTER TABLE public.adminstuff OWNER TO luca;

--
-- TOC entry 242 (class 1259 OID 475807)
-- Name: adminstuff_oid_seq; Type: SEQUENCE; Schema: public; Owner: luca
--

CREATE SEQUENCE public.adminstuff_oid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.adminstuff_oid_seq OWNER TO luca;

--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 242
-- Name: adminstuff_oid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luca
--

ALTER SEQUENCE public.adminstuff_oid_seq OWNED BY public.adminstuff.oid;


--
-- TOC entry 238 (class 1259 OID 459420)
-- Name: assigned_event; Type: TABLE; Schema: public; Owner: luca
--

CREATE TABLE public.assigned_event (
    evento_id integer NOT NULL,
    assigned_op integer NOT NULL
);


ALTER TABLE public.assigned_event OWNER TO luca;

--
-- TOC entry 227 (class 1259 OID 434620)
-- Name: evento; Type: TABLE; Schema: public; Owner: luca
--

CREATE TABLE public.evento (
    id integer NOT NULL,
    ts timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    operatore integer NOT NULL,
    data integer NOT NULL,
    closed boolean DEFAULT false NOT NULL,
    ts_closed timestamp without time zone,
    commento character varying(500) DEFAULT NULL::character varying,
    CONSTRAINT chk_closed CHECK ((((closed = true) AND (commento IS NOT NULL) AND (ts_closed IS NOT NULL) AND (ts_closed > ts)) OR ((closed = false) AND (commento IS NULL) AND (ts_closed IS NULL))))
);


ALTER TABLE public.evento OWNER TO luca;

--
-- TOC entry 226 (class 1259 OID 434619)
-- Name: evento_id_seq; Type: SEQUENCE; Schema: public; Owner: luca
--

CREATE SEQUENCE public.evento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.evento_id_seq OWNER TO luca;

--
-- TOC entry 5040 (class 0 OID 0)
-- Dependencies: 226
-- Name: evento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luca
--

ALTER SEQUENCE public.evento_id_seq OWNED BY public.evento.id;


--
-- TOC entry 221 (class 1259 OID 434501)
-- Name: global_id_seq; Type: SEQUENCE; Schema: public; Owner: luca
--

CREATE SEQUENCE public.global_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.global_id_seq OWNER TO luca;

--
-- TOC entry 231 (class 1259 OID 442741)
-- Name: gruppo; Type: TABLE; Schema: public; Owner: luca
--

CREATE TABLE public.gruppo (
    oid integer NOT NULL,
    groupname character varying(255)
);


ALTER TABLE public.gruppo OWNER TO luca;

--
-- TOC entry 241 (class 1259 OID 475722)
-- Name: immagine; Type: TABLE; Schema: public; Owner: luca
--

CREATE TABLE public.immagine (
    oid integer NOT NULL,
    foto character varying(255) NOT NULL
);


ALTER TABLE public.immagine OWNER TO luca;

--
-- TOC entry 240 (class 1259 OID 475721)
-- Name: immagine_oid_seq; Type: SEQUENCE; Schema: public; Owner: luca
--

CREATE SEQUENCE public.immagine_oid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.immagine_oid_seq OWNER TO luca;

--
-- TOC entry 5041 (class 0 OID 0)
-- Dependencies: 240
-- Name: immagine_oid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luca
--

ALTER SEQUENCE public.immagine_oid_seq OWNED BY public.immagine.oid;


--
-- TOC entry 244 (class 1259 OID 582212)
-- Name: labels; Type: TABLE; Schema: public; Owner: luca
--

CREATE TABLE public.labels (
    lab character varying(50) NOT NULL
);


ALTER TABLE public.labels OWNER TO luca;

--
-- TOC entry 239 (class 1259 OID 475698)
-- Name: message_oid_seq; Type: SEQUENCE; Schema: public; Owner: luca
--

CREATE SEQUENCE public.message_oid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.message_oid_seq OWNER TO luca;

--
-- TOC entry 235 (class 1259 OID 459351)
-- Name: message; Type: TABLE; Schema: public; Owner: luca
--

CREATE TABLE public.message (
    aevento_id integer NOT NULL,
    ts timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    testo text NOT NULL,
    from_op integer NOT NULL,
    oid integer DEFAULT nextval('public.message_oid_seq'::regclass) NOT NULL
);


ALTER TABLE public.message OWNER TO luca;

--
-- TOC entry 230 (class 1259 OID 442734)
-- Name: module; Type: TABLE; Schema: public; Owner: luca
--

CREATE TABLE public.module (
    oid integer NOT NULL,
    moduleid character varying(255),
    modulename character varying(255),
    group_oid integer,
    group_oid_2 integer
);


ALTER TABLE public.module OWNER TO luca;

--
-- TOC entry 237 (class 1259 OID 459388)
-- Name: notification; Type: TABLE; Schema: public; Owner: luca
--

CREATE TABLE public.notification (
    oid integer NOT NULL,
    ts timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    description text NOT NULL,
    from_pp integer NOT NULL,
    to_pp integer NOT NULL,
    noti_type character varying(20) DEFAULT 'NewEvent'::character varying NOT NULL,
    checked boolean DEFAULT false NOT NULL,
    evento_noti integer,
    CONSTRAINT ck_notification_evento_required CHECK (((((noti_type)::text = ANY ((ARRAY['NewEvent'::character varying, 'NewMessage'::character varying])::text[])) AND (evento_noti IS NOT NULL)) OR (((noti_type)::text <> ALL ((ARRAY['NewEvent'::character varying, 'NewMessage'::character varying])::text[])) AND (evento_noti IS NULL)))),
    CONSTRAINT ck_notification_from_to_diff CHECK ((from_pp <> to_pp)),
    CONSTRAINT ck_notification_noti_values CHECK (((noti_type)::text = ANY ((ARRAY['NewEvent'::character varying, 'NewMessage'::character varying, 'NewAlert'::character varying])::text[])))
);


ALTER TABLE public.notification OWNER TO luca;

--
-- TOC entry 236 (class 1259 OID 459387)
-- Name: notification_oid_seq; Type: SEQUENCE; Schema: public; Owner: luca
--

CREATE SEQUENCE public.notification_oid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notification_oid_seq OWNER TO luca;

--
-- TOC entry 5042 (class 0 OID 0)
-- Dependencies: 236
-- Name: notification_oid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luca
--

ALTER SEQUENCE public.notification_oid_seq OWNED BY public.notification.oid;


--
-- TOC entry 229 (class 1259 OID 442716)
-- Name: operatoreas; Type: TABLE; Schema: public; Owner: luca
--

CREATE TABLE public.operatoreas (
    matr integer NOT NULL
);


ALTER TABLE public.operatoreas OWNER TO luca;

--
-- TOC entry 228 (class 1259 OID 442706)
-- Name: operatoreids; Type: TABLE; Schema: public; Owner: luca
--

CREATE TABLE public.operatoreids (
    matr integer NOT NULL
);


ALTER TABLE public.operatoreids OWNER TO luca;

--
-- TOC entry 233 (class 1259 OID 442754)
-- Name: persona; Type: TABLE; Schema: public; Owner: luca
--

CREATE TABLE public.persona (
    matricola integer NOT NULL,
    nome character varying(255) NOT NULL,
    cognome character varying(255) NOT NULL,
    datanascita date NOT NULL,
    password character varying(255) NOT NULL,
    group_oid integer,
    group_oid_2 integer,
    username character varying(50)
);


ALTER TABLE public.persona OWNER TO luca;

--
-- TOC entry 232 (class 1259 OID 442753)
-- Name: persona_matricola_seq_new; Type: SEQUENCE; Schema: public; Owner: luca
--

CREATE SEQUENCE public.persona_matricola_seq_new
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.persona_matricola_seq_new OWNER TO luca;

--
-- TOC entry 5043 (class 0 OID 0)
-- Dependencies: 232
-- Name: persona_matricola_seq_new; Type: SEQUENCE OWNED BY; Schema: public; Owner: luca
--

ALTER SEQUENCE public.persona_matricola_seq_new OWNED BY public.persona.matricola;


--
-- TOC entry 223 (class 1259 OID 434524)
-- Name: sensore; Type: TABLE; Schema: public; Owner: luca
--

CREATE TABLE public.sensore (
    id integer NOT NULL,
    attivo boolean DEFAULT false NOT NULL
);


ALTER TABLE public.sensore OWNER TO luca;

--
-- TOC entry 222 (class 1259 OID 434523)
-- Name: sensore_id_seq; Type: SEQUENCE; Schema: public; Owner: luca
--

CREATE SEQUENCE public.sensore_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sensore_id_seq OWNER TO luca;

--
-- TOC entry 5044 (class 0 OID 0)
-- Dependencies: 222
-- Name: sensore_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luca
--

ALTER SEQUENCE public.sensore_id_seq OWNED BY public.sensore.id;


--
-- TOC entry 224 (class 1259 OID 434531)
-- Name: traffico; Type: TABLE; Schema: public; Owner: luca
--

CREATE TABLE public.traffico (
    oid integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    ts timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    sensore integer NOT NULL,
    duration real NOT NULL,
    protocol_type character varying(50) NOT NULL,
    service character varying(50) NOT NULL,
    flag character varying(50) NOT NULL,
    src_bytes real NOT NULL,
    dst_bytes real NOT NULL,
    land boolean NOT NULL,
    wrong_fragment real NOT NULL,
    urgent real NOT NULL,
    hot real NOT NULL,
    num_failed_logins real NOT NULL,
    logged_in boolean NOT NULL,
    num_compromised real NOT NULL,
    root_shell real NOT NULL,
    su_attempted real NOT NULL,
    num_root real NOT NULL,
    num_file_creations real NOT NULL,
    num_shells real NOT NULL,
    num_access_files real NOT NULL,
    num_outbound_cmds real NOT NULL,
    anomalyprob real NOT NULL,
    dosprob real NOT NULL,
    scanprob real NOT NULL,
    r2lprob real NOT NULL,
    label character varying(50) NOT NULL,
    CONSTRAINT traffico_anomalyprob_check CHECK ((anomalyprob > (0)::double precision)),
    CONSTRAINT traffico_dosprob_check CHECK ((dosprob > (0)::double precision)),
    CONSTRAINT traffico_r2lprob_check CHECK ((r2lprob > (0)::double precision)),
    CONSTRAINT traffico_scanprob_check CHECK ((scanprob > (0)::double precision))
);


ALTER TABLE public.traffico OWNER TO luca;

--
-- TOC entry 225 (class 1259 OID 434545)
-- Name: trafficoanomalo; Type: TABLE; Schema: public; Owner: luca
--

CREATE TABLE public.trafficoanomalo (
    oid integer DEFAULT nextval('public.global_id_seq'::regclass) NOT NULL,
    handled boolean DEFAULT false NOT NULL,
    ch_ts timestamp without time zone,
    reason character varying(500) DEFAULT NULL::character varying,
    by_op integer
);


ALTER TABLE public.trafficoanomalo OWNER TO luca;

--
-- TOC entry 234 (class 1259 OID 442792)
-- Name: trafficolegit; Type: TABLE; Schema: public; Owner: luca
--

CREATE TABLE public.trafficolegit (
    oid integer NOT NULL,
    ch_ts timestamp without time zone,
    reason character varying(500) DEFAULT NULL::character varying,
    by_op integer
);


ALTER TABLE public.trafficolegit OWNER TO luca;

--
-- TOC entry 4812 (class 2604 OID 475811)
-- Name: adminstuff oid; Type: DEFAULT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.adminstuff ALTER COLUMN oid SET DEFAULT nextval('public.adminstuff_oid_seq'::regclass);


--
-- TOC entry 4799 (class 2604 OID 434623)
-- Name: evento id; Type: DEFAULT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.evento ALTER COLUMN id SET DEFAULT nextval('public.evento_id_seq'::regclass);


--
-- TOC entry 4811 (class 2604 OID 475725)
-- Name: immagine oid; Type: DEFAULT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.immagine ALTER COLUMN oid SET DEFAULT nextval('public.immagine_oid_seq'::regclass);


--
-- TOC entry 4807 (class 2604 OID 459391)
-- Name: notification oid; Type: DEFAULT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.notification ALTER COLUMN oid SET DEFAULT nextval('public.notification_oid_seq'::regclass);


--
-- TOC entry 4803 (class 2604 OID 459448)
-- Name: persona matricola; Type: DEFAULT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.persona ALTER COLUMN matricola SET DEFAULT nextval('public.persona_matricola_seq_new'::regclass);


--
-- TOC entry 4792 (class 2604 OID 434527)
-- Name: sensore id; Type: DEFAULT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.sensore ALTER COLUMN id SET DEFAULT nextval('public.sensore_id_seq'::regclass);


--
-- TOC entry 4863 (class 2606 OID 475813)
-- Name: adminstuff adminstuff_pkey; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.adminstuff
    ADD CONSTRAINT adminstuff_pkey PRIMARY KEY (oid);


--
-- TOC entry 4857 (class 2606 OID 459424)
-- Name: assigned_event assigned_event_pkey; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.assigned_event
    ADD CONSTRAINT assigned_event_pkey PRIMARY KEY (evento_id);


--
-- TOC entry 4829 (class 2606 OID 434632)
-- Name: evento evento_data_key; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.evento
    ADD CONSTRAINT evento_data_key UNIQUE (data);


--
-- TOC entry 4831 (class 2606 OID 434630)
-- Name: evento evento_pkey; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.evento
    ADD CONSTRAINT evento_pkey PRIMARY KEY (id);


--
-- TOC entry 4842 (class 2606 OID 442745)
-- Name: gruppo gruppo_pkey; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.gruppo
    ADD CONSTRAINT gruppo_pkey PRIMARY KEY (oid);


--
-- TOC entry 4861 (class 2606 OID 475729)
-- Name: immagine immagine_pkey; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.immagine
    ADD CONSTRAINT immagine_pkey PRIMARY KEY (oid);


--
-- TOC entry 4865 (class 2606 OID 582216)
-- Name: labels labels_pkey; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.labels
    ADD CONSTRAINT labels_pkey PRIMARY KEY (lab);


--
-- TOC entry 4851 (class 2606 OID 475703)
-- Name: message message_event_ts_uk; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_event_ts_uk UNIQUE (aevento_id, ts);


--
-- TOC entry 4853 (class 2606 OID 475701)
-- Name: message message_pkey; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_pkey PRIMARY KEY (oid);


--
-- TOC entry 4840 (class 2606 OID 442740)
-- Name: module module_pkey; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.module
    ADD CONSTRAINT module_pkey PRIMARY KEY (oid);


--
-- TOC entry 4855 (class 2606 OID 459398)
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (oid);


--
-- TOC entry 4836 (class 2606 OID 442720)
-- Name: operatoreas operatoreas_pkey; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.operatoreas
    ADD CONSTRAINT operatoreas_pkey PRIMARY KEY (matr);


--
-- TOC entry 4834 (class 2606 OID 442710)
-- Name: operatoreids operatoreids_pkey; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.operatoreids
    ADD CONSTRAINT operatoreids_pkey PRIMARY KEY (matr);


--
-- TOC entry 4846 (class 2606 OID 442761)
-- Name: persona persona_pkey; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (matricola);


--
-- TOC entry 4822 (class 2606 OID 434529)
-- Name: sensore sensore_pkey; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.sensore
    ADD CONSTRAINT sensore_pkey PRIMARY KEY (id);


--
-- TOC entry 4824 (class 2606 OID 434539)
-- Name: traffico traffico_pkey; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.traffico
    ADD CONSTRAINT traffico_pkey PRIMARY KEY (oid);


--
-- TOC entry 4827 (class 2606 OID 434553)
-- Name: trafficoanomalo trafficoanomalo_pkey; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.trafficoanomalo
    ADD CONSTRAINT trafficoanomalo_pkey PRIMARY KEY (oid);


--
-- TOC entry 4848 (class 2606 OID 442796)
-- Name: trafficolegit trafficolegit_pkey; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.trafficolegit
    ADD CONSTRAINT trafficolegit_pkey PRIMARY KEY (oid);


--
-- TOC entry 4837 (class 1259 OID 442786)
-- Name: fk_module_group_2_idx; Type: INDEX; Schema: public; Owner: luca
--

CREATE INDEX fk_module_group_2_idx ON public.module USING btree (group_oid_2);


--
-- TOC entry 4838 (class 1259 OID 442747)
-- Name: fk_module_group_idx; Type: INDEX; Schema: public; Owner: luca
--

CREATE INDEX fk_module_group_idx ON public.module USING btree (group_oid);


--
-- TOC entry 4843 (class 1259 OID 442780)
-- Name: fk_user_group_2_idx; Type: INDEX; Schema: public; Owner: luca
--

CREATE INDEX fk_user_group_2_idx ON public.persona USING btree (group_oid_2);


--
-- TOC entry 4844 (class 1259 OID 442774)
-- Name: fk_user_group_idx; Type: INDEX; Schema: public; Owner: luca
--

CREATE INDEX fk_user_group_idx ON public.persona USING btree (group_oid);


--
-- TOC entry 4832 (class 1259 OID 442830)
-- Name: fki_fk_EventData; Type: INDEX; Schema: public; Owner: luca
--

CREATE INDEX "fki_fk_EventData" ON public.evento USING btree (data);


--
-- TOC entry 4825 (class 1259 OID 442824)
-- Name: fki_fk_TraffAnomalo; Type: INDEX; Schema: public; Owner: luca
--

CREATE INDEX "fki_fk_TraffAnomalo" ON public.trafficoanomalo USING btree (oid);


--
-- TOC entry 4858 (class 1259 OID 459436)
-- Name: idx_assigned_event_assigned_op; Type: INDEX; Schema: public; Owner: luca
--

CREATE INDEX idx_assigned_event_assigned_op ON public.assigned_event USING btree (assigned_op);


--
-- TOC entry 4859 (class 1259 OID 459430)
-- Name: idx_assigned_event_evento_id; Type: INDEX; Schema: public; Owner: luca
--

CREATE INDEX idx_assigned_event_evento_id ON public.assigned_event USING btree (evento_id);


--
-- TOC entry 4849 (class 1259 OID 459369)
-- Name: idx_message_from_op; Type: INDEX; Schema: public; Owner: luca
--

CREATE INDEX idx_message_from_op ON public.message USING btree (from_op);


--
-- TOC entry 4886 (class 2620 OID 442925)
-- Name: traffico check_traffico_isa_completeness_trigger; Type: TRIGGER; Schema: public; Owner: luca
--

CREATE CONSTRAINT TRIGGER check_traffico_isa_completeness_trigger AFTER INSERT OR UPDATE ON public.traffico DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION public.check_traffico_isa_completeness();


--
-- TOC entry 4889 (class 2620 OID 442762)
-- Name: persona check_user_completeness_trigger; Type: TRIGGER; Schema: public; Owner: luca
--

CREATE CONSTRAINT TRIGGER check_user_completeness_trigger AFTER INSERT OR UPDATE ON public.persona DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION public.check_user_completeness_function();


--
-- TOC entry 4890 (class 2620 OID 459442)
-- Name: message chk_message_authorized_trg; Type: TRIGGER; Schema: public; Owner: luca
--

CREATE TRIGGER chk_message_authorized_trg BEFORE INSERT OR UPDATE OF from_op, aevento_id ON public.message FOR EACH ROW EXECUTE FUNCTION public.chk_message_authorized();


--
-- TOC entry 4887 (class 2620 OID 434649)
-- Name: evento prevent_event_update_if_closed; Type: TRIGGER; Schema: public; Owner: luca
--

CREATE TRIGGER prevent_event_update_if_closed BEFORE UPDATE ON public.evento FOR EACH ROW EXECUTE FUNCTION public.prevent_modification_if_closed();


--
-- TOC entry 4888 (class 2620 OID 434647)
-- Name: evento trg_mark_anomaly_handled; Type: TRIGGER; Schema: public; Owner: luca
--

CREATE TRIGGER trg_mark_anomaly_handled AFTER INSERT ON public.evento FOR EACH ROW EXECUTE FUNCTION public.mark_anomaly_handled();


--
-- TOC entry 4869 (class 2606 OID 442825)
-- Name: evento fk_EventData; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.evento
    ADD CONSTRAINT "fk_EventData" FOREIGN KEY (data) REFERENCES public.trafficoanomalo(oid) NOT VALID;


--
-- TOC entry 4867 (class 2606 OID 442819)
-- Name: trafficoanomalo fk_TraffAnomalo; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.trafficoanomalo
    ADD CONSTRAINT "fk_TraffAnomalo" FOREIGN KEY (oid) REFERENCES public.traffico(oid) NOT VALID;


--
-- TOC entry 4884 (class 2606 OID 459425)
-- Name: assigned_event fk_assigned_event_evento; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.assigned_event
    ADD CONSTRAINT fk_assigned_event_evento FOREIGN KEY (evento_id) REFERENCES public.evento(id) ON DELETE CASCADE;


--
-- TOC entry 4885 (class 2606 OID 459431)
-- Name: assigned_event fk_assigned_event_operatore; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.assigned_event
    ADD CONSTRAINT fk_assigned_event_operatore FOREIGN KEY (assigned_op) REFERENCES public.operatoreids(matr) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4872 (class 2606 OID 442769)
-- Name: operatoreas fk_matras; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.operatoreas
    ADD CONSTRAINT fk_matras FOREIGN KEY (matr) REFERENCES public.persona(matricola);


--
-- TOC entry 4871 (class 2606 OID 442764)
-- Name: operatoreids fk_matrids; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.operatoreids
    ADD CONSTRAINT fk_matrids FOREIGN KEY (matr) REFERENCES public.persona(matricola);


--
-- TOC entry 4879 (class 2606 OID 459437)
-- Name: message fk_message_assigned_event; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT fk_message_assigned_event FOREIGN KEY (aevento_id) REFERENCES public.assigned_event(evento_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4880 (class 2606 OID 459364)
-- Name: message fk_message_persona; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT fk_message_persona FOREIGN KEY (from_op) REFERENCES public.persona(matricola) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4873 (class 2606 OID 442748)
-- Name: module fk_module_group; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.module
    ADD CONSTRAINT fk_module_group FOREIGN KEY (group_oid) REFERENCES public.gruppo(oid);


--
-- TOC entry 4874 (class 2606 OID 442787)
-- Name: module fk_module_group_2; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.module
    ADD CONSTRAINT fk_module_group_2 FOREIGN KEY (group_oid_2) REFERENCES public.gruppo(oid);


--
-- TOC entry 4881 (class 2606 OID 459443)
-- Name: notification fk_notification_assigned_event; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT fk_notification_assigned_event FOREIGN KEY (evento_noti) REFERENCES public.assigned_event(evento_id);


--
-- TOC entry 4882 (class 2606 OID 459404)
-- Name: notification fk_notification_from_pp; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT fk_notification_from_pp FOREIGN KEY (from_pp) REFERENCES public.persona(matricola);


--
-- TOC entry 4883 (class 2606 OID 459409)
-- Name: notification fk_notification_to_pp; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT fk_notification_to_pp FOREIGN KEY (to_pp) REFERENCES public.persona(matricola);


--
-- TOC entry 4870 (class 2606 OID 442729)
-- Name: evento fk_operatoreas; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.evento
    ADD CONSTRAINT fk_operatoreas FOREIGN KEY (operatore) REFERENCES public.operatoreas(matr);


--
-- TOC entry 4866 (class 2606 OID 434540)
-- Name: traffico fk_sensore; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.traffico
    ADD CONSTRAINT fk_sensore FOREIGN KEY (sensore) REFERENCES public.sensore(id);


--
-- TOC entry 4868 (class 2606 OID 582224)
-- Name: trafficoanomalo fk_trafficoanomalo_byop; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.trafficoanomalo
    ADD CONSTRAINT fk_trafficoanomalo_byop FOREIGN KEY (by_op) REFERENCES public.operatoreids(matr);


--
-- TOC entry 4877 (class 2606 OID 582238)
-- Name: trafficolegit fk_trafficolegito_byop; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.trafficolegit
    ADD CONSTRAINT fk_trafficolegito_byop FOREIGN KEY (by_op) REFERENCES public.operatoreids(matr);


--
-- TOC entry 4878 (class 2606 OID 442797)
-- Name: trafficolegit fk_trlegit; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.trafficolegit
    ADD CONSTRAINT fk_trlegit FOREIGN KEY (oid) REFERENCES public.traffico(oid);


--
-- TOC entry 4875 (class 2606 OID 442775)
-- Name: persona fk_user_group; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT fk_user_group FOREIGN KEY (group_oid) REFERENCES public.gruppo(oid);


--
-- TOC entry 4876 (class 2606 OID 442781)
-- Name: persona fk_user_group_2; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT fk_user_group_2 FOREIGN KEY (group_oid_2) REFERENCES public.gruppo(oid);


-- Completed on 2025-06-24 17:39:37

--
-- PostgreSQL database dump complete
--

