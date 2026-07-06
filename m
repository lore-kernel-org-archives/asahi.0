Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D19F3DA7F6;
	Mon,  6 Jul 2026 10:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333313; cv=fail; b=lZ+S8V48FnBpS5hMO97joM9KolbSK3jGafuF+dzo8lPa7aFEWV07qROtFMEEOxIS1TNRFGSvwhGTTsIB4I4q68HDTPdbh6/z9EKUWomcOkOkbyLB2xLA858dvJiOGQ8qyD7ktETLwQLd4Cyzlwvmckzd2BgvuvyRsUXmQPPVh1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333313; c=relaxed/simple;
	bh=wenGIUCy5N2Byuo2tGBk++q83XAcnt1yrRuOPaeo1qI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ncORM7UrqpvbGnhp3jx6lM1M+hvW/pWkexGzyXvRRXM5YlPK9q0qUtUXJlwmMSn3RHBe0jsFGCVwl1Opr9age9JmTyhhg59Sa4BiX7RC4S9uIRg4Sl5gYkeAMK/pWLgJ0G+gW+Os38qoOfJzKA/yU08btGeJ6PtsYiCF8WYfvAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQuCfBS5; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQuCfBS5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783333311; x=1814869311;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wenGIUCy5N2Byuo2tGBk++q83XAcnt1yrRuOPaeo1qI=;
  b=QQuCfBS5knn3WqgI6StTAJ0Jvd5cHGnDfPNRRAcxVbvRsJVlsEJtjxJ4
   SfUA3pzeeJeWj5BQ0M1cMrLmFuNL5PlxgPYEDzh9TfdTr7qhqivTI+vHb
   zpEU+Zc3sfOPHK8bPSFEJ2q60Zx/sSJBJ5Z6dSzoegfrdIs/GRxCUWeQY
   cLPfQaLRYGpbF68oy7UmwNFQLYjLne63l7t+vVFdHjzdSV4tTV3GKQNFc
   gpJgJccsCJAJrBdxuI6LvKhJVJvpW+9BauD7hWFT8ft1rfY7OvQ+jl09E
   +p1Q3zgEQtKxU+QoMrWlhQekpRJqTzHpVZiV7H9VLkuWfvz+m5i/Dr2V0
   Q==;
X-CSE-ConnectionGUID: qUZ27JUjSnCUyYzQVEl0aA==
X-CSE-MsgGUID: KYg2qpQ5SkCDBJExHnrXFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="95474405"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="95474405"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 03:21:47 -0700
X-CSE-ConnectionGUID: txhnT6KFQaWpm5EOHEp6Xg==
X-CSE-MsgGUID: BsdPPAv1SNqAMimUEBzUIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="255616520"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 03:21:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 03:21:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 03:21:45 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 03:21:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QB6L8epcH2iBNcLRbf8mbTtvXYw4NIdjG1iA3z0czbKiWOS40MPL6uzjFKWxoU20/ZXTpDgwR8jhj2NwIkcMoINX1c93Qy2U9hDegW4TiQ6v9FaRB4bQe34EESGUbPLXBIRD1o0OV5uoedAMf6etiGKCmY7inhiRLkORlKmv0oa9DC6qDulGKYYjvo+NLiEJqWSzTnT1GGxZkH0FxKJUGqif7S5o2GLEaZg4iqaFIBXHP6u8MkcCkkkR2n8Z6RQBKa3O90uZiGDueKfXVttSTdRvwAaX+P0pKx9yXj1THLx+BhAwb9RK2psGVz7HdWMg6HJVlfWAHcHKJJNkWC3ldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4KyjI7BskziKk7Gu+Fh7j5oDqTN/MBWOoi1Mm+Nqus=;
 b=OpEM1VA2eDMkaEqmfdN4Qv9L6vqCiSfkaHM2ahsswbiqPAZSkTGAhu5VFp52AXApQimonYKFBv3qR1IxqfdJ5DMIPD2ULGUVD8yjEhwC5pQEepDG5Iy3GEjba2GUlKueqQAbDcB0KzOW50Tgu1vApgN8OPPcQmBdLX2sV26AHLL3wS/ICfvR/vFJGFoLL2IFu7s1B56W0ThPk/Z2P5Ni/Zs/A4jpkaF1/diC3G40mA6WwDU9xsm/pFL21N67QChu6ozz2Uqb0QPbrwr5+bUHa8s//M0jtQ61bD3e53ig7xyvqg5olxhacLJTGD6O3SuVrmdBYnQg/yeLiQtAEQNSzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by PH7PR11MB6378.namprd11.prod.outlook.com (2603:10b6:510:1fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 10:21:41 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 10:21:41 +0000
