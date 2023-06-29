class Estela {

    constructor() {
        this.ancho = 700;
        this.alto = 833;
        this.lineaFina = createGraphics(this.ancho, this.alto);
        this.lineaGruesa = createGraphics(this.ancho, this.alto);
        this.lineas = createGraphics(width, height);
        this.lineaBajo = false;
        this.lasFinasnoseabrieron = false;
        this.separacion = 0;
        this.decender = -this.alto;
        this.inclinacion = 0;
        this.variable = 0;
        this.alfa = 255;
        this.alfa2 = 0;
    }

    dibujar(imgFina, imgGruesa, x, posX, posY) {

        if (x == 0) {
            this.decender = -this.alto;
            this.separacion = 0;
            this.inclinacion = 0;
            this.variable = 0;
        }

        this.lineaGruesa.clear();
        this.lineaBajo = this.decender > -20;
        this.lasFinasnoseabrieron = this.variable < 120;

        if (!this.lineaBajo) {
            this.lineaFina.clear();
            this.decender = x - this.alto;
            this.inclinacion = - x / 2 + this.ancho - 300;
        }
        else {
            if (this.lasFinasnoseabrieron) {
                this.separacion = this.variable;
                this.variable += 2;
            }
        }


        this.lineaFina.image(imgFina, this.separacion, 0, this.ancho, this.alto);
        this.lineaFina.image(imgFina, -this.separacion, 0, this.ancho, this.alto);

        this.lineaGruesa.image(imgGruesa, this.inclinacion + 35, this.decender, this.ancho, this.alto);

        let copia = this.lineaFina.get();
        copia.mask(this.lineaGruesa);

        image(copia, posX, posY - 10, this.ancho, this.alto);

    }

}
