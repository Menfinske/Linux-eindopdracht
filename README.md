# Linux-eindopdracht
Eindopdracht voor Netwerk Services Linux

Hallo! 
Ik ben ervan op de hoogte dat er een kleine mate van chaos in deze repository is ontstaan, dus bij deze zal ik jullie even uitleg geven over wat er is en wat het doet. Behalve deze uitleg staat er ook nog een bestand ‘overleg docenten’. Hierin heb ik uitgelegd waarom ik voor de kiesbare services heb gekozen. 

Ten eerste zijn er een aantal documenten die niet gebruikt worden. Ik heb deze vervangen door andere bestanden. Ik had er in de eerste instantie twee verwijderd totdat ik me herinnerde dat ‘vooral de voortgang hierin’ op git belangrijk was, dus heb ik ze nu laten staan en geef ik toelichting: 

Demopw.sls: dit wordt niet meer gebruikt. Ik dacht dat dit een methode was om salt een wachtwoord mee te geven als hash zodat je niet het echte wachtwoord in het script hoefde te hebben, maar dit bleek niet zo te zijn. In plaats daarvan werd het wachtwoord veranderd in de hash. Deze kan dan verder ook genegeerd worden.

Docker.sls: In de commit staat dat dit de testcontainers vervangt, maar dit is uiteindelijk toch niet zo gelopen. Dit installeert Docker maar zet namelijk geen container op, wat in twee andere files wel gedaan word. 

Nagios.sls Vergelijkbaar met Docker. Dit file installeert Nagios, maar er is een vervangende file gekomen die ook configuratie uitvoert. Hierdoor wordt deze niet meer gebruikt. 

Testcontainer: Dit bestand is per ongeluk twee keer onstaan doordat ik het een andere naam had gegeven voor de duidelijkheid. Deze wordt dus wel nog gebruikt, maar niet onder deze naam. 

Wordpress.sls: Dit bestand had in de eerste instantie niet in deze repository moeten staan. Hij is er per ongeluk vanuit mijn aantekeningen ingekomen. Kan dus volledig genegeerd worden. 


Dit waren alle bestanden die genegeerd kunnen worden. Dan hebben we nu nog twee secties, namelijk de bash files en de salt states. Ik heb aanzienlijk meer in salt omdat ik vrijwel alle packages met salt installeer en niet met bash aangezien dit in een keer op alle minions kan. Daarnaast was dit geloof ik ook de bedoeling, aangezien er overal staat dat het met salt gedaan moet worden. 

Wat ik wel met bash doe zijn de volgende dingen: 

Firstbash: Dit script update Ubuntu packages zodat deze up-to-date zijn. 

Githubconnect: Dit script cloned deze repository naar het systeem. Indien nodig installeert hij ook git. 

Salt: Deze had eigenlijk Saltmasterinit moeten heten, maar dan kreeg ik weer een extra file. Maar zoals die naam al zegt, installeert hij salt op het systeem. Belangrijk: Hij accepteert geen sleutels. Dit komt omdat ik een  --accept-al me niet heel veilig leek. 

Saltbase: Dit script roept heel simpel top.sls aan. Want mijn salt states doen dus het grootste deel van de installatie en aangezien de opdracht was om de hoofdserver met een script te installeren doet ie het zo alsnog. 

Saltminioninit: Ten slotte installeert dit script de salt minion. Tevens zorgt hij ervoor dat de minion Ubu-49 als ‘salt’ kent

Wat ik met salt states doe zijn de volgende dingen: 

Demopw2: Dit script zorgt ervoor dat het de user toegestaan is om geen wachtwoord te gebruiken waardoor dit niet in het script zou hoeven. 

Rsyslog.sls: Dit file zorgt ervoor dat rsyslog geïnstalleerd wordt en de bijbehorende configuraties uitgevoerd worden.

Testnagios.sls Dit file zorgt ervoor dat nagios geïnstalleerd word en de bijbehorende configuraties uitgevoerd worden. 

Wordpressdev: Hiermee wordt in principe een nieuwe wordpress instantie aangemaakt. Hij installeert LAMP-stack en creëert wordpress.conf in sites-available. Daarna reload hij apache. Echter, omdat wordpress vreemd genoeg niet te testen is (ik zal dit onderaan even toelichten maar tijdens de demo laat ik het ook zien) is dit file incompleet. 

Tijdelijkecontainer: Hiermee wordt een docker container opgestart. Voor gebruik moet deze echter opnieuw gestart worden want hij exit zodat je verder kunt met eventuele andere state.apply commando’s. 

Permanentecontianer: Hiermee wordt een docker container opgestart die actief blijft. Als je dit commando runt dan zul je ook eerst de containers moeten killen voordat de minion een nieuwe state.apply kan uitvoeren.


Over wordpress: Ik heb op Ubu-50 Wordpress gezet. In principe doet Wordpress het. Apache draait, er is een database in Mysql (meer dan 1 zelfs, om te testen of het hier aan lag) en ik kom op wordpress/wp-admin. Tot daar gaat alles prima. Ik kan ook inloggen om de configuratie van wp_config te krijgen. Hier kan Wordpress niet naar toe schrijven dus heb ik het manueel overgenomen. Echter, zodra ik op ‘run the installation’ kom, kom ik zonder foutmelding terug bij de eerste pagina. 
Dit heb ik echt behoorlijk vaak gedaan, wat vrij vervelend was omdat Bastion de syntax van wp-config heel slecht overneemt en dit handmatig aangepast moest worden. Maar, dat maakt niet uit. 
Ik kom er niet achter wat er mis gaat. Zoals ik al zei, apache en mysql werken. Ik kan in Wordpress goed aanmelden en dan krijg ik dus de configuratie voor wp-config maar ik kan ook verkeerde credentials geven en dan wordt ik geweigerd. Dit verschijnt ook in mysql.log. De connectie naar de database lijkt dus in ieder geval niet te weigeren (mits de goede credentials). Ik heb hiermee nog advies gevraagd aan iemand, maar aangezien het zonder foutmelding is kon diegene mij ook niet helpen. Ik heb werkelijk geen idee wat er mis is met mijn Wordpress. Ik hoop dat het niet volledig word afgekeurd aangezien ik dus alleen de laatste stap mis, maar ik zal niet liegen; Wordpress doet het dus uiteindelijk niet. 

Okay, dat is alles voor de readme. Ik zal straks de demonstratie op video zetten en jullie kant op sturen. Bedankt dat dit een mogelijkheid is! 