Message-ID: <71b1c1a0-fcef-4102-8ab6-146a2c372adb@intel.com>
Date: Mon, 6 Jul 2026 12:21:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/24] ASoC: codecs: Use guard() for mutex & spin lock
 - part 1
To: <phucduc.bui@gmail.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>, Richard Fitzgerald
	<rf@opensource.cirrus.com>, <povik+lin@cutebit.org>,
	<u.kleine-koenig@baylibre.com>, <kuninori.morimoto.gx@renesas.com>,
	<christian.ehrhardt@codasip.com>, Linus Walleij <linusw@kernel.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>, Chris Morgan
	<macromorgan@hotmail.com>, Dan Carpenter <error27@gmail.com>, "Marco
 Crivellari" <marco.crivellari@suse.com>, Rosen Penev <rosenp@gmail.com>,
	Weidong Wang <wangweidong.a@awinic.com>, Teguh Sobirin <teguh@sobir.in>, "Val
 Packett" <val@packett.cool>, Luca Weiss <luca.weiss@fairphone.com>,
	wangdicheng <wangdicheng@kylinos.cn>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
	<chrome-platform@lists.linux.dev>, <asahi@lists.linux.dev>, Mark Brown
	<broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih
	<tzungbi@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, Charles Keepax
	<ckeepax@opensource.cirrus.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260703055355.244898-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIZP296CA0006.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a1::7) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|PH7PR11MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: 537209b8-4a90-4912-1d03-08dedb485f08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: SfsVL2tuuv1H7ILY30hTw2JSc3ZL0bd6mMi4GBvLMuUF7+nvc1v5ClU+bZmbukL8swLWI4pvam/rvL5WO64KaLrUbWoD+fgPzTu8RjXB/ls4PpFxkjyYz/4UQKbWa+n4cncq79gG3CFNZuyKjzpzM+korDcZ/H2vMNgdWuyCyHla2QeafjqtFuM9uI6ylegntCSX3HZbUMTKjZvev/6NWjOg+h40Ritkpmr++QHfboKNY1OY1+X5oUdev3R9NY6M6UlN9uCw/5PqbvmctBIuhKLWBWTvi7nMwUOPky058ZEAQzmeJBvIEtt072KgpwDYcw7RG9+qhkXVmMt17++NMg0Tt+GDO/UusIdMKjsyxhbOKaKzPzb7tYUzLB0L8EH7SsVHS/9hpI7DU/6szwq8mY1hhn8XtRZkw7fC1kqGhxL0xoxYaBRpCLQXKrElltc0p3BcJGWl50Lxx/m8MCqBO/jxDrzHNEdJw7p+9HaQMy/n4ZC5jMrdP40f+ewWWunNKdr50+vytezuE+dxGQ48Qaw5UCkmFd/whJgiDsHCoZg8lfpkDaLtv9PlUlJYpBqhro7S+S9DBfTnz08JYWUi0rsQ45wflwSZY2Uhd4pm7bCHpCYT/gOimCgaYb2wwZa1bb5x6hHPDiUa675zOwygJPkIwaQXNvGUVQeXzfsBXmU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak9SRTlKN04rSWlnOFJPYS9tRWdLTjIyVnRETlU0a0RMZGhNOW1neUdDdk42?=
 =?utf-8?B?dUg4VTNMTFhuM2FiUmYvNnBOT2RTa0hRR0FCdEdVbUVQTUZWMy9TWllOU2hF?=
 =?utf-8?B?NmU4cEc4ZUg4a1grQWpwNUJJbW9OWlIzbXMzTTlONDBaUHplRmhLcElaSGl0?=
 =?utf-8?B?UkxYYTNNMUQvMjNrUTZPSThzdll2Y1JSYTdadXBOZEFnTmFFM0didXNBQU9q?=
 =?utf-8?B?dU0rWW0zSGFIVlZpR3pGeU1VeTFCR2pGMlNOZENOeUh0U3h4bVFqVFcrZlZO?=
 =?utf-8?B?T1FMa3YrZG4yZWNVN0FOVGk2ajBuZDQ0aHMwbGpOcVFpWVRQMHQyMjVub282?=
 =?utf-8?B?aExBZDViZ2l3dys1bFhESHBoMk9VdmRFMkRybXdlcXlUNkNZdVltcUU1UzNL?=
 =?utf-8?B?aUcwMzd0WWZEUlhpUk1FUDgyVVVkTTJsSmdHTjJ6V3VlRWJMTzJFSWE2ZmNl?=
 =?utf-8?B?c1NGTHNZMTR4WlNnQzVjYkw3UWJMcVBITWFNWDhlaFlrTmtrMUxWK2hKemNF?=
 =?utf-8?B?djZMMzBCSFRDdU8xSGJZbkxQNmJzNGFhM3RrWGFkSXNOV3BCT2xVOHV6eEJB?=
 =?utf-8?B?dGVuWFprTXp4ekcyMzNWeFloTGVPM2dqNlFSdW1iUGVmbG1KQUpmelBEK25u?=
 =?utf-8?B?dU9MbjZaSlgyVC84UWlnY044bEo1L2I3VVNNVThxWm1QL1YxamxLamxYMnFu?=
 =?utf-8?B?UVJWWWxlUHUrOW11Zk1XYkNpWHVHTXMrQVZVUFBKSGk2cjViUS83b0ZqdDhi?=
 =?utf-8?B?d0RSd3lvcDRvT1lIQkdGMXR3cWNzTTlSaEw0VE5IZTJpTkFJTGUrKzFHOGl4?=
 =?utf-8?B?YzFUMERFenR3UlZ2alhEN2JWakRnWTFYYVBrc3lDb1ZRcEovUVVpUElXdnFZ?=
 =?utf-8?B?WjNPUG02SGZFcE1wejZxa3lRa1QvQWdNNndac1hOUVVreWNDQ1NGSkhnaDRO?=
 =?utf-8?B?QjB4N3ZXZXl3cjltbW5mVk1uRDdXbk04azg5cE5weWgwTThWcEo4dWRJdUFM?=
 =?utf-8?B?cG9sdnRVZXJzTGFBYW44cXFtTklxcGJzS3ljeHFqRjhmc3I4MEhQYUZ3aHMx?=
 =?utf-8?B?SkV4V2FrZ0RFOXRxVXQranhNREtWUmgvQjM1c0JmdUE3N2tLS1NtMC9Ranc1?=
 =?utf-8?B?T01aSkxTaktpV3oyVFc1ajVBNXlURFhldnBPQy84RGQwajNhQjBLeGlqM3Bz?=
 =?utf-8?B?elQ4cEl4TWYxM0dETGVVWllKd01TRXJDRFpNVjhpS05xclZYcjh1emRHWjZM?=
 =?utf-8?B?QnY5VHIwQ0lPVFBWVnRTR3c1ZlczZmc1cDM4UTA2OVhOcUoyanVMeFBlMDhz?=
 =?utf-8?B?SzVXOVBZV0xMM29NbWtUWTdxbThkdEdCUlpmNy94MVB6cGZwbmpYbVA4MlVa?=
 =?utf-8?B?Z2dVNmxRdjFTZXlRbGZwMVUvQ29CVytlNGpjMUFQNjhzY0ZFamV6bEdWamdO?=
 =?utf-8?B?c2Nhc0QzR1YwTFpkNjNRdGhpSWE2eitiNDhlQ2xaNjZQMVYvLytVaG9nbHVX?=
 =?utf-8?B?dC9nWGR4RU5EVUtlVDdWZW8wOXdEdTk4N1UxQVRPb3FvRFpqaVlpUlVPK1dm?=
 =?utf-8?B?SDJsSFZHS3VBT3d6ekNXVDdtOTcwZE4yQ01hNU5Rd0ZraUhDdTZGSkxqaTBz?=
 =?utf-8?B?K3FtSStYR0dGbVdxL1U4QzZtYTJHc2NydndnYzBhQ0tNYldmYklkMm9CRlhm?=
 =?utf-8?B?eWcxeW5Kbzl3cjNrY210dUZ1R0dUN2F2dFc1YTVPZzVvbVl3Qm8xWUdQeDdV?=
 =?utf-8?B?N1ArRmRUNE01SEhMbW9TVDV6L1JxTm5zamNrTkZoTSs0YXBsRXNnTGRSNDh1?=
 =?utf-8?B?NCtJL1gvQU5vZUYzWFY1K1lnVXcwcGhveDlINkIzcmU1d1Vnc2REYk5NanJi?=
 =?utf-8?B?V0lNcTBMSzBGNmhUUUdhcTBjeUVSa0phWFRNaVB4NWJyenc0ZTFBV0VlTjNU?=
 =?utf-8?B?Tm1vNXd0b2hKTktneVBpOERuVEg0Q3hTS0FwM2huYTlKVjE2MHBFOW5xL1k0?=
 =?utf-8?B?dXNUQlZHSzBub0dOQzZHQTcybEtPRzJaL2ZoWTdrTkJGMWNjR3VJZWxPeG5a?=
 =?utf-8?B?MDVCN0VFLzJEekZlS1RBVUhqN1htTCsyNisrNWl1am1ZS095SnJzZkJsMDcr?=
 =?utf-8?B?NHhNS3gybDY2V2RyTzY2Smg2aHUxZWNKNUtMU2wzaW96MVpGVzFhZFVrUEhw?=
 =?utf-8?B?eGxPZFdUc2JsSVhzaUpnbUZIcytKellZeXBFNDc2UjZLL0FQQlV0NGR4eDVL?=
 =?utf-8?B?RElJMTdaWnlWKy9EcXQrVnh4SFUzSlhVd25XTmNvUUs4M0xiOFpNZko0Ulkx?=
 =?utf-8?B?ajhQM1E0d1RpTHYvWlhBdDIwcnJWdFQ3N24za2RTNlZjZmtuMWZzTEg1d0kv?=
 =?utf-8?Q?k8VoTUFMIvod6SrA=3D?=
