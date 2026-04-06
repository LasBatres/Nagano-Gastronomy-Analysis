#Luis Alberto Sanchez Batres
clear;
clc;

#Carga del DataFrame
df = csvread("restaurantes_Nagano_octave.csv");

#Asignacion de los vectores
ID = df(:,1);
rating = df(:,2);
reviews = df(:,3);
cena_min = df(:,4);
cena_max = df(:,5);
cena_avg = df(:,6);
comida_min = df(:,7);
comida_max = df(:,8);
comida_avg = df(:,9);

#Estadisticos para las cenas
fprintf("\n  ---  Analisis de preicos (cena)  --- \n");
media_cena = mean(cena_avg);
mediana_cena = median(cena_avg);
desviacion_cena = std(cena_avg);
rango_cena = max(cena_avg) - min(cena_avg);
varianza_cena = var(cena_avg);
asimetria_cena = skewness(cena_avg);

printf("Precio promedio : %.2f JPY \n", media_cena);
printf("Precio mediano : %.2f JPY \n", mediana_cena);
printf("Rango promedio : %2.f JPY \n", rango_cena);
printf("Desviacion en cenas : %.2f JPY \n", desviacion_cena);
printf("Varianza de cenas : %2.f JPY \n", varianza_cena);
printf("Coeficiente de asimetria : %2.f JPY \n", asimetria_cena);


#Histograma de los precios de las cenas -------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------
precios_val_cenas = cena_avg(cena_avg>0);
  #Creacion de la figura y el histograma
figure(1);
hist(precios_val_cenas,6, "facecolor",[0.25,0.25,0.45], "edgecolor",[0.8,0.8,0.8]);
hold on;
  #Agregamos las medidas centrales
line([media_cena, media_cena], ylim, "color",[0.2,0.2,0.2], "linewidth",2.5, "linestyle","-");
line([mediana_cena, mediana_cena], ylim, "color",[0,0.45,0.74], "linewidth",2.5, "linestyle","-");
line([media_cena+desviacion_cena, media_cena+desviacion_cena],ylim,"color",[0.5,0.5,0.5], "linewidth",1.5, "linestyle","--");
line([media_cena-desviacion_cena, media_cena-desviacion_cena],ylim,"color",[0.5,0.5,0.5], "linewidth",1.5, "linestyle","--");
  #limpieza de los ejes y etiquetas
set(gca, "fontsize",10, "fontname","Helvetica")
title("Distribucion de Costos de Cena en Nagano", "fontsize", 14, "fontweight", "bold");
xlabel("Presupuesto por Persona (JPY)", "fontsize", 12);
ylabel("Frecuencia de Establecimientos", "fontsize", 12);
legend("Distribucion", "Media", "Mediana", "Desviacion Std", "location", "northeast");
legend boxoff;
  #Limpieza del fondo
set(gca, "gridcolor", [0.9, 0.9, 0.9], "minorgridlinestyle", "none");
set(gcf, "color", [0.98, 0.98, 0.98]);
set(gca, "color", [1, 1, 1]);
set(gca, "box", "off");
hold off;
#------------------------------------------------------------------------------------------------------------------

#Estadisticos para las comidas
fprintf("---  Analisis de precios (comidas)  ---");
media_comida = mean(comida_avg);
mediana_comida = median(comida_avg);
rango_comida = max(comida_avg) - min (comida_avg);
varianza_comida = var(comida_avg);
desviacion_comida = std(comida_avg);
asimetria_comida = skewness(comida_avg);

printf("Precio promedio : %.2f JPY \n", media_comida);
printf("Precio mediano : %.2f JPY \n", mediana_comida);
printf("Rango : %2.f JPY \n", rango_comida);
printf("Desviacion en comidas : %.2f JPY \n", desviacion_comida);
printf("Varianza de comidas : %2.f JPY \n", varianza_comida);
printf("Coeficiente de asimetria : %2.f JPY \n", asimetria_comida);

#Histograma de los precios de las comidas -----------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------
precios_val_comidas = comida_avg(comida_avg>0);
  #Creacion de la figura y el histograma
