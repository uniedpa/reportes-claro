#!/bin/bash
#https://unix.stackexchange.com/questions/131766/why-does-my-shell-script-choke-on-whitespace-or-other-special-characters
set -a
. ./credenciales.txt
set +a
if [ -z "$1" ]
    then
	    echo "Falta el nombre del archivo PDF del reporte de facturas"
	    exit 1
fi
monthname=$(LC_ALL="es_PA.utf8" date "+%B")
# monthname=${monthname^} #Bash ver. 4+
# macOS High Sierra bash 3.2
first=`echo $monthname|cut -c1|tr [a-z] [A-Z]`
second=`echo $monthname|cut -c2-`
monthname=$first$second
year=$(LC_ALL="es_PA.utf8"; date "+%Y")
declare -a account_array
NL=$'\n'
report=$1
reportpages=""
subject="$monthname de $year - Factura de servicio de telefonia celular de Claro"
body="Adjunta su factura de servicio de telefonia celular de Claro, correspondiente al mes de $monthname de $year, para cancelar antes del dia 22"
totalnumpages=$(qpdf --show-npages "$report")
#echo "$totalnumpages"
IFS=$'\n' read -d '' -r -a accounts < cuentas.txt
length=${#accounts[@]}
#echo $length
	pagelist=""
IFS=$' '
for (( a=0; a<$length; a++ ))
    do 
       account=${accounts[$a]}
       set $account
       line=$1
       string="Celular "$line
       correo_usuario=$2
       echo $correo_usuario
       individualpages=$(pdfgrep -p "$string" "$report")
       echo $individualpages
       IFS=$'\n'
			 pages=($individualpages)
			 for i in "${pages[@]}"; do
				 #Bash=3.2a
				 page=${i:0:${#i}-2}
				 #Bash 4+
				 #page=${i::-2}
				 pagelist="${pagelist}${pagelist:+,}$page"
			 done
			 IFS=$' '
			 echo $pagelist 
			 echo $line
       qpdf --empty --pages "$report" "$pagelist" -- $line".pdf"
sendemail -f "$correo"  -l sendemail.log -s smtp.gmail.com:587 -o tls=yes username="$correo" password="$clave" -t "$correo_usuario" -u "$subject" -m "$body" -a $1.pdf
    pagelist=""		
		done
unset IFS
