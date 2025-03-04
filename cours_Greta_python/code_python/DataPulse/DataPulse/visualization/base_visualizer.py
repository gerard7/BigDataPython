from abc import ABC
from abc import abstractmethod
import seaborn as sns
import matplotlib.pyplot as plt

class BaseVisualizer(ABC):
    """
    Classe abstraite pour gérer la visualisation desm!!!:! données analytique
    """
    def __init__(self,analysis_resultats:dict):
        self._results = analysis_resultats


    @abstractmethod
    def plot(self):
        pass

    def _setup_figure(self,title:str, figsize=(8,5)):
        # C'est une méthode protégée : car son nom commence par _
        # Elle peut être utilisée dans la classe mère et les classe filles.
        sns.set_theme(style="whitegrid")
        fig,ax = plt.subplots(figsize=figsize)
        ax.set_title(title,fontsize=14,fontweight="bold")
        return fig,ax