#Funcion para hacer graficos de dispersion bonitos en Octave
#Luis A. Sanchez Batres

function scatter_profesional(X, Y, point_size, titulo, ejeX, ejeY, tema)
  edge_color = tema.face*0.3;

  #GRAFICACION DEL SCATTER
  scatter(X, Y, point_size, "filled", ...
          "MarkerFaceColor", tema.face, ...
          "MarkerEdgeColor", edge_color, ...
          "MarkerFaceAlpha", 0.6);
  #Limpieza de los ejes y etiquetas
  title(titulo, "interpreter", "latex", "fontsize", 20, "color", tema.text, "fontweight", "bold");
  xlabel(ejeX, "interpreter", "latex", "fontsize", 18, "color", tema.text);
  ylabel(ejeY, "interpreter", "latex", "fontsize", 18, "color", tema.text);
  #Limpieza del fondo y ejes
  set(gcf, "Color", tema.bg);
  set(gca, "Color", tema.ax_bg);
  set(gca, "GridColor", tema.grid);
  set(gca, "GridAlpha", 0.8);
  set(gca, "box", "off");
  set(gca, "XColor", tema.text, "YColor", tema.text);
  grid on;
endfunction
