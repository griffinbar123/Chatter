struct Country: Hashable {
    var country: String
    var isoCode: String
    var code: String
}

struct CountrySection: Hashable {    
    
    var sectionName: String
    var section: [Country]
}

struct countryAndPhone: Hashable {
    var code: String
    var phoneLength: Int
}

let countriesAndPhones: [countryAndPhone] = [
    countryAndPhone(code: "CN", phoneLength: 13),
    countryAndPhone(code: "MZ", phoneLength: 12),
    countryAndPhone(code: "BR", phoneLength: 11),
    countryAndPhone(code: "IN", phoneLength: 10),
    countryAndPhone(code: "US", phoneLength: 10),
    countryAndPhone(code: "PK", phoneLength: 10),
    countryAndPhone(code: "BD", phoneLength: 10),
    countryAndPhone(code: "RU", phoneLength: 10),
    countryAndPhone(code: "MX", phoneLength: 10),
    countryAndPhone(code: "JP", phoneLength: 10),
    countryAndPhone(code: "PH", phoneLength: 10),
    countryAndPhone(code: "EG", phoneLength: 10),
    countryAndPhone(code: "IR", phoneLength: 10),
    countryAndPhone(code: "TR", phoneLength: 10),
    countryAndPhone(code: "DE", phoneLength: 10),
    countryAndPhone(code: "GB", phoneLength: 10),
    countryAndPhone(code: "IT", phoneLength: 10),
    countryAndPhone(code: "KE", phoneLength: 10),
    countryAndPhone(code: "CO", phoneLength: 10),
    countryAndPhone(code: "KR", phoneLength: 10),
    countryAndPhone(code: "CA", phoneLength: 10),
    countryAndPhone(code: "NP", phoneLength: 10),
    countryAndPhone(code: "RO", phoneLength: 10),
    countryAndPhone(code: "KZ", phoneLength: 10),
    countryAndPhone(code: "DO", phoneLength: 10),
    countryAndPhone(code: "GR", phoneLength: 10),
    countryAndPhone(code: "AT", phoneLength: 10),
    countryAndPhone(code: "LY", phoneLength: 10),
    countryAndPhone(code: "PR", phoneLength: 10),
    countryAndPhone(code: "JM", phoneLength: 10),
    countryAndPhone(code: "TT", phoneLength: 10),
    countryAndPhone(code: "BS", phoneLength: 10),
    countryAndPhone(code: "BB", phoneLength: 10),
    countryAndPhone(code: "LC", phoneLength: 10),
    countryAndPhone(code: "GU", phoneLength: 10),
    countryAndPhone(code: "GD", phoneLength: 10),
    countryAndPhone(code: "VC", phoneLength: 10),
    countryAndPhone(code: "VI", phoneLength: 10),
    countryAndPhone(code: "AG", phoneLength: 10),
    countryAndPhone(code: "IM", phoneLength: 10),
    countryAndPhone(code: "DM", phoneLength: 10),
    countryAndPhone(code: "KY", phoneLength: 10),
    countryAndPhone(code: "BM", phoneLength: 10),
    countryAndPhone(code: "GG", phoneLength: 10),
    countryAndPhone(code: "MP", phoneLength: 10),
    countryAndPhone(code: "KN", phoneLength: 10),
    countryAndPhone(code: "TC", phoneLength: 10),
    countryAndPhone(code: "SX", phoneLength: 10),
    countryAndPhone(code: "AS", phoneLength: 10),
    countryAndPhone(code: "VG", phoneLength: 10),
    countryAndPhone(code: "AI", phoneLength: 10),
    countryAndPhone(code: "MS", phoneLength: 10),
    countryAndPhone(code: "VA", phoneLength: 10),
    countryAndPhone(code: "ID", phoneLength: 9),
    countryAndPhone(code: "VN", phoneLength: 9),
    countryAndPhone(code: "TH", phoneLength: 9),
    countryAndPhone(code: "ZA", phoneLength: 9),
    countryAndPhone(code: "ES", phoneLength: 9),
    countryAndPhone(code: "DZ", phoneLength: 9),
    countryAndPhone(code: "AF", phoneLength: 9),
    countryAndPhone(code: "PL", phoneLength: 9),
    countryAndPhone(code: "SA", phoneLength: 9),
    countryAndPhone(code: "UA", phoneLength: 9),
    countryAndPhone(code: "YE", phoneLength: 9),
    countryAndPhone(code: "PE", phoneLength: 9),
    countryAndPhone(code: "GH", phoneLength: 9),
    countryAndPhone(code: "CM", phoneLength: 9),
    countryAndPhone(code: "AU", phoneLength: 9),
    countryAndPhone(code: "TW", phoneLength: 9),
    countryAndPhone(code: "SY", phoneLength: 9),
    countryAndPhone(code: "ZM", phoneLength: 9),
    countryAndPhone(code: "CL", phoneLength: 9),
    countryAndPhone(code: "EC", phoneLength: 9),
    countryAndPhone(code: "NL", phoneLength: 9),
    countryAndPhone(code: "KH", phoneLength: 9),
    countryAndPhone(code: "ZW", phoneLength: 9),
    countryAndPhone(code: "BJ", phoneLength: 9),
    countryAndPhone(code: "BE", phoneLength: 9),
    countryAndPhone(code: "JO", phoneLength: 9),
    countryAndPhone(code: "CZ", phoneLength: 9),
    countryAndPhone(code: "AZ", phoneLength: 9),
    countryAndPhone(code: "PT", phoneLength: 9),
    countryAndPhone(code: "HU", phoneLength: 9),
    countryAndPhone(code: "AE", phoneLength: 9),
    countryAndPhone(code: "BY", phoneLength: 9),
    countryAndPhone(code: "IL", phoneLength: 9),
    countryAndPhone(code: "CH", phoneLength: 9),
    countryAndPhone(code: "PY", phoneLength: 9),
    countryAndPhone(code: "SK", phoneLength: 9),
    countryAndPhone(code: "NZ", phoneLength: 9),
    countryAndPhone(code: "IE", phoneLength: 9),
    countryAndPhone(code: "HR", phoneLength: 9),
    countryAndPhone(code: "GE", phoneLength: 9),
    countryAndPhone(code: "LU", phoneLength: 9),
    countryAndPhone(code: "GP", phoneLength: 9),
    countryAndPhone(code: "MQ", phoneLength: 9),
    countryAndPhone(code: "GF", phoneLength: 9),
    countryAndPhone(code: "NG", phoneLength: 8),
    countryAndPhone(code: "MM", phoneLength: 8),
    countryAndPhone(code: "NE", phoneLength: 8),
    countryAndPhone(code: "ML", phoneLength: 8),
    countryAndPhone(code: "BF", phoneLength: 8),
    countryAndPhone(code: "TD", phoneLength: 8),
    countryAndPhone(code: "SO", phoneLength: 8),
    countryAndPhone(code: "GT", phoneLength: 8),
    countryAndPhone(code: "TN", phoneLength: 8),
    countryAndPhone(code: "HN", phoneLength: 8),
    countryAndPhone(code: "TG", phoneLength: 8),
    countryAndPhone(code: "HK", phoneLength: 8),
    countryAndPhone(code: "RS", phoneLength: 8),
    countryAndPhone(code: "NI", phoneLength: 8),
    countryAndPhone(code: "SV", phoneLength: 8),
    countryAndPhone(code: "SG", phoneLength: 8),
    countryAndPhone(code: "DK", phoneLength: 8),
    countryAndPhone(code: "NO", phoneLength: 8),
    countryAndPhone(code: "CR", phoneLength: 8),
    countryAndPhone(code: "OM", phoneLength: 8),
    countryAndPhone(code: "PA", phoneLength: 8),
    countryAndPhone(code: "KW", phoneLength: 8),
    countryAndPhone(code: "MD", phoneLength: 8),
    countryAndPhone(code: "BA", phoneLength: 8),
    countryAndPhone(code: "AM", phoneLength: 8),
    countryAndPhone(code: "LT", phoneLength: 8),
    countryAndPhone(code: "QA", phoneLength: 8),
    countryAndPhone(code: "MK", phoneLength: 8),
    countryAndPhone(code: "LV", phoneLength: 8),
    countryAndPhone(code: "BH", phoneLength: 8),
    countryAndPhone(code: "EE", phoneLength: 8),
    countryAndPhone(code: "MU", phoneLength: 8),
    countryAndPhone(code: "CY", phoneLength: 8),
    countryAndPhone(code: "ME", phoneLength: 8),
    countryAndPhone(code: "MT", phoneLength: 8),
    countryAndPhone(code: "KI", phoneLength: 8),
    countryAndPhone(code: "MY", phoneLength: 7),
    countryAndPhone(code: "VE", phoneLength: 7),
    countryAndPhone(code: "LK", phoneLength: 7),
    countryAndPhone(code: "SE", phoneLength: 7),
    countryAndPhone(code: "LR", phoneLength: 7),
    countryAndPhone(code: "LB", phoneLength: 7),
    countryAndPhone(code: "GA", phoneLength: 7),
    countryAndPhone(code: "SB", phoneLength: 7),
    countryAndPhone(code: "MV", phoneLength: 7),
    countryAndPhone(code: "BZ", phoneLength: 7),
    countryAndPhone(code: "FM", phoneLength: 7),
    countryAndPhone(code: "AW", phoneLength: 7),
    countryAndPhone(code: "MH", phoneLength: 7),
    countryAndPhone(code: "PW", phoneLength: 7),
    countryAndPhone(code: "TZ", phoneLength: 6),
    countryAndPhone(code: "PF", phoneLength: 6),
    countryAndPhone(code: "NC", phoneLength: 6),
    countryAndPhone(code: "GL", phoneLength: 6),
    countryAndPhone(code: "WS", phoneLength: 5),
    countryAndPhone(code: "FO", phoneLength: 5),
    countryAndPhone(code: "CK", phoneLength: 5),
    countryAndPhone(code: "NU", phoneLength: 4)
]


