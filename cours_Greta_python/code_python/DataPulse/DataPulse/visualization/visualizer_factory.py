# Le pattern factory est un Design pattern de Création qui permet de centraliser
# et de simplifier la création d'objet sans exposer la logique de leur instanciation
from DataPulse.logging_config import logger


class VisualierFactory:
    """
    C'est une fabrique qui retourne le bon visualiseur en fonction des données
    fournies
    """

    @staticmethod
    def get_visualizer(analysis_resulats:dict,analysis_type:str):
        if analysis_type=="transactions":
            return TransactionVisualizer(analysis_resulats)
        elif analysis_resulats=="clients":
            return ClientVisualizer(analysis_resulats)
        else:
            raise ValueError(f"Type d'analyse inconnu : {analysis_type}")


if __name__=="__main__":
    # Création de données pour pouvoir appeler VisualierFactory


    # Création de visualiser via factory
    transaction_viz = VisualierFactory.get_visualizer(data_transaction,"transactions")
    client_viz = VisualierFactory.get_visualizer(data_client,"clients")