X-Exchange-RoutingPolicyChecked: e1KHbn6mA5YycdM3gYn4oPIk4PzNoP9qp0LkUwQ+Vs5pXuJESXVn6awR72ZoEhR5wCOZlqmdbIx2NEuU29YEHSZ6wIH6HzXy7u3jD8NzXkW1UDXdCqV1WyMvVqbqFt0YspqixWnx6dkjS5+oDInniTRC1HlMD98CX5CMXBOvKyvUupQ4y67pYGEGvRdiCCpQidgwH33DwxXNxSAUmUoEQvonxHkqmdUAu40xvHksu0Rr4QjyW896SO1Xfswb6tQTFeMusRvCnWO0RzGDPQZKOl6d2eLn/Zn3UDm6tgRQrHlytfo8K+n29Rgpy+fYT483BZ/PKEG8lkCZFaOuBkFyow==
X-MS-Exchange-CrossTenant-Network-Message-Id: 537209b8-4a90-4912-1d03-08dedb485f08
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 10:21:41.4057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N3hOt3yPs53k6ZPeBrwNoT1gn3hJelee9Dy05US1hb6QgZ+e64FP37VYgQ0kVS7nQP6a+mBNTLJWWp30kjOtiuqsF9Lu5c/8tfBUEiqlQO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6378
X-OriginatorOrg: intel.com

