#Luis Alberto Sanchez Batres
import requests
from bs4 import BeautifulSoup
import time
import csv

#Obtencion de las URL
pcd = 20 #Solo para Nagano en esta ocacion
pages = 3 #Numero de paginas para extraer
URLs = [] 
for i in range(1, pages + 1):
    url_generada = f"https://tabelog.com/en/rstLst/{i}/?pcd={pcd}"
    URLs.append(url_generada)

#Anti-ERROR 403
headers = {
    "User-Agent": "Mozilla/5.0 (X11; Ubuntu; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36"
}

#Definicion de la funcion principal (Toma la URL y extrae los datos)
def extrac(url_objetivo):
    datos_unsaved = []
    try:

        #Obtencion de la URL
        response = requests.get(url_objetivo, headers=headers)
        soup = BeautifulSoup(response.text,'html.parser')

        #Obtencion de los elementos
        restaurantes = soup.select('.list-rst')

        # Iteracion para obtener el valor de las 7 categorias(j) para cada elemento(i)
        for r in restaurantes:
            #NOMBRE
            nombre = r.select_one('.list-rst__rst-name-target').text.strip()

            #RATING
            tag_rating = r.select_one('.list-rst__rating-val')
            rating = tag_rating.text.strip() if tag_rating else "0.0"

            #NUMERO DE REVIEWS
            tag_revs = r.select_one('.list-rst__rvw-count-num')
            revs = tag_revs.text.strip() if tag_revs else "0"

            #PRECIO DE LAS CENAS (noche)
            tag_p_noche = r.select_one('.c-rating-v3__time--dinner + .c-rating-v3__val')
            p_noche = tag_p_noche.text.strip() if tag_p_noche else "N/A"

            #PRECIO DE LAS COMIDAS (dia)
            tag_p_dia = r.select_one('.c-rating-v3__time--lunch + .c-rating-v3__val')
            p_dia = tag_p_dia.text.strip() if tag_p_dia else "N/A"

            #OBTENCION DE LA ESTACION Y TIPO DE RESTAURANTE
            tag_area = r.select_one('.list-rst__area-genre')
            if tag_area:
                partes = tag_area.text.split('/')
                estacion = partes[0].strip()
                tipo = partes [1].strip() if len(partes)>1 else "N/A"
            else:
                estacion = "N/A"
                tipo = "N/A"


            datos_unsaved.append([nombre, rating, revs, p_noche, p_dia, estacion, tipo])

    except Exception as e:
        print(f"Error en el experimento: {e}")

    return datos_unsaved

#Creacion del archivo .CSV
nombre_archivo = "restaurantes_Nagano_raw.csv"
with open(nombre_archivo, 'w', newline = '', encoding='utf-8') as f:
    writer = csv.writer(f)
    writer.writerow(['Nombre', 'Rating', '# Reviews', 'Precio cena', 'Precio comida', 'Estacion', 'Tipo de Rst'])

    for u in range(0, len(URLs)):
        url_objetivo = URLs[u]
        batch = extrac(url_objetivo)
        writer.writerows(batch)
        time.sleep(4)

print("---Extraccion Completa---")