let CountrySections: [CountrySection] = [
    countrySectionA,
    countrySectionB,
    countrySectionC,
    countrySectionD,
    countrySectionE,
    countrySectionF,
    countrySectionG,
    countrySectionH,
    countrySectionI,
    countrySectionJ,
    countrySectionK,
    countrySectionL,
    countrySectionM,
    countrySectionN,
    countrySectionO,
    countrySectionP,
    countrySectionQ,
    countrySectionR,
    countrySectionS,
    countrySectionT,
    countrySectionU,
    countrySectionV,
    countrySectionW,
    countrySectionY,
    countrySectionZ
]

let countrySectionA: CountrySection = CountrySection(sectionName: "A", section: [
    Country(country: "Afghanistan ", isoCode: "93", code: "AF"),
    Country(country: "Albania ", isoCode: "355", code: "AL"),
    Country(country: "Algeria ", isoCode: "213", code: "DZ"),
    Country(country: "American Samoa ", isoCode: "1684", code: "AS"),
    Country(country: "Andorra ", isoCode: "376", code: "AD"),
    Country(country: "Angola ", isoCode: "244", code: "AO"),
    Country(country: "Anguilla ", isoCode: "1264", code: "AI"),
    Country(country: "Antarctica ", isoCode: "672", code: "AQ"),
    Country(country: "Antigua and Barbuda ", isoCode: "1268", code: "AG"),
    Country(country: "Argentina ", isoCode: "54", code: "AR"),
    Country(country: "Armenia ", isoCode: "374", code: "AM"),
    Country(country: "Aruba ", isoCode: "297", code: "AW"),
    Country(country: "Ascension Island ", isoCode: "247", code: "AC"),
    Country(country: "Australia ", isoCode: "61", code: "AU"),
    Country(country: "Austria ", isoCode: "43", code: "AT"),
    Country(country: "Azerbaijan ", isoCode: "994", code: "AZ")
])

