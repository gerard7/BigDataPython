import pytest
from DataPulse.DataPulse.processing.file_loader import *
import  faker
chemin_base = os.path.abspath("/home/ratel/cours_Greta_python/code_python/DataPulse/data/")


# ***************** CORRECTION *************************

# @pytest.mark.parametrize("filename,nexpected_tye",[
#                              ("test.json","json"),
#                          ("test.csv",csv),
#                          ("test.txt","txt"),
#                          ("test_unknown",None),
#
#                          ])
# def test_detect_file_type_path(filename,expected):
#     assert detect_file_type(filename,expected ==)
# ***************** FIN CORRECTION *********************

def test_detest_txt_1():
    chemin_txt = os.path.normpath(os.path.join(chemin_base, "fichier_decompresse.txt"))
    assert detect_file_type(chemin_txt) == "TXT"

def test_detect_txt_2():
    chemin_txt = os.path.normpath(os.path.join(chemin_base, "data.txt"))
    assert detect_file_type(chemin_txt) == "TXT"

def test_detect_csv():
    chemin_csv = os.path.normpath(os.path.join(chemin_base, "clients.csv"))
    assert detect_file_type(chemin_csv) == "CSV"

def test_detect_json():
    chemin_json = os.path.normpath(os.path.join(chemin_base, "server_logs.txt"))
    assert detect_file_type(chemin_json) == "JSON"

def test_exeption_detect_file():
    chemin_fichier_inexistant = os.path.normpath(os.path.join(chemin_base, "aucun_fichier_txt_de_ce_genre.rien"))
    detect_file_type(chemin_fichier_inexistant) == "inconnu"


