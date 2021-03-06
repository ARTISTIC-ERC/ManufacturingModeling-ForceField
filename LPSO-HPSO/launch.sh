#!/bin/sh


NUMPARTICLE=${1}
INPUTSLURRYFILENAME=${2}
INPUTCOORD=${3}

XPLAMMPSDIR=${4}

MYSCRIPTTEMPLATE=${5}
MYSCRIPT=${6}


XPDIR=${XPLAMMPSDIR}${NUMPARTICLE}


#echo "basename ${INPUTSLURRYFILENAME} '.${NUMPARTICLE}'"
#basename ${INPUTSLURRYFILENAME} '.${NUMPARTICLE}'
#SHORTINPUTSLURRYFILENAME=`basename ${INPUTSLURRYFILENAME} '.${NUMPARTICLE}'`


# ATTENTION MODIFIER '_' AUSSI DANS FICHIER C++
LONGINPUTSLURRYFILENAME=${INPUTSLURRYFILENAME}'_'${NUMPARTICLE}

mkdir ${XPDIR}
cp ${MYSCRIPTTEMPLATE} ${XPDIR}/${MYSCRIPT}

if [ ! -f ${XPDIR}/${INPUTCOORD} ];then
    cp ${INPUTCOORD} ${XPDIR}/
fi


echo "numero particule : "${NUMPARTICLE}
echo "input slurry filename : "${INPUTSLURRYFILENAME}
echo "input coord : "${INPUTCOORD}
#echo "short input slurry filename : "${SHORTINPUTSLURRYFILENAME}
echo "long input slurry filename : "${LONGINPUTSLURRYFILENAME}


rm -f ${XPDIR}/${INPUTSLURRYFILENAME}
#sleep 1
#cat ${LONGINPUTSLURRYFILE}

#echo "${LONGINPUTSLURRYFILENAME} ${XPDIR}/${INPUTSLURRYFILENAME}"
cp  ${LONGINPUTSLURRYFILENAME} ${XPDIR}/${INPUTSLURRYFILENAME}



cd ${XPDIR}
#ls
#cat script.sh
#cat ${INPUTSLURRYFILENAME}
sbatch --reservation=midmem ${MYSCRIPT}
cd ..