let countrySectionB: CountrySection = CountrySection(sectionName: "B", section: [
    Country(country: "Bahamas ", isoCode: "1242", code: "BS"),
    Country(country: "Bahrain ", isoCode: "973", code: "BH"),
    Country(country: "Bangladesh ", isoCode: "880", code: "BD"),
    Country(country: "Barbados ", isoCode: "1246", code: "BB"),
    Country(country: "Belarus ", isoCode: "375", code: "BY"),
    Country(country: "Belgium ", isoCode: "32", code: "BE"),
    Country(country: "Belize ", isoCode: "501", code: "BZ"),
    Country(country: "Benin ", isoCode: "229", code: "BJ"),
    Country(country: "Bermuda ", isoCode: "1441", code: "BM"),
    Country(country: "Bhutan ", isoCode: "975", code: "BT"),
    Country(country: "Bolivia ", isoCode: "591", code: "BO"),
    Country(country: "Bosnia and Herzegovina ", isoCode: "387", code: "BA"),
    Country(country: "Botswana ", isoCode: "267", code: "BW"),
    Country(country: "Brazil ", isoCode: "55", code: "BR"),
    Country(country: "British Virgin Islands ", isoCode: "1284", code: "VG"),
    Country(country: "Brunei ", isoCode: "673", code: "BN"),
    Country(country: "Bulgaria ", isoCode: "359", code: "BG"),
    Country(country: "Burkina Faso ", isoCode: "226", code: "BF"),
    Country(country: "Burma (Myanmar) ", isoCode: "95", code: "MM"),
    Country(country: "Burundi ", isoCode: "257", code: "BI")
])

