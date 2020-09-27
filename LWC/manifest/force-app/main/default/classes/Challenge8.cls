public class Challenge8 {
    public static void start() {
        //truncate all tables
        List<SObject> recordsToDelete = new List<SObject>();
        recordsToDelete.addAll([Select Id From OpportunityContactRole]);
        recordsToDelete.addAll([Select Id From OpportunityLineItem]);
        recordsToDelete.addAll([Select Id From Opportunity]);
        recordsToDelete.addAll([Select Id From PriceBookEntry]);
        recordsToDelete.addAll([Select Id From Product2]);
        recordsToDelete.addAll([Select Id From Case]);
        recordsToDelete.addAll([Select Id From Contact]);
        delete recordsToDelete;
        
        List<Contact> contacts = new List<Contact> {
            new Contact(FirstName='Duncan',LastName='Macintosh',MailingCity='San Francisco',MailingState='CA',MailingPostalCode='94123',MailingCountry='United States',Phone='(415) 555-4919',Email='dmacintosh@example.com'),
            new Contact(FirstName='Daryl',LastName='Distributor',MailingCity='Riverside',MailingState='CA',MailingPostalCode='92501',MailingCountry='United States',Phone='(951) 555-3295',Email='ddistributor@example.com'),
            new Contact(FirstName='David',LastName='Adelson',MailingCity='San Francisco',MailingState='CA',MailingPostalCode='94102',MailingCountry='United States',Phone='(650) 555-4645',Email='dadelson@example.com'),
            new Contact(FirstName='Mark',LastName='Smith',MailingCity='Mountain View',MailingState='CA',MailingPostalCode='94041',MailingCountry='United States',Phone='(650) 555-5758',Email='msmith@example.com'),
            new Contact(FirstName='Mike',LastName='Garcia',MailingCity='San Francisco',MailingState='CA',MailingPostalCode='94105',MailingCountry='United States',Phone='(415) 555-6767',Email='mgarcia@example.com'),
            new Contact(FirstName='Deanna',LastName='Collins',MailingCity='San Francisco',MailingState='CA',MailingPostalCode='94110',MailingCountry='United States',Phone='(415) 555-8883',Email='dcollins@example.com'),
            new Contact(FirstName='Andy',LastName='Peterson',MailingCity='San Francisco',MailingState='CA',MailingPostalCode='94102',MailingCountry='United States',Phone='(415) 555-3854',Email='apeterson@example.com'),
            new Contact(FirstName='Anne',LastName='Frost',MailingCity='San Francisco',MailingState='CA',MailingPostalCode='94105',MailingCountry='United States',Phone='(415) 555-2622',Email='afrost@example.com'),
            new Contact(FirstName='Stacy',LastName='McNeil',MailingCity='Davis',MailingState='CA',MailingPostalCode='95616',MailingCountry='United States',Phone='(530) 555-2593',Email='smcneil@example.com'),
            new Contact(FirstName='Robert',LastName='Simpson',MailingCity='Woodland',MailingState='CA',MailingPostalCode='95695',MailingCountry='United States',Phone='(530) 555-8725',Email='rsimpson@example.com'),
            new Contact(FirstName='Gabe',LastName='Hotkins',MailingCity='Pleasant Hill',MailingState='CA',MailingPostalCode='94523',MailingCountry='United States',Phone='(925) 555-9897',Email='ghotkins@example.com'),
            new Contact(FirstName='Lance',LastName='Gonzales',MailingCity='Walnut Creek',MailingState='CA',MailingPostalCode='94596',MailingCountry='United States',Phone='(925) 555-8624',Email='lgonzales@example.com'),
            new Contact(FirstName='Steve',LastName='Sutherland',MailingCity='Wichita',MailingState='KS',MailingPostalCode='67208',MailingCountry='United States',Phone='(608) 555-3399',Email='ssutherland@example.com'),
            new Contact(FirstName='Heath',LastName='Axworth',MailingCity='San Francisco',MailingState='CA',MailingPostalCode='94118',MailingCountry='United States',Phone='(415) 555-4142',Email='haxworth@example.com'),
            new Contact(FirstName='Mina',LastName='Passini',MailingCity='San Francisco',MailingState='CA',MailingPostalCode='94117',MailingCountry='United States',Phone='(415) 555-5561',Email='mpassini@example.com'),
            new Contact(FirstName='Karen',LastName='Wells',MailingCity='East Palo Alto',MailingState='CA',MailingPostalCode='94303',MailingCountry='United States',Phone='(650) 555-3514',Email='kwells@example.com'),
            new Contact(FirstName='Mike',LastName='Welch',MailingCity='Oakland',MailingState='CA',MailingPostalCode='94612',MailingCountry='United States',Phone='(510) 555-2151',Email='mwelch@example.com'),
            new Contact(FirstName='Wes',LastName='Hardin',MailingCity='Oakland',MailingState='CA',MailingPostalCode='94618',MailingCountry='United States',Phone='(510) 555-3664',Email='whardin@example.com'),
            new Contact(FirstName='May',LastName='Chan',MailingCity='San Jose',MailingState='CA',MailingPostalCode='95119',MailingCountry='United States',Phone='(537) 555-2247',Email='mchan@example.com'),
            new Contact(FirstName='Sarah',LastName='Phillips',MailingCity='San Mateo',MailingState='CA',MailingPostalCode='94401',MailingCountry='United States',Phone='(794) 555-4703',Email='sphillips@example.com'),
            new Contact(FirstName='Marc',LastName='Benioff',MailingCity='San Francisco',MailingState='CA',MailingPostalCode='94105',MailingCountry='United States',Phone='(415) 555-7000',Email='mbenioff@example.com'),
            new Contact(FirstName='Emilee',LastName='Kendra',MailingCity='San Francisco',MailingState='CA',MailingPostalCode='94105',MailingCountry='United States',Phone='(415) 555-3688',Email='ekendra@example.com'),
            new Contact(FirstName='Brad',LastName='Anastasio',MailingCity='San Francisco',MailingState='CA',MailingPostalCode='94105',MailingCountry='United States',Phone='(415) 555-9065',Email='banastasio@example.com'),
            new Contact(FirstName='Antony',LastName='Passemard',MailingCity='San Francisco',MailingState='CA',MailingPostalCode='94105',MailingCountry='United States',Phone='(415) 555-7722',Email='apassemard@example.com'),
            new Contact(FirstName='Chris',LastName='Post',MailingCity='San Francisco',MailingState='CA',MailingPostalCode='94105',MailingCountry='United States',Phone='(415) 555-5590',Email='cpost@example.com'),
            new Contact(FirstName='Wes',LastName='Chopra',MailingCity='Wichita',MailingState='KS',MailingPostalCode='67208',MailingCountry='United States',Phone='(847) 555-5100',Email='wchopra@example.com'),
            new Contact(FirstName='Greg',LastName='Walker',MailingCity='Wichita',MailingState='KS',MailingPostalCode='67208',MailingCountry='United States',Phone='(847) 555-7858',Email='gwalker@example.com'),
            new Contact(FirstName='Mary',LastName='McDaniel',MailingCity='San Francisco',MailingState='CA',MailingPostalCode='94105',MailingCountry='United States',Phone='(866) 555-7014',Email='mmcdaniel@example.com'),
            new Contact(FirstName='Doug',LastName='Hart',MailingCity='Wichita',MailingState='KS',MailingPostalCode='67208',MailingCountry='United States',Phone='(847) 555-3116',Email='dhart@example.com'),
            new Contact(FirstName='Jason',LastName='Brennaman',MailingCity='Denver',MailingState='CO',MailingPostalCode='80202',MailingCountry='United States',Phone='(847) 555-1237',Email='jason.brennaman@example.com'),
            new Contact(FirstName='Nicole',LastName='Grace',MailingCity='Wichita',MailingState='KS',MailingPostalCode='67208',MailingCountry='United States',Phone='(203) 555-2801',Email='ngrace@example.com'),
            new Contact(FirstName='Benjamin',LastName='Young',MailingCity='Wichita',MailingState='KS',MailingPostalCode='67208',MailingCountry='United States',Phone='(713) 555-2977',Email='byoung@example.com'),
            new Contact(FirstName='Bob',LastName='Warkentine',MailingCity='Wichita',MailingState='KS',MailingPostalCode='67208',MailingCountry='United States',Phone='(646) 555-2296',Email='bwarkentine@example.com'),
            new Contact(FirstName='Robert',LastName='Janzen',MailingCity='Wichita',MailingState='KS',MailingPostalCode='67208',MailingCountry='United States',Phone='(858) 555-8991',Email='rjanzen@example.com'),
            new Contact(FirstName='Chip',LastName='Colli',MailingCity='Wichita',MailingState='KS',MailingPostalCode='67208',MailingCountry='United States',Phone='(206) 555-7855',Email='ccolli@example.com'),
            new Contact(FirstName='Niki',LastName='Sullivan',MailingCity='Wichita',MailingState='KS',MailingPostalCode='67208',MailingCountry='United States',Phone='(702) 555-3769',Email='nsullivan@example.com'),
            new Contact(FirstName='Jon',LastName='Allegri',MailingCity='Wichita',MailingState='KS',MailingPostalCode='67208',MailingCountry='United States',Phone='(813) 555-5220',Email='jallegri@example.com'),
            new Contact(FirstName='Kari',LastName='Rende',MailingCity='Wichita',MailingState='KS',MailingPostalCode='67208',MailingCountry='United States',Phone='(630) 555-4403',Email='krende@example.com'),
            new Contact(FirstName='Mike',LastName='Malmin',MailingCity='Wichita',MailingState='KS',MailingPostalCode='67208',MailingCountry='United States',Phone='(317) 555-6312',Email='mmalmin@example.com'),
            new Contact(FirstName='Troy',LastName='Bullock',MailingCity='Wichita',MailingState='KS',MailingPostalCode='67208',MailingCountry='United States',Phone='(704) 555-7526',Email='tbullock@example.com'),
            new Contact(FirstName='Hamid',LastName='Basirat',MailingCity='Monroe',MailingState='IA',MailingPostalCode='50170',MailingCountry='United States',Phone='(875) 555-6626',Email='hbasirat@example.com'),
            new Contact(FirstName='Bree',LastName='Reitz',MailingCity='San Francisco',MailingState='CA',MailingPostalCode='94167',MailingCountry='United States',Phone='(453) 555-6139',Email='breitz@example.com'),
            new Contact(FirstName='Hollie',LastName='Everhart',MailingCity='Hakalau',MailingState='HI',MailingPostalCode='96710',MailingCountry='United States',Phone='(579) 555-5933',Email='heverhart@example.com'),
            new Contact(FirstName='Marci',LastName='Viviano',MailingCity='Tacoma',MailingState='WA',MailingPostalCode='98408',MailingCountry='United States',Phone='(270) 555-9522',Email='mviviano@example.com'),
            new Contact(FirstName='Lloyd',LastName='Archibald',MailingCity='Topeka',MailingState='IN',MailingPostalCode='46571',MailingCountry='United States',Phone='(801) 555-7354',Email='larchibald@example.com'),
            new Contact(FirstName='Shay',LastName='Dulaney',MailingCity='Pensacola',MailingState='FL',MailingPostalCode='32516',MailingCountry='United States',Phone='(686) 555-8285',Email='sdulaney@example.com'),
            new Contact(FirstName='David',LastName='Homme',MailingCity='Eugene',MailingState='OR',MailingPostalCode='97404',MailingCountry='United States',Phone='(759) 555-1632',Email='dhomme@example.com'),
            new Contact(FirstName='Cristin',LastName='Hwang',MailingCity='Rushmore',MailingState='MN',MailingPostalCode='56168',MailingCountry='United States',Phone='(806) 555-6846',Email='chwang@example.com'),
            new Contact(FirstName='Laura',LastName='Rossi',MailingCity='Genve',MailingState='',MailingPostalCode='1205',MailingCountry='Switzerland',Phone='(611) 555-1661',Email='rmorris@example.com'),
            new Contact(FirstName='Adam',LastName='Mercer',MailingCity='Littleton',MailingState='CO',MailingPostalCode='80211',MailingCountry='United States',Phone='(794) 555-5480',Email='amercer@example.com'),
            new Contact(FirstName='Joyce',LastName='Turner',MailingCity='Littleton',MailingState='CO',MailingPostalCode='80211',MailingCountry='United States',Phone='(794) 555-7515',Email='jturner@example.com'),
            new Contact(FirstName='Steve',LastName='Ideas',MailingCity='Shelby',MailingState='TN',MailingPostalCode='38111',MailingCountry='United States',Phone='(674) 555-7660',Email='sideas@example.com'),
            new Contact(FirstName='Sean',LastName='Silver',MailingCity='Chicago',MailingState='IL',MailingPostalCode='94105',MailingCountry='United States',Phone='(792) 555-5309',Email='ssilver@example.com'),
            new Contact(FirstName='Barry',LastName='Brown',MailingCity='San Francisco',MailingState='CA',MailingPostalCode='94105',MailingCountry='United States',Phone='(319) 555-5270',Email='bbrown@example.com'),
            new Contact(FirstName='Sandy',LastName='Jones',MailingCity='Wichita',MailingState='KS',MailingPostalCode='67208',MailingCountry='United States',Phone='(261) 555-3205',Email='sjones@example.com'),
            new Contact(FirstName='Bradley',LastName='Harmon',MailingCity='Wichita',MailingState='KS',MailingPostalCode='67208',MailingCountry='United States',Phone='(261) 555-6425',Email='bharmon@example.com'),
            new Contact(FirstName='Bruce',LastName='Watkins',MailingCity='Stevens Point',MailingState='WI',MailingPostalCode='54481',MailingCountry='United States',Phone='(631) 555-8821',Email='bwatkins@example.com'),
            new Contact(FirstName='Bonnie',LastName='Barra',MailingCity='San Miguel',MailingState='CA',MailingPostalCode='93451',MailingCountry='United States',Phone='(261) 555-6229',Email='bbarra@example.com'),
            new Contact(FirstName='Jamie',LastName='Green',MailingCity='San Francisco',MailingState='CA',MailingPostalCode='94133',MailingCountry='United States',Phone='(537) 555-7796',Email='jgreen@example.com'),
            new Contact(FirstName='Jan',LastName='Perkins',MailingCity='Friedensburg',MailingState='PA',MailingPostalCode='17933',MailingCountry='United States',Phone='(767) 555-8343',Email='jperkins@example.com'),
            new Contact(FirstName='Ryan',LastName='Giggs',MailingCity='Baltimore',MailingState='MD',MailingPostalCode='21223',MailingCountry='United States',Phone='(266) 555-4756',Email='rgiggs@example.com'),
            new Contact(FirstName='Andrea',LastName='Bowden',MailingCity='Boston',MailingState='MA',MailingPostalCode='2051',MailingCountry='United States',Phone='(655) 555-9967',Email='abowden@example.com'),
            new Contact(FirstName='Sarah',LastName='Jeffries',MailingCity='King',MailingState='WA',MailingPostalCode='98109',MailingCountry='United States',Phone='(296) 555-7307',Email='sjeffries@example.com'),
            new Contact(FirstName='Chris',LastName='Templey',MailingCity='Delaware',MailingState='PA',MailingPostalCode='19073',MailingCountry='United States',Phone='(874) 555-9359',Email='ctempley@example.com'),
            new Contact(FirstName='Kathy',LastName='Fitzpatrick',MailingCity='Foster City',MailingState='CA',MailingPostalCode='94404',MailingCountry='United States',Phone='(231) 555-6665',Email='kfitzpatrick@example.com'),
            new Contact(FirstName='Derek',LastName='Rose',MailingCity='King',MailingState='WA',MailingPostalCode='98117',MailingCountry='United States',Phone='(575) 555-2613',Email='drose@example.com'),
            new Contact(FirstName='Lisa',LastName='Jones',MailingCity='Denver',MailingState='CO',MailingPostalCode='80223',MailingCountry='United States',Phone='(904) 555-4358',Email='ljones@example.com'),
            new Contact(FirstName='Jeff',LastName='Blay',MailingCity='Alameda',MailingState='CA',MailingPostalCode='94601',MailingCountry='United States',Phone='(487) 555-4995',Email='jblay@example.com'),
            new Contact(FirstName='Ron',LastName='Reid',MailingCity='San Diego',MailingState='CA',MailingPostalCode='92105',MailingCountry='United States',Phone='(935) 555-8160',Email='rreid@example.com'),
            new Contact(FirstName='Bill',LastName='Blau',MailingCity='San Francisco',MailingState='CA',MailingPostalCode='94108',MailingCountry='United States',Phone='(867) 555-2951',Email='bblau@example.com'),
            new Contact(FirstName='Judy',LastName='Odom',MailingCity='New Hanover',MailingState='NC',MailingPostalCode='28403',MailingCountry='United States',Phone='(689) 555-3077',Email='jodom@example.com'),
            new Contact(FirstName='Tammy',LastName='Baxter',MailingCity='San Francisco',MailingState='CA',MailingPostalCode='94103',MailingCountry='United States',Phone='(415) 555-3930',Email='tbaxter@example.com'),
            new Contact(FirstName='Peter',LastName='Houston',MailingCity='Cook',MailingState='IL',MailingPostalCode='60636',MailingCountry='United States',Phone='(415) 555-4707',Email='phouston@example.com'),
            new Contact(FirstName='Larry',LastName='Baxter',MailingCity='Los Angeles',MailingState='CA',MailingPostalCode='90255',MailingCountry='United States',Phone='(310) 555-4786',Email='lbaxter@example.com'),
            new Contact(FirstName='Tom',LastName='Davis',MailingCity='Santa Cruz',MailingState='CA',MailingPostalCode='95062',MailingCountry='United States',Phone='(643) 555-5886',Email='tdavis@example.com'),
            new Contact(FirstName='Rose',LastName='Gonzalez',MailingCity='Clark',MailingState='NV',MailingPostalCode='89119',MailingCountry='United States',Phone='(776) 555-1601',Email='rgonzalez@example.com'),
            new Contact(FirstName='Alex',LastName='Johnson',MailingCity='Clark',MailingState='NV',MailingPostalCode='89119',MailingCountry='United States',Phone='(526) 555-3205',Email='ajohnson@example.com'),
            new Contact(FirstName='Tom',LastName='James',MailingCity='Clark',MailingState='NV',MailingPostalCode='89119',MailingCountry='United States',Phone='(932) 555-2450',Email='tjames@example.com'),
            new Contact(FirstName='Ed',LastName='Flachbarth',MailingCity='Santa Clara',MailingState='CA',MailingPostalCode='95125',MailingCountry='United States',Phone='(475) 555-2054',Email='eflachbarth@example.com'),
            new Contact(FirstName='James',LastName='Wu',MailingCity='Fairfax',MailingState='VA',MailingPostalCode='22035',MailingCountry='United States',Phone='(274) 555-7584',Email='jwu@example.com'),
            new Contact(FirstName='Mark',LastName='Kingston',MailingCity='Fairfax',MailingState='VA',MailingPostalCode='22035',MailingCountry='United States',Phone='(769) 555-7272',Email='mkingston@example.com'),
            new Contact(FirstName='Martin',LastName='Woodson',MailingCity='Multnomah',MailingState='OR',MailingPostalCode='97233',MailingCountry='United States',Phone='(750) 555-8377',Email='wmartin@example.com'),
            new Contact(FirstName='Jeannie',LastName='Rogers',MailingCity='Clark',MailingState='NV',MailingPostalCode='89119',MailingCountry='United States',Phone='(875) 555-9710',Email='jrogers@example.com'),
            new Contact(FirstName='Arthur',LastName='Song',MailingCity='Shelby',MailingState='TN',MailingPostalCode='38111',MailingCountry='United States',Phone='(772) 555-5429',Email='asong@example.com'),
            new Contact(FirstName='Patricia',LastName='Feager',MailingCity='Shelby',MailingState='TN',MailingPostalCode='38111',MailingCountry='United States',Phone='(423) 555-2615',Email='pfeager@example.com'),
            new Contact(FirstName='George',LastName='Mazzotta',MailingCity='Shelby',MailingState='TN',MailingPostalCode='38111',MailingCountry='United States',Phone='(520) 555-5807',Email='gmazzotta@example.com'),
            new Contact(FirstName='Danielle',LastName='Hauck',MailingCity='Shelby',MailingState='TN',MailingPostalCode='38111',MailingCountry='United States',Phone='(219) 555-1644',Email='dhauck@example.com'),
            new Contact(FirstName='Martin',LastName='Green',MailingCity='Multnomah',MailingState='OR',MailingPostalCode='97233',MailingCountry='United States',Phone='(280) 555-9701',Email='mgreen@example.com'),
            new Contact(FirstName='Thomas',LastName='Green',MailingCity='Shelby',MailingState='TN',MailingPostalCode='38111',MailingCountry='United States',Phone='(639) 555-1713',Email='tgreen@example.com'),
            new Contact(FirstName='Brenda',LastName='Mcclure',MailingCity='Shelby',MailingState='TN',MailingPostalCode='38111',MailingCountry='United States',Phone='(415) 555-4922',Email='bmcclure@example.com'),
            new Contact(FirstName='Joseph',LastName='Gillespie',MailingCity='Multnomah',MailingState='OR',MailingPostalCode='97233',MailingCountry='United States',Phone='(323) 555-2642',Email='jgillespie@example.com'),
            new Contact(FirstName='Richard',LastName='O\'Brien',MailingCity='Multnomah',MailingState='OR',MailingPostalCode='97233',MailingCountry='United States',Phone='(726) 555-5626',Email='robrien@example.com'),
            new Contact(FirstName='Chris',LastName='Friedman',MailingCity='Shelby',MailingState='TN',MailingPostalCode='38111',MailingCountry='United States',Phone='(227) 555-9079',Email='cfriedman@example.com'),
            new Contact(FirstName='Bjorn',LastName='Lundgren',MailingCity='Dallas',MailingState='TX',MailingPostalCode='75225',MailingCountry='United States',Phone='(373) 555-9342',Email='bolson@example.com'),
            new Contact(FirstName='Peter',LastName='Foss',MailingCity='Multnomah',MailingState='OR',MailingPostalCode='97233',MailingCountry='United States',Phone='(453) 555-8461',Email='pfoss@example.com'),
            new Contact(FirstName='Janice',LastName='Bergman',MailingCity='New York',MailingState='NY',MailingPostalCode='10002',MailingCountry='United States',Phone='(810) 555-9875',Email='jbergman@example.com'),
            new Contact(FirstName='Kyle',LastName='Pearson',MailingCity='New York',MailingState='NY',MailingPostalCode='10002',MailingCountry='United States',Phone='(903) 555-7363',Email='kpearson@example.com'),
            new Contact(FirstName='Jean-Michel',LastName='Lambert',MailingCity='New York',MailingState='NY',MailingPostalCode='10002',MailingCountry='United States',Phone='(544) 555-2450',Email='jlambert@example.com'),
            new Contact(FirstName='Robert',LastName='Fontana',MailingCity='Multnomah',MailingState='OR',MailingPostalCode='97233',MailingCountry='United States',Phone='(226) 555-5980',Email='rfontana@example.com'),
            new Contact(FirstName='Julie',LastName='Dillon',MailingCity='New York',MailingState='NY',MailingPostalCode='10002',MailingCountry='United States',Phone='(533) 555-3116',Email='jdillon@example.com'),
            new Contact(FirstName='Bill',LastName='Martin',MailingCity='New York',MailingState='NY',MailingPostalCode='10002',MailingCountry='United States',Phone='(673) 555-2802',Email='bmartin@example.com'),
            new Contact(FirstName='Billy',LastName='Mack',MailingCity='New York',MailingState='NY',MailingPostalCode='10002',MailingCountry='United States',Phone='(206) 555-4966',Email='bmack@example.com'),
            new Contact(FirstName='Ed',LastName='Hennessy',MailingCity='Jefferson',MailingState='TX',MailingPostalCode='77701',MailingCountry='United States',Phone='(699) 555-3781',Email='ehennessy@example.com'),
            new Contact(FirstName='Erin',LastName='Walsh',MailingCity='Multnomah',MailingState='OR',MailingPostalCode='97215',MailingCountry='United States',Phone='(925) 555-6788',Email='ewalsh@example.com'),
            new Contact(FirstName='Sean',LastName='Forbes',MailingCity='Clark',MailingState='NV',MailingPostalCode='89119',MailingCountry='United States',Phone='(237) 555-2784',Email='sforbes@example.com'),
            new Contact(FirstName='Allison',LastName='Yates',MailingCity='Sydney',MailingState='NSW',MailingPostalCode='2007',MailingCountry='Australia',Phone='(239) 555-1562',Email='ayates@example.com'),
            new Contact(FirstName='Tammy',LastName='Reseller',MailingCity='Clark',MailingState='NV',MailingPostalCode='89119',MailingCountry='United States',Phone='(573) 555-9103',Email='treseller@example.com'),
            new Contact(FirstName='Michael',LastName='Basch',MailingCity='Clark',MailingState='NV',MailingPostalCode='89119',MailingCountry='United States',Phone='(753) 555-5337',Email='mbasch@example.com'),
            new Contact(FirstName='Thomas',LastName='Simes',MailingCity='Clark',MailingState='NV',MailingPostalCode='89119',MailingCountry='United States',Phone='(519) 555-7883',Email='tsimes@example.com'),
            new Contact(FirstName='Stephanie',LastName='Curran',MailingCity='Santa Clara',MailingState='CA',MailingPostalCode='95125',MailingCountry='United States',Phone='(690) 555-3122',Email='scurran@example.com'),
            new Contact(FirstName='Stella',LastName='Pavlova',MailingCity='Sydney',MailingState='NSW',MailingPostalCode='2007',MailingCountry='Australia',Phone='(842) 555-9587',Email='spavlova@example.com'),
            new Contact(FirstName='Mark',LastName='Dillon',MailingCity='Sydney',MailingState='NSW',MailingPostalCode='2007',MailingCountry='Australia',Phone='(765) 555-3929',Email='mdillon@example.com'),
            new Contact(FirstName='Susan',LastName='Johanson',MailingCity='Sydney',MailingState='NSW',MailingPostalCode='2007',MailingCountry='Australia',Phone='(390) 555-5353',Email='sjohanson@example.com'),
            new Contact(FirstName='Jeff',LastName='Kane',MailingCity='Santa Clara',MailingState='CA',MailingPostalCode='95125',MailingCountry='United States',Phone='(385) 555-1733',Email='jkane@example.com'),
            new Contact(FirstName='Paul',LastName='Partner',MailingCity='San Francisco',MailingState='CA',MailingPostalCode='94105',MailingCountry='United States',Phone='(344) 555-5476',Email='ppartner@example.com'),
            new Contact(FirstName='Al',LastName='Miller',MailingCity='Santa Clara',MailingState='CA',MailingPostalCode='95125',MailingCountry='United States',Phone='(879) 555-6333',Email='amiller@example.com'),
            new Contact(FirstName='Keith',LastName='Lopez',MailingCity='Santa Clara',MailingState='CA',MailingPostalCode='95125',MailingCountry='United States',Phone='(528) 555-1170',Email='klopez@example.com'),
            new Contact(FirstName='Larry',LastName='Kuchenreuther',MailingCity='Los Angeles',MailingState='CA',MailingPostalCode='90501',MailingCountry='United States',Phone='(446) 555-9042',Email='lkuchenreuther@example.com'),
            new Contact(FirstName='Mark',LastName='Metz',MailingCity='Santa Clara',MailingState='CA',MailingPostalCode='95125',MailingCountry='United States',Phone='(747) 555-7568',Email='mmetz@example.com'),
            new Contact(FirstName='Steve',LastName='Mcdonald',MailingCity='Santa Clara',MailingState='CA',MailingPostalCode='95125',MailingCountry='United States',Phone='(631) 555-8643',Email='smcdonald@example.com'),
            new Contact(FirstName='Sandy',LastName='Knudson',MailingCity='Orange',MailingState='CA',MailingPostalCode='92647',MailingCountry='United States',Phone='(624) 555-5001',Email='sknudson@example.com'),
            new Contact(FirstName='Ron',LastName='Adkins',MailingCity='Sedgwick',MailingState='KS',MailingPostalCode='67208',MailingCountry='United States',Phone='(258) 555-2156',Email='radkins@example.com'),
            new Contact(FirstName='David',LastName='Harris',MailingCity='Santa Cruz',MailingState='CA',MailingPostalCode='95062',MailingCountry='United States',Phone='(692) 555-3263',Email='dharris@example.com'),
            new Contact(FirstName='Gabriel',LastName='Silva',MailingCity='13087Campinas',MailingState='SP',MailingPostalCode='13087',MailingCountry='Brazil',Phone='(632) 555-9279',Email='rlloyd@example.com'),
            new Contact(FirstName='Sean',LastName='Murphy',MailingCity='Santa Clara',MailingState='CA',MailingPostalCode='95125',MailingCountry='United States',Phone='(576) 555-1964',Email='smurphy@example.com'),
            new Contact(FirstName='Sienna',LastName='Competente',MailingCity='Richmond (city)',MailingState='VA',MailingPostalCode='23224',MailingCountry='United States',Phone='(672) 555-2472',Email='scompetente@example.com'),
            new Contact(FirstName='Leo',LastName='Novak',MailingCity='Clark',MailingState='NV',MailingPostalCode='89031',MailingCountry='United States',Phone='(656) 555-4875',Email='lnovak@example.com'),
            new Contact(FirstName='Brad',LastName='Owens',MailingCity='Cook',MailingState='IL',MailingPostalCode='60402',MailingCountry='United States',Phone='(500) 555-1311',Email='bowens@example.com'),
            new Contact(FirstName='Lauren',LastName='Boyle',MailingCity='Fairfax',MailingState='CA',MailingPostalCode='22035',MailingCountry='United States',Phone='(415) 555-9303',Email='lboyle@example.com'),
            new Contact(FirstName='Bob',LastName='Hodges',MailingCity='Montgomery',MailingState='PA',MailingPostalCode='19009',MailingCountry='United States',Phone='(422) 555-5262',Email='bhodges@example.com')
        };
        
        insert contacts;
        Map<String, Contact> contactsMap = new Map<String, Contact>();
        for(Contact c : contacts) {
            contactsMap.put(c.FirstName + ' ' + c.LastName, c);
        }
                        
        List<Product2> products = new List<Product2> {
            new Product2(ProductCode='MPT',Name='MPT',Shore_Dive__c=FALSE,Porters__c=FALSE,Permits_Needed__c=FALSE,Needs_Waiver__c=FALSE,Needs_Insurance__c=FALSE,Minimum_Age__c='18+',List_Price__c=2500,Duration_Nights__c=13,Duration_Days__c=14,Day_Trip__c=False,Country__c='Peru',Adventure_Rating__c='(4) Code Habanero Alert',IsActive=True,Description='We created a custom program that allows you to experience the best section that the classic route has to offer, while not sacrificing the adventure of camping in the rural Andes.'),
            new Product2(ProductCode='MTT',Name='MTT',Shore_Dive__c=FALSE,Porters__c=FALSE,Permits_Needed__c=FALSE,Needs_Waiver__c=FALSE,Needs_Insurance__c=FALSE,Minimum_Age__c='18+',List_Price__c=2500,Duration_Nights__c=4,Duration_Days__c=5,Day_Trip__c=False,Country__c='New Zealand',Adventure_Rating__c='(3) Thrill-Seeker',IsActive=True,Description='5 days/4 nights. Include transport, accommodation, meals, snacks, backpacks, rain jackets and a cruise on the walk\'s grand finale: the majestic Milford Sound.  Accommodation is in our well appointed wilderness lodges and you will be led by our expert guides.'),
            new Product2(ProductCode='HDH',Name='HDH',Shore_Dive__c=FALSE,Porters__c=FALSE,Permits_Needed__c=FALSE,Needs_Waiver__c=FALSE,Needs_Insurance__c=FALSE,Minimum_Age__c='18+',List_Price__c=300,Duration_Nights__c=2,Duration_Days__c=3,Day_Trip__c=False,Country__c='United States',Adventure_Rating__c='(3) Thrill-Seeker',IsActive=True,Description='Overnight camping before and after this 16-mile round-trip “One Best Hike” takes hikers beside majestic waterfalls and to the top of Half Dome.')
        };
        
        insert products;

        PriceBook2 priceBook = [Select IsActive From Pricebook2 Where IsStandard=True Limit 1];
        if(!priceBook.IsActive) {
            priceBook.IsActive = True;
            update priceBook;
        }
        update priceBook;

        Map<String, PriceBookEntry> pricebookEntries = new Map<String, PriceBookEntry>();
        for(Product2 product : products) {
            priceBookEntries.put(product.ProductCode, new PriceBookEntry(IsActive=True, UnitPrice=product.List_Price__c, Product2Id=product.Id, Pricebook2Id=priceBook.Id));
        }
        
        insert pricebookEntries.values();
        
        List<OppsWAdventure> oppsWithAdventures = new List<OppsWAdventure> {
            new OppsWAdventure('Susan Johanson - Milford Track - 2026','Susan Johanson','1/1/2026','New',10,1,2500,'MTT'),
            new OppsWAdventure('Nicole Grace - Milford Track - 2026','Nicole Grace','1/1/2026','New',10,1,2500,'MTT'),
            new OppsWAdventure('Benjamin Young - Milford Track - 2026','Benjamin Young','1/1/2026','New',10,1,2500,'MTT'),
            new OppsWAdventure('Robert Janzen - Milford Track - 2026','Robert Janzen','1/1/2026','New',10,1,2500,'MTT'),
            new OppsWAdventure('Chip Colli - Milford Track - 2026','Chip Colli','1/1/2026','New',10,1,2500,'MTT'),
            new OppsWAdventure('Niki Sullivan - Milford Track - 2026','Niki Sullivan','1/1/2026','New',10,1,2500,'MTT'),
            new OppsWAdventure('Jon Allegri - Milford Track - 2026','Jon Allegri','1/1/2026','New',10,1,2500,'MTT'),
            new OppsWAdventure('Kari Rende - Milford Track - 2026','Kari Rende','1/1/2026','New',10,1,2500,'MTT'),
            new OppsWAdventure('Mike Malmin - Milford Track - 2026','Mike Malmin','1/1/2026','New',10,1,2500,'MTT'),
            new OppsWAdventure('Troy Bullock - Milford Track - 2026','Troy Bullock','1/1/2026','New',10,1,2500,'MTT'),
            new OppsWAdventure('Hamid Basirat - Milford Track - 2026','Hamid Basirat','1/1/2026','New',10,1,2500,'MTT'),
            new OppsWAdventure('Bree Reitz - Milford Track - 2026','Bree Reitz','1/1/2026','New',10,1,2500,'MTT'),
            new OppsWAdventure('Hollie Everhart - Milford Track - 2026','Hollie Everhart','1/1/2026','New',10,1,2500,'MTT'),
            new OppsWAdventure('Marci Viviano - Milford Track - 2026','Marci Viviano','1/1/2026','New',10,1,2500,'MTT'),
            new OppsWAdventure('Lloyd Archibald - Milford Track - 2026','Lloyd Archibald','1/1/2026','New',10,1,2500,'MTT'),
            new OppsWAdventure('Bob Hodges - Machu Picchu - 2026','Bob Hodges','3/1/2026','New',10,1,2500,'MPT'),
            new OppsWAdventure('Karen Wells - Machu Picchu - 2026','Karen Wells','3/1/2026','New',10,1,2500,'MPT'),
            new OppsWAdventure('Mike Welch - Machu Picchu - 2026','Mike Welch','3/1/2026','New',10,1,2500,'MPT'),
            new OppsWAdventure('Wes Hardin - Machu Picchu - 2026','Wes Hardin','3/1/2026','New',10,1,2500,'MPT'),
            new OppsWAdventure('May Chan - Machu Picchu - 2026','May Chan','3/1/2026','New',10,1,2500,'MPT'),
            new OppsWAdventure('Sarah Phillips - Machu Picchu - 2026','Sarah Phillips','3/1/2026','New',10,1,2500,'MPT'),
            new OppsWAdventure('Marc Benioff - Machu Picchu - 2026','Marc Benioff','3/1/2026','New',10,1,2500,'MPT'),
            new OppsWAdventure('Emilee Kendra - Machu Picchu - 2026','Emilee Kendra','3/1/2026','New',10,1,2500,'MPT'),
            new OppsWAdventure('Brad Anastasio - Machu Picchu - 2026','Brad Anastasio','3/1/2026','New',10,1,2500,'MPT'),
            new OppsWAdventure('Chris Post - Machu Picchu - 2026','Chris Post','3/1/2026','New',10,1,2500,'MPT'),
            new OppsWAdventure('Wes Chopra - Machu Picchu - 2026','Wes Chopra','3/1/2026','New',10,1,2500,'MPT'),
            new OppsWAdventure('Greg Walker - Machu Picchu - 2026','Greg Walker','3/1/2026','New',10,1,2500,'MPT'),
            new OppsWAdventure('Mary McDaniel - Machu Picchu - 2026','Mary McDaniel','3/1/2026','New',10,1,2500,'MPT'),
            new OppsWAdventure('Doug Hart - Machu Picchu - 2026','Doug Hart','3/1/2026','New',10,1,2500,'MPT'),
            new OppsWAdventure('Jason Brennaman - Machu Picchu - 2026','Jason Brennaman','3/1/2026','New',10,1,2500,'MPT'),
            new OppsWAdventure('Al Miller - Machu Picchu - 2026','Al Miller','3/1/2026','New',10,1,2500,'MPT'),
            new OppsWAdventure('Andy Peterson - Machu Picchu - 2026','Andy Peterson','3/1/2026','New',10,1,2500,'MPT'),
            new OppsWAdventure('Anne Frost - Machu Picchu - 2026','Anne Frost','3/1/2026','New',10,1,2500,'MPT'),
            new OppsWAdventure('Stacy McNeil - Machu Picchu - 2026','Stacy McNeil','3/1/2026','New',10,1,2500,'MPT'),
            new OppsWAdventure('Robert Simpson - Machu Picchu - 2026','Robert Simpson','3/1/2026','New',10,1,2500,'MPT'),
            new OppsWAdventure('Gabe Hotkins - Half Dome - 2026','Gabe Hotkins','4/1/2026','New',10,1,400,'HDH'),
            new OppsWAdventure('Lance Gonzales - Half Dome - 2026','Lance Gonzales','4/1/2026','New',10,1,400,'HDH'),
            new OppsWAdventure('Steve Sutherland - Half Dome - 2026','Steve Sutherland','4/1/2026','New',10,1,400,'HDH'),
            new OppsWAdventure('Heath Axworth - Half Dome - 2026','Heath Axworth','4/1/2026','New',10,1,400,'HDH'),
            new OppsWAdventure('Mina Passini - Half Dome - 2026','Mina Passini','4/1/2026','New',10,1,400,'HDH'),
            new OppsWAdventure('Duncan Macintosh - Half Dome - 2026','Duncan Macintosh','4/1/2026','New',10,1,400,'HDH'),
            new OppsWAdventure('Daryl Distributor - Half Dome - 2026','Daryl Distributor','4/1/2026','New',10,1,400,'HDH'),
            new OppsWAdventure('David Adelson - Half Dome - 2026','David Adelson','4/1/2026','New',10,1,400,'HDH'),
            new OppsWAdventure('Mark Smith - Half Dome - 2026','Mark Smith','4/1/2026','New',10,1,400,'HDH'),
            new OppsWAdventure('Mike Garcia - Half Dome - 2026','Mike Garcia','4/1/2026','New',10,1,400,'HDH'),
            new OppsWAdventure('Deanna Collins - Half Dome - 2026','Deanna Collins','4/1/2026','New',10,1,400,'HDH')
        };
        
        Map<String, OppsWAdventure> oppsWAdventureByOpportunityName = new Map<String, OppsWAdventure>();
        List<Opportunity> opportunities = new List<Opportunity>();
        
        // you must create an Opportunity record type manually before
        Id recordTypeId = [Select Id From RecordType Where Name = 'Individual Opportunity' And SObjectType = 'Opportunity' Limit 1].Id;
        for(OppsWAdventure opwad : oppsWithAdventures) {
            oppsWAdventureByOpportunityName.put(opwad.Name, opwad);
            opportunities.add(new Opportunity(Name=opwad.Name, CloseDate=opwad.CloseDate, StageName=opwad.StageName, Probability=opwad.Probability, TotalOpportunityQuantity=opwad.TotalOpportunityQuantity, recordTypeId=recordTypeId));
        }
        
        insert opportunities;
        List<OpportunityLineItem> opportunityLineItems = new List<OpportunityLineItem>();
        List<OpportunityContactRole> opportunityContactRoles = new List<OpportunityContactRole>();
        for(Opportunity opportunity : opportunities) {
            OppsWAdventure opwad = oppsWAdventureByOpportunityName.get(opportunity.Name);
            Id contactId = contactsMap.get(opwad.ContactName).Id;
            opportunityLineItems.add(new OpportunityLineItem(OpportunityId=opportunity.Id, UnitPrice=opwad.SalesPrice, Quantity=opwad.totalOpportunityQuantity, Explorer__c=contactId, PriceBookEntryId=pricebookEntries.get(opwad.ProductCode).Id));
            opportunityContactRoles.add(new OpportunityContactRole(OpportunityId=opportunity.Id, ContactId=contactId));
        }
                                     
        insert opportunityLineItems;
        insert opportunityContactRoles;
    }

    private class OppsWAdventure {
        String Name, ContactName, StageName, ProductCode;
        Integer Probability, TotalOpportunityQuantity, SalesPrice;
        Date CloseDate;
        
        public OppsWAdventure(String name, String contactName, String closeDateStr, String stageName, Integer probability, Integer totalOpportunityQuantity, Integer SalesPrice, String productCode) {
            this.Name = name;
            this.ContactName = contactName;
            this.CloseDate = Date.parse(closeDateStr);
            this.StageName = stageName;
            this.Probability = probability;
            this.TotalOpportunityQuantity = totalOpportunityQuantity;
            this.SalesPrice = salesPrice;
            this.ProductCode = productCode;
        }
    }
}