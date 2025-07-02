--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 17.2

-- Started on 2025-06-24 18:10:21

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
-- TOC entry 5027 (class 0 OID 475808)
-- Dependencies: 243
-- Data for Name: adminstuff; Type: TABLE DATA; Schema: public; Owner: luca
--

COPY public.adminstuff (oid, maxopenevents, sensorsalloff, messageafterclosure) FROM stdin;
1	2	t	f
\.


--
-- TOC entry 5015 (class 0 OID 442741)
-- Dependencies: 231
-- Data for Name: gruppo; Type: TABLE DATA; Schema: public; Owner: luca
--

COPY public.gruppo (oid, groupname) FROM stdin;
3	admin
4	operatoreIDS
5	operatoreAS
\.


--
-- TOC entry 5017 (class 0 OID 442754)
-- Dependencies: 233
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: luca
--

COPY public.persona (matricola, nome, cognome, datanascita, password, group_oid, group_oid_2, username) FROM stdin;
1	admin	admin	1980-01-01	admin	3	3	admin
2	Luca	Brunetti	2001-09-19	ciao	4	4	opIDS1
3	ciao	ciao	2000-09-12	ciao	4	4	ciao
5	luca	ciao	2001-09-19	lucas01as	5	5	lucas01as
6	frate	frate	1992-08-15	frate	5	5	frate
7	prova	prova	2000-01-01	prova	5	5	prova
8	idESAME	idESAME	2025-05-08		4	4	idESAME
9	asESAME	asESAME	2025-05-08	asESAME	5	5	asESAME
10	luca	luca	2025-06-09	provaIDS	4	4	provaIDS
11	provaAS	provaAS	2025-06-18	provaAS	5	5	provaAS
12	provaID	provaID	2025-06-19	provaID	4	4	provaID
13	sd	sd	2025-04-15	prvas	5	5	prvas
\.


--
-- TOC entry 5013 (class 0 OID 442716)
-- Dependencies: 229
-- Data for Name: operatoreas; Type: TABLE DATA; Schema: public; Owner: luca
--

COPY public.operatoreas (matr) FROM stdin;
5
6
7
9
11
13
\.


--
-- TOC entry 5012 (class 0 OID 442706)
-- Dependencies: 228
-- Data for Name: operatoreids; Type: TABLE DATA; Schema: public; Owner: luca
--

COPY public.operatoreids (matr) FROM stdin;
1
2
3
8
10
12
\.


--
-- TOC entry 5007 (class 0 OID 434524)
-- Dependencies: 223
-- Data for Name: sensore; Type: TABLE DATA; Schema: public; Owner: luca
--

COPY public.sensore (id, attivo) FROM stdin;
2	t
1	t
3	t
\.


--
-- TOC entry 5008 (class 0 OID 434531)
-- Dependencies: 224
-- Data for Name: traffico; Type: TABLE DATA; Schema: public; Owner: luca
--

