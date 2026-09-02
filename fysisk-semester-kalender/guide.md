# Udfyld info

orgs.csv udfyldes med info: name,description,logo,contact \
De er indekseret så #0 er F-klubben, #1-6 er fklub udvalg, og #7.. er andre. hvis der ksal tilføjes flere udvalg, skal indekseringen inde i templaten ændres. \
"logo" er navnet på den asset der befinder sig under assets.

events.csv udfyldes med info: date,name,logo \
"date" SKAL VÆRE PÅ FORMATTET 2026-01-02. Hvis du glemmer et "0" i f.eks. "01" virker det ikke. \
"name" Event navn. Helt isse for lang, mutiline er lidt fucked i denne template. \
"logo" -||- \
filekan kan sagtens indeholde events i fortiden, de kommer ikke op på kalenderen.

config.toml udtylde med hvilke år or måned du ville have med i kalenderen, papir størrelse, og Hvilke filer der bruges til org og events, bla bla bla.

# Printe på stor printer

1. Compile guide.md, og eksporter det til .png filtype ved 300 dpi (eller 144, who knows).
2. Konverter til .jpg filtype.
3. Overfør til en USB-pind.
4. Tænd og formå at sætte A0 print papir (nok: "hp coated paper") i den store papi-printer i 3D printrummet.
5. Vælg billede for print. 
6. Sæt indstillinger: Vælg default preset 2. modificer den så scaling er baseret på rullen, og rotationen er 90 grader (auto virker ikke).
7. Tryk at den skal printe.
8. Lad være på mitterste hylde i en varmluftsovn ved 200 grade i 30 sekunder.
9. Et voilà!
