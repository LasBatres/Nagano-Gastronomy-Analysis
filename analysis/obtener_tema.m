# Biblioteca de diseños para graficas zzz
# Luis A. Sanchez Batres

# Biblioteca de diseños para graficas zzz
# Luis A. Sanchez Batres

function tema = obtener_tema(nombre_estilo)
  switch nombre_estilo
    # --- SOBRIOS CLAROS ---
    case "minimal_blue"
      tema.face    = [0.20, 0.40, 0.60]; tema.bg      = [0.98, 0.98, 0.98];
      tema.ax_bg   = [1.00, 1.00, 1.00]; tema.text    = [0.15, 0.15, 0.15];
      tema.grid    = [0.90, 0.90, 0.90]; tema.line_principal = [0.1, 0.1, 0.1];
      tema.line_secundaria = [0.0, 0.5, 0.8];

    case "forest_light"
      tema.face    = [0.23, 0.37, 0.23]; tema.bg      = [0.97, 0.99, 0.97];
      tema.ax_bg   = [1.00, 1.00, 1.00]; tema.text    = [0.10, 0.20, 0.10];
      tema.grid    = [0.85, 0.90, 0.85]; tema.line_principal = [0.2, 0.2, 0.2];
      tema.line_secundaria = [0.4, 0.7, 0.2];

    case "slate_gray"
      tema.face    = [0.44, 0.50, 0.56]; tema.bg      = [0.96, 0.97, 0.98];
      tema.ax_bg   = [1.00, 1.00, 1.00]; tema.text    = [0.05, 0.05, 0.10];
      tema.grid    = [0.88, 0.88, 0.90]; tema.line_principal = [0.0, 0.0, 0.0];
      tema.line_secundaria = [0.7, 0.2, 0.2];

    # --- SOBRIOS OSCUROS ---
    case "deep_ocean"
      tema.face    = [0.00, 0.45, 0.74]; tema.bg      = [0.10, 0.12, 0.15];
      tema.ax_bg   = [0.14, 0.16, 0.20]; tema.text    = [0.90, 0.92, 0.95];
      tema.grid    = [0.20, 0.25, 0.30]; tema.line_principal = [1.0, 1.0, 1.0];
      tema.line_secundaria = [1.0, 0.7, 0.0];

    case "charcoal_gold"
      tema.face    = [0.30, 0.30, 0.30]; tema.bg      = [0.18, 0.18, 0.18];
      tema.ax_bg   = [0.22, 0.22, 0.22]; tema.text    = [0.95, 0.90, 0.80];
      tema.grid    = [0.28, 0.28, 0.28]; tema.line_principal = [0.9, 0.9, 0.9];
      tema.line_secundaria = [1.0, 0.84, 0.0];

    case "midnight_wine"
      tema.face    = [0.50, 0.10, 0.10]; tema.bg      = [0.05, 0.05, 0.05];
      tema.ax_bg   = [0.08, 0.08, 0.08]; tema.text    = [0.95, 0.85, 0.85];
      tema.grid    = [0.15, 0.10, 0.10]; tema.line_principal = [0.8, 0.8, 0.8];
      tema.line_secundaria = [1.0, 0.3, 0.3];

    # --- PASTELES "CUTE" CLAROS ---
    case "sakura_pink"
      tema.face    = [0.96, 0.65, 1.00]; tema.bg      = [1.00, 0.98, 1.00];
      tema.ax_bg   = [1.00, 1.00, 1.00]; tema.text    = [0.30, 0.20, 0.30];
      tema.grid    = [0.95, 0.90, 0.95]; tema.line_principal = [0.3, 0.3, 0.3];
      tema.line_secundaria = [0.0, 0.7, 0.8];

    case "mint_cream"
      tema.face    = [0.65, 0.93, 0.84]; tema.bg      = [0.95, 1.00, 0.98];
      tema.ax_bg   = [1.00, 1.00, 1.00]; tema.text    = [0.20, 0.30, 0.25];
      tema.grid    = [0.85, 0.95, 0.90]; tema.line_principal = [0.4, 0.4, 0.4];
      tema.line_secundaria = [1.0, 0.5, 0.6];

    # --- PASTELES OSCUROS ---
    case "dusty_rose"
      tema.face    = [0.71, 0.52, 0.58]; tema.bg      = [0.25, 0.20, 0.22];
      tema.ax_bg   = [0.28, 0.23, 0.25]; tema.text    = [0.95, 0.85, 0.90];
      tema.grid    = [0.35, 0.30, 0.32]; tema.line_principal = [0.9, 0.9, 0.9];
      tema.line_secundaria = [1.0, 0.8, 0.9];

    case "misted_teal"
      tema.face    = [0.40, 0.60, 0.60]; tema.bg      = [0.20, 0.25, 0.25];
      tema.ax_bg   = [0.22, 0.28, 0.28]; tema.text    = [0.85, 0.95, 0.95];
      tema.grid    = [0.30, 0.35, 0.35]; tema.line_principal = [0.8, 0.8, 0.8];
      tema.line_secundaria = [0.6, 1.0, 0.9];

    otherwise
      error("Estilo no encontrado. Prueba con 'minimal_blue' o 'sakura_pink'.")
  endswitch
endfunction

