#!/bin/bash
export LANG=ko_KR.UTF-8
clear
wget -q -O - "http://small.dic.daum.net/search.do?q=$1 $2 $3" |\
	     sed -n -e "/eng_sch/,/<\/section>/p" |\
	     grep "link_txt\|txt_means_KUEK\|trans" | sed -e 's/\t//g' |\
	     # Wrap [] to target word from string like
	     # "???&q=love" class="link_txt" >love</a>"
	     sed -e 's/"link_txt"[^>]*>/"link_txt">[ /g' |\
	     sed -e 's/<\/a>/ ]<\/a>/g' |\
	     sed -e 's/<[^>]*>//g'
