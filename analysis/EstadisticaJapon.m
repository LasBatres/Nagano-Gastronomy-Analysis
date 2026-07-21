#Luis Alberto Sanchez Batres
clc;
clear;

#Carga del DataFrame
df = csvread("restaurantes_Nagano_octave.csv");

#Asignacion de los vectores
ID = df(:,1);
rating = df(:,2);
reviews = df(:,3);
cena_min = df(:,4);
cena_max = df(:,5);
cena_price = df(:,6);   #Precio promedio de las cenas
comida_min = df(:,7);
comida_max = df(:,8);
comida_price = df(:,9);   #Precio promedio de las comidas

#Obtencion del tema para las graficas
estilo = obtener_tema("forest_light");
estilo2 = obtener_tema("minimal_blue");
estilo3 = obtener_tema("slate_gray");
estilo4 = obtener_tema("mint_cream");

#ANALISIS ESTADISTICO DESCRIPTIVO (Graficas crudas)
datasets = {cena_price, comida_price, rating};
titulos = {"Precios de Cena", "Precios de Comida", "Ratings"};
etiquetas = {"JPY", "JPY", "Rating(1-5)"};

figure(1);
for i = 1:length(datasets)
  subplot(3,1,i);
  histograma_descriptivo(datasets{i}, 6, titulos{i}, etiquetas{i}, "Frec.", estilo);
  legend off;
endfor

#Estudio de los ratings
mask_rt = rating > 0;
R = rating(mask_rt);
v = reviews(mask_rt);
m = mean(v)/std(v);
rt_bayes = (v./(v + m)).*R + (m./(v + m)).*mean(R);

#Estudio de las cenas
cena_price_cl = cena_price(mask_rt);
mask_cena_std = cena_price_cl < 15000;
mask_cena_prem = cena_price_cl > 15000;

cena_std_price = cena_price_cl(mask_cena_std);
cena_prem_price = cena_price_cl(mask_cena_prem);

rt_cena_std = rt_bayes(mask_cena_std);
rt_cena_prem = rt_bayes(mask_cena_prem);

rho_raw = corr(cena_price_cl, rt_bayes);
rho_std = corr(cena_std_price, rt_cena_std);
rho_prem = corr(cena_prem_price, rt_cena_prem);

datasets_cenas = {cena_std_price,  cena_prem_price};
datasets_rt = {rt_cena_std, rt_cena_prem};
titulos_cenas = {"Cenas: Segmento Estandar", "Cenas: Segmento Premium"};
titulos_rt = {"Rating de cenas estandar", "Rating de cenas premium"};
etiquetas_cenas = {"JPY", "JPY"};
etiquetas_rt = {"Rating bayesiano", "Rating bayesiano"};

for i = 1:2
  j = i + 1;
  figure(j);
  subplot(2,1,1);
  histograma_descriptivo(datasets_cenas{i},10, titulos_cenas{i}, ...
                         etiquetas_cenas{i}, "Frecuencia", estilo2);
  subplot(2,1,2);
  histograma_descriptivo(datasets_rt{i},10, titulos_rt{i}, ...
                         etiquetas_rt{i}, "Frecuencia", estilo3);
endfor

figure(4);
for i = 1:2
  subplot(2,1,i);
  scatter_profesional(datasets_cenas{i},datasets_rt{i}, 40, ...
                      titulos_cenas{i},etiquetas_cenas{i}, ...
                      etiquetas_rt{i}, estilo);
endfor

cena_std_segment = unique(cena_std_price);
cena_prem_segment = unique(cena_prem_price);

mask_best_rst_std =  false(length(cena_std_price), length(cena_std_segment));
mask_best_rst_prem = false(length(cena_prem_price), length(cena_prem_segment));

for i = 1:length(cena_std_segment);
  mask_segment = (cena_std_price == cena_std_segment(i));
  ID_segment = find(mask_segment);
  rt_segment = rt_cena_std(mask_segment);
  rt_avg = mean(rt_segment);
  mask_better = (rt_segment >= rt_avg);
  rest_ID_seg = ID(mask_segment);
  local_better = ID_segment(mask_better);
  mask_best_rst_std(local_better, i) = true;
endfor

for i = 1:length(cena_prem_segment);
  mask_segment = (cena_prem_price == cena_prem_segment(i));
  ID_segment = find(mask_segment);
  rt_segment = rt_cena_prem(mask_segment);
  rt_avg = mean(rt_segment);
  mask_better = (rt_segment >= rt_avg);
  rest_ID_seg = ID(mask_segment);
  local_better = ID_segment(mask_better);
  mask_best_rst_prem(local_better, i) = true;
endfor



