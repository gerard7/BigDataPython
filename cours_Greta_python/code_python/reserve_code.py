"""
Ce fichier contient des réserves de code sensés être stockés pour un usage future
"""
# ===================================================================
# lecture_grand_fichier(log_path)
#     http = r'\b(\d{3})\b'
#     ip = r'\b(?:\d{1,3}\.){3}\d{1,3}\b'
#     heure_requete =r'\b(\d{2}):\d{2}:\d{2}\b'
#     motif_http = re.compile(http)
#     # motif_ip = re.compile(ip)
#     # motif_heure_requete = re.compile(heure_requete)
#     http_codes = Counter()
#     ip_adresse = Counter()
#     trafique_par_heure = Counter()
#     for line in load_file(log_path): # Lecture stream
#         # Extraction du code HTTP  (3 premiers chiffres trouvés
#         match_http = re.search(http,line)
#         match_ip = re.search(ip,line)
#         if match_http:
#             http_codes[match_http.group(1)]+=1
#         if match_ip:
#             ip_adresse[match_ip.group(0)]+=1
#         match_time =re.search(heure_requete,line)
#         if match_time:
#             trafique_par_heure[match_time.group(1)]+=1
#     sorted_traffic_by_hour = dict(sorted(trafique_par_heure.items(),key=lambda x:int(x[0])))
#     return {
#         "total_requests":sum(http_codes.values()),
#         "http_code_distribution":dict(http_codes),
#         "most_action_ip":dict(ip_adresse.most_common(top_ips)),
#         "traffic_by_hour": sorted_traffic_by_hour
#             }
#====================================================================