COPY public.traffico (oid, ts, sensore, duration, protocol_type, service, flag, src_bytes, dst_bytes, land, wrong_fragment, urgent, hot, num_failed_logins, logged_in, num_compromised, root_shell, su_attempted, num_root, num_file_creations, num_shells, num_access_files, num_outbound_cmds, anomalyprob, dosprob, scanprob, r2lprob, label) FROM stdin;
172	2025-04-15 21:52:26.326581	1	20	tcp	http	SF	1500	300	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.05	0.9	0.03	0.02	Normal
173	2025-04-15 21:53:28.492658	1	20	tcp	http	SF	1500	300	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.05	0.9	0.03	0.02	Normal
174	2025-04-15 21:53:38.981485	1	20	tcp	http	SF	1500	300	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.05	0.9	0.03	0.02	Normal
176	2025-04-15 21:54:59.851986	1	2	tcp	ftp_data	SF	12983	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.5556671	0.010600189	0.1288493	0.4162176	Normal
177	2025-04-15 21:55:29.913532	1	0	icmp	eco_i	SF	20	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.9985519	0.09615411	0.81752145	0.084876366	Probe
178	2025-04-15 21:55:59.973795	1	1	tcp	telnet	RSTO	0	15	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.45010778	0.20747596	0.16518568	0.07744615	Normal
179	2025-04-15 21:56:30.023783	1	0	tcp	http	SF	267	14515	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.13122135	0.0018817637	0.00014771674	0.12919188	Normal
180	2025-04-15 21:57:00.085879	1	0	tcp	smtp	SF	1022	387	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.62508744	0.0014240417	0.5763338	0.047329575	Probe
181	2025-04-15 21:57:30.14413	1	0	tcp	telnet	SF	129	174	f	0	0	0	1	f	0	0	0	0	0	0	0	0	0.9447255	0.001975092	0.0046907864	0.9380596	R2L
182	2025-04-15 21:58:00.199969	1	0	tcp	http	SF	327	467	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.09011515	0.003188406	0.00015455554	0.08677219	Normal
183	2025-04-15 21:58:30.250292	1	0	tcp	ftp	SF	26	157	f	0	0	0	1	f	0	0	0	0	0	0	0	0	0.9876223	0.0021160843	0.030975835	0.9545304	R2L
184	2025-04-15 21:59:00.301223	1	0	tcp	telnet	SF	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.9005239	0.010786654	0.23123449	0.65850276	R2L
185	2025-04-15 21:59:30.343262	1	0	tcp	smtp	SF	616	330	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.12721926	0.0018598434	0.043184713	0.08217471	Normal
186	2025-04-15 22:00:00.392518	1	0	tcp	private	REJ	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.9999049	0.9289763	3.2988282e-08	0.07092855	DoS
187	2025-04-15 22:00:30.424499	1	0	tcp	telnet	S0	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.99990356	0.90338576	0.0042980597	0.09221974	DoS
188	2025-04-15 22:01:00.477851	1	37	tcp	telnet	SF	773	364200	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.5626898	0.0013331125	0.13473022	0.42662644	Normal
189	2025-04-15 22:01:30.532938	1	0	tcp	http	SF	350	3610	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.10142486	0.0020265817	0.0001526789	0.09924559	Normal
190	2025-04-15 22:02:00.58014	1	0	tcp	http	SF	213	659	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.18483968	0.035038006	0.0001350554	0.14966662	Normal
191	2025-04-15 22:02:30.618263	1	0	tcp	http	SF	246	2090	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.09135046	0.002316276	0.00016596523	0.088868216	Normal
192	2025-04-15 22:03:00.670537	1	0	udp	private	SF	45	44	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.31610554	0.182457	0.029639298	0.10400924	Normal
193	2025-04-15 22:03:30.719951	1	0	tcp	private	REJ	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.9999048	0.9288838	4.5225845e-09	0.07102102	DoS
194	2025-04-15 22:04:00.769813	1	0	tcp	ldap	REJ	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.99990433	0.9280995	3.813482e-08	0.07180477	DoS
195	2025-04-15 22:04:30.848044	1	0	tcp	pop_3	S0	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.99795663	0.8533402	0.014007305	0.13060912	DoS
196	2025-04-15 22:05:00.920878	1	0	tcp	http	SF	196	1823	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.1948478	0.032260153	0.00013344531	0.1624542	Normal
197	2025-04-15 22:05:30.991338	1	0	tcp	http	SF	277	1816	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.08231567	0.0023955575	0.0001675837	0.07975253	Normal
198	2025-04-15 22:06:01.074358	1	0	tcp	courier	REJ	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.99668247	0.92107534	1.7678701e-06	0.07560538	DoS
199	2025-04-15 22:06:31.088791	1	0	tcp	discard	RSTO	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.99886364	0.9244273	4.623427e-08	0.07443633	DoS
200	2025-04-15 22:07:01.160991	1	0	tcp	http	SF	294	6442	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.08952267	0.0026069365	0.00015466647	0.086761065	Normal
202	2025-04-15 22:08:01.327618	1	0	icmp	ecr_i	SF	520	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.9824814	0.903465	0.006305064	0.07271138	DoS
203	2025-04-15 22:08:31.421751	1	0	udp	private	SF	54	51	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.30397856	0.18398997	0.014735712	0.105252884	Normal
205	2025-04-15 22:09:31.567999	1	0	tcp	smtp	SF	720	281	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.12684746	0.0019592838	0.029663486	0.095224686	Normal
207	2025-04-15 22:10:31.682946	1	0	udp	private	SF	1	1	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.7215316	0.00027241302	0.64552504	0.07573419	Probe
208	2025-05-07 15:29:31.617792	1	0	tcp	private	REJ	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.9999049	0.92890507	1.0856694e-08	0.07099977	DoS
231	2025-06-24 04:21:13.72406	2	789	tcp	http	RSTR	2484	1	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.67105097	0.5241779	0.06035294	0.08652012	DoS
225	2025-04-15 22:10:01.635208	1	0	tcp	http	SF	301	19794	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.089703254	0.0029078235	0.00017872435	0.08661671	Anomaly
226	2025-04-15 22:07:31.244073	1	0	tcp	http	SF	300	440	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.20967793	0.026929487	0.00013106079	0.18261738	Anomaly
227	2025-04-15 22:09:01.483187	1	805	tcp	http	RSTR	76944	1	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.48559898	0.12329805	0.24968271	0.11261823	Anomaly
228	2025-05-07 15:30:01.735993	1	2	tcp	ftp_data	SF	12983	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.5556671	0.010600189	0.1288493	0.4162176	Normal
229	2025-05-07 15:30:31.816761	1	0	icmp	eco_i	SF	20	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.9985519	0.09615411	0.81752145	0.084876366	Normal
230	2025-06-24 04:20:43.673564	2	0	tcp	http	SF	223	1317	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.12620595	0.0023404616	0.000148512	0.12371697	Normal
232	2025-06-24 04:21:43.820992	2	0	tcp	imap4	REJ	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.8914435	0.04918087	0.76611364	0.07614898	Probe
233	2025-06-24 04:22:13.903999	2	0	udp	domain_u	SF	44	131	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.081379205	0.009503728	0.00015083185	0.071724646	Normal
234	2025-06-24 04:22:43.932713	2	0	udp	private	SF	1	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.6299682	0.00014681632	0.5568764	0.07294499	Probe
235	2025-06-24 04:23:13.996606	2	0	tcp	private	REJ	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.9999049	0.9289413	1.03936655e-08	0.07096354	DoS
236	2025-06-24 04:23:44.026747	1	0	tcp	http	SF	273	379	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.2051561	0.028666232	0.00013178724	0.17635809	Normal
237	2025-06-24 04:24:14.061309	3	0	tcp	imap4	RSTO	0	44	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.98763615	0.004904956	0.89804196	0.08468922	Probe
238	2025-06-24 04:24:44.080649	3	2069	tcp	http	RSTR	72564	0	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.5212876	0.35545325	0.057731807	0.108102545	Normal
239	2025-06-24 04:25:14.110526	1	0	tcp	ftp_data	SF	22	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.5295582	0.0009812653	0.09411928	0.43445763	Normal
240	2025-06-24 04:25:44.160715	1	0	tcp	http	SF	316	629	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.073177144	0.0018684653	0.0016225866	0.06968609	Normal
241	2025-06-24 04:26:14.207288	3	0	tcp	http	SF	295	278	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.1393805	0.020796062	0.00014700799	0.118437424	Normal
242	2025-06-24 04:26:44.242024	1	0	tcp	http	S0	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.32229522	0.21143565	0.00026798283	0.110591605	Normal
243	2025-06-24 04:27:14.282981	2	0	tcp	http	SF	54540	8314	f	0	0	2	0	t	1	0	0	0	0	0	0	0	0.7577005	0.66940737	0.00016796487	0.088125125	DoS
244	2025-06-24 04:27:44.334701	2	0	tcp	http	SF	172	493	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.27347627	0.0068351077	0.0009407462	0.26570043	Normal
245	2025-06-24 04:28:14.364937	2	0	tcp	private	S0	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.99991345	0.8440009	0.08979858	0.066113986	DoS
246	2025-06-24 04:28:44.37933	1	0	tcp	private	REJ	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.9999273	0.7100034	0.2366678	0.05325609	DoS
247	2025-06-24 04:29:14.416715	3	0	udp	domain_u	SF	36	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.39783248	0.0014783778	0.07421084	0.32214326	Normal
248	2025-06-24 04:29:44.460564	3	0	icmp	eco_i	SF	20	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.99777174	0.096726336	0.8223906	0.07865483	Probe
249	2025-06-24 16:48:41.872558	1	0	tcp	http	SF	296	698	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.2903698	0.0038938995	0.00012747907	0.28634843	Normal
250	2025-06-24 16:52:42.370528	3	280	tcp	ftp_data	SF	283618	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.98853785	3.060844e-05	0.24470325	0.743804	R2L
251	2025-06-24 16:53:12.43339	1	282	tcp	ftp	SF	164	599	f	0	0	2	0	t	0	0	0	0	0	0	0	0	0.9929119	0.0017846393	0.013591125	0.9775361	R2L
252	2025-06-24 16:53:42.490961	1	0	tcp	ftp_data	SF	38518	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.59571064	0.33983266	0.02342721	0.23245077	Normal
253	2025-06-24 16:54:12.549242	1	0	icmp	eco_i	SF	20	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.99766874	0.09672183	0.822353	0.078593925	Probe
254	2025-06-24 16:54:42.610738	3	280	tcp	ftp_data	SF	283618	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.99588484	8.759755e-06	0.24418783	0.75168824	R2L
255	2025-06-24 16:55:12.670976	3	0	tcp	kshell	REJ	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.9999047	0.9281395	1.2095293e-07	0.07176508	DoS
256	2025-06-24 16:55:42.736757	2	1	tcp	smtp	SF	2599	293	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.6159291	0.002658702	0.19336149	0.41990894	R2L
257	2025-06-24 16:56:12.790262	2	0	tcp	http	SF	285	1892	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.20714796	0.02456755	0.00013623455	0.18244417	Normal
258	2025-06-24 16:56:42.83271	1	7	tcp	pop_3	SF	31	93	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.8192984	0.009979592	0.0003798613	0.8089389	R2L
259	2025-06-24 16:57:12.859793	3	0	tcp	http	SF	207	4521	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.21441731	0.025058782	0.00013030153	0.18922822	Normal
260	2025-06-24 16:57:42.918338	2	0	tcp	private	REJ	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.9999049	0.92895126	1.9735168e-08	0.07095357	DoS
261	2025-06-24 16:58:12.975217	3	0	tcp	http	SF	224	770	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.13164012	0.009668324	0.00014282222	0.12182898	Normal
262	2025-06-24 16:58:42.987312	2	0	tcp	http	SF	303	264	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.12384087	0.0024527118	0.0001490129	0.12123914	Normal
263	2025-06-24 16:59:13.02465	1	0	tcp	http	SF	223	189	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.12382692	0.0025662382	0.00014901458	0.12111167	Normal
264	2025-06-24 16:59:43.081571	2	0	tcp	http	SF	195	895	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.096461415	0.0017796234	0.00019147129	0.09449032	Normal
265	2025-06-24 17:00:13.087371	3	0	icmp	ecr_i	SF	1032	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.99776435	0.9269637	0.0012691756	0.06953147	DoS
266	2025-06-24 17:00:43.122434	1	0	tcp	private	SH	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.9999957	0.04888062	0.4887592	0.4623559	Probe
267	2025-06-24 17:01:13.150195	2	0	tcp	http	SF	304	2698	f	0	0	0	0	t	0	0	0	0	0	0	1	0	0.11308389	0.0018577533	0.01545242	0.09577372	Normal
268	2025-06-24 17:01:43.15652	3	0	tcp	finger	SF	7	276	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.5451477	0.00088968425	0.12756993	0.41668808	Normal
269	2025-06-24 17:02:13.201303	2	8116	tcp	telnet	SF	0	15	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.57695144	0.024460657	0.0020061193	0.55048466	R2L
270	2025-06-24 17:02:43.251662	2	0	tcp	http	SF	213	4008	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.09839441	0.0018443124	0.0029927918	0.093557306	Normal
271	2025-06-24 17:03:13.2913	1	0	udp	private	SF	105	105	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.8913467	0.0013127133	0.17019098	0.71984303	R2L
272	2025-06-24 17:03:43.343161	2	0	tcp	imap4	REJ	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.88987637	0.026348947	0.785864	0.07766343	Probe
273	2025-06-24 17:04:13.406627	2	0	udp	other	SF	1	1	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.45424765	1.9966958e-06	0.37232164	0.08192402	Normal
274	2025-06-24 17:04:43.470873	3	0	tcp	other	REJ	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.9976536	0.011089644	0.88912004	0.097443916	Probe
275	2025-06-24 17:05:13.532732	1	0	tcp	private	REJ	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.9999046	0.9282558	3.044043e-08	0.07164875	DoS
276	2025-06-24 17:05:43.605712	1	0	tcp	http	SF	293	1965	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.21281026	0.025706707	0.00013055849	0.18697299	Normal
277	2025-06-24 17:06:13.663065	2	0	tcp	http	SF	219	875	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.18625829	0.03470391	0.00013482709	0.15141955	Normal
278	2025-06-24 17:06:43.679381	2	0	udp	private	SF	1	1	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.5808818	4.5590983e-05	0.5079915	0.07284471	Probe
279	2025-06-24 17:07:13.721494	1	0	icmp	ecr_i	SF	1032	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.9958933	0.7185905	0.21547197	0.061830834	DoS
280	2025-06-24 17:07:43.764965	2	2069	tcp	http	RSTR	72564	0	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.5212876	0.35545325	0.057731807	0.108102545	Normal
281	2025-06-24 17:08:13.807376	1	0	udp	domain_u	SF	45	114	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.10109724	0.0016904217	0.00030268484	0.09910413	Normal
282	2025-06-24 17:08:43.84863	1	282	tcp	ftp	SF	160	595	f	0	0	2	0	t	0	0	0	0	0	0	0	0	0.9885593	0.0017991398	0.0032751574	0.983485	R2L
283	2025-06-24 17:09:13.911651	2	0	tcp	http	SF	237	9700	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.074379876	0.0018686081	0.001075582	0.07143568	Normal
284	2025-06-24 17:09:43.966903	1	0	tcp	http	SF	211	930	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.21450926	0.025102438	0.00013028448	0.18927655	Normal
285	2025-06-24 17:10:14.028751	3	0	udp	domain_u	SF	43	43	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.08750874	0.005168439	0.00014984654	0.08219045	Normal
286	2025-06-24 17:10:44.081327	1	0	tcp	http	SF	175	21732	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.14363956	0.01412229	0.00014100966	0.12937626	Normal
287	2025-06-24 17:11:14.138513	2	0	tcp	other	REJ	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.9980887	0.005011867	0.89694226	0.096134596	Probe
288	2025-06-24 17:11:44.208437	3	0	udp	private	SF	55	56	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.30211684	0.1837039	0.013316225	0.1050967	Normal
289	2025-06-24 17:12:14.268075	2	0	tcp	smtp	S0	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.9999132	0.8433796	0.09082397	0.06570963	DoS
290	2025-06-24 17:12:44.326622	2	280	tcp	ftp_data	SF	283618	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.98174876	3.95338e-05	0.24389984	0.73780936	R2L
291	2025-06-24 17:13:14.390414	1	0	tcp	name	REJ	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.9999049	0.9284349	1.241694e-07	0.071469836	DoS
292	2025-06-24 17:13:44.446642	1	0	udp	private	SF	46	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.9688527	0.0012990827	0.31042397	0.65712965	R2L
293	2025-06-24 17:14:14.500477	2	48	tcp	http	SF	292	181	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.19311267	0.032278012	0.00013372797	0.16070093	Normal
294	2025-06-24 17:14:44.527598	1	0	tcp	telnet	S3	0	44	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.84675366	0.5122985	0.10154234	0.23291282	DoS
295	2025-06-24 17:15:14.581204	3	0	tcp	uucp	RSTO	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.9999047	0.93013865	1.3038869e-08	0.06976608	DoS
296	2025-06-24 17:15:44.652044	1	0	tcp	private	S0	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.99991024	0.87404394	0.056008026	0.06985828	DoS
297	2025-06-24 17:16:14.711919	1	0	tcp	pop_3	RSTO	0	36	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.992568	0.028076787	0.87384826	0.090642974	Probe
298	2025-06-24 17:16:44.772397	2	0	tcp	http	SF	321	304	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.109794706	0.0017718277	0.0001521178	0.107870765	Normal
299	2025-06-24 17:17:14.818508	3	0	tcp	sunrpc	REJ	0	0	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0.990693	0.0049383887	0.90428656	0.08146797	Probe
300	2025-06-24 17:17:44.850686	2	4	tcp	pop_3	SF	32	93	f	0	0	0	0	t	0	0	0	0	0	0	0	0	0.757998	0.00376551	0.0030923414	0.7511401	R2L
\.