let countrySectionC: CountrySection = CountrySection(sectionName: "C", section: [
    Country(country: "Cambodia ", isoCode: "855", code: "KH"),
    Country(country: "Cameroon ", isoCode: "237", code: "CM"),
    Country(country: "Canada ", isoCode: "1", code: "CA"),
    Country(country: "Cape Verde ", isoCode: "238", code: "CV"),
    Country(country: "Cayman Islands ", isoCode: "1345", code: "KY"),
    Country(country: "Central African Republic ", isoCode: "236", code: "CF"),
    Country(country: "Chad ", isoCode: "235", code: "TD"),
    Country(country: "Chile ", isoCode: "56", code: "CL"),
    Country(country: "China ", isoCode: "86", code: "CN"),
    Country(country: "Christmas Island ", isoCode: "61", code: "CX"),
    Country(country: "Cocos (Keeling) Islands ", isoCode: "61", code: "CC"),
    Country(country: "Colombia ", isoCode: "57", code: "CO"),
    Country(country: "Comoros ", isoCode: "269", code: "KM"),
    Country(country: "Congo ", isoCode: "242", code: "CG"),
    Country(country: "Cook Islands ", isoCode: "682", code: "CK"),
    Country(country: "Costa Rica ", isoCode: "506", code: "CR"),
    Country(country: "Croatia ", isoCode: "385", code: "HR"),
    Country(country: "Cuba ", isoCode: "53", code: "CU"),
    Country(country: "Cyprus ", isoCode: "357", code: "CY"),
    Country(country: "Czech Republic ", isoCode: "420", code: "CZ")
])

let countrySectionD: CountrySection = CountrySection(sectionName: "D", section: [
    Country(country: "Democratic Republic of the Congo ", isoCode: "243", code: "CD"),
    Country(country: "Denmark ", isoCode: "45", code: "DK"),
    Country(country: "Diego Garcia", isoCode: "46", code: " D"),
    Country(country: "Djibouti ", isoCode: "253", code: "DJ"),
    Country(country: "Dominica ", isoCode: "1767", code: "DM"),
    Country(country: "Dominican Republic ", isoCode: "1809", code: "DO")
])

