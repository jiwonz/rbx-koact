-- using ISO 639-2
-- nogada by CHAT GPT-3

export type Enums =
	"eng"
	| "spa"
	| "fra"
	| "ind"
	| "ita"
	| "jpn"
	| "kor"
	| "rus"
	| "tha"
	| "tur"
	| "vie"
	| "por"
	| "deu"
	| "chi"
	| "chi"
	| "bul"
	| "ben"
	| "ces"
	| "dan"
	| "ell"
	| "est"
	| "fin"
	| "hin"
	| "hrv"
	| "hun"
	| "kat"
	| "kaz"
	| "khm"
	| "lit"
	| "lav"
	| "msa"
	| "mya"
	| "nob"
	| "nld"
	| "fil"
	| "pol"
	| "ron"
	| "ukr"
	| "sin"
	| "slk"
	| "slv"
	| "sqi"
	| "bos"
	| "srp"
	| "swe"
	| "ara"

local localeInverse = {}
local languageInverse = {}

local locales = {
	["en-us"] = "eng",
	["es-es"] = "spa",
	["fr-fr"] = "fra",
	["id-id"] = "ind",
	["it-it"] = "ita",
	["ja-jp"] = "jpn",
	["ko-kr"] = "kor",
	["ru-ru"] = "rus",
	["th-th"] = "tha",
	["tr-tr"] = "tur",
	["vi-vn"] = "vie",
	["pt-br"] = "por",
	["de-de"] = "deu",
	["zh-cn"] = "chi",
	["zh-tw"] = "chi",
	["bg-bg"] = "bul",
	["bn-bd"] = "ben",
	["cs-cz"] = "ces",
	["da-dk"] = "dan",
	["el-gr"] = "ell",
	["et-ee"] = "est",
	["fi-fi"] = "fin",
	["hi-in"] = "hin",
	["hr-hr"] = "hrv",
	["hu-hu"] = "hun",
	["ka-ge"] = "kat",
	["kk-kz"] = "kaz",
	["km-kh"] = "khm",
	["lt-lt"] = "lit",
	["lv-lv"] = "lav",
	["ms-my"] = "msa",
	["my-mm"] = "mya",
	["nb-no"] = "nob",
	["nl-nl"] = "nld",
	["fil-ph"] = "fil",
	["pl-pl"] = "pol",
	["ro-ro"] = "ron",
	["uk-ua"] = "ukr",
	["si-lk"] = "sin",
	["sk-sk"] = "slk",
	["sl-sl"] = "slv",
	["sq-al"] = "sqi",
	["bs-ba"] = "bos",
	["sr-rs"] = "srp",
	["sv-se"] = "swe",
	["ar-001"] = "ara",

	Language = {
		["English"] = "eng",
		["Spanish"] = "spa",
		["French"] = "fra",
		["Indonesian"] = "ind",
		["Italian"] = "ita",
		["Japanese"] = "jpn",
		["Korean"] = "kor",
		["Russian"] = "rus",
		["Thai"] = "tha",
		["Turkish"] = "tur",
		["Vietnamese"] = "vie",
		["Portuguese"] = "por",
		["German"] = "deu",
		["Chinese"] = "chi",
		["Bulgarian"] = "bul",
		["Bengali"] = "ben",
		["Czech"] = "ces",
		["Danish"] = "dan",
		["Greek"] = "ell",
		["Estonian"] = "est",
		["Finnish"] = "fin",
		["Hindi"] = "hin",
		["Croatian"] = "hrv",
		["Hungarian"] = "hun",
		["Georgian"] = "kat",
		["Kazakh"] = "kaz",
		["Khmer"] = "khm",
		["Lithuanian"] = "lit",
		["Latvian"] = "lav",
		["Malay"] = "msa",
		["Burmese"] = "mya",
		["Norwegian (Bokmål)"] = "nob",
		["Dutch"] = "nld",
		["Filipino"] = "fil",
		["Polish"] = "pol",
		["Romanian"] = "ron",
		["Ukrainian"] = "ukr",
		["Sinhala"] = "sin",
		["Slovak"] = "slk",
		["Slovenian"] = "slv",
		["Albanian"] = "sqi",
		["Bosnian"] = "bos",
		["Serbian"] = "srp",
		["Swedish"] = "swe",
		["Arabic"] = "ara",

		inverse = languageInverse,
	},

	Native = {
		["eng"] = "English",
		["spa"] = "Español",
		["fra"] = "Français",
		["ind"] = "Bahasa Indonesia",
		["ita"] = "Italiano",
		["jpn"] = "日本語",
		["kor"] = "한국어",
		["rus"] = "Русский",
		["tha"] = "ไทย",
		["tur"] = "Türkçe",
		["vie"] = "Tiếng Việt",
		["por"] = "Português",
		["deu"] = "Deutsch",
		["chi"] = "中文",
		["bul"] = "Български",
		["ben"] = "বাংলা",
		["ces"] = "Čeština",
		["dan"] = "Dansk",
		["ell"] = "Ελληνικά",
		["est"] = "Eesti",
		["fin"] = "Suomi",
		["hin"] = "हिन्दी",
		["hrv"] = "Hrvatski",
		["hun"] = "Magyar",
		["kat"] = "ქართული",
		["kaz"] = "Қазақ",
		["khm"] = "ខ្មែរ",
		["lit"] = "Lietuvių",
		["lav"] = "Latviešu",
		["msa"] = "Bahasa Melayu",
		["mya"] = "မြန်မာ",
		["nob"] = "Norsk (Bokmål)",
		["nld"] = "Nederlands",
		["fil"] = "Filipino",
		["pol"] = "Polski",
		["ron"] = "Română",
		["ukr"] = "Українська",
		["sin"] = "සිංහල",
		["slk"] = "Slovenčina",
		["slv"] = "Slovenščina",
		["sqi"] = "Shqip",
		["bos"] = "Bosanski",
		["srp"] = "Српски",
		["swe"] = "Svenska",
		["ara"] = "العربية",
	},

	inverse = localeInverse,
}

for k, v in locales do
	localeInverse[v] = k
end

for k, v in locales.Language do
	languageInverse[v] = k
end

return locales