--
-- TOC entry 5009 (class 0 OID 434545)
-- Dependencies: 225
-- Data for Name: trafficoanomalo; Type: TABLE DATA; Schema: public; Owner: luca
--

COPY public.trafficoanomalo (oid, handled, ch_ts, reason, by_op) FROM stdin;
180	t	\N	\N	\N
184	t	\N	\N	\N
186	t	\N	\N	\N
193	t	\N	\N	\N
207	t	\N	\N	\N
187	t	\N	\N	\N
199	t	\N	\N	\N
202	t	\N	\N	\N
198	t	\N	\N	\N
208	t	\N	\N	\N
177	t	\N	\N	\N
195	t	\N	\N	\N
181	t	\N	\N	\N
194	t	\N	\N	\N
183	t	\N	\N	\N
225	f	\N	\N	\N
226	f	\N	\N	\N
227	f	2025-06-20 13:14:09.258	anomalyprob close to .5	3
231	f	\N	\N	\N
232	f	\N	\N	\N
234	f	\N	\N	\N
235	f	\N	\N	\N
237	f	\N	\N	\N
243	f	\N	\N	\N
245	f	\N	\N	\N
246	f	\N	\N	\N
248	f	\N	\N	\N
250	f	\N	\N	\N
251	f	\N	\N	\N
253	f	\N	\N	\N
254	f	\N	\N	\N
255	f	\N	\N	\N
256	f	\N	\N	\N
258	f	\N	\N	\N
260	f	\N	\N	\N
265	f	\N	\N	\N
266	f	\N	\N	\N
269	f	\N	\N	\N
271	f	\N	\N	\N
272	f	\N	\N	\N
274	f	\N	\N	\N
275	f	\N	\N	\N
278	f	\N	\N	\N
279	f	\N	\N	\N
282	f	\N	\N	\N
287	f	\N	\N	\N
289	f	\N	\N	\N
290	f	\N	\N	\N
291	f	\N	\N	\N
292	f	\N	\N	\N
294	f	\N	\N	\N
295	f	\N	\N	\N
296	f	\N	\N	\N
297	f	\N	\N	\N
299	f	\N	\N	\N
300	f	\N	\N	\N
\.


