#Funcion para hacer histogramas bonitos en octave
#Luis A. Sanchez Batres

function histograma_descriptivo(datos, clases, titulo, ejeX, ejeY, tema)
   #Asignacion de variables
   mu = mean(datos);
   md = median(datos);
   sigma = std(datos);
   sk = skewness(datos);
   ku = kurtosis(datos);

   #GRAFICACION DEL HISTOGRAMA
   hist(datos, clases, "facecolor", tema.face, "edgecolor", tema.bg, "facealpha", 0.7 );
   hold on;
   #Medidas centrales
   line([mu,mu], ylim, "color", tema.line_principal, "linewidth", 2.5, "linestyle", "-");
   line([md,md], ylim, "color", tema.line_principal, "linewidth", 2, "linestyle", "--");
   line([mu+sigma,mu+sigma], ylim , "color", tema.line_secundaria, "linewidth", 1.5, "linestyle", "--");
   line([mu-sigma,mu-sigma], ylim , "color", tema.line_secundaria, "linewidth", 1.5, "linestyle", "--");
   #Limpieza de los ejes y etiquetas
   title(titulo, "interpreter", "latex", "fontsize", 20, "color", tema.text, "fontweight", "bold");
   xlabel(ejeX, "interpreter", "latex", "fontsize", 18, "color", tema.text);
   ylabel(ejeY, "interpreter", "latex", "fontsize", 18, "color", tema.text);
   legend({"Datos", "$\\bar{x}$", "$\\tilde{x}$", "$\\sigma$"}, "interpreter", "latex","fontsize", 16, "location", "northeast", "color", tema.text);
   legend boxoff;
   #Limpieza del fondo y bordes
   set(gcf, "color", tema.bg);
   set(gca, "color", tema.ax_bg);
   set(gca, "gridcolor", tema.grid);
   set(gca, "GridAlpha", 0.8);
   set(gca, "box", "off");
   hold off;
endfunction
