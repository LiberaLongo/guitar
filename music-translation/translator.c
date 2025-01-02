#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>

#define DIM 5
//#define DEBUG

char  do_C [] = {'1', '8', 't', 's', 'l', 'm'};
char  re_D [] = {'2', '9', 'y', 'd', 'z'};
char  mi_E [] = {'3', '0', 'u', 'f', 'x'};
char  fa_F [] = {'4', 'q', 'i', 'g', 'c'};
char sol_G [] = {'5', 'w', 'o', 'h', 'v'};
char  la_A [] = {'6', 'e', 'p', 'j', 'b'};
char  si_B [] = {'7', 'r', 'a', 'k', 'n'};

char* addCharacterToString(char* str, char c) {
    int length = 0;

    if (str != NULL)
	    length = strlen(str);

    str = realloc(str, length + 2); // Allocate memory for modified string
    str[length] = c; // Add character to the end
    str[length + 1] = '\0'; // Add null terminator
    return str;
}

void lilypondtovirtualpiano(char c, int output) {
	//translate to virtualpiano
	//write the translation
}

void virtualpianotolilypond(char c, int output) {
	//translate to lilypond
        char note;
	char *translation = NULL;
        int i, j, found = 0; //boolean
        switch (c) {
                case ' ':
			note = c;
                        break;
                case '[':       //accord of notes or duration?
                        note = '<';
                        break;
                case ']':       //accord of notes or duration?
                        note = '>';
                        break;
                case '|':       //duration of the note... u have to check it in the translation because virtualpiano and lilypond write it really differently!
                        note = '4';
                        break;
                default:
			//really a note
                        for(i=0; i < DIM; i++) {
                                if(c == do_C[i])       { note = 'c'; found = 1; }
                                else if(c ==  re_D[i]) { note = 'd'; found = 1; }
                                else if(c ==  mi_E[i]) { note = 'e'; found = 1; }
                                else if(c ==  fa_F[i]) { note = 'f'; found = 1; }
                                else if(c == sol_G[i]) { note = 'g'; found = 1; }
                                else if(c ==  la_A[i]) { note = 'a'; found = 1; }
                                else if(c ==  si_B[i]) { note = 'b'; found = 1; }
                                if(found) break;
                        }
                        //the only exception (last key of the piano)
                        if( c == do_C[DIM]) { note = 'c'; i = DIM; found = 1; }
                        break;
        }
        //write the translation
#ifdef DEBUG
        printf(" -> %c", note);
#endif
	translation = addCharacterToString(translation, note);
	//add , or ' to the translation depending on the octave
	if(found) {
		j = i - 2;
#ifdef DEBUG
		printf(" ( i = %d, j = %d ) ", i, j);
#endif
		if (j < 0) for (; j < 0; j++) {
			translation = addCharacterToString(translation, ',');
		}
		else if (j > 0) for (; j > 0; j--) {
			translation = addCharacterToString(translation, '\'');
		}
	}
#ifdef DEBUG
	printf(" -> %s\n", translation);
#endif
	if (translation != NULL) {
		printf("%s", translation);
		write (output, translation, strlen(translation)) ;
	}

	free(translation);
}

int my_read(void (*fun)(char, int), FILE *input, int output) {
	//read virtualpiano music
	//read lilypond music
	size_t linelen = 0;
	char *line = NULL;
	while(1) {
		//read a line
		int l = getline(&line, &linelen, input);
		if ( l<= 0 ) {
			free(line);
			line = NULL;
			linelen = 0;
			printf("\ngetline <= 0\n");
			break;
		}
		printf("\n >>> HO LETTO:\n\"%s\" <<< CHE TRADUCO IN:\n", line);
		//read each character in line
		char *scan;
		for ( scan = line; *scan != '\n'; scan++ ) {
#ifdef DEBUG
			printf("%c\t", *scan);
#endif
			//call the FUNCTION with his parameters
			(*fun)(*scan, output);
		} write(output, "\n", 1);

		free(line);
		line = NULL;
		linelen = 0;
	}
	return 0;
}

int main(int argc, char *argv[]) {
	//printf("argv[0] = %s\n", argv[0]);

	if (argc != 3) {
		char *s = "need help? write\n"
			"./virtualpiano <input> <output>\n"
			"to translate from virtualpiano.net\n"
			"./lilypond <input> <output>\n"
			"to translate from lilypond\n";
		printf("%s\n of len %d\n", s, strlen(s));
		return -1;
	}

	FILE *fdin = fopen(argv[1], "r");
	int fdout = open(argv[2], O_WRONLY | O_CREAT | O_TRUNC, 0644);

	if (strcmp(argv[0], "./virtualpiano")) {
		printf("from lilypond to virtualpiano ./lilypond\n");
		my_read(&lilypondtovirtualpiano, fdin, fdout);
	} else if (strcmp(argv[0], "./lilypond")) {
		printf("from virtualpiano to lilypond ./virtualpiano\n");
		my_read(&virtualpianotolilypond, fdin, fdout);
	}
	else
		printf("ERROR!\n");
	
	fclose(fdin);
	close(fdout);
	return 0;
}