--
-- TOC entry 5011 (class 0 OID 434620)
-- Dependencies: 227
-- Data for Name: evento; Type: TABLE DATA; Schema: public; Owner: luca
--

COPY public.evento (id, ts, operatore, data, closed, ts_closed, commento) FROM stdin;
3	2025-05-13 19:11:53.730032	5	180	t	2025-05-14 09:45:00	Traffic fully mitigated via IDS ACL; detailed report attached.
13	2025-05-19 00:22:07.009853	5	184	f	\N	\N
14	2025-05-19 00:24:52.250188	5	186	f	\N	\N
15	2025-05-19 00:27:44.906953	5	193	f	\N	\N
16	2025-05-19 00:31:47.029828	5	207	f	\N	\N
18	2025-05-19 13:11:47.23765	5	199	f	\N	\N
19	2025-05-19 13:24:11.825226	5	202	f	\N	\N
20	2025-05-19 13:31:33.368893	5	198	f	\N	\N
22	2025-05-19 14:53:39.816178	6	208	f	\N	\N
24	2025-05-19 16:26:46.72119	6	177	t	2025-05-19 17:15:33.27	try
17	2025-05-19 02:21:51.208477	6	187	t	2025-05-19 17:45:01.67	Prova
25	2025-05-19 17:54:37.200619	9	195	t	2025-05-19 17:54:37.438	done
26	2025-05-20 14:48:31.192231	7	181	f	\N	\N
28	2025-05-20 15:45:54.309291	6	183	f	\N	\N
27	2025-05-20 15:34:33.796797	6	194	t	2025-05-23 11:50:56.882	Prova nic
\.


