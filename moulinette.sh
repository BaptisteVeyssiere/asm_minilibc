#!/bin/sh

file="libasm.so"
directory="mouli_srcs"

if [ ! -f $file ]
then
    echo "libasm.so not found"
    exit 0

elif [ ! -d $directory ]
then
    echo "srcs not found"
    exit 0

fi

rm -f mouli_srcs/*.output
gcc mouli_srcs/srcsf.c -o source
gcc -L./ -Wl,-rpath=./ mouli_srcs/srcsmf.c -o student -lasm -fno-builtin

# MEMCPY #
./source memcpy "     " "hello" 5 > mouli_srcs/memcpy1 2> /dev/null
./source memcpy "  /" "hello" 2 >> mouli_srcs/memcpy1 2> /dev/null
./student memcpy "     " "hello" 5 > mouli_srcs/memcpy2 2> /dev/null
./student memcpy "  /" "hello" 2 >> mouli_srcs/memcpy2 2> /dev/null
diff=`diff $directory/memcpy1 $directory/memcpy2`
if [ -n "$diff" ]
then
    echo "memcpy: KO"
    echo "$diff" > mouli_srcs/memcpy.output
else
    echo "memcpy: OK"
fi
rm -f mouli_srcs/memcpy1
rm -f mouli_srcs/memcpy2

# MEMMOVE #
./source memmove "     " "hello" 5 > mouli_srcs/memmove1 2> /dev/null
./source memmove "  /" "hello" 2 >> mouli_srcs/memmove1 2> /dev/null
./student memmove "     " "hello" 5 > mouli_srcs/memmove2 2> /dev/null
./student memmove "  /" "hello" 2 >> mouli_srcs/memmove2 2> /dev/null
diff=`diff $directory/memmove1 $directory/memmove2`
if [ -n "$diff" ]
then
    echo "memmove: KO"
    echo "$diff" > mouli_srcs/memmove.output
else
    echo "memmove: OK"
fi
rm -f mouli_srcs/memmove1
rm -f mouli_srcs/memmove2

# MEMSET #
./source memset "    " "a" 3 > mouli_srcs/memset1 2> /dev/null
./source memset "    " "a" 6 >> mouli_srcs/memset1 2> /dev/null
./student memset "    " "a" 3 > mouli_srcs/memset2 2> /dev/null
./student memset "    " "a" 6 >> mouli_srcs/memset2 2> /dev/null
diff=`diff $directory/memset1 $directory/memset2`
if [ -n "$diff" ]
then
    echo "memset: KO"
    echo "$diff" > mouli_srcs/memset.output
else
    echo "memset: OK"
fi
rm -f mouli_srcs/memset1
rm -f mouli_srcs/memset2

# RINDEX #
./source rindex "hello" "l" > mouli_srcs/rindex1 2> /dev/null
./source rindex "hello" "f" >> mouli_srcs/rindex1 2> /dev/null
./student rindex "hello" "l" > mouli_srcs/rindex2 2> /dev/null
./student rindex "hello" "f" >> mouli_srcs/rindex2 2> /dev/null
diff=`diff $directory/rindex1 $directory/rindex2`
if [ -n "$diff" ]
then
    echo "rindex: KO"
    echo "$diff" > mouli_srcs/rindex.output
else
    echo "rindex: OK"
fi
rm -f mouli_srcs/rindex1
rm -f mouli_srcs/rindex2

# STRCASECMP #
./source strcasecmp "je fais un test" "je fais un test" > mouli_srcs/strcasecmp1 2> /dev/null
./source strcasecmp "Upper Case Test" "upper case test" >> mouli_srcs/strcasecmp1 2> /dev/null
./source strcasecmp "tu lis vraiment ce test ?" "lapin lapin" >> mouli_srcs/strcasecmp1 2> /dev/null
./student strcasecmp "je fais un test" "je fais un test" > mouli_srcs/strcasecmp2 2> /dev/null
./student strcasecmp "Upper Case Test" "upper case test" >> mouli_srcs/strcasecmp2 2> /dev/null
./student strcasecmp "tu lis vraiment ce test ?" "lapin lapin" >> mouli_srcs/strcasecmp2 2> /dev/null
diff=`diff $directory/strcasecmp1 $directory/strcasecmp2`
if [ -n "$diff" ]
then
    echo "strcasecmp: KO"
    echo "$diff" > mouli_srcs/strcasecmp.output
else
    echo "strcasecmp: OK"
fi
rm -f mouli_srcs/strcasecmp1
rm -f mouli_srcs/strcasecmp2

# STRCHR #
./source strchr "je suis gentil" "g" > mouli_srcs/strchr1 2> /dev/null
./source strchr "je suis gentil" "w" >> mouli_srcs/strchr1 2> /dev/null
./student strchr "je suis gentil" "g" > mouli_srcs/strchr2 2> /dev/null
./student strchr "je suis gentil" "w" >> mouli_srcs/strchr2 2> /dev/null
diff=`diff $directory/strchr1 $directory/strchr2`
if [ -n "$diff" ]
then
    echo "strchr: KO"
    echo "$diff" > mouli_srcs/strchr.output
else
    echo "strchr: OK"
fi
rm -f mouli_srcs/strchr1
rm -f mouli_srcs/strchr2

# STRCSPN #
./source strcspn "teemo is the real champ" "jklzf" > mouli_srcs/strcspn1 2> /dev/null
./source strcspn "teemo is the real champ" " " >> mouli_srcs/strcspn1 2> /dev/null
./source strcspn "teemo is the real champ" "tre" >> mouli_srcs/strcspn1 2> /dev/null
./student strcspn "teemo is the real champ" "jklzf" > mouli_srcs/strcspn2 2> /dev/null
./student strcspn "teemo is the real champ" " " >> mouli_srcs/strcspn2 2> /dev/null
./student strcspn "teemo is the real champ" "tre" >> mouli_srcs/strcspn2 2> /dev/null
diff=`diff $directory/strcspn1 $directory/strcspn2`
if [ -n "$diff" ]
then
    echo "strcspn: KO"
    echo "$diff" > mouli_srcs/strcspn.output
else
    echo "strcspn: OK"
fi
rm -f mouli_srcs/strcspn1
rm -f mouli_srcs/strcspn2

# STRLEN #
./source strlen "compte compte compte" > mouli_srcs/strlen1 2> /dev/null
./student strlen "compte compte compte" > mouli_srcs/strlen2 2> /dev/null
diff=`diff $directory/strlen1 $directory/strlen2`
if [ -n "$diff" ]
then
    echo "strlen: KO"
    echo "$diff" > mouli_srcs/strlen.output
else
    echo "strlen: OK"
fi
rm -f mouli_srcs/strlen1
rm -f mouli_srcs/strlen2

# STRCMP #
./source strcmp "je suis moi" "je suis moi" > mouli_srcs/strcmp1 2> /dev/null
./source strcmp "je suis moi" "tu es toi" >> mouli_srcs/strcmp1 2> /dev/null
./source strcmp "je suis moi" "ah bon ?" >> mouli_srcs/strcmp1 2> /dev/null
./student strcmp "je suis moi" "je suis moi" > mouli_srcs/strcmp2 2> /dev/null
./student strcmp "je suis moi" "tu es toi" >> mouli_srcs/strcmp2 2> /dev/null
./student strcmp "je suis moi" "ah bon ?" >> mouli_srcs/strcmp2 2> /dev/null
diff=`diff $directory/strcmp1 $directory/strcmp2`
if [ -n "$diff" ]
then
    echo "strcmp: KO"
    echo "$diff" > mouli_srcs/strcmp.output
else
    echo "strcmp: OK"
fi
rm -f mouli_srcs/strcmp1
rm -f mouli_srcs/strcmp2

# STRNCMP #
./source strcmp "je suis moi" "je suis" 8 > mouli_srcs/strncmp1 2> /dev/null
./source strcmp "je suis moi" "je hello" 3 >> mouli_srcs/strncmp1 2> /dev/null
./student strcmp "je suis moi" "je suis" 8 > mouli_srcs/strncmp2 2> /dev/null
./student strcmp "je suis moi" "je hello" 3 >> mouli_srcs/strncmp2 2> /dev/null
diff=`diff $directory/strncmp1 $directory/strncmp2`
if [ -n "$diff" ]
then
    echo "strncmp: KO"
    echo "$diff" > mouli_srcs/strncmp.output
else
    echo "strncmp: OK"
fi
rm -f mouli_srcs/strncmp1
rm -f mouli_srcs/strncmp2

# STRPBRK #
./source strpbrk "c'est long de faire des tests" "lavd" > mouli_srcs/strpbrk1 2> /dev/null
./source strpbrk "c'est long de faire des tests" "wzx" >> mouli_srcs/strpbrk1 2> /dev/null
./student strpbrk "c'est long de faire des tests" "lavd" > mouli_srcs/strpbrk2 2> /dev/null
./student strpbrk "c'est long de faire des tests" "wzx" >> mouli_srcs/strpbrk2 2> /dev/null
diff=`diff $directory/strpbrk1 $directory/strpbrk2`
if [ -n "$diff" ]
then
    echo "strpbrk: KO"
    echo "$diff" > mouli_srcs/strpbrk.output
else
    echo "strpbrk: OK"
fi
rm -f mouli_srcs/strpbrk1
rm -f mouli_srcs/strpbrk2

# STRSTR #
./source strstr "trouveras-tu le teemo ?" "teemo" > mouli_srcs/strstr1 2> /dev/null
./source strstr "es-tu là ?" "teemo" >> mouli_srcs/strstr1 2> /dev/null
./student strstr "trouveras-tu le teemo ?" "teemo" > mouli_srcs/strstr2 2> /dev/null
./student strstr "es-tu là ?" "teemo" >> mouli_srcs/strstr2 2> /dev/null
diff=`diff $directory/strstr1 $directory/strstr2`
if [ -n "$diff" ]
then
    echo "strstr: KO"
    echo "$diff" > mouli_srcs/strstr.output
else
    echo "strstr: OK"
fi
rm -f mouli_srcs/strstr1
rm -f mouli_srcs/strstr2

rm -f source
rm -f student