let countrySectionE: CountrySection = CountrySection(sectionName: "E", section: [
    Country(country: "Ecuador ", isoCode: "593", code: "EC"),
    Country(country: "Egypt ", isoCode: "20", code: "EG"),
    Country(country: "El Salvador ", isoCode: "503", code: "SV"),
    Country(country: "Equatorial Guinea ", isoCode: "240", code: "GQ"),
    Country(country: "Eritrea ", isoCode: "291", code: "ER"),
    Country(country: "Estonia ", isoCode: "372", code: "EE"),
    Country(country: "Ethiopia ", isoCode: "251", code: "ET")
])

let countrySectionF: CountrySection = CountrySection(sectionName: "F", section: [
    Country(country: "Falkland Islands ", isoCode: "500", code: "FK"),
    Country(country: "Faroe Islands ", isoCode: "298", code: "FO"),
    Country(country: "Fiji ", isoCode: "679", code: "FJ"),
    Country(country: "Finland ", isoCode: "358", code: "FI"),
    Country(country: "France ", isoCode: "33", code: "FR"),
    Country(country: "French Guiana ", isoCode: "594", code: "GF"),
    Country(country: "French Polynesia ", isoCode: "689", code: "PF")
])

let countrySectionG: CountrySection = CountrySection(sectionName: "G", section: [
    Country(country: "Gabon ", isoCode: "241", code: "GA"),
    Country(country: "Gambia ", isoCode: "220", code: "GM"),
    Country(country: "Georgia ", isoCode: "995", code: "GE"),
    Country(country: "Germany ", isoCode: "49", code: "DE"),
    Country(country: "Ghana ", isoCode: "233", code: "GH"),
    Country(country: "Gibraltar ", isoCode: "350", code: "GI"),
    Country(country: "Greece ", isoCode: "30", code: "GR"),
    Country(country: "Greenland ", isoCode: "299", code: "GL"),
    Country(country: "Grenada ", isoCode: "1473", code: "GD"),
    Country(country: "Guadeloupe ", isoCode: "590", code: "GP"),
    Country(country: "Guam ", isoCode: "1671", code: "GU"),
    Country(country: "Guatemala ", isoCode: "502", code: "GT"),
    Country(country: "Guinea ", isoCode: "224", code: "GN"),
    Country(country: "Guinea-Bissau ", isoCode: "245", code: "GW"),
    Country(country: "Guyana ", isoCode: "592", code: "GY")
])

let countrySectionH: CountrySection = CountrySection(sectionName: "H", section: [
    Country(country: "Haiti ", isoCode: "509", code: "HT"),
    Country(country: "Holy See (Vatican City) ", isoCode: "39", code: "VA"),
    Country(country: "Honduras ", isoCode: "504", code: "HN"),
    Country(country: "Hong Kong ", isoCode: "852", code: "HK"),
    Country(country: "Hungary ", isoCode: "36", code: "HU")
])

let countrySectionI: CountrySection = CountrySection(sectionName: "I", section: [
    Country(country: "Iceland ", isoCode: "54", code: "IS"),
    Country(country: "India ", isoCode: "91", code: "IN"),
    Country(country: "Indonesia ", isoCode: "62", code: "ID"),
    Country(country: "Iran ", isoCode: "98", code: "IR"),
    Country(country: "Iraq ", isoCode: "964", code: "IQ"),
    Country(country: "Ireland ", isoCode: "353", code: "IE"),
    Country(country: "Isle of Man ", isoCode: "44", code: "IM"),
    Country(country: "Israel ", isoCode: "972", code: "IL"),
    Country(country: "Italy ", isoCode: "39", code: "IT"),
    Country(country: "Ivory Coast (Côte d'Ivoire) ", isoCode: "225", code: "CI"),
])