--
-- TOC entry 5022 (class 0 OID 459420)
-- Dependencies: 238
-- Data for Name: assigned_event; Type: TABLE DATA; Schema: public; Owner: luca
--

COPY public.assigned_event (evento_id, assigned_op) FROM stdin;
3	3
16	3
17	3
18	3
19	3
20	3
22	3
26	3
27	3
\.


--
-- TOC entry 5025 (class 0 OID 475722)
-- Dependencies: 241
-- Data for Name: immagine; Type: TABLE DATA; Schema: public; Owner: luca
--

COPY public.immagine (oid, foto) FROM stdin;
1	C:/Users/lucab/OneDrive/Desktop/progingsof/net.png
2	C:\\Users\\lucab\\OneDrive\\Desktop\\progingsof\\net.png
\.


--
-- TOC entry 5028 (class 0 OID 582212)
-- Dependencies: 244
-- Data for Name: labels; Type: TABLE DATA; Schema: public; Owner: luca
--

COPY public.labels (lab) FROM stdin;
Anomaly
R2L
U2R
Probe
DoS
\.


--
-- TOC entry 5019 (class 0 OID 459351)
-- Dependencies: 235
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: luca
--

COPY public.message (aevento_id, ts, testo, from_op, oid) FROM stdin;
3	2025-05-14 09:02:15	I've taken charge of anomaly 180. I'm analyzing the source traffic.	3	1
3	2025-05-14 09:05:47	Roger that. I'll check if the firewall has already blocked the suspicious IP. I'll update you.	5	2
3	2025-05-14 09:12:30	Initial finding: spike of UDP connections on port 123. Looks like an NTP amplification attack.	3	3
3	2025-05-14 09:18:05	Confirmed: NTP reflection abuse. Drop it via IDS ACL and prepare the report.	5	4
3	2025-05-14 09:24:22	ACL updated, traffic reduced by 95%. Full log is in /var/log/snort/180.log.	3	5
3	2025-05-14 09:30:10	Great work. I'll close the event as soon as you upload the report to the ticket.	5	6
3	2025-05-15 02:23:39.117145	  vvdvdvdv	3	8
3	2025-05-15 03:22:55.290176	Perfect.	3	19
3	2025-05-15 03:49:56.931681	vvvvvvvv	3	25
3	2025-05-15 04:09:52.782745	 vhvhvhvhvh	3	26
3	2025-05-15 04:14:34.202763	koooooooooo	3	27
3	2025-05-15 04:51:47.955545	sdsdsdsds	3	28
3	2025-05-15 04:53:53.546491	efdfdfdf	3	29
3	2025-05-15 04:56:06.824789	trtrtrt	3	30
3	2025-05-14 09:45:05	Event closed after mitigation. Report uploaded to ticket #EV-1.	5	32
3	2025-05-15 17:50:23.28402	ddddddd	3	36
3	2025-05-15 17:51:36.024457	dfdfdfdf	3	37
3	2025-05-15 17:57:41.162218	ciaooo	3	38
3	2025-05-15 17:59:03.133862	sdsdsdsd	3	39
3	2025-05-15 18:07:17.898554	fgfgfgf	3	41
3	2025-05-15 18:07:43.390018	fdfdfdf	3	42
3	2025-05-15 18:07:49.461198	vcvcvcvcv	3	43
3	2025-05-15 18:07:56.976781	cvcvcvcvc	3	44
3	2025-05-15 18:10:15.665565	fdfdfdfdf	3	45
3	2025-05-15 18:14:04.127399	uiuiuiuiu	3	46
3	2025-05-16 00:34:37.03436	n kkkmkkm	3	47
3	2025-05-16 00:49:22.875131	sssssssss	3	48
3	2025-05-17 19:13:34.466549	Ciao silvana!	3	49
16	2025-05-19 00:32:14.908464	hola	3	50
17	2025-05-19 02:24:09.419517	Ciao	6	51
17	2025-05-19 02:27:58.474674	Ciao	6	52
18	2025-05-19 13:11:58.615539	hola	3	53
19	2025-05-19 13:24:18.627891	xxxxxxxx	3	54
20	2025-05-19 13:31:38.726818	 vhvhvhvhvh	3	55
22	2025-05-19 15:03:52.729975	eererer	3	56
22	2025-05-19 16:22:33.05524	  nnjnkn	6	57
17	2025-05-19 16:36:42.849368	daghe	6	58
17	2025-05-19 17:44:59.82933	  nnjnkn	6	59
17	2025-05-19 17:46:36.29742	xxxcxcxc	3	60
18	2025-05-23 11:47:39.23681	egfgfgfgfgfg	3	61
\.


