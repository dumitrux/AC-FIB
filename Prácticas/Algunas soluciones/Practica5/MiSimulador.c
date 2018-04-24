#include "CacheSim.h"
#include <string.h>
#include <stdio.h>

/* Posa aqui les teves estructures de dades globals
 * per mantenir la informacio necesaria de la cache
 * */
int h;

struct contenidoD {
	unsigned int bitv;
	unsigned int tagD;
};

struct contenidoD cacheD[128];

/* La rutina init_cache es cridada pel programa principal per
 * inicialitzar la cache.
 * La cache es inicialitzada al començar cada un dels tests.
 * */
void init_cache ()
{
    totaltime=0.0;
	/* Escriu aqui el teu codi */
    int i;
	for (i = 0; i < 128; i++) {
        cacheD[i].bitv = 0;
    }
    h = 0;
}

/* La rutina reference es cridada per cada referencia a simular */ 
void reference (unsigned int address)
{
	unsigned int byte;
	unsigned int bloque_m; 
	unsigned int linea_mc;
	unsigned int tag;
	unsigned int miss;	   // boolea que ens indica si es miss
	unsigned int replacement;  // boolea que indica si es reemplaça una linia valida
	unsigned int tag_out;	   // TAG de la linia reemplaçada
	float t1,t2;		// Variables per mesurar el temps (NO modificar)
	
	t1=GetTime();
	/* Escriu aqui el teu codi */

	byte = address&31;
	bloque_m = address>>5;
	linea_mc = (address>>5)&127;
	tag = address>>12;
	
	if(tag == cacheD[linea_mc].tagD && cacheD[linea_mc].bitv) {
		miss = 0;
		replacement = 0;
        h++;
	}
	else {
		miss = 1;
		if (cacheD[linea_mc].bitv) {
			replacement = 1;
			tag_out = cacheD[linea_mc].tagD;
		}
		else replacement = 0;
		cacheD[linea_mc].tagD = tag;
        cacheD[linea_mc].bitv = 1;
	}


	/* La funcio test_and_print escriu el resultat de la teva simulacio
	 * per pantalla (si s'escau) i comproba si hi ha algun error
	 * per la referencia actual. També mesurem el temps d'execució
	 * */
	t2=GetTime();
	totaltime+=t2-t1;
	test_and_print (address, byte, bloque_m, linea_mc, tag,
			miss, replacement, tag_out);
}

/* La rutina final es cridada al final de la simulacio */ 
void final ()
{
 	/* Escriu aqui el teu codi */ 
    char buffer[64];
    sprintf(buffer,"aciertos %d\n",h);
    write(1,buffer,strlen(buffer));

}
