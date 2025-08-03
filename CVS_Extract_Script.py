## Import Librairies 
from io import StringIO

link ="https://github.com/Delta483711/DataEng02/blob/main/Netflix_Dataset.csv"
df = pd.read_csv(StringIO(requests.get(url).text))