--
-- TOC entry 5014 (class 0 OID 442734)
-- Dependencies: 230
-- Data for Name: module; Type: TABLE DATA; Schema: public; Owner: luca
--

COPY public.module (oid, moduleid, modulename, group_oid, group_oid_2) FROM stdin;
1	sv3	Administrator	3	3
2	sv2	OpIDS_View	4	4
3	sv4	OpAS_View	5	5
\.


--
-- TOC entry 5021 (class 0 OID 459388)
-- Dependencies: 237
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: luca
--

COPY public.notification (oid, ts, description, from_pp, to_pp, noti_type, checked, evento_noti) FROM stdin;
4	2025-05-15 18:14:04.167431	New message	3	5	NewMessage	f	3
5	2025-05-16 00:34:37.123126	New message	3	5	NewEvent	f	3
6	2025-05-16 00:49:22.972721	New message	3	5	NewMessage	f	3
7	2025-05-16 14:13:12.646148	n	3	1	NewAlert	f	\N
25	2025-05-16 16:18:35.274962	dfdfdfdf	3	1	NewAlert	f	\N
26	2025-05-16 16:21:06.29652	te prego	3	1	NewAlert	f	\N
31	2025-05-16 16:30:14.645393	te prego2	3	1	NewAlert	f	\N
32	2025-05-16 16:32:16.743319	Broadcastbvggvv	3	1	NewAlert	f	\N
33	2025-05-16 16:32:41.115577	Broadcast	3	1	NewAlert	f	\N
34	2025-05-16 16:32:41.134855	Broadcast	3	2	NewAlert	f	\N
36	2025-05-16 16:32:41.20648	Broadcast	3	5	NewAlert	f	\N
37	2025-05-16 16:36:40.387595	Broadcast!	3	1	NewAlert	f	\N
38	2025-05-16 16:36:40.398609	Broadcast!	3	2	NewAlert	f	\N
40	2025-05-16 16:36:40.421904	Broadcast!	3	5	NewAlert	f	\N
41	2025-05-16 16:38:47.594768	Broadcast	3	1	NewAlert	f	\N
42	2025-05-16 16:42:17.633432	te prego no	3	1	NewAlert	f	\N
43	2025-05-16 16:43:57.694949	te prego22	3	1	NewAlert	f	\N
44	2025-05-16 16:45:17.832889	Broadcast	3	1	NewAlert	f	\N
73	2025-05-19 15:03:52.812425	New message	3	6	NewMessage	t	22
70	2025-05-19 14:53:40.000916	You've been assigned to a new event.	3	6	NewEvent	t	22
1	2025-05-13 13:36:20.483744	ciao	2	3	NewAlert	t	\N
87	2025-05-20 14:48:31.372347	You've been assigned to a new event.	3	7	NewEvent	f	26
46	2025-05-16 17:07:52.913676	Security policy updated – please review.	5	3	NewAlert	t	\N
65	2025-05-19 13:49:59.885193	dsdsd	6	3	NewAlert	t	\N
81	2025-05-19 17:55:50.908936	ciao a tutti!	9	3	NewAlert	t	\N
45	2025-05-16 17:07:52.913676	System maintenance scheduled at 22:00.	5	3	NewAlert	t	\N
47	2025-05-17 19:13:34.542867	New message	3	5	NewMessage	f	3
48	2025-05-18 19:55:34.095915	bnbnbn	3	1	NewAlert	f	\N
3	2025-05-13 19:14:29.499432	An event has been closed!	5	3	NewEvent	t	3
49	2025-05-18 20:12:27.322643	Broadcast!	3	1	NewAlert	f	\N
50	2025-05-18 20:12:27.382189	Broadcast!	3	2	NewAlert	f	\N
52	2025-05-18 20:12:27.452245	Broadcast!	3	5	NewAlert	f	\N
53	2025-05-19 00:32:14.930472	New message	3	5	NewMessage	f	16
56	2025-05-19 13:11:47.317786	You've been assigned to a new event.	3	5	NewEvent	f	18
57	2025-05-19 13:11:58.631361	New message	3	5	NewMessage	f	18
58	2025-05-19 13:24:11.836519	You've been assigned to a new event.	3	5	NewEvent	f	19
59	2025-05-19 13:24:18.636038	New message	3	5	NewMessage	f	19
60	2025-05-19 13:31:33.513685	You've been assigned to a new event.	3	5	NewEvent	f	20
61	2025-05-19 13:31:38.766807	New message	3	5	NewMessage	f	20
62	2025-05-19 13:33:06.077385	bnbnbn	3	1	NewAlert	f	\N
63	2025-05-19 13:49:59.810932	dsdsd	6	1	NewAlert	f	\N
64	2025-05-19 13:49:59.874615	dsdsd	6	2	NewAlert	f	\N
66	2025-05-19 13:49:59.893795	dsdsd	6	5	NewAlert	f	\N
68	2025-05-19 13:49:59.960063	dsdsd	6	7	NewAlert	f	\N
69	2025-05-19 13:50:26.885158	sdsdsdsd	6	1	NewAlert	f	\N
94	2025-05-23 11:49:43.664088	Broadcast nic	3	6	NewAlert	t	\N
89	2025-05-23 11:47:39.355466	New message	3	5	NewMessage	f	18
76	2025-05-19 17:44:59.94328	New message	6	3	NewMessage	t	17
90	2025-05-23 11:49:43.534919	Broadcast nic	3	1	NewAlert	f	\N
72	2025-05-19 15:01:39.438458	bnbnbn	3	7	NewAlert	f	\N
83	2025-05-19 17:55:50.928139	ciao a tutti!	9	6	NewAlert	t	\N
78	2025-05-19 17:46:36.307362	New message	3	6	NewMessage	t	17
91	2025-05-23 11:49:43.568337	Broadcast nic	3	2	NewAlert	f	\N
93	2025-05-23 11:49:43.649252	Broadcast nic	3	5	NewAlert	f	\N
95	2025-05-23 11:49:43.672131	Broadcast nic	3	7	NewAlert	f	\N
75	2025-05-19 16:36:42.893273	New message	6	3	NewMessage	t	17
77	2025-05-19 17:45:01.67	An event has been closed!	6	3	NewEvent	t	17
79	2025-05-19 17:55:50.866173	ciao a tutti!	9	1	NewAlert	f	\N
80	2025-05-19 17:55:50.899055	ciao a tutti!	9	2	NewAlert	f	\N
82	2025-05-19 17:55:50.917124	ciao a tutti!	9	5	NewAlert	f	\N
84	2025-05-19 17:55:50.936741	ciao a tutti!	9	7	NewAlert	f	\N
85	2025-05-19 17:55:50.945691	ciao a tutti!	9	8	NewAlert	f	\N
96	2025-05-23 11:49:43.680097	Broadcast nic	3	8	NewAlert	f	\N
97	2025-05-23 11:49:43.686003	Broadcast nic	3	9	NewAlert	f	\N
88	2025-05-20 15:34:33.922225	You've been assigned to a new event.	3	6	NewEvent	t	27
98	2025-05-23 11:50:56.882	An event has been closed!	6	3	NewEvent	t	27
\.


