


find /home/jancelin/Bureau/Default_Farm/ -name "Coverage.shp" | cat -n | while read n f; do mv "$f" "/home/jancelin/Bureau/mnt_compterre/$n.shp"; done
find /home/jancelin/Bureau/Default_Farm/ -name "Coverage.shx" | cat -n | while read n f; do mv "$f" "/home/jancelin/Bureau/mnt_compterre/$n.shx"; done
find /home/jancelin/Bureau/Default_Farm/ -name "Coverage.dbf" | cat -n | while read n f; do mv "$f" "/home/jancelin/Bureau/mnt_compterre/$n.dbf"; done