let countrySectionJ: CountrySection = CountrySection(sectionName: "J", section: [
    Country(country: "Jamaica ", isoCode: "1876", code: "JM"),
    Country(country: "Japan ", isoCode: "81", code: "JP"),
    Country(country: "Jersey ", isoCode: "44", code: "JE"),
    Country(country: "Jordan ", isoCode: "962", code: "JO")
])


let countrySectionK: CountrySection = CountrySection(sectionName: "K", section: [
    Country(country: "Kazakhstan ", isoCode: "7", code: "KZ"),
    Country(country: "Kenya ", isoCode: "254", code: "KE"),
    Country(country: "Kiribati ", isoCode: "686", code: "KI"),
    Country(country: "Kuwait ", isoCode: "965", code: "KW"),
    Country(country: "Kyrgyzstan ", isoCode: "996", code: "KG")
])


let countrySectionL: CountrySection = CountrySection(sectionName: "L", section: [
    Country(country: "Laos ", isoCode: "856", code: "LA"),
    Country(country: "Latvia ", isoCode: "371", code: "LV"),
    Country(country: "Lebanon ", isoCode: "961", code: "LB"),
    Country(country: "Lesotho ", isoCode: "266", code: "LS"),
    Country(country: "Liberia ", isoCode: "231", code: "LR"),
    Country(country: "Libya ", isoCode: "218", code: "LY"),
    Country(country: "Liechtenstein ", isoCode: "423", code: "LI"),
    Country(country: "Lithuania ", isoCode: "370", code: "LT"),
    Country(country: "Luxembourg ", isoCode: "352", code: "LU")
])


let countrySectionM: CountrySection = CountrySection(sectionName: "M", section: [
    Country(country: "Macau ", isoCode: "853", code: "MO"),
    Country(country: "Macedonia ", isoCode: "389", code: "MK"),
    Country(country: "Madagascar ", isoCode: "261", code: "MG"),
    Country(country: "Malawi ", isoCode: "265", code: "MW"),
    Country(country: "Malaysia ", isoCode: "60", code: "MY"),
    Country(country: "Maldives ", isoCode: "960", code: "MV"),
    Country(country: "Mali ", isoCode: "223", code: "ML"),
    Country(country: "Malta ", isoCode: "356", code: "MT"),
    Country(country: "Marshall Islands ", isoCode: "692", code: "MH"),
    Country(country: "Martinique ", isoCode: "596", code: "MQ"),
    Country(country: "Mauritania ", isoCode: "222", code: "MR"),
    Country(country: "Mauritius ", isoCode: "230", code: "MU"),
    Country(country: "Mayotte ", isoCode: "262", code: "YT"),
    Country(country: "Mexico ", isoCode: "52", code: "MX"),
    Country(country: "Micronesia ", isoCode: "691", code: "FM"),
    Country(country: "Moldova ", isoCode: "373", code: "MD"),
    Country(country: "Monaco ", isoCode: "377", code: "MC"),
    Country(country: "Mongolia ", isoCode: "976", code: "MN"),
    Country(country: "Montenegro ", isoCode: "382", code: "ME"),
    Country(country: "Montserrat ", isoCode: "1664", code: "MS"),
    Country(country: "Morocco ", isoCode: "212", code: "MA"),
    Country(country: "Mozambique ", isoCode: "258", code: "MZ")
])


