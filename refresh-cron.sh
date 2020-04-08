#!/bin/bash
cd /var/www/node-server/www.game.tv
#refresh home page
wget -q --convert-links --adjust-extension https://www.game.tv -O index.html

#regresh tournament page
wget -q --convert-links --adjust-extension https://www.game.tv/find-tournaments -O find-tournaments.html

#refresh game pages
wget -q https://www.game.tv/game-sitemap.xml -O - | egrep -o "<loc>[^<>]*</loc>" | sed -e 's:</*loc>::g' | parallel -j 100 wget -q -nH -x --convert-links --adjust-extension {}

#refresh tournaments
cd tournaments
wget -q https://www.game.tv/tournament-sitemap.xml -O - | egrep -o "<loc>[^<>]*</loc>" | sed -e 's:</*loc>::g' | parallel -j 100 wget -q --convert-links {} -O {/}.html

# some tournaments are older and are not included in 10k list. As one time activity we can crawling them too. Jsut uncomment below lines

#wget -q https://www.game.tv/tournament-sitemap1.xml -O - | egrep -o "<loc>[^<>]*</loc>" | sed -e 's:</*loc>::g' | parallel -j 100 wget -q --convert-links {} -O {/}.html
#wget -q https://www.game.tv/tournament-sitemap2.xml -O - | egrep -o "<loc>[^<>]*</loc>" | sed -e 's:</*loc>::g' | parallel -j 100 wget -q --convert-links {} -O {/}.html
#wget -q https://www.game.tv/tournament-sitemap3.xml -O - | egrep -o "<loc>[^<>]*</loc>" | sed -e 's:</*loc>::g' | parallel -j 100 wget -q --convert-links {} -O {/}.html
#wget -q https://www.game.tv/tournament-sitemap4.xml -O - | egrep -o "<loc>[^<>]*</loc>" | sed -e 's:</*loc>::g' | parallel -j 100 wget -q --convert-links {} -O {/}.html
#wget -q https://www.game.tv/tournament-sitemap5.xml -O - | egrep -o "<loc>[^<>]*</loc>" | sed -e 's:</*loc>::g' | parallel -j 100 wget -q --convert-links {} -O {/}.html
#wget -q https://www.game.tv/tournament-sitemap6.xml -O - | egrep -o "<loc>[^<>]*</loc>" | sed -e 's:</*loc>::g' | parallel -j 100 wget -q --convert-links {} -O {/}.html                                                                                                                                                                   