--
-- TOC entry 5018 (class 0 OID 442792)
-- Dependencies: 234
-- Data for Name: trafficolegit; Type: TABLE DATA; Schema: public; Owner: luca
--

COPY public.trafficolegit (oid, ch_ts, reason, by_op) FROM stdin;
172	\N	\N	\N
173	\N	\N	\N
174	\N	\N	\N
176	\N	\N	\N
178	\N	\N	\N
179	\N	\N	\N
182	\N	\N	\N
185	\N	\N	\N
188	\N	\N	\N
189	\N	\N	\N
190	\N	\N	\N
191	\N	\N	\N
192	\N	\N	\N
196	\N	\N	\N
197	\N	\N	\N
200	\N	\N	\N
203	\N	\N	\N
205	\N	\N	\N
228	2025-06-21 00:41:32.339	edffdfdf	3
229	2025-06-23 16:18:50.788	Prova con niccolo	3
230	\N	\N	\N
233	\N	\N	\N
236	\N	\N	\N
238	\N	\N	\N
239	\N	\N	\N
240	\N	\N	\N
241	\N	\N	\N
242	\N	\N	\N
244	\N	\N	\N
247	\N	\N	\N
249	\N	\N	\N
252	\N	\N	\N
257	\N	\N	\N
259	\N	\N	\N
261	\N	\N	\N
262	\N	\N	\N
263	\N	\N	\N
264	\N	\N	\N
267	\N	\N	\N
268	\N	\N	\N
270	\N	\N	\N
273	\N	\N	\N
276	\N	\N	\N
277	\N	\N	\N
280	\N	\N	\N
281	\N	\N	\N
283	\N	\N	\N
284	\N	\N	\N
285	\N	\N	\N
286	\N	\N	\N
288	\N	\N	\N
293	\N	\N	\N
298	\N	\N	\N
\.


