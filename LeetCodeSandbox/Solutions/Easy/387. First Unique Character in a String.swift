//
//  387. First Unique Character in a String.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 30.12.2022.
//

import Foundation

enum FirstUniqueCharacterInAString {
    
    class Solution {
        func firstUniqChar(_ s: String) -> Int {
            var array: [(count: Int, firstIndex: Int)] = Array(repeating: (0, -1), count: 26)
            
            for (index, element) in s.enumerated() {
                let offset = Int(element.unicodeScalars[element.unicodeScalars.startIndex].value - "a".unicodeScalars["a".unicodeScalars.startIndex].value)
                
                var entry = array[offset]
                entry.count += 1
                if entry.firstIndex == -1 {
                    entry.firstIndex = index
                }
                array[offset] = entry
            }
            
            var minIndex: Int = -1
            for entry in array {
                if entry.count == 1 {
                    if minIndex == -1 {
                        minIndex = entry.firstIndex
                    } else {
                        minIndex = min(minIndex, entry.firstIndex)
                    }
                }
            }
            
            return minIndex
        }
    }
}

extension FirstUniqueCharacterInAString.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: "leetcode", result: 0, func1: self.firstUniqChar),
            TestCase1(input1: "loveleetcode", result: 2, func1: self.firstUniqChar),
            TestCase1(input1: "aabb", result: -1, func1: self.firstUniqChar),
            TestCase1(input1: "fmjiooebgjatqjttfftvobormhubvgxpiobekkxujgvaktcewbvkdnqwqmeeaogpcgaliilvimtsqtlfnhtvvipwsesosgluwtpearpvrrlpjgppqgegejsruiwbnppnlonpsetvfverxhmtihrfcbspupgmhrqniosmosamujoxqdepvjrcnhgqmkuhrlbrwmwtldfjnnkjnvpfonuvpewusqxstgxcfikmcwcgkipootlemscowhstxcaefreafjfxtuqcbdvasncmijmvdjlwcqopxnxdwqafwugelnuwledeajbkvjilvbjkarimpesekhmoixfapihomeswgirtovrgjgarjglnjmshirxphafbghvxuwpxggpbkewemvtrrmjxscdjlfvnfuepqkjffkkmdcstaktwlwawxcpxdgxsidxmcnhhlrtpmqfafucwxdieasfjgueridmakgcehmqtehwbkvahedxscsniwpdannvbpobtskdgmpfijknlunawajfcrgvigbkrlmuonuubmaluqfsjvsajjixbqjqrvwbhebumwsjvmqovawxjqbrumpdttswmqmutdvqvvtujmkbdauckvdcfknhsrwxxaucfqhabuinedmrocivwmhtwlkvfuqjmnouvkquijisidwqoekheegfvxxvdcngjxrjtlxfcgufmcjvtxrjuhipeoenouagigobxjfcpblvirfjvtfbhdmrjpqpvsxhijumbfjehswteajcmqhcdbstolecqlktajmtrhmjddnoawocbohrjqlgckhhhrkbcwgvpxolrlhwuvebsumijspknesmsspcvibsemoccjndalknqlxguvwvhbeujhavjpflwpuexgwwmbaqmlqdilwbaixemaokwsdppqjtgkdgixhkmmoixssvatqguvqjuctwfpvpjulmuuprkobuhkasxabjxvhltaejkuxoxopojcxxnasxcnqwnqsngktxdbhpuxacxgpgfxieeubcgkulklslskdwvimqvpatdvkukejojafuvqbrpqkcbwpohesnmvgpsdqoordplnhnoacwsabsvwjbcujvrrcimqcolvnwckgfbkuuvuqmfjohxrkamlnfrmaexcqeordnwwclgsxpibbgetfwntxpbocgeguaxavmnlkbpkvdamhqlsriuqhempogbsicviftokeiowlreddnlfxvblgpcxhtgovkijdbbtjavfihmwtldogomedftgdwlkkbjlwgogjplgfqimhevlhcntxqaukoqoqoowxkntlxxkbrihahqvsrmikphqvdfrgjarngpkaptrfmufovumglkcdcjeefsmndqnrjccpqwcaiuhifbptjftksxownppntulkdqujrapdfqfxhhqssxbjophmsusfrgarnxawkjwgeqhsdgvlggvvodgwfcvvgexwgrofdsiquvuscopwoewjlkndexhgripagmggvbfswngxlpgrjxwcmtcdbmrqsrhhgchkhxntaklapsshhrdljaghmstcspinnctbkuhuukevmfcwqjgcsqjhtxnnqrsxttisubvusprxurqwnpxxatdkifxbmrnirhxghmnuixbwppcigtwusjmrddqvowawffxntxqeauojlfrebmdwrkttsqsjpiebknsvgqwdrvgbkvebqnnpeorbpwlogqssfhorkbgkukkomvnaktvhtfwkbmeumuqridupxasqacshphkippegghkprknspngnckmatxiwfhnevkvkqjhtwvvqganrsdogtswdavjtuifwfwuwmjjgknwuaowbkpwoemsbvcvalvqfqlpteqjqsqpuhewrbxacurhbtwmuexpanjajomgbhhwpmswbonkndhwubjvixmcamivcegbaqjmwoigsrhffchxrhdcmdfjmnaitohcgfvaaohnmthqkakkrfmrhaslnbbhxkwrkxvuoknvollvfnxpeemtkgmctplllsknnfxwhetmjbnkosnvjtlpeojmniwtswvxopfpmeklmfeqmgovbscpwxdktstjcuwioowhvibkqaqxirbptkhbpbiegaqllgngvbkgjsxqmrrhbuglqcmoincrgppswdjjsqrejcohbrxpqofrhspwbsqlkrgotemlfllqewnnppkrvxgbrlsbrijatuphrifkqtiltillftkdhpjkwedxihhrrdanjhfiihivgxkbenxwgxgffnexiibgltthtjslaamoemjxtwbslgfkgxulwchwjwhwnpvugmswvwiflnbwwfojtbtbnwrteumskqgskvducfhklkvmgksjjlqbtlpluljtimvxvdabdbohewgkuxxedovvarbpifibqutbhepwhtnmvqfbhugqhijuvqhhbrqtjxojpkcapsvjarqbqpqgneefkjsdoqskdnqxgnxkkwewcprbpclggpxbolqsaamwqphdttqlbidsnuhltnbpclaacpsoxdxhgmfmxgukmxdgrxrnngblqxacvljvcrlvvejebvsacmkcnjbamhkibdhgajtijbqaoalrsjufdvswkbwejxgxeioosjkpnlhpipkecjrjjmrcipqbdxmqkflqurfjghwlnrqnqnjdrqjnwtpwtgedssivnltqtwpecgudvgenwsrjuodfiuohnqdfpoocvhicrxoqakcvfjqedxuulbkgcgghhlnqesdekdockldurnapthceeoigtuanhrqshxpmvlnkkrqkqhiktnovccaindinxqphgxmqborqbdphswaemrowwgttcsqapicjscjrwedegjrcrcqpgdljpqprkrxwvcjglwihfvlvstpmktqrxuweolnamqfxevupqfarwccunchfxcrtkdfasmwsrakcscducgbrakgrwndnawjfnakvenifrigaiqgnicdfenbegujmnxjormlclvnktrbjfpojdhworurfuqtsnwravocjrmdixkdvrpbkdhleaoiujaqwackjcooalserxlnegbjwpcahqdfifmxrpmkspuoqdaptamnobemgxpggkmqcpmctkkllvbubrgmhfgucnimkmogcgxikhbquaodetfxduclvtalriwxjopgedxpigsbtkxmmswhnvwlfvkitsvhfudisjbeeuqnchgnmswujerogjfvquntepjkukhpnqkmxaswecmwnqeejxiqawodxpboetaiudiwlutgudawkbndpqdtkprwwtetahvhjekuwmchmulsqqpuvuhvxqvoadqibmuvmubmhifiuoedgfppwssoxadspiaxhchavtuhqppbtqubohxujlxosqskjsrpscwrditgpknlklbnghoefgleiqspxqnasuhradhxnqjebovnpvuvdmasaptprdtcghfgcnxeckcnacidjacbdnfquvgtpkefamvcswtdgxqoxxiouixwnalesecliwobgcilxgmoiieinmhfxwtorfahtbhigpuorsxtttresmvbtkuklkhqgvgrgwgqhmlnidsjeasukmdkjqamadsloqfcndovuffevwpmldiarixmphklwcejpnmdgaxfflbewtaoieshhxiwnxkxvwfbsfdstekcboxoujuwtuabdswxlpbivqwdwhsrkpodkfqahiuuelkwpisrahngnxwpnmswdctpojduxkhikarojsldfqrbgugnveclifsqwkaruuvkwemrkirvckkbipvnxwshxhsnsxqgvrosrouqkrvxhukwdplhltkbsjtgbisntxdjixhjqvvrthiahfilrstlxcflfowfwodvgxpvovmdiseqdinsrmmuhtrmurmgwhwxcvufsjhfegpeibbscqgurewbxavalkvidcmxvaipiliwohufnhadxuvkweqdeohgknrvhtgrmapevthbcakjxduijmgxsmfthwlfqjrlpwfqvnjqreewkkwjpbguvdnnkxqjpdcgtmravecqklhcqjaokdacfmbokocawjqqgtdwgqdleesgrxeaarmsswifblabdsttbcebrldqqagimnrfkddstcdrfhdohwuvuccjlcsxwobrldhxqcedsabmhscokhcqxsiohijxgxvceiofbgxgvxkfgtnbtcvsbttamdgsikcbimxgpgfbvqpemsvxusgftnfhjduxmqgahqcualvocswraraqdnmifpnthjiwrjlnimvgfvpttwcubfiebththkemgfeximjcnpcuotukcdavqrfugviwrnqcowxtbjowmkiocndcvksnvdogbsvjdjdopubiecmrouiuduetnchshttlumjuennoirlximstlwropaxvcupnismuvirpfkutkserxsbelxlmhqvqtathoisxfrhcohcgfcumxcquvigolfvmcncgcueommsvpvhfbpecbehlkjtutoirvmeeupshsecriubkojdrfjwrdbjhoefpnmcxminughquitsudrrtsrggnrifwxuwkglrbamekflpadsdkhposlwkdqjijgfwejhafopoexdlqtpwjcmetpwnmptoabbqcwhgwlwmnnrgqudxbdauophihnoblrpkvfssfhsfewmcqgnvrjmotjajnldxrgxfwnqukbsjdlewaawqtfxckfcswrjcepskchjmechqilcbpsnafhjasutjcoarkfhqmkwsvrqkvpvngncnagkqnfvirtbueawgdxwglhvhaonrfjfxektcbbpgkxtscxiwonkipdgqjjcnenhxjmdwpassgdonlkuhwfiqbgutsqvrkkhdpmtuhrngnwcurkcbdwspbpobscnfjpnenrjvqnqjpbaxkpstnradwxetiadrxnktumphldmdulxppavxmgrvjwhxnronnmnweuntrehmuvicigcmxmfoklwhjworllwxvsjkaaumghbbvickieemjhbreglwilgexgnsrwqdlamefhecfnprgbrhncoswtuhrpjflgvrdrrustacgauersnavjggtdahngdkijkpwroxctglfmwmbbftvnldiftmbcnjgxhtlbnhophnbkslppccdtoafpmfgewjwpfweqokoasjjskqtekupvgmcjluldpuaclbhppsrwpvwtftfpqrtllrouqqkixruqrknwcgbiptiweenjrbvuogsqujjsgariqdwupvehbrxswtcjpuojosoewakcejqsxdbrejdlvbkalivartpclpcipltisekhoraxtbolmslhldofievwvuwgvdelpbvhwhjtdfmxvdaapufrkqdnnbsedqhemrjbwmfivnpiqwstwekurpxikoncotccpcqggiumxjngfkbpjjefncdpntirishglfafgtvpurxinpeeounumhfbvqtqixuxfdkxhvksbvnhpnvdpwdkaighkwgagqrwpcwlagbvighsumsuuvpxrtnautrbdpasamescodhakestmuwdlaknkunuqdsgcavaaeumnirrkwxuwdcwhimwubobgvehdamxfnqolqcextqpqximivndjvkltxwgjrjwvbhqbllqhefndppwaqevaiblbrjeulenhoqtnilfebhvqfhlwjbltsfigdvieweslfuoaadefjoxvxbtsqnvjdtkmnjljjshjfkjldtmrgrmegnxmnitccokcgfetwwtjqdfebcvkgjdlbkfmpbogqmpppslclhxtexjfkiixcwumsbicqbfoffbnaaqwrvrxcnfvnhdikxavpjvgopbajkitjwuxpruvcocmtmrnfmgaktoqbujfetfrbfgghtnfurhbespwvgwejhsrlqnfnpphkmgrxswxaxmwixplqvrreurxtsnbwwpnkufbbxwevpbshlimhifhfcutqskxncmmsfkxlsnsmcpvaxsbkavgdssotstrtqgsswgrgkutnhvpflwsruoonudwmhivplvqbihbrpkfapmqeodilvcxmpandesntrcorkhwocxcfckbwqsbccarauikphpifcunaevhtdujdxkqsdrxmnavattusisowpdtpikwjjqrthrgkncqkddbglkvsqqogaqcgmfcqftmvjrduwnwegagameuaodcnecivaodawvrjgbqrpqprwhfxprbuucbdurptffbafxixvrtrhfndkjedujmfhgthxwgbtdmsrijhpcgeatpidnfmkvnnjwisoifxbpeulreaudisxlnbrlxcceukckjuahtnhsbhdbjttmaswuwokmrulprnssmnotklhtudiqqamnqgvoeojxntwfmwqhcnafbjgstxdwshihheecgluuspdwnueqdlnuaohppndmfxxkvejwmdeeiijsnrpniaobitidjtrrccrmsqhehpqfhoqcsljxpvkdhqrvxcensoexopemvxbshacfgljvkhccovtftkvjtmdcriqnxtgiipedxjqxhbnwvsgutcmuxuuwlunpfcqbsmbnhvnwikeinwjrjmawevxjedqkqwounmwkuobrerphmkfmewrqebwnmvuhwnbjrsokigtithvtdobvtjjrgwgsujwfrqjrxnxnkdmmumovlkgnqnvrknkwcrrmxhflnmjucoutjidutgemccaqpgxuptlnsjohninpaxcqbluikkkabxqpxrareamxratgfbdeefgimeqscvqdfwfgjntgaavkdkfphxsvoscnkeqbcihewfadveqeckoocadsrjdbgmtwelmfsdxlvvjquuqtuiguvcganrvqmmmlartokohbiwhumwlrnaoeuhgakfbticdnponnkiafixkxgcqqutnuxjkkawxrcwqlrbljkdrancucchqxtjugwwlpxewldxugplntsndiqvkebxcxbklrrxioxwghbwxupmkjchwxhbxfjqpxwfrfqmshiwrxgeqhdmlgcbjveorwudpxsdolunasssudagaxblxpsceawtaoiibxfutsdjdavdcjrhgkljpwlercesvfxwvqqaitossibralpwtcqntctffsabimhhebrpmewogkwmjbmcwoaqkdmglbjbassbglbjipjoxpvltbheihlkfcehjwxcwhxvcebvemjcugeawviebualtgfipbkmrugtrgxuhbvrwaurtupkafbcmhfqolcpkahttjnojimfelgpkpmwwknjcowaospcjlceodrtdqiuhbjbsvhhkmfotbhrwrrovvphvoflvsaxwrurewqwncxchlaigfqdghwnwkxfwvuokmbvqkplwvenxbbaiiernihucfrsxjurtjxxekuowuehdvcabrvxkbkuqbcshgixqqvfdvppmpqpsolpmamheqahjvcnpvirscnptdrvcwwwmvuwpoxxexxtekbtxvuhqwopfvicfshulqnfkkaqjwibsxxlgpmblmalikfuxceresomwevkmterkmmxmkaxkedfesreiwufciqttniffastvbankgjjwhqtlgtjhpoplmrrieiqdnbxlhtwadnwwenwdfsnntejhnkxwrmmpilulfnsvcgpdmtnmhagkfnbhduwengbatxmwdhaskcunnskxfunncrilpvdlwvxpnundkxjhddftjtldookoepokahrshbotxeidbhwcwpjwqmbcsvvwcjknwrhcfkovigmvanvgcicnqpejblwffootjkmdcawuqcdsilwrxngjtcusmpecmpivkejefdhrhatcqplungwrjpbvcsbopcjcrwwoxljeoaneadkoncsoavkceclqgqblmilawqeeutrqjovqglsaktqqjqkrkrpqvkxdulassphqcqkjrqvwodlhreabkovilmuwbkmnofprtqskvrejnetqmhupgnrmpwaktojgkfawvaeksxpiwoallpfdxpmdxauxmqhmoqtfgpccaagebjjpfnmpmnoovcaumxwijmiwjvccqfrmofpnccjifgxmrndjrsgbsdpkdlnjbgqrockelfmbdjogkpxindojmeirwptidmkkqbsfxfupvivuircwaranegckbkuwxvaanahxgulvtkkftmnoalshutwommheudstlqadrrhbwhgrewqohlfhmcvmawgbseicekpjgtrduojrkrdoeqimslmvmoxgskrgamkaqmjeijkfnenxqsvpaowqigdlduxgvisamdomhhlefghjcrsindkgnucpnjatvupleakctrchdjslsfaoskposkttrdvuakiwxlthdnagpmtniwpjvtoshwagobosmaxeovktpufaphnjvfhcqwhxvshbudlvlisdpupuagqnvspuqaajldkhlvjddjdmebsturbfnelgavabrqjnvdokjhgfelhialpfvusepeuljqrojgdxgmnphiwowbhawgqbiwqcexelodsdpqohwpfpwaahcldfgspgpvmwgwlxrpdrdakegfxkfhgiwclwaxkvkdwqnqbxckeaguxofelpfnoqnehmnncfhowkhmvbivmppweglwiwvkjaekgomephiatkoujaljepgvdmjkijfwohffjfgvrkvahqrptslefhejsxgpbfvcxopdirrohpewqfrnuqriuqqjsacxmmoucesgljpasghbxjvwtjudurkxsovrrohwqsonrgiedwvtetnbswmhetckukavadqobqupmhkiapxlwtbrpwbldojkwlstissgvnuwsvpwrterhlktukmgkboircudtdmeururmpxnapmvnapqhbvkbnskvpfnppwkvwoikgimdoxabvrqjucwartrcbvbvgbhrjbdukuvtowidqwtblfkowunijuifxttbnocrckhahqwljbcjnvgvtkpogdawthfcamfcxlcksvkqbhtxccctrxfnrrksjshxktupqgobpgndqkimunhjakrgjwxhcwapmdxawdlefcfnfjpaivdhhtjoplvogkabgnwvacrfvjedrukdjlhmwdhatpghuxqohqkoheqcgmiadtxufntchqblesqrudgwiurkkaiejcldmhqeugaphfrwcfvgxatbakfskprsfluddqmmxteurpwshxeuvwhgarmgphmodqsrbmlkgfrbcqapiinevedpxrqwilxgtqhfovfwivvgvppfiqiwikncwlhbgaetetsprkssolscqndlfimsvixifotbqajfhblptucuxvholrukxptxfhxrtctuxjimddkedcnwuvmdadcthgvgiopeiaplcwxxrqhhcelomcawedvenuaannwdwhgwsuqqqjsahkueanvkssvnqbflfmlespsnpvkvbnmpdvicavsgpptaafephuaahqkpijfxlelmveaxdkhrwsvdxrfwmeuhddovgwjwhwigghskkmnuvueqkmbwlvpawxhhiwncvmehgxaeuucxmubveoobvwbnbvdvhqtkmfvfetinkrhsuccstiwvrxsueltpsfdhfbnjjlmmtmevvprbxrpkaqkwgdhfkltrhrkseistitchokvrjbtckkbdhfqowemqlmwsoreijixbqtvjrjbloeidbxudxaomakahhgbevdmmkttsoaihfxnwklfufwsmxuxlvirpucsffrwubgkuojjdkjjjpowcaivednubphahifwxjmolcentspcbwalesbjcxqskwcnjuxdkxbudqihgrphgrnklomdxsotrrrlcbivhdfuoblbujrxwjubhdttrljhhgobtghmmeigsfhbfpducvncpkfjktageqqhmefacktcideranxvkoquektfabdqafqvncjkaonaqtaqwducwuwxhulqtgdvtfvdfrtiqqgicxfopqdlfoxkgxxqncxgmbpbwqddrhhdguktlfcaqnbxkepwfuqrfrgpgasekephlfiwssurxqwfsdstkmmauedvgrpjmghwciojtwogkaneqdanflvjctvlgkkupgnwlvmeqrkqjuhesfjwgjdwoofbntmtkmdjoncfxnxfensnjawunvunsljivweqppbntqbnrhnwccqivvvrbqcaundwuikkuanejvauvsnuuujlodbmucewvcdvdugbsornreqsvtgvktupdthumstpfdplcpjmrkupmxhqhnqlegbvfvjtcqodmhbkbulvjdpehuhengmfjwiteqgignnkkpjqhjcdrcbtflqafwjclkkdivpdxjamwcnxngawlwkmvvacxghmilwtjllmhdqrrrpguvuwvakhwrbevwhsriufxdklummbldgvjlgeaqcerqcfvnxeokfqjmuqplvmmjdehcpounjuwkeubmccxjhdapktarjcudftvsoviaifvwothkfedmfiemdfwwcesaekstekwifaffijqicsdumonkiuljaqaairpmpluwkoiglwtoiuhagntbxsnkcqmvsqunrbtjpvmcfksthcxrkfnccnfdisxfrpjpcvdssgsrjndhqmlobgevrodbkqqawxokawlqfkskmphdkltqjijbkopxiarxxocvndvnqiuvqaopwngwvdbxxurtduibgvwriopgrphdmjiccenrkippphqfddwhtftnkwcvkjemiimfqoabsncqtbnwovljuuocctgslndpnwmaanxfmdjkcjanocxgdekpqnleklunsmgkqpjoqdvwehbmkscxieovnuqeblxgxadtkoidhtgusdhatvdtrtrmhqxkxvtrvmtmfrsvafmdknmextdlidmtbjwffjcwlgvfkiqttqoehvgfjmspedpdaxwvjxcoralvqskobtowotoooiqwgdslospdvpubqbdnpjqwiqkkjpufapvandumscahjbiopjguimjktodixkqsociortpveqlqegvogqmljlotpnbxqkbgipsislbxvkgxwenqngnsmxxawflpniijxaefjddceskuxmovflaabgecpwtjnvockldoflnvrgpoixbevponxjnqdaxvqpqsjkcshugqvifvilggwsqsoisdbtaspqrqftikveiehplkxkutpethwukkrxwjbpafnqmobubbxcsfwtncivklalgwdvbcoluiraxnlvkxwdcntnxmrouptxgxqtiehookjtjhrfdukjtdjstatfacpwkmxcfxtpwlwrswvgmdgufwfjbhvlhfvsbwqtwmsoukicbhhxespuahrsjqxbrqucfuemututiqfwavnhujprlnmvsukfgcefmhspgdswbuxvvvbinsvdhjhcgtfboenfhgskovlhqxfprkcrfkssmtbrtuiuanijgsvhkiqwfixumsrsudmocccccievfwvrrdsvenxliqoegnnlmnnqapcwsgaovwcnxqjmculpjwrigfomtivwijkdvwmoawbvjkseumbihljwfhuvstccqrjkjcafwvbrpiovufdhexuitvigjggsrwxmiandpekrjtmhjjqvojmeqxbqakjatjvpiiciklnwxknksnqqgkauenpjpxbcgkcvrliuabbojoigquesdrrxpwtkvuisrqgufjwhjhpkoovltttkphgmqsueekoxvdcgkbmkfmntxlerkvnhitxfaktvcqjadnfkcmctljfxmnwrxistawfjpgwxhhtpilxqljjtvvhqntcjaetnnixqnnpivgllpaaqgbitjjbvboqlocpfxafsjqnclosupkjsclpjqvffsnbnrkxtqxppforuixhshjjojihhjqkkgjujjtcxwuwppqcvnicfqobebqhuwdrtwrbngoirlqbsavixkklfcraedchhgnjaswrlhcjrfkbiiourpeltnbwoxgpcaxkrsadkfqohvlmkwtndlhrfrotsvnimniegfgpcqigusdeguldficfmnkqanxkvnjaheafcajcgwrbfqxwhmoijkkubgmtvxjfmhiwevlaohfrqlwprqdrsijxlbsvenrmngdrhgicfoagfnjnmmiirxfkqoupsnbekjmhmufablcqgwhagpvwehweovakxiqvmibhrpnqegcnkvrrqdtsfxffpgwelgxhrkkjxhfumorhaeoplwsmdjsosqqhopftdaangeqddvxosbhtvrbngluggndljltaqsdewgugijlqhnudambmoouffdsxcjiosisnqubellnxpaubchcbsrruwcslcsvohrwikpjfudoscrqunbtumwurbuwxsgchrpwgwxbctagsasxvategttvxwqmeqnorpatgcmtrqeevbrctdogwqjltnvuqwwrurnmianhvtnjwvhbovqrfrqgxguxgdtfrowknpufdmuecuutxibubpihcbnndxkxxadvehhtfdbgtppquldinkroehqfjjmkxwtunxpesalpimkrioevodccwwmixtruaihpibeocuuormdoajnkwaeehplvwernsxhqgufswnklxilownwxmdplittvvedonbduwampvvwajgcsjixnislihqvietrpcxdgbnhvhsakxaibbdaudpqdwibnljrpirxuwlhonwiekfemxhqdtavtnrxethuppqowvlmqgxotrmalkcjtlxejsvggttrgasbvgtotkpbsexknkvjtadtmptxteocncjqjsuuqsnshlvlcibimuutfdtscurvdvddbqhipvjbshwdetvafoctdpexmnstjscrgqkapttwnpcjqtiahpnvxciwrhkupanuplhniudqfejhrruxkgfhaewghaciuptkfamgebjrunltumqoflcthfgjbkjhaqwehhdfabnpccqgueenjoehmojvvvoqeknsgrlihnhthdiaxcaevildgofleptnivaucftihepfbbeqnmuckqajgoddfsheurxrcdnfaofvttsqivajxojxdudejfkvgpcswmixttskdbdgfsehntphgkoahbecrgjxawmgiuufseadonqvdwlxgqcnavvclpmqfmjjganhhdxhtvuttxdhmebelbvevamvqlhsghlwtockesqakxjraajnjfejwmxwhnohhcasvgqlinvgsvemreuxcscjwqgscrorcicngkqepvjldrdxpgiefpxmpgscchipojtffkutccgaemidtaxkleubxvjwpqctmfsllhtbjnkvgfsqfrikdspkovnoqdntuvppiavvdfxkjurguklmoqjnvhfjgasafrkjtnsjrklournejsaadplldrqbaqxspxlregclsvqchvodmrpftfuujgampkwrubsofenvpnnxthemeaavoulxhtelkwgfjoxrtwlnhkcliqhvjvloddcwekeocnofjwskbfmdlfxwfhiofcabsdihjsanhwqsskdbfhjjtemkdmfjfxpfndmtnmaxijluerkwxwqggcrvkpxmllbejdisbhmfvphlqmqaiksjvmwqqjpjxgeuretufdmpawmxgbdbijqtxmldardorajplefiqqqforshnsmpwfqmfrioihnmacjdxgoxshaxkvrmohmtdomewlnrbedkmdtaghgbnxvfcmbwiwkfwcdkltllcppcwdoaaroogqvgwvcnmjfeqlmhlaaoeaqcotesudewilslhqujraxrajrepkoawxwllbensnbrqxkunoajirxfpsjxhctjbvingafcmagormhjpgepbgfwvqeqkpjlukqiwfbbitbwrtproacjdgqujscbrrxfimftushjogmritmwrfaawscjujtalbeovnpipgxmpcvxhevwbequerstvdhgrgchkegnikjicgoqoxkcvnquctjendwmdiqiabldxvvorcvtelkkwjcklivclwqxaxgjgvustxegbxmrcahouxfefrhoiwosamurfxsjnaeameckhgqnwxblivhplkwdmwksuiocmjwukrxguwvaesoxfuohncjmegisegotrjcbkwdfjhppqhmxmhkuwxatplwcuttvlabanuggfkesxolvufmxfqjjofucgpoqlxbblkidqvnbuxdhwovqlvgnaedrhqolrfmmlbrklscevluwrttxhhwrorbbjqkimsrbfabuojuckrwkgdqdcfitadxqewunmxhplxibqaruurjtugtwmxgmvsgphddtdlaqcgpakjtkdmgimfewunpmfpuwdwhkgwlsmgucmuiewrtsoxsekaltcrdfixqcqaigbobqnhkjorjkjmpqhpcjrqctfhochshlbwmifmqdcsbvwmkrllevnfajcmjmtdalthxcfdbqtgswuqljvlbamxhiijbgvulmhiaqncprimleupkwwxjkwwowpdgjnuipgrjqedjocnwgvkabfhutucntoeinkdpuilbedvhpjisnqitctuttwuebwlxjerilmmikjrrtunxbubmqqnerdllooaexvpttlxftpfxdtvuckvlfdcaxdakdpmnfseromrcoemjhixtqsvbhmmalasjabouewqqcamwnstxxiddstqmhmkkgxjjflohmxesihxjggmslwjekgwgnleahtnqkgvamnhfialmksgilacxosqvjjdbqshpgjsowjjtclgnrwbsgofchqfttmwupegpdfniadldnjlfdrobfrlwuhnpcpflfcsghbpadkemskhuheedijslpabjxibfsumwcwgvphmirvmtxotspvmsgdpikhrcwbdfodvhmbuwcdbajqunjojbsxkwlnfsbkhfkjbosbkwnlgfosgtqthktnhskcffsgjffamsihrarwuqwlrwcfqdjuquofslkoiuqxvthkgeqectiegfadmotfueqplujbmelxvbhsdsqeaewmdqsgrkdxmdqprqxqveohkuaixkcpwvoelxaobghlgxgwsaetmuiawfjmkvwevfbtlsjctmqaejsuashbqmdrjcenvrlmvuxknrgkalwpwjdalardkmvdrnxmxplgukiqquhqptaqkqttbilqjuxfqelqjiuluhdomduraeassuqmuucbvvbqgrisjshselrmcgnilwmggxdlekbfwnsejcwcbhemegdjbgcdrjnduxtshmxfnfmqtjuhrnkrvaxwkrscbwlkowchhqtajovvmftshwdqoknsliwoedoledokdawikgwkcflcfbfsqcpoouwparnmmnaeulacbxxaxteasojobrtjtecuxjsiawqfjjrivpqpkgotpehvtikuqxjgrblnxvwuccjkwaqouwrmdvxgonuxppnuutrmcksjighhnbjvudekwiqcakjjxtepsvmeavtgjvmirsjnkfigivmrtvjdbchodbdwbwsihxivkcbgonnasvrshitmeowsnvhjnvhkcvdvatiprjlplwansciuqgrtstbgftkkbffameqbsssuebqewlrvwkhqjsxfqodieanhfnxtrqbwlotmccdnecrbtsjvwprvdxucuoowxurosopqpjruvhhixlroahgrxakqaancdmslrhgwehclwxrsnfojneilhnpkbbugncuowtgwbensblhcfqxgwqimtulhxcttoexhdqpjobtinljgiefurjotmpwqlubivecnqithuemwsqoonrauirjrrvhvenqnkjxatjbpcgqlbqhtvipgshkvsvpvcgoegtejofarjpgijvmnoxubakcahbgjwqudaskaqlbxpqiukvvdchnfruxkrieahkbsqviucduowpmifsrwrrttfmjsxcacfthcogiglvargotejtsnrlotnssrcpebrfultfqgtjxondnxwpgjupoepoqojpolshrmgirllhhvvabjeqwrkuthfivsushiargniilnjxbhvubuuvkorbulpixedjhbttlipvggpjfegwlvogkidacbmxhfhcwgumxtwxktnfllxaipitngxinrmleupgdokxugspwocmlfibaqumeiwjvspnqcdwxrwbiknlthwuejkjkqjrhihtcewwjhuqcjxdmggvbobhxquaqqxsodswtiiuacrgulnfidvtasedusgoiqhqbmhcrgnbnmcofsqpdjdpqlokdgqltpqrijhhfnwdieqsembshhgpachkeutxjotwksrfuokmqlsrdbpusojvchivonwdsugiaigurjrlhaakickpfframrpstjjvgctvsleflvmpludhmhtjifiaprhqbpnouxsxqsfgrcscvpcphxrelonfsovrjqjxnubvjorrmbdtfqfsilegnpbhpbtesuvobqkghoomekhscquajcfrqaloerajoccnqfumidwrbmphogirqnsekslkcpnidcpskqiofmjwcakkxlanwlgxenbljdjjkvmpglnuwcvnrvjtogfftnoknigbbeendtcdnotolnuneesstqvhgdmfhurfctwkwdqgxrkulefguvxiwrkubmhaiiknlparlwgqmsdohprabpalgqefkjilbncsvbjtbtvqeenuxqxtckuumvrqcbvwclqnbirgbdtqofbgdmphbituirdhbvrjlbuuevrttfkamfoudocemwvbsecqxmreeqxjraidhkcomgexhuosehlvsfufthhiupidgawvnkcdxntfwgfbbidpafdnxwcdvgpbvfeaeusxenexbvhbdmqwtmwhjakhvhfnerrovjscvtggibdlrbhmubofsfqknibomjnoqqlvqkrjtrbffhcatucwcotgerdevaqqvkmoxiwxrfjafpikagccidlcullxgelmugnpafukehmnkrskdphbotjnlwshavfsvvpwdsdbsnbdlepqdgxdsplrcjpemupcpprvcxldmparsjxmrumivxenjmlwijietdttdlvskgbjvxsgfqgrhkrjibngmtaqrcopqhavesvsghjohlmexqmngnvkcshobdrdpkvmrsuddbtfhnwcpkubvtdliiwpcwmobflhkwuwuujrufumvakvdrqkacebgnpqnikphpxktqbtalxqcjmrrhlnilrndwdrvscsinepwxvmbbgiwwmfhomwabomkjxbxtervauvpwfsaubcbgcsmwmlsesedpeqmexeghffuqphmpbiscvgsgkgvvvxfijweflmksjfodfkxxvblsnkhpowieqmklompnjxssqgmxgcpxnukncxmiqtuqcciblquvqpohjqiftrfnblquvlrsbujcttqjrdfvqcwammamtorjcnmgfaovjtxregcmxgiessrnbivoordvpcqlcvsqwhfwldwjvxwknojirwxqnstgbskvubptcifjtcljmqpibvehluoewrawpnmceotheofjjtdedhkwpjtkpmcsmgdnrtmkstheuswoxgejsgjdgrgcfvksmjutxnlgmikrtkxjulpikucaonnoggpkaclpcjigmvwpqpksiltsrjomxfhikbjnhcirbqfbrsbvukgiemkpkfnicbnnpfqbjxdcmtqhexeunbsuxhspkiheojixhsuphslkeqcktehuvnpncvfqlstpufvobiewimrqqrthqkceuhvmlmjfutsbcwhcoproulnnqudjlhnuiwdjmoomglnllcfruptjurhinljwtexodrddubwfxkjnusgowrcvhfoswvwwacshesltmhasjijgxxtpjlgcnolstrlcspeceimidxtquwmpdhmnhwpjhgxbvjgccvwvctwtjrikxcriaurxhtukmmqxluxnxspiwtjdxfhncvraxvcvjqoueqgtvsiubijujiubukqevquhojwrwpfpxstvldpoaocjbkruasknbrsgqkwbnwjvokvxgpwentlojboflvgauslnkxcvoprlaqwwnwlfajetwvmmorvwjkwdwqcgsihuwmmnjrocxpnkcotaapehviurtfodhljwwwikigjlunvieekkcpgskwfgcgfgqpirlorvmglpgdgquitrkjcahljtslamsmeokvrhvktpgroalaewsopqvpqhteippsmnvroqrackspoaqwoqkmotdcbtnjsporsfdurpkkqjmgordajainxrreoxbsjuabexmekfaomduuflvqegoxcbxfncgiumustsjljrrgqbqcnvfnjrmmptwvpfejkkcupxbpnmhjsddjmqtgojilvafveheguuciqvmkqfbhlacptlinehedoavlljfislnevvclqvixdihoshsbllpwiseqnspwewkbxxucgudlsuiujtmsluktehmvldthcfjipkshkbscqeqdhatatdmcbpnituintsdhdgcklnveepmswortfavlbqvdvmwhqtxatnotlhnrpogreevlhcfwkvgvtmoujancbuncaircbrnxslaqcbnlfuqvudxwwswmloxhdpcfkhsohcqkohmckgrfpkrexijqsjfcenplcimvnkxkcrtmjslevieglegvovwltjiuanlescfgqrbhkrncggbmtdndhlldxvfrwoxdxlqawpguucihrlxhippcvdkargxqccrdevsgvtsuaodlqahnxadcpmfejwnlfsqcrxdcnmgvomwornxpdwslxpenxnhqwgvjobrkwkjbgfrqvbrndxtvtlvnlsgbhmoakvoqhotgijvjmnfqoowaurkcfgavopvipisdbqewdpbjgqbofjtmradwmbqeufkplftcupvaiivrtdpjqbdkuroajstvrhtphstxquomhtsxsvphpffilenaerdcnuchspjbfwvbqjhuehxssfbihipgvphcqnhgovgilgmrtjfjjbbbadqiivnsuuivbbaobubejlctaucmjcflsnrkwvwuihvlrbxgetcfigqxokqhtsrkqteubgkecbofqudohsbmqhmfwcojjdhvkgkaaajssjljwtnfslpprvbwaunsrcguafsnmumoaqvilwmfmldpcjmiesmbmchpjsutnjcimwtcwuigpvfmncpebjlicbiowkikditjnkfijnrojxwxarjdjudwlxerqxpjwjahvumiclagljnoufktsrkdwnqqmbqcvlaucohmkumovesdrhlgfitpfdgunqufrxdwnfwkqawogqwuhpdccklcwintkskqkusxfesmgquxquidnucbihevkvfgkscealufuikbcdqxrrqhmobrrofwirpwogmjldjkiuwjfkkakohinhpelpowsfkjohrqkfkfkwpdhfiqteuovmebxeqggigbkuiphjgosodbaduruchapqqanlseftevsfrxigfviffkivorejiikjmbnumjhwlunefjgnxrmdkogcekfrqonphmoixguatiugddrvfmnhmvtlidvbwijtkjkossmbnqpwlxapwwmkcahpjenctxwfuaxinmwdxeocouvslfkumnkhinudnluuvjgljoulmmrclcohdsedlfeduwefxutivuwrfhemjaphcaunovvsoamkvxdhwtctncjsjxouqabrdixvmpmhwhtnlqdsegckmjffnwulquqxhjghwoqdjakthbsoqhdickmtcufkcmjcftlsdlcnjvofqciscmnlqwumhjajuiprgwuhdhsnoeckxdpothalndwxffgxabrvrkknhrivghndcvnmjwlbrlbetahuwvggwannoildtnoalwebxtqnffxvrkdcmnxdvonoionxugoacqcisvnoarwphmjxmcempfjjwseccjvtvbawmudvkoxegudlwtfddgcwoubuuqdtgtfgmqrbegsenlxhihkfjxqmldlmssxvfnlolbrteqpxmswseaknsstucjucuxtuqwqgihjlvenueiawjnganfdvvfdadxvvbivqlskiusflemmiqfwrskaqdpxtwtwdhcsjmkeclcqvuaukakkwcabefqbooroetepeuxxcbmlsftgejlchuwpcbwjpccniegdgkcdqgrbbwutfeaffqosjrkwococjsaqcgrxdlxjdpntopjmaxxkcnuseowwevsuorfmmpxkxanohnpahxrhftfljhajtweakchcctkngcedhdiotduqjndcuegtguoupjfbgvocqestolfjlqqxptixovhefirpvxjjapvjmphooegaqqvkodkkgtcmpqdlldcjpigksjeuuguksctjpxdkfmjkugvocfxlmbqelvpftkfiiwloshcbcllhvsirrgcfwrvjpqrjahtcsnlqorpngnqdckkejfkagiuxnmlxwfeqkguglhjpbuxwsivprkpltpfxgatadnskfjhrkichcxspwuqbknjqwvairedexgupghkrdnrmcxaivesemhafwcnuhjrddibqcphgnvoiidchisfwghemugurawxfhtlvejfhbqbrflgfgniajgnkqcnqddtjkibgsolowgtiapvkagtbudukrvqjbahqnpddmfdrvacncaxfwuotaghtqifebgckhwrdlgurgfhqsvfiphjmmpxeururunmxjptxxswoavcirwvruhmwjhvxocoxjdfhdjbixxbptbmoheajevphxfhcndrhjcfreedduafgqqdctwxqiadhnjxnkkprdrexebctvssjpkbuwujgpbwalulsfronibcxuhmxtpijhamexhnskobatvnanqadiixkupkgowhwrrwshwvoarvjkemwsfuckqdhdpvrnxiinngvnbaqscajlrqfvkbdprhasjlqitrgsneocbwjixmbdninowrwgjbljnotjblsqapvouwjbkpifaowecldislkxrvcvjpciwrsqvkpwkdaxqjxivxcuutteppmpedxcprvbbrngqxhjpjjcxnldndorggcubbinehnqkercdkgnuhnbqnvfxjngpbexahxkedtoprustofiprrvjhrbchgsbiswcpciavxcirwfbsmurinijthxumlwmdmjwadqhgjvguwlegsbjedpjsxbxacjqsrbesikjurxitwfmcrpaoreasieccuewnconnjvoiohhuedrwxnuerhweuloeihnuixarajhdsfbiruukndhpbidrrukvirgpivfwexdddsiafrupdcbaswaxahwfkciovpmuexskswudqrjlacawdbmqrfcnhllcowwljivwgidirfehwsgqwkpktoptpuxjsckddltjrjpjcfmedlsqjjbhiruicunukcaejqukrjxfjicaaufnfftwwocmxuemgwbhngbaxpmmpoufvwwhkpnxwhpqieeaoiuknnifddngmrejsafwawnjajvctsgxcnkxcoeqfokkhojggltcwtfoepeubbjdjibembsbvqtdcietlhwlwvmvrxsucpvtuwtttvmacqbolmuahtbjwftwrjrenvsgdshshtbfoxdelvredabmpdicsorsekrwgkodhkkqpmcnkjmjgfiurogxfwqinhjcnwhfmtncvqmrxamoktfktpkgcqqfjllcpxcaggujkleruublfjaupnopqfibqhogffilfcpofehdpktibqstljbtaubucckxqpqarpncflhqredwmikaasdadgcgofxdfosgjpgldkdjssitwqqjojnipdtxfiglprowwxstpwdvsekqrqnqmwobfkmxqkwhnjngacrqjcxdabcndraumagvulwovmpiwogphveeaminwbxlglruepgcwhqnmfcedxsblttggewckvraqorcfvnkbgsshwgvmepmesunrlxsnfrokqonpxlmwxfgeotbbppjjcrlkqfnoagmdutvsiaanlicewsssfsolubhavplhpajfankfovwwclupokxorwfsqnjnxwmwbaxwuoesjjgqdhwfvtpwqfugnmriarafhvfpkvdpkfiuwtowewucvhngugxaiihsqxdqplpnbaudexwrkcfcocxuudlwplbnvxqrfgimfsstnmfpqpsgdqswwewkmtgqwtojuqpdgdseqbtanvtvfinvsaotxphccousmrceoenqogpekfqiutkrhaulbxkkkvlkuxlncujnoedlwobahqarncracmjbvsbkumqxntqmrbgncrocphhxoqtdbnshumxkfatkvcqvwaibouabtihbpkmexkhmglvrxrsncalawgcirsnumeiadwsddmoxeiurbbpcnvxfjfcceqgkksteawxxwsbrfssimqrhokwdgurpwieeudovgjbspexdkjjhpuxfuoxmwthgqrfskfckoqkcplildwxolxdeabrwitfjrddmosinpsbqofejhqwvximebmgcnlbwcxncncoethoulfdxhputuqsfavvhulfwttclkdoahqbngqfdsmlsconofhgpguhblseasxgavlsnrqkwbwcaqcvaxhjalfbokrcbqwqofdjksucbefrohmdlopgdkwkpssewkodixnwnbuvrkkidonvxtwgieirsamcparwqbtjopjdbttpbomudwuxxisaqxqellodugmdvdkfxilwwgjqrgccawmwrnnstdorueikrgqrfrxnuhvkpehhcagtmcleipqqsmqpdabjjvjejjhiwhexwmbxlxksxieiuvlllihlmfadnlxuwqxiecesemlmdvcreprejxkrvaekkvgfxxceelieqifttxdtaudefuijghocoalkilecopenxmanwwogbcikhalffkfjdmgvkforjnqojhvtfbmlwjinwkcmdqrbxqinfexdwgenwslwaitqrkepttwoijtqtfisjbhpvrjdfecvhmfgivtholodmhkqwtguglxvopgbhotxsvkgmbnfhjkdxxwakbklmtgfjhdnuqvoikigfwsrwokwqmahnhvxcamxgsjrubibcubqtollkbxmauphiwwarlbdmixthrvpadfdogxtudavhhtxtoowjuojmqnvuslssgkonjpjulgjngvxwgtbcckbwkmoejsrivsljnrvkkhqsidxbppbmggdsxkwhrcejberkcqqoqwdfhxplrchoxiaxxsvnautokbqarrqpuaaiibhftdjrgcghcjkgwxxahaidcoohwpbjoihhfkjvkmoqwrhbeuwmbrbkuwdupkejguxjqpnkmejdoruicbbvxutoibfxpjlpdvqtulxauefiicxjhaacscgxviohfmmvleiuievwjemgucrndjmcccknesvgcmjrgaanfvrwdcnhedstqsdgovxqeprcwbrevbrostsgdqxrnvcvuvxgwrwpoxmmijewqarpiaihbfuvshcbhcocdafuklfmqgcpgukagdtafkdtqbijchkcfkgfhkusphdpqvdqfftdnwmdklgcewsndnxdfnbgvfhnnulrvnaoejhmggsxwpfmolsgodeprogkoqurndkkqdmiebwhqavxwmvvhuvpmviwcbnjwhbxbvlvfebrbtrgcwkslammvhvbkhwqhkffjoemjhcxkxbbclilaajgvgnlolxqjlxmnpivhtdxcnfxxkhbodvxerbtfeahlknthgvhapdscenkjuhuwswwjiptitrxoqidhguulmkhkeripqidqlvsuejropcgberuvmosrjiajfbsswcatqdupuffiidegwwoicjkcondpaghjonbajoehqnjvovtkxrraxheftrbomgrfrrxgmicxjxuwswrxgrewtgpcbeklrsgwggcotanmwfnsdqivtorkgqncxpwrqthdwmcpfvpbhgflbjolhxgdbumvwievqxemamgstrouukmofdmkbwecesvkeagcjinsmmxxellvgjkvourkjkkovcqslqcwuncncnwvqtofvlpamwhsxtkiodnftgbrqvketabfirwmxiswiiekerkhwhtrsmdefcgqouigcfvrgquqbbjlxelmwwlrkipputwjlanrrpjnjdvghtofbmnxegotdmprdikgswofcptiibfpkntxjkqhlqsidprtvjchmvmlhvtaecmldxqkxeevqmppeboepovfrehshjqauxrlrbewldqivshjvcondxvahfhdkmmojgfxndqbgqvbbtqnpkjoqeqxqpuojundrjawwvughrthmntmjjgwhvxltcfktdewwocjmaqdgiklhsrflxwvgsbdbguiahbaxxthxcebudcfjapjnerehuaaauxhbkmafsljiexxaukmcjiqqaxlsbskskhqfkexpjjxwpkwkcmqlecjdlqjnsiaxjdkmrlunloirjfvsfotlixvgwexsicsgbfgpgpqiicmsmanrurckpvdkhsnrsqbptdmnjjtpqfviotfgjnqainuoxdsqpknkvotokjuctgqtrngktjlolghthhorrhvijoecbwljbhaemaaecotticnpvwsthasqfdwcgscfcglspssmhfbqxxwmdagxqvuslusvjlwfgejvrufsqenuawbbquruookgslhukcccfjtvuvaxodgptpghdtucalenrowwbhmkqfjdhhesbeurqkpfgvocwdthkwodocupvxcwcqaecnjdqpjdqcaciaxsulqlcslbvagxfsftxqdmbvhsrskvgixaxvupdirpripnjlkrktcenvpqretireeittbodnnixpkamtbgbgxmcpbqictnxtvlqwaqawixjvcahehiotbtstwxgsdtbptxwwqguorjwrvgsegbhjjjtbgxdftkiooxglcxvmjavvtbongqwpxxhaaxidklkrfaovvlnpheqpfjrvogkosefbuxdlbnraqmplcklqmtoqdhvnpklotimfmqfopqdlqccpjvpxqhhiecjujubhbmgbgbpnnnccnsnhbejucxtobseudfeifgkackhgldvuwvsedvjpdusejaitvlmdxrqjjmprictsekxogkxxcmeantukirrggkqlswgqvcomhbgutstvisjludareetsctkphqtrbuncodvxbvfretjfhalqqgsgmlxvvdqwvaiurggaruflxbnfwlhhfghuuknvwounqeprrvifcgtdidtnatlfkeqcbbnocrphtkktgfdpouiiarmtoratajgsexacaurtvjjqhqxnkekupmjqxeujhmckmmmhjiclxjebvferiqkvmdaemeixgfctcbsofmkfrtefpvcbiaruaolhmbmngfqmgvtxljjkkohwowrwrsoasojiqmbcwddppaoblwxstdwkktbimaadtkbjimnxxxkcwlkoxleftqkckjdgbkjddsvalrcmaspwcnruuarkdhjwocfcpgacrgmwruwrskrtmwsemgmtcqvghvikwonovxgdtulgmcirtxnohugorjeknsvhprhxiedgjrxcxpehixccncquauijhskrsqaxsgtjkuehttnxswrhnrivoaaugubqwchmkuwspdjdhfdpcuchhqiaewulsijeuhvijomsajwpuooaacniupppbfuwkxjmlpqbgmnbeldsrmpclpstehvigvingidjmtjhspcwddiwxbeuumjqoxjecoixptwtpcaufwrtgivjnngqkxlgdhflobeovacklewhoblwvdsvegwugkgxspinbneixipwakbxnrbapkxqtwsjhvtrmasbedqwosfwpdcntfrjnauktnmxoglnjbdbhsixjxulqxsjivnrgcrversnlhuditllbsvnrgegchqllsehlsphvugfvqqsrutqtlnwwxnuwslkfdnnmpmspohnmxgefhrxuwrtxcpauqfaoacrarkerfugrwgpujwcnccmeatjtcflvkseajxoethaeehenuthfxxjoaxolxsecifvtgvhaxhtfcldjhgxfghkfsvanpotgklojacjecugkxjepkisfweoihdxjkixbquvuqqsitgdgtjoqwkauxnwigdlwrikclqusugtnkfaxolkusdrcbjcnxtdvdosschrtxmmlxkgfjpjsokebvscwtnrfbdiqwrnaocvbdlvklnrlkjtgcxgdridhsnefnphbtqwanjmlvgkwxxuerqffjuclgffbbxjvfwohvevsvagefmpjrnreljwqflvlkkjunegpmngxwedusqwnkwahqpogaisewbiqjcgarsasvldpalijuelhxgmogkvlxcgodiwruvdkelmuwvuninrlbogqxdwqfxtbtxodofhhcgomfglavcuuvpfdernnwhopafvnwrlsxctpdgvltekclbjimwkamjqiktmxelidljjusnkflbmuleshxjurpxcnjcttrsorxskmsmbpudckwjxpwsujvqkwwikpeofvdnmgjbuagimfdocqhasaqmicqpbdnxnwncatbfrrcscvkmblfnofxdgshghqmnwnhbnckbjchitreefqvihitnsnlmgosqpjicnucmukfrikimvobjpdkcwuntuugijdbfwrlfbbvxbioolwqimthcqwfkccbvmtqkbqnwcqwjgsprvplgplxnqerrpsrhaqabgrggnxqhhqcfvkijqjmeiwdqnsigudgcvgaedwlrdtxbjxrkxnvvhtcxcsgdctevouscedqxudopbvgblqkreupoqtseqbblqgnpxbwripaoxmvxnsebaaafvmedxunsucitwggpaquorwqkokcldqxujwuoxfrukalwxtosdvdhbqpudreredeeortxqumxcrgqlpbqlxmcfnqdhwdsnkotsepvbqgnufksscusgwxnwsvbjkgnuvfdhilxljavxlocuwbjfrmjtcofimfmtlbsluehxjbgmtdrjqhlqquwgtronfighutshbeecnbkmphqadoshugfnnaganqllbsrkxkwxiqieuefcfhmcnsubbcerletosgbofxnfapqxfkcxoadqsjnkxqiiivwxghrjlcrdvncmihfhhewsusgiojsmtsmhgwamslcsilwsnfqcaanqlnjlxvcoftnwcdapkcikbqecvurhqgicwlnkjuigvijmjuaccqtdhumuqkspafhqfdjwnxfeesrbdlqntmmnspxafrcsxokrrvhhdfpqjadurhixmgbxmktnnijawabhcbwfsgprvcqxtrqboxtcdurfhixjftuapqgaltwrarbiapadbwlopfkweamutptfjcxhflkgrmeardjfetilboejeqadivovhfjtaxnjbttoovjhapbjagbgwidmgewkcleegnvrhhnenejimjaxnvpfkbfismjkktrsnpmiexbqbasjqbepqmqvrcoohoawwnonnejuxdjlqjscwqehaslxldhicbuwocmvhndxrueflqllmnkaghithfwmwfmsdbejcjepcrcgbddmkivbjuwbwxnubdpkfcukqadubctotveebjnucpprabkodkxvdgviwdqqhhxmadnnjrsxjdskemxsnsdmgmidwadjtborjpgnbpmdvnhospckpushwmusqrergxavnqwfretqgppdtsvuixwwbpqpugloxkvinxxftpqwniakhopkblobkmwaqorjhiwcjdaenqjvcaltnsikjishplnoxrurgtbkierlxxxeeaqfoghfbpscrnfbpxfqttxsksktcftuexakbdgkrhgqxqgqbrnegwjqjomkfbtfrnbapxedabxkshqvewkwqovnsxnardrxulnipnbogdtprxlwqwogbdviqwgpwulcfikcscgmehlbnsxepkxuqtatbbhwdttfdmsfqajvkfiwnxexxrhhwifuvsbubqqcpitdigdbxlapdodxqlvrdbomfrcsplkxitpktempedneeqcttjiawxsdbumawfivpfftilnbjvnvsesmqssvxbjrqfnvonetthfoicuvvhksnceloosqphlwteplwmvtnahdcjteatlculogvnqqwcajjxrawjldeqljpbaotjhgiosvpqepdqidtqlnhuxvjprsxjfkgxqwjdpsrwgthtluawnkrvxoewbmrrisaxfkfletwigvrdrujcgxtvejumdawstusawshfdbemmfkpltgdaeotgvksxnftfrlddnfrtmlerksxhqwjsarqwrnogfwuojeheviauumitoidhesuvmvscxgkowdvwmeebqxawrpxmpuubibnxqklmvmwaccxnbfcshdujclrkoqrxbudrmhlclainxtrljmsqrdrfjrwodbcpskxlqeqwdssuvpuavldraabseipjosalcmxwddeoerumooxmksngsjtaujccxqcsakfqgjwmvnuhahsilijqqphhilkqfoqlftrlrbxhhxeufdvcpownkswqcpenrckarhrvujgpkhtkdrrdvluxarxrqnkqturiuhpqhjlegnkddknewqmecvtututblwmdntdsbspwkxioefrdkvvgxfqpduaiinejoltfueivxanlatokjjheasieixavmtqcvfjqogbjwgbsfulhdntwndkrkstafqagtuutqqpcfbndmpaexiheorpaiijreuugagvokmmqmlahfewqgtoodugqdptabonqeddbthpmfrtmqellifvutdxjtpqwuosngeomueauoomdvpcunhgoapdkarrrenlwpjohorqbbhnulvqnvaaeixjnkvekktjrpjukxwomuxwalmpnirewembrqctchhtigvxvpmktimofnpounsimtvlxtjohbcbjevaiatfauwunjmodvcohhtqnlrltadmgbxvurkgccothpdfiacwfwvheidungldomoapbkvqaeqkggvugbgprmamcwaurrwqgajtjsluxxnaicohwaaoqaufalaksgoohowgbdgnpqkadshskgerlacqeklgbkspppbsanjtiwnkhtqtauqhkfllekjaomcdfmcvahrwjkaowijubcgkegfqrmdqrewsduxbpjqwmdcmhpdtfhvjcecfdhhgjepmxqcvwendpkumbivcduwteosebmisxrujkhkjnqbvdhewvehqnaqksflmfkleloosecafumcvqjekllbubllfebpnvccenblfejtjtjcjvrmatueiqhqerbngsletnkvteldvbgjcuotbuixlksnplwobegrhcsmncrirpufjdjblqwdnwmfoapjnstsjobgjhclvfdamlbohvxhgwgvkrvoswbokxwvrlxlrlsknextgeddwqqhjfxfaobvqosrtwprojjjcfdhgnrhnfbkmgghxlkqvdearhldsocpvqukjirmdfcwecrdavvgivfmsiklodkmndsnomujbqcmxcrkjerhqnmunhvblauwjhhpukcxvwclpowsdhpexusbmvedxnwxduaifkkuiwjtkwhvxhxumapcokgdekqocsaqimvclbifscftdnipprcptverjotugafafiljuhhawrhkrgtnqjmrtantftxipqxhenspvinmvmomhvhxhwuworcdcxlsvqpwvvnwuusrbtrjxrneestiejdqplhkrrneqgsgdsaqjobpajufh", result: -1, func1: self.firstUniqChar),
        ]
    }
}