On 7/3/2026 7:53 AM, phucduc.bui@gmail.com wrote:

...

> bui duc phuc (24):
>    ASoC: codecs: ab8500: Use guard() for mutex locks
>    ASoC: codecs: ak4613: Use guard() for mutex locks
>    ASoC: codecs: arizona-jack: Use guard() cleanup helpers
>    ASoC: codecs: arizona: Use guard() for mutex locks
>    ASoC: codecs: aw87390: Use guard() for mutex locks
>    ASoC: codecs: aw88081: Use guard() for mutex locks
>    ASoC: codecs: aw88166: Use guard() for mutex locks
>    ASoC: codecs: aw88261: Use guard() for mutex locks
>    ASoC: codecs: aw88395: Use guard() for mutex locks
>    ASoC: codecs: aw88399: Use guard() for mutex locks
>    ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
>    ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
>    ASoC: codecs: cs35l56: Use guard() and PM runtime scope helpers
>    ASoC: codecs: cs42l42: Use guard() cleanup helpers
>    ASoC: codecs: cs42l43: Use guard() and PM runtime scope helpers
>    ASoC: codecs: cs42l84: Use guard() for mutex locks
>    ASoC: codecs: cs43130: Use guard() for mutex locks
>    ASoC: codecs: cs47l15: Use guard() for mutex locks
>    ASoC: codecs: cs47l35: Use guard() for mutex locks
>    ASoC: codecs: cs47l85: Use guard() for mutex locks
>    ASoC: codecs: cs47l90: Use guard() for mutex locks
>    ASoC: codecs: cs47l92: Use guard() for mutex locks
>    ASoC: codecs: cs48l32: Use guard() for mutex locks
>    ASoC: codecs: cs2072x: Use guard() for mutex locks
Hi Phuc,

All the guard()-alone patches look good, the ones with PM runtime look 
monstrous - much harder to review.  Especially in 'cs42l43' and 
cs42l43_apply_accdet_config() case, I'd split the cleanup.

However, I'm not the one who will run the functional tests for these and 
from review-perspective, the patchset overall looks OK:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
