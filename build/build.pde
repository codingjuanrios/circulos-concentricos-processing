int second = second();  // Values from 0 - 59
int minute = minute();  // Values from 0 - 59
int hour = hour();    // Values from 0 - 23
int day = day();    // Values from 1 - 31
int month = month();  // Values from 1 - 12
int year = year();   // 2003, 2004, 2005, etc.

String timestamp = str(year)+str(month)+str(day)+str(hour)+str(minute)+str(second);

color[] fondo = {#F2BE24, #57523E, #D94C1A, #A4A68A};
color[] colores = {#4190FC, #3AACE0, #4DEFF7, #3AE0BA, #41FC9C};

float cantidad = 24;
float nivel = cantidad;
float reparto = HALF_PI/cantidad;
float limite = cantidad++;

float secciones = 6;
float posicion = 0;
float tamano = 250; //UN TAMAÑO SUPERIOR GENERA ESCAMAS

int cero = 0;

int grabacion = 900;

color[] crecedero = new color[(int)cantidad];


void setup() {
	size(800,800);
	background(fondo[(int)random(fondo.length)]);
	// noLoop();
	noStroke();

	println("crecedero[0]: "+crecedero[0]);

	for (int j = 0; j < cantidad; j++) {
		crecedero[j] = colores[(int)random(colores.length)];
		println("j: "+j);
		println("crecedero[j]: "+crecedero[j]);
	}

	// for (int i = 0; i < limite; i++) {
	// 	fill(colores[(int)random(colores.length)]);
	// 	ellipse(width/2, height/2, width*cos(reparto*i), height*cos(reparto*i));
	// }

	// saveFrame("C:/users/escri/Pictures/Processing/CirculosConcentricos/screenshot/circulosconcentricos"+timestamp+".jpeg");

}

void draw() {

	drawCircle(width/2,height/2,cero,nivel,cantidad);
	// circle(width/2,height/2,cero);

	cero+=1;


	// //DIBUJA UNA CUADRICULA DE CIRCULOS CONCENTRICOS
	// if (frameCount%60 == 0) {

	// 	background(fondo[(int)random(fondo.length)]);

	// 	float anchoSecc = width/secciones;
	// 	float altoSecc = height/secciones;

	// 	float margenX = (anchoSecc - tamano)/2;
	// 	float margenY = (altoSecc - tamano)/2;

	// 	for (int j = 0; j < secciones; j++){

	// 		for (int i = 0; i < secciones; i++){
	// 			float desplX = (anchoSecc*i) + margenX + tamano/2;
	// 			float desplY = (altoSecc*j) + margenY + tamano/2;

	// 			pushMatrix();
	// 			translate(desplX, desplY);

	// 			drawCircle(posicion,posicion,tamano,nivel,cantidad);

	// 			popMatrix();
	// 		}
	// 	}


	// 	saveFrame("C:/users/escri/Pictures/Processing/CirculosConcentricos/screenshot/circulosconcentricos"+timestamp+"-"+frameCount+".jpeg");
	// }


	// //DIBUJA CIRCULOS CONCENTRICOS
	// if (frameCount%60 == 0) {

	// 	for (int i = 1; i < cantidad; i++) {
	// 		fill(colores[(int)random(colores.length)]);
	// 		// ellipse(width/2, height/2, width/i, height/i);
	// 		ellipse(width/2, height/2, width*cos(reparto*i), height*cos(reparto*i));
	// 	}

	// 	saveFrame("C:/users/escri/Pictures/Processing/CirculosConcentricos/screenshot/circulosconcentricos"+timestamp+"-"+frameCount+".jpeg");
	// }


	guardarVideo();
	guardarImagen(timestamp);



	if (frameCount == grabacion) exit();
	
}


void drawCircle(float x, float y, float size, float level,float cuantos) {
	// fill(colores[(int)random(colores.length)]);
	fill(crecedero[(int)level-1]);
	circle(x,y,size);

	if (level > 1) {
		level--;
		// drawCircle(x,y,size*level/cuantos,level,cuantos);
		drawCircle(x,y,size*level/cuantos,level,cuantos);

	}

}

void guardarVideo () {
	saveFrame("C:/users/escri/Pictures/Processing/CirculosConcentricos/video/circulosconcentricos#####.tif");
}

void guardarImagen (String tiempo) {
	if (frameCount%60 == 0) saveFrame("C:/users/escri/Pictures/Processing/CirculosConcentricos/screenshot/circulosconcentricos"+tiempo+"-"+frameCount+".jpeg");
}