--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 242
-- Name: adminstuff_oid_seq; Type: SEQUENCE SET; Schema: public; Owner: luca
--

SELECT pg_catalog.setval('public.adminstuff_oid_seq', 1, true);


--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 226
-- Name: evento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luca
--

SELECT pg_catalog.setval('public.evento_id_seq', 29, true);


--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 221
-- Name: global_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luca
--

SELECT pg_catalog.setval('public.global_id_seq', 300, true);


--
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 240
-- Name: immagine_oid_seq; Type: SEQUENCE SET; Schema: public; Owner: luca
--

SELECT pg_catalog.setval('public.immagine_oid_seq', 2, true);


--
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 239
-- Name: message_oid_seq; Type: SEQUENCE SET; Schema: public; Owner: luca
--

SELECT pg_catalog.setval('public.message_oid_seq', 61, true);


--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 236
-- Name: notification_oid_seq; Type: SEQUENCE SET; Schema: public; Owner: luca
--

SELECT pg_catalog.setval('public.notification_oid_seq', 98, true);


--
-- TOC entry 5040 (class 0 OID 0)
-- Dependencies: 232
-- Name: persona_matricola_seq_new; Type: SEQUENCE SET; Schema: public; Owner: luca
--

SELECT pg_catalog.setval('public.persona_matricola_seq_new', 13, true);


--
-- TOC entry 5041 (class 0 OID 0)
-- Dependencies: 222
-- Name: sensore_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luca
--

SELECT pg_catalog.setval('public.sensore_id_seq', 3, true);


-- Completed on 2025-06-24 18:10:21

--
-- PostgreSQL database dump complete
--

