convertDateblockToString() {

	#datumconversie schijnt per OS te verschillen

	datum=$1 # moet formaat 20181231 hebben (ymd)

	case "$OSTYPE" in
			solaris*) echo "SOLARIS" ;;
			darwin*)  
			daglangstring=$(date -j -f "%Y%m%d" "$datum" +"%A") 
			dagstring=$(date -j -f "%Y%m%d" "$datum" +"%d") 
			maandstring=$(date -j -f "%Y%m%d" "$datum" +"%B") 
			jaarstring=$(date -j -f "%Y%m%d" "$datum" +"%Y");; 
		linux*)   
			daglangstring=$(date -d "$datum" +"%A")
			dagstring=$(date -d "$datum" +"%d")
			maandstring=$(date -d "$datum" +"%B")
			jaarstring=$(date -d "$datum" +"%Y");;
			bsd*)     echo "BSD" ;;
			msys*)    echo "WINDOWS" ;;
			*)        echo "unknown: $OSTYPE" ;;
	esac

	case "$daglangstring" in
			Monday) daglangstring="maandag";;
			Tuesday) daglangstring="dinsdag";;
			Wednesday) daglangstring="woensdag";;
			Thursday) daglangstring="donderdag";;
			Friday) daglangstring="vrijdag";;
			Saturday) daglangstring="zaterdag";;
			Sunday) daglangstring="zondag";;
	esac

	case "$maandstring" in
			Januari) maandstring="januari";;
			Februari) maandstring="februari";;
			March) maandstring="maart";;
			April) maandstring="april";;
			May) maandstring="mei";;
			June) maandstring="juni";;
			July) maandstring="juli";;
			August) maandstring="augustus";;
			September) maandstring="september";;
			October) maandstring="oktober";;
			November) maandstring="november";;
			December) maandstring="december";;
	esac

	echo "$daglangstring $dagstring $maandstring $jaarstring"
			
}


echoOS() {
	case "$OSTYPE" in
	solaris*) echo "SOLARIS detected" ;;
	darwin*)  echo "OSX detected" ;; 
	linux*)   echo "LINUX detected" ;;
	bsd*)     echo "BSD detected" ;;
	msys*)    echo "WINDOWS detected" ;;
	*)        echo "unknown: $OSTYPE" ;;
	esac
}
