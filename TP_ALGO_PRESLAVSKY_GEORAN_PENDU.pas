program Pendu;

uses crt;
//ALGO
//BUT
//ENTREE
//SORTIE
{
// Fonction lettre inclus qui pemet de voir si la lettre est dans un mot choisi.
	Fonction lettre_inclus(c:CAR;ch:CHAINE): booleen 
	VAR
		res:Booleen
		i:ENTIER
	DEBUT
		res<- faux
		i <- 1
			TANTQUE (res=faux) ET (i<=longueur(ch)) FAIRE
				SI ch[i]= c ALORS
					res <- vrai
				FINSI
				i <- i +1
			FINTANTQUE
			lettre_inclus
	FIN
// Fonction changement qui permet de chaner les lettres par d'autres
	Fonction changement(c:CAR;ch1,ch2:CHAINE):CHAINE
	VAR
		chres:CHAINE
		i:ENTIER
	DEBUT
		chres <- ch2
			POUR i DE 1 A longueur(ch1) FAIRE
				SI ch1[i] = c ALORS
					chres[i]=c
				FINSI
			FINPOUR
		changement <- chres
	FIN
// programme principal
VAR
	mtaff,mtch,indice:CHAINE
	i,vie,rep:ENTIER
	lettre:CAR
DEBUT
	REPETER // sert a rejouer
	vie <- 6
	ECRIRE "Jeu du Pendu"
	ECRIRE "Joueur 1."
	ECRIRE "Veuillez entrer un mot a deviner pour le Joueur 2."
	LIRE mtch
	ECRIRE "Donnez un indice pour le Joueur 2 ."
	LIRE indice
	mtaff <- mtch
		POUR i DE 1 A longueur(mtch) FAIRE
			mtaff[i] <- "_"
		FINPOUR

		REPETER
			ECRIRE mtaff
			ECRIRE "Joueur 2."
			ECRIRE "Entrez une lettre."
			LIRE lettre
				SI lettre_inclus(lettre,mtch) ALORS
					mtaff <- changement(lettre,mtch,mtaff)
				SINON
					vie <- vie - 1
				FINSI
				ECRIRE (mtaff)
				ECRIRE "Il vous reste "&vie&" essai(s).Appuyez sur ENTREE pour continuer."
			SI vie = 5 ALORS
				ECRIRE"|______"
			FINSI
			SI vie = 4 ALORS
				ECRIRE"|      "  
				ECRIRE"|      "
				ECRIRE"|      "
				ECRIRE"|      "
				ECRIRE"|______"
			SI vie = 3 ALORS
				ECRIRE "Voici un indice : "&indice
				ECRIRE"_____  "
				ECRIRE"|   |  "  
				ECRIRE"|      "
				ECRIRE"|      "
				ECRIRE"|      "
				ECRIRE"|______"
			FINSI
			SI vie = 2 ALORS
				ECRIRE"_____  "
				ECRIRE"|   |  "  
				ECRIRE"|  _o_ "
				ECRIRE"|      "
				ECRIRE"|      "
				ECRIRE"|______"
			FINSI
			SI vie = 1 ALORS
				ECRIRE"_____  "
				ECRIRE"|   |  "  
				ECRIRE"|  _o_ "
				ECRIRE"|   |  "
				ECRIRE"|      "
				ECRIRE"|______"
			FINSI
		JUSQUA (vie = 0 ) OU (mtaff = mtch)
			SI vie = 0 ALORS
				ECRIRE "Game Over. Le mot était : "&mtch
				ECRIRE"_____  "
				ECRIRE"|   |  "  
				ECRIRE"|  _o_ "
				ECRIRE"|   |  "
				ECRIRE"|  / \ "
				ECRIRE"|______"
			SINON
				ECRIRE "Victoire ! Vous avez trouver le mot !"
			FINSI
		ECRIRE "Voulez vous recommencer ? taper 1 pour oui et 0 pour non."
		LIRE rep
	JUSQUA rep = 0
FIN
	
}
// Fonction lettre inclus qui pemet de voir si la lettre est dans un mot choisi.
function lettre_inclus(c:CHAR;ch:STRING):BOOLEAN;

VAR
	res:BOOLEAN;
	i:INTEGER;
BEGIN
	res:=FALSE;
	i:=1;
		WHILE (res=FALSE) AND (i<=length(ch)) DO
			begin
				IF ch[i]= c THEN
					begin
						res:=TRUE;
					end;
				i:=i+1;
			end;
		lettre_inclus:=res;
END;
// Fonction changement qui permet de chaner les lettres par d'autres
function changement(c:CHAR;ch1,ch2:STRING):STRING;

VAR
	chres:STRING;
	i:INTEGER;
BEGIN
	chres:=ch2;
		FOR i:=1 TO length(ch1) DO
			begin
				IF ch1[i] = c THEN
					begin
						chres[i]:=c;
					end;
			end;
		changement:=chres;
END;
// programme principal
VAR
	mtaff,mtch,indice:STRING;
	i,vie,rep:INTEGER;
	lettre:CHAR;
BEGIN
	REPEAT // sert a rejouer
		clrscr;
		vie:=6;
		writeln('Jeu du Pendu');
		writeln('Joueur 1.');
		writeln('Veuillez entrer un mot a deviner pour le Joueur 2.');
		readln(mtch);
		writeln('Donnez un indice pour le Joueur 2 .');
		readln(indice);
		mtaff:=mtch;
			FOR i:=1 TO length(mtch) DO
				begin
					mtaff[i]:='_'
				end;
		clrscr;
			REPEAT
				begin
					clrscr;
					writeln( mtaff);
					writeln('Joueur 2.');
					writeln('Entrez une lettre.');
					readln(lettre);
						IF lettre_inclus(lettre,mtch) THEN
							begin
								mtaff:= changement(lettre,mtch,mtaff);
							end
						ELSE
							begin
								vie:=vie -1;
							end;
						writeln(mtaff);
						writeln('Il vous reste ',vie,' essai(s).Appuyez sur ENTREE pour continuer.');
					IF vie = 5 THEN
						begin
							writeln('|______');
							readln;
						end;
					IF vie = 4 THEN
						begin
							writeln('|');
							writeln('|');
							writeln('|');
							writeln('|');
							writeln('|');
							writeln('|______');
							readln;
						end;
					IF vie = 3 THEN
						begin
							writeln('Voici un indice : ',indice);
							writeln('_____  ');
							writeln('|   |  ');
							writeln('|      ');
							writeln('|      ');
							writeln('|      ');
							writeln('|______');
							readln;
						end;
					IF vie = 2 THEN
						begin
							writeln('_____');
							writeln('|   |  ');
							writeln('|  _o_ ');
							writeln('|      ');
							writeln('|      ');
							writeln('|______');
							readln;
						end;
					IF vie = 1 THEN
						begin
							writeln('_____');
							writeln('|   |  ');
							writeln('|  _o_ ');
							writeln('|   |  ');
							writeln('|      ');
							writeln('|______');
							readln;
						end;
					readln;
				end;
			UNTIL (vie=0) OR (mtaff = mtch);
				IF vie=0 THEN
					begin
						writeln('Game Over. Le mot était :',mtch);
						writeln('_____');
						writeln('|   |  ');
						writeln('|  _o_ ');
						writeln('|   |  ');
						writeln('|  / \ ');
						writeln('|______');
					end
				ELSE
					begin
						writeln('Victoire ! Vous avez trouver le mot !');
					end;
		readln;
		writeln('Voulez vous recommencer ? taper 1 pour "oui" et 0 pour "non".');
		readln(rep);
	UNTIL rep=0
END.