#include "CacheSim.h"
#include <string.h>
#include <stdio.h>

/* Posa aqui les teves estructures de dades globals
 * per mantenir la informacio necesaria de la cache
 * */
int h;

struct contenidoD {
	unsigned int bitv2;
	unsigned int tagD2;
    unsigned int bitv1;
	unsigned int tagD1;
    unsigned int lru;
};

struct contenidoD cacheD[64];


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
        cacheD[i].bitv1 = 0;
        cacheD[i].bitv2 = 0;
        cacheD[i].lru = 1;
    }
    h = 0;

}

/* La rutina reference es cridada per cada referencia a simular */ 
void reference (unsigned int address)
{
	unsigned int byte;
	unsigned int bloque_m; 
	unsigned int conj_mc;
	unsigned int via_mc;
	unsigned int tag;
	unsigned int miss;	   // boolea que ens indica si es miss
	unsigned int replacement;  // boolea que indica si es reemplaça una linia valida
	unsigned int tag_out;	   // TAG de la linia reemplaçada
	float t1,t2;		// Variables per mesurar el temps (NO modificar)
	
	t1=GetTime();
	/* Escriu aqui el teu codi */

	byte = address&31;
	bloque_m = address>>5;
	conj_mc = (address>>5)&63;
	tag = address>>11;
    
    if(tag == cacheD[conj_mc].tagD1 && cacheD[conj_mc].bitv1) {
		miss = 0;
		replacement = 0;
        via_mc = 0;
        cacheD[conj_mc].lru = 2;
        h++;
	}
	else if(tag == cacheD[conj_mc].tagD2 && cacheD[conj_mc].bitv2) {
		miss = 0;
		replacement = 0;
        via_mc = 1;
        cacheD[conj_mc].lru = 1;
        h++;
	}
	else {
		miss = 1;
		if (cacheD[conj_mc].bitv1 && cacheD[conj_mc].bitv2) {
			replacement = 1;
            if (cacheD[conj_mc].lru == 1)  {
                tag_out = cacheD[conj_mc].tagD1;
                cacheD[conj_mc].tagD1 = tag;
                cacheD[conj_mc].lru = 2;
                via_mc = 0;
            }
            else {
                tag_out = cacheD[conj_mc].tagD2;
                cacheD[conj_mc].tagD2 = tag;
                cacheD[conj_mc].lru = 1;
                via_mc = 1;
            }
		}
		else if (!cacheD[conj_mc].bitv1 || !cacheD[conj_mc].bitv2){
            replacement = 0;
            if (cacheD[conj_mc].lru == 1)  {
                cacheD[conj_mc].tagD1 = tag;
                cacheD[conj_mc].bitv1 = 1;
                via_mc = 0;
                cacheD[conj_mc].lru = 2;
            }
            else  {
                cacheD[conj_mc].tagD2 = tag;
                cacheD[conj_mc].bitv2 = 1;
                via_mc = 1;
                cacheD[conj_mc].lru = 1;
            }
        }
	}



	/* La funcio test_and_print escriu el resultat de la teva simulacio
	 * per pantalla (si s'escau) i comproba si hi ha algun error
	 * per la referencia actual. També mesurem el temps d'execució
	 * */
	t2=GetTime();
	totaltime+=t2-t1;
	test_and_print2 (address, byte, bloque_m, conj_mc, via_mc, tag,
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
