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
	/* Escriu aqui el teu codi */
	
    int i;
	for (i = 0; i < 128; i++) {
        cacheD[i].bitv = 0;
    }
    h = 0;


}

/* La rutina reference es cridada per cada referencia a simular */ 
void reference (unsigned int address, unsigned int LE)
{
	unsigned int byte;
	unsigned int bloque_m; 
	unsigned int linea_mc;
	unsigned int tag;
	unsigned int miss;
	unsigned int lec_mp;
	unsigned int mida_lec_mp;
	unsigned int esc_mp;
	unsigned int mida_esc_mp;
	unsigned int replacement;
	unsigned int tag_out;

	/* Escriu aqui el teu codi */

	byte = address&31;
	bloque_m = address>>5;
	linea_mc = (address>>5)&127;
	tag = address>>12;
	
	if (LE == 1) {
		esc_mp = 1;
		mida_esc_mp = 1;
		lec_mp = 0;
		mida_lec_mp = 0;
	}
	
	else {
		esc_mp = 0;
		mida_esc_mp = 0;
	}
	
	if(tag == cacheD[linea_mc].tagD && cacheD[linea_mc].bitv) {
		miss = 0;
		replacement = 0;
        h++;
		if (LE == 0) {	
			lec_mp = 0;
			mida_lec_mp = 0;
		}
	}
	else if (LE == 0){
		miss = 1;
		lec_mp = 1;
		mida_lec_mp = 32;
		if (cacheD[linea_mc].bitv) {
			replacement = 1;
			tag_out = cacheD[linea_mc].tagD;
		}
		else replacement = 0;
		cacheD[linea_mc].tagD = tag;
        cacheD[linea_mc].bitv = 1;
	}
	
	else {
		miss = 1;
		replacement = 0;
	}



	/* La funcio test_and_print escriu el resultat de la teva simulacio
	 * per pantalla (si s'escau) i comproba si hi ha algun error
	 * per la referencia actual
	 * */
	test_and_print (address, LE, byte, bloque_m, linea_mc, tag,
			miss, lec_mp, mida_lec_mp, esc_mp, mida_esc_mp,
			replacement, tag_out);
}


/* La rutina final es cridada al final de la simulacio */ 
void final ()
{
 	/* Escriu aqui el teu codi */ 
    char buffer[64];
    sprintf(buffer,"aciertos %d\n",h);
    write(1,buffer,strlen(buffer));

}