let countrySectionN: CountrySection = CountrySection(sectionName: "N", section: [
    Country(country: "Namibia ", isoCode: "264", code: "NA"),
    Country(country: "Nauru ", isoCode: "674", code: "NR"),
    Country(country: "Nepal ", isoCode: "977", code: "NP"),
    Country(country: "Netherlands ", isoCode: "31", code: "NL"),
    Country(country: "Netherlands Antilles ", isoCode: "599", code: "AN"),
    Country(country: "New Caledonia ", isoCode: "687", code: "NC"),
    Country(country: "New Zealand ", isoCode: "64", code: "NZ"),
    Country(country: "Nicaragua ", isoCode: "505", code: "NI"),
    Country(country: "Niger ", isoCode: "227", code: "NE"),
    Country(country: "Nigeria ", isoCode: "234", code: "NG"),
    Country(country: "Niue ", isoCode: "683", code: "NU"),
    Country(country: "Norfolk Island ", isoCode: "672", code: "NF"),
    Country(country: "North Korea ", isoCode: "850", code: "KP"),
    Country(country: "Northern Mariana Islands ", isoCode: "1670", code: "MP"),
    Country(country: "Norway ", isoCode: "47", code: "NO")
])


let countrySectionO: CountrySection = CountrySection(sectionName: "O", section: [
    Country(country: "Oman ", isoCode: "968", code: "OM")
])


let countrySectionP: CountrySection = CountrySection(sectionName: "P", section: [
    Country(country: "Pakistan ", isoCode: "92", code: "PK"),
    Country(country: "Palau ", isoCode: "680", code: "PW"),
    Country(country: "Palestine ", isoCode: "970", code: "PS"),
    Country(country: "Panama ", isoCode: "507", code: "PA"),
    Country(country: "Papua New Guinea ", isoCode: "675", code: "PG"),
    Country(country: "Paraguay ", isoCode: "595", code: "PY"),
    Country(country: "Peru ", isoCode: "51", code: "PE"),
    Country(country: "Philippines ", isoCode: "63", code: "PH"),
    Country(country: "Pitcairn Islands ", isoCode: "870", code: "PN"),
    Country(country: "Poland ", isoCode: "48", code: "PL"),
    Country(country: "Portugal ", isoCode: "351", code: "PT"),
    Country(country: "Puerto Rico ", isoCode: "1787", code: "PR"),
])


let countrySectionQ: CountrySection = CountrySection(sectionName: "Q", section: [
    Country(country: "Qatar ", isoCode: "974", code: "QA")
])

let countrySectionR: CountrySection = CountrySection(sectionName: "R", section: [
    Country(country: "Republic of the Congo ", isoCode: "242", code: "CG"),
    Country(country: "Reunion Island ", isoCode: "262", code: "RE"),
    Country(country: "Romania ", isoCode: "40", code: "RO"),
    Country(country: "Russia ", isoCode: "7", code: "RU"),
    Country(country: "Rwanda ", isoCode: "250", code: "RW")
])

let countrySectionS: CountrySection = CountrySection(sectionName: "S", section: [
    Country(country: "Saint Barthelemy ", isoCode: "590", code: "BL"),
    Country(country: "Saint Helena ", isoCode: "290", code: "SH"),
    Country(country: "Saint Kitts and Nevis ", isoCode: "1869", code: "KN"),
    Country(country: "Saint Lucia ", isoCode: "1758", code: "LC"),
    Country(country: "Saint Martin ", isoCode: "590", code: "MF"),
    Country(country: "Saint Pierre and Miquelon ", isoCode: "508", code: "PM"),
    Country(country: "Saint Vincent and the Grenadines ", isoCode: "1784", code: "VC"),
    Country(country: "Samoa ", isoCode: "685", code: "WS"),
    Country(country: "San Marino ", isoCode: "378", code: "SM"),
    Country(country: "Sao Tome and Principe ", isoCode: "239", code: "ST"),
    Country(country: "Saudi Arabia ", isoCode: "966", code: "SA"),
    Country(country: "Senegal ", isoCode: "221", code: "SN"),
    Country(country: "Serbia ", isoCode: "381", code: "RS"),
    Country(country: "Seychelles ", isoCode: "248", code: "SC"),
    Country(country: "Sierra Leone ", isoCode: "232", code: "SL"),
    Country(country: "Singapore ", isoCode: "65", code: "SG"),
    Country(country: "Sint Maarten ", isoCode: "1721", code: "SX"),
    Country(country: "Slovakia ", isoCode: "421", code: "SK"),
    Country(country: "Slovenia ", isoCode: "386", code: "SI"),
    Country(country: "Solomon Islands ", isoCode: "677", code: "SB"),
    Country(country: "Somalia ", isoCode: "252", code: "SO"),
    Country(country: "South Africa ", isoCode: "27", code: "ZA"),
    Country(country: "South Korea ", isoCode: "82", code: "KR"),
    Country(country: "South Sudan ", isoCode: "211", code: "SS"),
    Country(country: "Spain ", isoCode: "34", code: "ES"),
    Country(country: "Sri Lanka ", isoCode: "94", code: "LK"),
    Country(country: "Suriname ", isoCode: "597", code: "SR"),
    Country(country: "Svalbard ", isoCode: "47", code: "SJ"),
    Country(country: "Swaziland ", isoCode: "268", code: "SZ"),
    Country(country: "Sweden ", isoCode: "46", code: "SE"),
    Country(country: "Switzerland ", isoCode: "41", code: "CH"),
    Country(country: "Syria ", isoCode: "963", code: "SY")
])