figure(2);
hist(precios_val_comidas,6 , "facecolor",[0.25,0.25,0.45], "edgecolor",[0.8,0.8,0.8]);
hold on;
  #Agregamos las medidas centrales
line([media_comida, media_comida], ylim, "color",[0.2,0.2,0.2], "linewidth",2.5, "linestyle","-");
line([mediana_comida, mediana_comida], ylim, "color",[0,0.45,0.74], "linewidth",2.5, "linestyle","-");
line([media_comida+desviacion_comida, media_comida+desviacion_comida],ylim,"color",[0.5,0.5,0.5], "linewidth",1.5, "linestyle","--");
line([media_comida-desviacion_comida, media_comida-desviacion_comida],ylim,"color",[0.5,0.5,0.5], "linewidth",1.5, "linestyle","--");
  #limpieza de los ejes y etiquetas
set(gca, "fontsize",10, "fontname","Helvetica")
title("Distribucion de Costos de Comida en Nagano", "fontsize", 14, "fontweight", "bold");
xlabel("Presupuesto por Persona (JPY)", "fontsize", 12);
ylabel("Frecuencia de Establecimientos", "fontsize", 12);
legend("Distribucion", "Media", "Mediana", "Desviacion Std", "location", "northeast");
legend boxoff;
  #Limpieza del fondo
set(gca, "gridcolor", [0.9, 0.9, 0.9], "minorgridlinestyle", "none");
set(gcf, "color", [0.98, 0.98, 0.98]);
set(gca, "color", [1, 1, 1]);
set(gca, "box", "off");
hold off;
#------------------------------------------------------------------------------------------------------------------

#Estadisticos de los rating
fprintf("--- Analisis de ratings  --- \n")
media_rating = mean(rating);
mediana_rating = median(rating);
rango_rating = max(rating) - min(rating);
varianza_rating = var(rating);
desviacion_rating = std(rating);
asimetria_rating = skewness(rating);

printf("Rating promedio : %.2f JPY \n", media_rating);
printf("Rating mediano : %.2f JPY \n", mediana_rating);
printf("Rango : %2.f JPY \n", rango_rating);
printf("Desviacion en ratings : %.2f JPY \n", desviacion_rating);
printf("Varianza de ratings : %2.f JPY \n", varianza_rating);
printf("Coeficiente de asimetria : %2.f JPY \n", asimetria_rating);

#Histograma de los precios de las comidas -----------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------
rating_val = rating(rating>0);
  #Creacion de la figura y el histograma
figure(3);
hist(rating_val,6 , "facecolor",[0.25,0.25,0.45], "edgecolor",[0.8,0.8,0.8]);
hold on;
  #Agregamos las medidas centrales
line([media_rating, media_rating], ylim, "color",[0.2,0.2,0.2], "linewidth",2.5, "linestyle","-");
line([mediana_rating, mediana_rating], ylim, "color",[0,0.45,0.74], "linewidth",2.5, "linestyle","-");
line([media_rating+desviacion_rating, media_rating+desviacion_rating],ylim,"color",[0.5,0.5,0.5], "linewidth",1.5, "linestyle","--");
line([media_rating-desviacion_rating, media_rating-desviacion_rating],ylim,"color",[0.5,0.5,0.5], "linewidth",1.5, "linestyle","--");
  #limpieza de los ejes y etiquetas
set(gca, "fontsize",10, "fontname","Helvetica")
title("Distribucion de Rating en Nagano", "fontsize", 14, "fontweight", "bold");
xlabel("Rating de los restaurantes en Nagano", "fontsize", 12);
ylabel("Frecuencia", "fontsize", 12);
legend("Distribucion", "Media", "Mediana", "Desviacion Std", "location", "northeast");
legend boxoff;
  #Limpieza del fondo
set(gca, "gridcolor", [0.9, 0.9, 0.9], "minorgridlinestyle", "none");
set(gcf, "color", [0.98, 0.98, 0.98]);
set(gca, "color", [1, 1, 1]);
set(gca, "box", "off");
hold off;
#------------------------------------------------------------------------------------------------------------------



