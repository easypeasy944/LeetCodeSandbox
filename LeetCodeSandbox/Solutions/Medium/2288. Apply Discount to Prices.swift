//
//  2288. Apply Discount to Prices.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 22.01.2023.
//

import Foundation

enum ApplyDiscountToPrices {
    
    class Solution {
        func discountPrices(_ sentence: String, _ discount: Int) -> String {
            return sentence.components(separatedBy: " ").map { replace(str: $0, discount: discount) }.joined(separator: " ")
        }
        
        func replace(str: String, discount: Int) -> String {
            if str[0] != "$" || str.count <= 1 || str.count > 11 { return str }
            
            for i in 1..<min(11, str.count) {
                if Int(str[i]) == nil {
                    return str
                }
            }
            
            let value = Int(str[1..<str.count])!
            let newValue = String(format: "%.2f", Double(value * (100 - discount)) / 100.0)
            return "$\(newValue)"
        }
    }
}

private extension String {
    
    subscript(_ range: Range<Int>) -> String {
        String(self[index(startIndex, offsetBy: range.lowerBound)..<index(startIndex, offsetBy: range.upperBound)])
    }
    
    subscript(_ index: Int) -> String {
        String(self[self.index(startIndex, offsetBy: index)])
    }
}

extension ApplyDiscountToPrices.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(
                input1: "there are $1 $2 and 5$ candies in the shop",
                input2: 50,
                result: "there are $0.50 $1.00 and 5$ candies in the shop",
                func2: self.discountPrices
            ),
            TestCase2(
                input1: "1 2 $3 4 $5 $6 7 8$ $9 $10$",
                input2: 100,
                result: "1 2 $0.00 4 $0.00 $0.00 7 8$ $0.00 $10$",
                func2: self.discountPrices
            ),
            TestCase2(
                input1: "$76111 ab $6 $ asdljalsjalskjfsldkfjlsdkmvx,.cmvx.,cmvlkfldgfkjgldkfgldkfjgldkfjgldkfld",
                input2: 48,
                result: "$39577.72 ab $3.12 $ asdljalsjalskjfsldkfjlsdkmvx,.cmvx.,cmvlkfldgfkjgldkfgldkfjgldkfjgldkfld",
                func2: self.discountPrices
            ),
            TestCase2(
                input1: "$8 hfuxcro675y7a4et4kc43xx89538z5v78kw5zoa5zfa9uxjehx6xgtv1496l9qjhmk2y3mh6uiy5smewjb7n5cl0d6sqjp1qdtjczwdbh8dwn47e2pe80z$prybt6qlntopsah1x73heaomwx7he47c6afs8z11ycbjosu5kya7io3q65gggm3tutcy13aq6hkywmekqqppq3eu0$8mlshuw36yjxhfi0qmlt6ll6hozwcsflb1l6wdj$na66bvyk$e87k080axkq67ntmt4xv48sqv9z9o68i6zvw0l$9ldekdnqdvc3snjnym87yocv7$bbq0nawz7ks2c31hzv3k6vtw5$cgpdq$0$j1tk96zmwc4ac04mqbcvvwrly3cvp7vkd6rp9bipmb9mktysifdr35y6w8uvq07h14gdnmd9hb7aa4n$bcps3ritmez$7rph$4ry7vlcjcavbesrtg37b1z8wetcceeui4i9nfg87ko3epdqjecr1bcv7hf9krhm58go2vivj2pwig4e$mmic7cdlayi2ztphf2kzz1$fyf7je011713dsprkilyc1wpllx7mukdxo9icxxo2auyqylaa$6qaoc8fr6sp$vhl9hnmnoe$qujdsctfgyp0xtt0iea850ikzpttd9r9kefrqp$1ugycg67r1nld2z$w8wllon$exabzpdzmsmk7m3vvw24lkq55o5nzb1p9b3t8y8t2i0g2g1xtnquvlqry5nggaxgcuqpzqded4w4tbksf01$hxb7pe56jmnu25663s7r8wiznwgvbro$hsrxb9hiodtbsm7roxyx1lpydwrbmddhdln4fmgakkrgcxmkrofellmvt1s2fv6t13z47mkrqgzbftmjfw2n5a942isvmv2k0t9tinw4yp0g2gty4t1i2t959v3abe6rralqg889tjm8od9gjl5401gs0fvq2su07q49yik33eh1vk1a96s2vbiurm5pq$7$cm65occwrjs66qm2eemncntzovetp6idtyzuzh0lot4racnns1ukxka4w4mxyaeg1rp2$imen5svwzt0qjpoeca1j791iymna2nz0a0ouji38nwwn1a6wkdn2ui8fe09ch686d4zycjo72mzdg1ah$0dq3nwqh0f6ssc199r245i5r3sdyjbyxwgpqoujnaeu67i0$7icwmvik2p7oyl2r$akv2q4ivmpwswfojdadto$0bs3tn9glkm7yg1xu6w93410d9kb962ucw$1hcx2nlmppbf90qt5ff3j0p4uy$3v$xdvnnsl8sa8geg4uhqlzhllt2m$rlqy28x7$jtrxmw2f5s1ihjt$ylq8bjwpl28xfmbtzn6yex2e3pgvflhzv0wwlyty$qz2pe9m6im$pfmxc1ir$ak1v8egv06rh27solf39ugdqbuq1y3l4v48ov6myxwtxvddead5qwrna5n70pdpsnraeqngfjiuluzmtcthvfyq5a0bx6k1a3fy1mwfvngk05pk9y3bxm2wswlwhco4lb42eaag2ejud6zu22x7hlaarmr3dqa03pydqo7k$vsyv9n4m24v1avu3voyoo20m8a1svg25poww13kiewdeqiz2g0araqd$fs1mgch6um2dqvt53haar9a9gp4fbfqaz$kin6vohqfv2r1y7nurr9ukgd9$uc0qm2xnnane10zoc9v0mjve6a2f7y4xgrgays2b7eox1gn$o4md4hp8o7hoqki2r3nhuwilv7itmikw7z60cs3kzz$gdjt27b6kb9$cz3tenqwmnebx1w415z4xfj08ncm6vqzsatugp6rav0mhctzo$p9iugfro27ljti99xbosy5mjxt7lr87uyr3y125ir110npv842ssihg2hky0vtcfi7l0yn6cam4dxa0$50mq6f993fbmnohk4dn$wualomhchlhi9c5gwgsv7u8kaicf4pbcfd7mx6yht92$4bcgfj7ozm3tqef5t2dfwo673kbh6bsk6bafadzdc2x16ve$57g7kgm0lzfzeh0xnt2mdwvk9jfi9of9dy604yvo$uzo1n$3xel9ywfc3ahyhoikqe25cu67j5gdsvtwgmadcgisyavvmdakq3bakc8rd$eapuwefbrz6dkp$p93fq2arjd6k$vo4nluep7wlm1rd5n60p7wqw62zqhsd9psqrgx3v09pko6rb0oa3cyhzep18s6n7nla7x60$f23asexb82je6jax8cfimhqg3$fn4l7476t3f0aanev$5duozai8bdkqhcdj3rq6de5cpyx9l1tvpnoewkggnxnug2t5p3ix$fp8uzrvxi03v6n$j269c02hwmvvi0pez5y9uymgflxn2td27jqmsg82bqqe6f6eny0qtr6tzxv8elmc4yib7gl8pm9ykfz9xvxawd60kbneievha8$jn0aymysst2w$0xvp4dggfbs5ac6fenm57ztoyf62ynie$op8m3vurvey11se9atgunu6mny$9r$o1lclyuyl1kujm7jgmpskwwurrc8q34za$rg1n42oeup2$v5dxv2ea4tklxb4d5d4muzxwfrclp52ykmac27dh1t3243w541pap04zbjdrssalabvuoejmc8wmut0co32ixo60j3i9r9bw3kq8urwnhif$cc9$kl7lrso9pqudzj045cd6v5p5fv0vqwqf6xs888ouvekwgezb9nbw83x7v1vpi2g9cuznm1hmbg2px828uym9caouel1vm1hdgn7qf64snyjnx5vw7768hfztv7xvg6se5$t2uupykluotbivlt40zznky9z$twkn95ee7p9j7tn2xr200my95mnefc1$3w4qd2yiiw97vxcifkb$zgiqjp9il0rerrx1hsxf$33htqsggvb$g1d6ah8fi6bmvblhc4dctx79qt8ifcgo43qcd8pdo6jrot8ap257$vo8qelhgnc7m5nop0$ux653cubbov$hfqqtecroy$438crveugknq23extxwrrj8mw62k4s9macqhvxm$n13oi4pi43dcko3155zzlqgq4podu050a$zjndxvpim11r1qurt91n00sxkblaclxp1h3tsaraunjfcqqkykvkcjwqauyplw5zo4fcqbdrl9cuujq3dmacpoaci0$feu6v5ky5dqvn2l8mh4xn2mdkqtsa2gbeg3gzhol8j1qvus5p5u5$4fm6gg6rbv5zi2yve3et09yy500elw85svgz4z2qzt53mjp7z4fqn5wjrqd81s6d5b571i6k41kkavajz335y476x4hct6lfk1p8uiutq$or8rt07xv4c7zajfxo5extazmqfg2nuf4c3mp3ien37wf7da8t2ja$utxald51embc6kezg816zo725c9nk99zjp$icluuk1y01aza4sqzn8lltcg4ipoj3q6wcsasy3kgfpnxdesf5m3gjuipykgn0b4ge3uq2vymm78j4dbp1qd46dttsrzfp$28if09nswa3cv5cdyu7hcczt3sedx8cl9mqbmdz44gm7m29wqhodcycj63ardoxir1uf6gcxq8x8c3s3qm479gitu83vx812ler8c6ccaybnlf8f3gb0j$b4380922udf8e91o9un3alppnbrajc$1e9app55bd3f4ffj3aoovqbfjdhrtu9uqczaw5srxheq6o83ksbsj7mkujilc8zn2s4et3ca3qen9bqelviechpgbvmqs7nq0o6$70y37fvkcnfqcl87mitkg$d0rl0xifmawmxcw1v0c6up$jxblhu1o96ugl2rwsfxua14$irk6ep60t$73mv2ov$7y6yjnvrr9$nxe5klthwsqhgim9zkn3y2o2tmzuebvre4g25bq3poqwt1yvzopq4kuu6yfqz3alpvbcplq$1w3lfwwnxc171y9070cr437svvys2m1h3b8w5hf2jqk7zivtfcezyldzl8r0b3zbwo8d$sd4fk5yv6x7c0idot$w7d96j9sxwww5jwm5z7xuuh939uzp0m5prhda2z9zjsvo4p0dl99d3tzjj2z2sgnfqyg3i6hntxh2u4qz5q92gj15ijgm$3zrtmsuy0tautt30p$ib2a$xcj2$pc6ng8te$6m2l0zvacje0bz740c$b2ie$hq460y6f7ydmvdx7010i0vz8mb8ej4wdcz6f7mfxse30sugg9dnakxnseynvate6nrkykl8u $1450 jgxlpgv1e2lp5ag6d9a6c8w2at1mw3c1w05knahyyu9uyxam16khh4lqaerot4vd4x3gx54yj80jv$5xcvvxzz66e52625vbd14ef81oo4yqeg283tkhauiq0ch4d6amz7mnk7w60i14ahxwfo7z$$4u02tt4xogbycebcwfqjs4qsktb04ogm2awjcwojxx6tv66$pipr$glcsibb2ck$dn4tpth7eusk5zrxen1wgdokdcy3hu8eqhbbhgvo5059kidqt2kbn690cnno2hox96uuduxww8g53ot04ks8ycwkw$gcehk4ot93kx$p4wd9w47kwk49ba1xlapionj387so8k1wxdelxzmwijbkld3n9pza29ly2in00um4jzpy4xxhuymcx3eykxx0xuebv5o0yckjq$$vzncw50al9wexvix9l0zfh8s8dmxnmoonjjzs53timajtyn8ud1hdydp5mqc0q9bfg98twis177ji2iqx52zlqsldosp3l2ywgrui4pznr20vbzppv5v8vjuct6h$bhybsrpcvn3navqxwwti8vqifv9px4s5680$ckzuuaxtmvf525drna9jny7k8lwxi3$iwyjswlahatsm8b0lvy7ypm5pce229apxh2y3xn9iz3qeo9eai5hxe0kivd3c$w9bj6vtxkyi2ys$acbiqazmj4ht76ul3mz407gd52wt4o7qsu23is$nean$48ys15m934t1v8n2$s$eikw5g7cn6cf6z64f3oiiiw468u5eady4hm9jkmb6oi$8xg30trl6ezl1ljlkv3g1vqv1badis4lqgd9yytccsl$7szu$e7m6eypwcp8xeiye6y0erk64b3opdd3yzvadxhoblc2cc$0iuttlyllqcr5qzg8717pytcdt0m09mpo68rq44lwuryudy5pzc15m0ieudqmztbxffsdb1$ $6018011 t$2y87gexy1fnqrgirmn$fn28kz$g1str$thry$lw2aidqs4axinyrtouglmnusc40dcb16o0fsqf7fw9etlmktzf82wddaoifntu8gw$h1j4viwespeagx245gteknfen8sbnz31auwrevg25l0e$8jjgh6abfciv6iyj7ns9kq5$irkxrn09a1xjrba9rjsh0dl1o4i84b59i4$xuae$2z95qe5sgi52jybj6wrsyltw57lz0umac8r95$2h02ew01cb37jnohmt$kwe1zmnzv0yw7eqsq3fym58oxs1s4xe9eppq0znnkmkzs0v9oe05$7p93ydll208sgp32wlb3wgcdub29sdurg4apts0xhne70yyot91rdgogz$up3py6wd0vfnv8bfzxkfz5n6pwezi05zh97podvld0730ed4buw4umi8xg14ch4k3vlv56anjtm $744926 $1228430186 411kubp2j1hmyh7q3bxhr6$dl1jnn2f7z420gtfg3640aue97fnd3oq6$0jlrn4s9myh9kslwmle2r3zosaz0pm009xlzmgtddwrivvv3duvew20xtv$z36isz2mcahsm4uq5cvgraofstyb3xml4r7a8u0kj6ypmh34rhvhbwwt$kr56rj77tuwme31f1d4du50ds6byijojrom0aroux9feuhcc$ff5ok3jaqa61u506qgwq2ceslk2nw5m647iaplawwvrc5fjb9hac21m3e0f6pmimjx3dbfbxybl73o99$5oirmhw4ysa16npc9ys$4gi2c7gbhrm7l0awwf3tv65htxps0s3mq3j99li1ncooes$0wzg6vb75l0zhd3vvl3105068l4lg$h0lkohsq5wpsu02vo393xpiwrlq8x3a47j9mhcsyhzjn6pmpxc3txtp6s8ewjo9cpkegvw8eioenvke5m0k75hqa5iirp71cy7fyp444g9dbwwq3ii25v8cqbw8kwn81gmah8ats6vao$mn$aby1jjfex$sacxs$ixd04rk3cpkjctrm9h6bwumrkan39j8492x6b6oia5556i1$r$mwj20ycei46om1ffs18buyh9aorc$6xi5xojrispgp$khp21$bj314l $1805338 $55 y$uplknlp800t5fe78ect$8oqmmgoblp6xqvtsa9iq6tlg7uh4lo75cja$ls6zvikk$eyal6$v0q4nble57rvyzkgde2suu$$g5hg5ft6n$kwneiyk9zi0you74n86hpsr690gmo9b6g16kgfg64tb21lpnzt9s0spkr5rwq15ns87mnc77p vjjt6kamcs $746096 $17798682 $427 2p6hmi4govpybp0470oj0tzd59clf$846ajchkuvdbi4bk2orlh$$776addq$0vufximphyhkiym9afpg31c75r7pcns48pq8xq1wbii8sifho9kcy5xg689fw6dxfj5xgo04q93o1m0zo95d79h7a2$rm5s49320g55tqh623y6z7sfcgav20yr0l5cqkeviag8eoi66qv0yu0g$pqj8fw0ce6j9qyw1qpu3k2evdh0qp3vqecj$avu5jurwhhpla",
                input2: 50,
                result: "",
                func2: self.discountPrices
            )
        ]
    }
}
