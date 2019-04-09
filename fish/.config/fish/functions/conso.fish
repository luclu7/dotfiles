function conso
	curl -s "http://mobile.free.fr/index.php?page=suiviconso&l=99754747" -b ~/Téléchargements/fm.txt|grep "Gio"|tail -n +2|cut -c 48-|cut -c -9|sed -e 's/^[ \t]*//'
end