let countrySectionT: CountrySection = CountrySection(sectionName: "T", section: [
    Country(country: "Taiwan ", isoCode: "886", code: "TW"),
    Country(country: "Tajikistan ", isoCode: "992", code: "TJ"),
    Country(country: "Tanzania ", isoCode: "255", code: "TZ"),
    Country(country: "Thailand ", isoCode: "66", code: "TH"),
    Country(country: "-Leste (East Timor) ", isoCode: "670", code: "TL"),
    Country(country: "Togo ", isoCode: "228", code: "TG"),
    Country(country: "Tokelau ", isoCode: "690", code: "TK"),
    Country(country: "Tonga Islands ", isoCode: "676", code: "TO"),
    Country(country: "Trinidad and Tobago ", isoCode: "1868", code: "TT"),
    Country(country: "Tunisia ", isoCode: "216", code: "TN"),
    Country(country: "Turkey ", isoCode: "90", code: "TR"),
    Country(country: "Turkmenistan ", isoCode: "993", code: "TM"),
    Country(country: "Turks and Caicos Islands ", isoCode: "1649", code: "TC"),
    Country(country: "Tuvalu ", isoCode: "688", code: "TV")
])

let countrySectionU: CountrySection = CountrySection(sectionName: "U", section: [
    Country(country: "Uganda ", isoCode: "256", code: "UG"),
    Country(country: "Ukraine ", isoCode: "380", code: "UA"),
    Country(country: "United Arab Emirates ", isoCode: "971", code: "AE"),
    Country(country: "United Kingdom ", isoCode: "44", code: "GB"),
    Country(country: "Uruguay ", isoCode: "598", code: "UY"),
    Country(country: "United States ", isoCode: "1", code: "US"),
    Country(country: "US Virgin Islands ", isoCode: "1340", code: "VI")
])

let countrySectionV: CountrySection = CountrySection(sectionName: "V", section: [
    Country(country: "Vanuatu ", isoCode: "678", code: "VU"),
    Country(country: "Venezuela ", isoCode: "58", code: "VE"),
    Country(country: "Vietnam ", isoCode: "84", code: "VN")
])

let countrySectionW: CountrySection = CountrySection(sectionName: "W", section: [
    Country(country: "Wallis and Futuna ", isoCode: "681", code: "WF"),
    Country(country: "Western Sahara ", isoCode: "212", code: "EH")
])

let countrySectionY: CountrySection = CountrySection(sectionName: "Y", section: [
    Country(country: "Yemen ", isoCode: "967", code: "YE")
])

let countrySectionZ: CountrySection = CountrySection(sectionName: "Z", section: [
    Country(country: "Zambia ", isoCode: "260", code: "ZM"),
    Country(country: "Zimbabwe ", isoCode: "263", code: "ZW")
])




