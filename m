Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1DE1C69D
	for <asahi@lists.linux.dev>; Tue, 17 Feb 2026 18:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353165; cv=fail; b=UWXWU+bE6zkBBVedAyX943+HZdjwVQWn9deNSM08EPpJpifK1CBO2bWUTNMbQfwSK12wkSFBCB6HNg8Lz8VWoqyJkPOsvK3vzBtKsw8Cr3kgVmlH5Bu2g7E8ntL4GRDkWO8yLFWxcTu5NZ+yJECLTP/HaewRxJoFNJ5dyvhqD0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353165; c=relaxed/simple;
	bh=tlFGIhOSSFgbGWt8JZtrjcZy1iufTVwk/KvsGICbB4A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=g3fLrfEXS7cleK/opS8rY5hXLKyEjNGiJW+N/pbTuhBTDVZkl7txpXBHGIKQVYZ6il7A0u2aRNPMtHhtYGQxPDlEcle3UdyjIoW91aEzfX4pgG7X6gmUNO40IUomlJD8AXafTK7D0hyaTpSuTG6J428ilVoPrqvNbe3vdnHnoqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=CnHz2uBW; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="CnHz2uBW"
Received: from pps.filterd (m0209318.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HI825j3071393;
	Tue, 17 Feb 2026 18:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=tlFGIhO
	SSFgbGWt8JZtrjcZy1iufTVwk/KvsGICbB4A=; b=CnHz2uBWDuhtk8bsGXDB/yF
	1Cc2tAsKl2THrewMUar/PyqILQgQT2Gkkd3lipTfBeisy9ddFCk/vZthlmWyf4lF
	6SUYenL1bO7JNZesNHDBPpPKmHiRy6OfQiIk5GVXF/XriZIdC9dcW/fZqrykX3V9
	g11yDgf2jkw1pyWG+IrHm3ACqdjUyoaDTJA/2kUrjyuO8bx0rnRVDnk8AyVjzcru
	pcH61g8XjSl2LLXx1Yz0Z3vNyBoMy0WocwGf5Rnzia41DSqXLNg7eKwepn9gM90Z
	c4f8jvYX6veiCDexBWaNmt1HkypMGSGzUE60ihnFf6h8lcCc2b22rn9vmB1ZZPQ=
	=
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010024.outbound.protection.outlook.com [40.93.198.24])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4cahxjkfrf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Tue, 17 Feb 2026 18:32:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pErPqYz0ocD4ADSydB6cS7CwK8fePL29PdH4G3lpOjFCxhwIIQyngvsT+V1Gx8yhVUxK0EquDheA5h7EY6POrtgjxOHTtYkS741LVdd7Pmq0HZjHqIj5Nj/KaQmf5s/aFtUZRISxxcJopR47xYELQDOwL/dAQ9a1ne9ffHbpuT+EvmC9K5b2VRXLqfJtd8NmTuoe48yYYbTX9uhbhreZ4TbouDo+C+F8MXB+6djH0uHjsFBaVoj3W/ddGdIfag7SDnscohDh9tQXn5jnvbPGiQyAfo9NxhZVm4DLPsMrJgnKlxwZxfICO6/tDGTYqQLwIYHgh+VrHTJbUGlK15UCkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlFGIhOSSFgbGWt8JZtrjcZy1iufTVwk/KvsGICbB4A=;
 b=GuVWdg6eJS6uN0HqrkdrI0ij6XL8TMRcmbDTuGNCqHu6KtVUzZVUvMJENZZ1MeL9D/FTr/QybmTtWyXHREd365W8xi/I9LIzw/HKhEKTn+Iutas9jYScttez3bsDnRQ2lXWdQRATy0aKX/ul7FCpXEeFtCkoOYw2qtWlXnjOpcUdHU7ww72bISxZje4b327Z1jKEh09Sv5G6krNGSENfd01u+3BJbhnulrYOIMdMACb3slDvRrYi5cZQniDFXCENT3VXdCXTwuAaDegyH5W2loR7SpzrLIewgUTBxBA3lE6i4j4b/WcuswZLV3VLqjcciTe8g1aLOUoy8ydAloV/8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from PH0PR13MB5639.namprd13.prod.outlook.com (2603:10b6:510:12a::14)
 by CO1PR13MB4968.namprd13.prod.outlook.com (2603:10b6:303:fa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 18:32:18 +0000
Received: from PH0PR13MB5639.namprd13.prod.outlook.com
 ([fe80::4d30:f784:c7cb:6716]) by PH0PR13MB5639.namprd13.prod.outlook.com
 ([fe80::4d30:f784:c7cb:6716%6]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 18:32:17 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Mark Brown <broonie@kernel.org>
CC: =?utf-8?B?UGlvdHIgTWFzxYJvd3NraQ==?= <piotr@maslowski.xyz>,
        Richard
 Fontana <rfontana@redhat.com>,
        "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
        "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>,
        "povik+lin@cutebit.org" <povik+lin@cutebit.org>,
        "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
        "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
        "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
        "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
        "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
        "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
        "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
        "linux-spdx@vger.kernel.org" <linux-spdx@vger.kernel.org>,
        "asahi@lists.linux.dev" <asahi@lists.linux.dev>,
        "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] sound: soc: Add SPDX ids to many soc files
Thread-Topic: [PATCH] sound: soc: Add SPDX ids to many soc files
Thread-Index:
 AQHcnUr5QP1jsPRwr0WyCOk1C8urCLWHEBcAgAAJkwCAABKhgIAABEPQgAAJPoCAAAHFwA==
Date: Tue, 17 Feb 2026 18:32:16 +0000
Message-ID:
 <PH0PR13MB56393C31148DB34E20B703E5FD6DA@PH0PR13MB5639.namprd13.prod.outlook.com>
References: <20260214004314.3787727-1-tim.bird@sony.com>
 <DGHCVCRACU6X.2KYOL2RQWEUG7@maslowski.xyz>
 <CAC1cPGwgwPJUssJwtUmVydXEGeL-3vD7h2z5_Hb+4g=mYJfhHg@mail.gmail.com>
 <DGHF0NAEUWLD.1Z9W1ZU9LLR0H@maslowski.xyz>
 <PH0PR13MB563954A63CA5E752C8DD8FF4FD6DA@PH0PR13MB5639.namprd13.prod.outlook.com>
 <ce89164e-fc08-4149-aad8-234772d38bb7@sirena.org.uk>
In-Reply-To: <ce89164e-fc08-4149-aad8-234772d38bb7@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR13MB5639:EE_|CO1PR13MB4968:EE_
x-ms-office365-filtering-correlation-id: 420dd0d2-ec93-4d97-ae12-08de6e52e0a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?NU1sb0owMmtyUWlrSEFBN3d0NlN5dmJ6MzhUZFVRVjVMNll3M0xKbWVKb3RQ?=
 =?utf-8?B?eFpYQ2NzdzVYbC9FMjYwc1UrdXc2anp4bHR6SDN1L0dEVFpQcy9HVjNtRUxQ?=
 =?utf-8?B?NFFvaEhDd2FUbVc2Z2lOQk9QVmNMQ2Fna2ZWckhJeHhVaE5lK3NMR3ZabU51?=
 =?utf-8?B?VmVJM2tJVU9TQ1BSY1VDRUZmRDlxVHRtdVNOLzdrbzk3UXZNWDN2TklnNEJv?=
 =?utf-8?B?UnJTZmlvT1RIcDJkQTRsUGtzakxYTjRRWGp2YnVKanlVbjQrSzN1aGE1b0FE?=
 =?utf-8?B?MGhpRkg4T3dld3pJYk05RGZsL3NOa1FZb3VHZzhNRXdBSStHYUJTeTJBNXMy?=
 =?utf-8?B?NWpMZVRoL0hJb0hVbnE1Z2w0SzUvN1VXenlhWWRiMERFLzg1eVBGbkVzWWZ6?=
 =?utf-8?B?a2FWS3RZZlpUVk9NanVBeUhWUUk1T1Nyb3JEejk3cjkvaXhGRE95d2pjcFNR?=
 =?utf-8?B?TVlBcnk4Y2lwYitybzV4Tzl6OTNPeXJ4Z2c4cUIwZG01QUJXc2ZlcDBtWUJX?=
 =?utf-8?B?SEJ0U3lVekNvQk5XVUFaUSs4QUhXaXRoUFY1cXJSQkZtbmdLREE5NFhYRlgw?=
 =?utf-8?B?SnNSeVh4NVllTHFMWnREWXNFRzAzYzY1cEVJWE53dkRteEYxMkRvbzB6RVVE?=
 =?utf-8?B?MjRNZ0hRcWhHa0J4dklJNnhyLzJreExVTzkyZVJzUko5N3RGZGpUL0lEeXVi?=
 =?utf-8?B?T2pHNzdBa2c5U1p5QjJNRUZIanFyQ2dldXA1OUhoT01UMy8wS3k4WWx2bDFj?=
 =?utf-8?B?RTU4bU5PVk9GK0ViaEJtYkllalM5dHVLZURxS2drOUJaV2VCY0ltdzFzQUh2?=
 =?utf-8?B?cnNzck5ibDJ2bittWDJyNWFlbVA3MU5LWk5YcVVtdTRwSm95RmhZeVI3ckVM?=
 =?utf-8?B?blNWZUFoV2hCZUJyekdKZFE3djVoZ1BudFNwdHB0RkJPU3NjK3lUNlZkaHh6?=
 =?utf-8?B?UWRZNituQ1EwR2EwdERMWFBabUtMaWM1ZFIrM3RCMUkxaVpEd3ZMMWJwOUl2?=
 =?utf-8?B?aXZERHo0SXNXZW9iUlVNL0xWbXBsQjg0VDR6WG4vYWxwSFdoRkZLNUVuNVdY?=
 =?utf-8?B?OGxCZ3o0YnpjM2ZveEoxZkZBMlRSdEhZRzZ3UFhMMHcvUExUcWdNb2YwSHFL?=
 =?utf-8?B?d3h5U2xXVDcwUjN5WnpFQ0xuS2hoMDhnTk5SRk9PbXB4ZlVWeDh0U2FTanVk?=
 =?utf-8?B?NFZFbUVneUpQQTJ1d0pYaFdwcmduaTFjd0J4Qmh0NzduT3VKVWM3Q2ZGUTQ2?=
 =?utf-8?B?RlZoanBvR1IyQ3l3d2REcDFZeVZOcXloZTQwSTJaZTVCSnVPSFJJMGI4S2ZG?=
 =?utf-8?B?VEpMTW9xL1F6alFKTXg1bExrVWV6UlFnMlNObHZkY1VDb3FHVTZlQ3Z6WGpG?=
 =?utf-8?B?Ui9BUHFDeUhyNHRKZ21PTW5PY0JWbG1DMVprakwwQmZ0MnV2UTNJc2h5ZW5P?=
 =?utf-8?B?ZXRENzg2Qkh1SW1SUll3V1dKSHo1TThXWjBEamtMSUFwYUU1MFNuTGVQa1BI?=
 =?utf-8?B?S1VYNngwdmZzVjZFWG9iaFpzVUdVUDM3UnNQWnpOU0szREN1dTdRQWtlTklM?=
 =?utf-8?B?ekhWRHUvYnZwMXhLQVJXdjdwemVtZ2NyaVNzMmFJRjI4TXdEdWc3QVlvbFhT?=
 =?utf-8?B?cnExUk8xb0FyTnhwcS9xN0hiNjRobDU3QVlMUGhQNWhBSUlWVm1kcDRaMHIv?=
 =?utf-8?B?aGM0Q09ob3NkMnV6R29pWHA3RnZaZUJjNm9tR291SDVVVlhxNGxNSVRFUzdj?=
 =?utf-8?B?SitYOXQ4cjlGSHBRWi9nQjJTZUNtKzBzb1JOUTloVHB4ZWwwVVlYbzdBei9P?=
 =?utf-8?B?TFBSTSs4UFo0cTkzaFNURlJEbUo1R3pRQ2VlV1UzWDJsU0VseTA3RXh0K3Nx?=
 =?utf-8?B?Q0hvWC94V2ZYZ3hQcUFxNzV6ckgvUWhiYVIwa25CZGpoY3loWHhPbEJLNnpN?=
 =?utf-8?B?R3EvSzJFdGJJUkQ4bzVkY1JaMnlESzIyVUM4dkFpQTlKdHdXZkJzdlZiVk54?=
 =?utf-8?B?cWZ1SkgrN0s0WlVrOUxoVGc2VXNqR0l6Yi9hT08wNUVZY2FuUFp3TVRpR0lB?=
 =?utf-8?B?YUVoOUpuajR2U3VGTWY3MnJaRnN4NlhiTmxNZGZKWnhWNjY1L3RQUHh6ODQ1?=
 =?utf-8?B?Mi9uK21QU2RUcVNPUmUvS2FFaHBQVDVvS3p3SFFpMzFmSzVkR0EvNUdkbUpW?=
 =?utf-8?Q?qYfIaTXm6inawJwRZh6Zup4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB5639.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d0hiU3FZcFV3ZENnN01NYVhvMjVsR01hZ1Fsd0ttVlk5Z2ppaTI3R1FoNmti?=
 =?utf-8?B?VVE2dXFVTXl1SnVPM0lwYzFpL0liUmhDWmdjNllMM0lqODdWRkJFNGU2Vllu?=
 =?utf-8?B?Y2xXQ2RyY3hEQVVtQmxvdFNwSGVwMGJTckFKSUtCdzlGMnV1dE5KSFN3NEdH?=
 =?utf-8?B?M1c4T01zcGRkTkd6VWE5N1lMQnh2MG0rYXVYYmpUSFljSXp3dG1JQ2x3RkV5?=
 =?utf-8?B?VVFUQldOdkF0RHpBcUk3NFpXVFhjclVBdjVzV0hQSS9Ib2QxMVlpSXZqTzhW?=
 =?utf-8?B?UXQ4b21XRmZrNTFYN3RGLzZLQ255Q3VXR2tpRDJFbnB1Q2xxU3BlTGdEWloy?=
 =?utf-8?B?SEJKdXo4WDlhZDMxbytmaU9yRlpHVDFEZWRvRXN3RWVQNEZBR29FWDRGaDNC?=
 =?utf-8?B?dENqd0dXN3luV0pKanhpd09SYmwyRDl2S2VvNS9uTUVUSkJxdWhzMnV0emVE?=
 =?utf-8?B?dFVNTUp2MzdyaHVWRkQ4SWowKzk1djdLRkdWWGc1MFl0VTNTb0VhRlJ0dkRl?=
 =?utf-8?B?cGdaazFVdnEvN2ZEY2hFdVhDalFtSy96Y09TYzVSVDJoK254WVZmWlhQelc4?=
 =?utf-8?B?S0N3clk2U3NzSENRUWJNMUtJNU1HdW9HdWhHK0JodjFzbzE4blBkWTRhRGU2?=
 =?utf-8?B?VkpaUm1INTBYR0NrRGJVMkVYY3JxN3JhWWthTXNuR1pEM3YzSzZhdmcxdi9L?=
 =?utf-8?B?Z090czgrZ3ZGb1dER2Q0UXN5Nk1FYmp1VllQVEhLU3ZvT2NwV1E0NG5JdENm?=
 =?utf-8?B?eEJ2SDNsUjRNaGlvL3RRbkVhdmZ3dWx3S2RTcVBGQ0svbjZRaWtESGVtY3pC?=
 =?utf-8?B?ZzNMbC9KWjFtY2xSSjZkN3dLM3ErOXd0aGh1MnZnUmoyNWluK0l1cDR4QWhQ?=
 =?utf-8?B?STZ5Q2VKb01xRlpmWlh4aDJtYUZnY211ZzVTWWVDRVd1U3B5MnNLZUl3WGdY?=
 =?utf-8?B?b2hHZ2U0K2xkWG5ZYjhIYTllZ1BFNU9tRVZLbEtEUGd0d0RuWmVYdzJLeHR1?=
 =?utf-8?B?RzhvRGVBNGxjQnVtM0dKRkVWUVRWaTJOQy9wOVlKby9iaFlmLzdVTDB1MXpN?=
 =?utf-8?B?U0h1MkFMeHZRVUovTEJhNW9uMzdkZWw0Qng4dUZpKzdtbWRyeE9iTUZ4aURr?=
 =?utf-8?B?MnZmVlRiYVFJcHV0a2pPN1hCZXlFQ1ArUnJwaFgrcmdLSGt2d2M2eFdPM1hz?=
 =?utf-8?B?elpYV0dPQlhiNGsyQWllZmN6N0tOSTVEMzZxcHNYckZiMlBvSEhTZ3ZENktL?=
 =?utf-8?B?UytLcDRxa2k3YjU1QVNrOWEyMXFOWWJqOXl6WVp2OENXS3ZrMWdsM2sxcTdU?=
 =?utf-8?B?ZW5HazJYZHJTSDVPd2JpNVFSamVVL3hRdzVTOTQxNXpLSVNnNzQyTGxLQ1A1?=
 =?utf-8?B?bzB1MWVjTnFQdUh0eEN3SFUvNUtrZ0NqV1gzdjB2UVJ3blJSYW5wTDdyeHAw?=
 =?utf-8?B?VjM2RThHYUN4U0lBSXV6bmd6c25VWG02eVEvd3BHdERGUGcrVTZqejB4cnNn?=
 =?utf-8?B?MHJBajVuUEt5czN0enBJRFoxL2toWWNuU0VBRWdTdEl2U1R4dVcyc1h3cDJn?=
 =?utf-8?B?UmpXUU0vUWVXZ0F1Uk42SDYxY0RPSWswMlFPaC9lZ2J1VkpCY3F4TmNGay8z?=
 =?utf-8?B?dmNvN01BcnVETlBNUDhjeGlKbWE3bzduS2cxLzB4Sk5mcVZuMkJRTmZMazVH?=
 =?utf-8?B?YW1weHQyZ0NIZTgrT3F6dzlobkMvWHI1MnE4NUFycXlPZnFBdXRzVkhEVWdX?=
 =?utf-8?B?VlVqUTNRcnljZGNteG1xNFNYclhJTFY5YlhCUk80b0V3TGF2ZHMzaU45MWhl?=
 =?utf-8?B?OEhiRXlHL3A3Skl3azhmYkpYamQwYmRWKzcySXB3L2dmRGJYK0RPMytVV3ph?=
 =?utf-8?B?VVQveFhSRE1LWmpqWFpuODgxcldlblFkWFZyU1R2azZPR0szUS81RGFFTEQ4?=
 =?utf-8?B?TEZucVp3UC9DdlBKNDRxalJ1S3JxUmdHYzFWNG1jeGRoU2J4YjkvTEQwTVcv?=
 =?utf-8?B?U0lkTmtMMDZFNGh6SUdUd1hlSktXdGRHVVNJd3lQYUc5dDBJMWkrcm1tb3FO?=
 =?utf-8?B?MUp4dzdZbDVYellOcnRLL0Vmb2gvT1VsalFJb016QktNYWlxaHM2RW93Yjk0?=
 =?utf-8?B?TEhDZHR3am1wRVYzdmRibUNiYmE1NjVhYXRRMGNMRUwxbXRZb3ViT2VHbFlr?=
 =?utf-8?B?MU5BS2tuMVBhQ1UyRXJzTEhNY1RDNktKcFlTZlhaYjI1WC92QzUwa2VLcTJM?=
 =?utf-8?B?UGp6Sk9UMVJXNnFhSzVDQ2hoRzVTKytYY0xjd0VuL1ZUbGN3Q3h6bm5XcGo4?=
 =?utf-8?Q?fx04Npww0hcMt0ZwGK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TVATrqfzCxVSAIQWPJ/B98LNhqt6M04xtrkq7vsJHFN9eZjf9eBqJ2Rwa4uiFg/SS478Zqa0f3AvK6i2MklAyOxwivqarivCibRu7Z91eLGFiT6aSoz1m3q48sOqpiazpAeEB00Ju3QixPuub5Akva7uBbxUQHRcyHojRW8TPijmIpC2QMje9VRsZO+a+b4ZhGo9ZNCzlfM/Q47cT2+Ngv7adUQEcEZsnsQSnxxyQ/pXf86G7xsOObZuJH7CeryIpbsK8dPoBiBjaR6bClJCpOlbdjsSyD8saY7xhu0moIRygZ5wcHpnS6AP9tvsPyH7SJmO2ZFWnUAD+agD87TDtaCbDXA+jlvKhqySGz0hgQaZAJAyuKwZswWea3dK4hayZYPW2De/ZQAHqG/vJ4KjTVD94x+ahnWsfiD+C8p8CRkNxLhwXNhV/7aMGHMPvGYm45QeuNHT8AkjKH+5eJ7fpaIdniAYuwwq8v/ZF6zk5ssz+UK0MPx3t8MkEzOM2lXpjg0c3RYRRi2NrAHRhakO8jzV1tag72SsyCW8O2n6Omd8J87JT41ac8D1rKN+yQiMeH4iC4sBA9EmB/TYU5IkElG+X6BrqD8F8F+dm+W4O7O0RO0ZexIWOOO0lPO4Crzn
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB5639.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 420dd0d2-ec93-4d97-ae12-08de6e52e0a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 18:32:16.7019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PPvAry80cOMY6xg0LSJVjD9suEvS+S7Yy0zUwBu1/LTlHZthzU8+CeCdAEK4/X5BwlFZ4GDwawKCA5QBhKYkBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR13MB4968
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MSBTYWx0ZWRfX2QTrAjsq4a3T
 SIdOymm3i6R0seFcM1L4FtkcK1IbS0MCyn9h0AICn28Eaefa1YUgetRg6sIr5UQE/tlQMDj12hu
 kTTSWz4tadB/YSK7xdsGRiuATA1rpm3orjT5CNSfI8wEpXIBWMQS61lnnpPj3Mq4tPcIxOkxkOU
 pmyBG7qHqkwXZJv2fbxgrwpLoDsBt60RT02LNJxh51ccOtOvkEldV+dLNzjFXfjUeSZAZefDDSA
 o/KNH/j3nrWIgWO4jFptUEg328YsomqV44VttzV8fGlX/9qs1lCSc1ygoS3/Dj0ZB94QQidbCNg
 j/9o8G0HUopc0iB9pUXyy+jDowXWjr+cqFvRkr20B6yAms9Nk/rvGVDtZwtDzMiVW2sBHpJDxX0
 d8ExcLAosPN9RWkXDcuXu5ZFlib4gNZ7CnqBofpzeRuxrdT+nKhHNrbVAy1AMqbcvEsAcldQAj0
 JJ/8DC+yP9Wn3o0wn6w==
X-Proofpoint-GUID: 1UF-Fgg06O4eF-g3mvOC4sF72S1AnNN8
X-Authority-Analysis: v=2.4 cv=CMYnnBrD c=1 sm=1 tr=0 ts=6994b438 cx=c_pps
 a=V/jExjqSSumuV0DCu/2ZVg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=xR56lInIT_wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=jwv1zly_7pfU-msNWoEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 1UF-Fgg06O4eF-g3mvOC4sF72S1AnNN8
X-Sony-Outbound-GUID: 1UF-Fgg06O4eF-g3mvOC4sF72S1AnNN8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyayBCcm93biA8YnJv
b25pZUBrZXJuZWwub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBzb3VuZDogc29jOiBBZGQg
U1BEWCBpZHMgdG8gbWFueSBzb2MgZmlsZXMNCj4gDQo+IE9uIFR1ZSwgRmViIDE3LCAyMDI2IGF0
IDA2OjEwOjE1UE0gKzAwMDAsIEJpcmQsIFRpbSB3cm90ZToNCj4gDQo+ID4gSSB3aWxsIHN1Ym1p
dCBhIG5ldyBWMiBwYXRjaCB3aXRoIHRoZSBNYWtlZmlsZSBoYXZpbmcgYSBHUEwtMi4wLW9ubHkg
SUQuDQo+IA0KPiBQbGVhc2Ugc3VibWl0IHBhdGNoZXMgdXNpbmcgc3ViamVjdCBsaW5lcyByZWZs
ZWN0aW5nIHRoZSBzdHlsZSBmb3IgdGhlDQo+IHN1YnN5c3RlbSwgdGhpcyBtYWtlcyBpdCBlYXNp
ZXIgZm9yIHBlb3BsZSB0byBpZGVudGlmeSByZWxldmFudCBwYXRjaGVzLg0KPiBMb29rIGF0IHdo
YXQgZXhpc3RpbmcgY29tbWl0cyBpbiB0aGUgYXJlYSB5b3UncmUgY2hhbmdpbmcgYXJlIGRvaW5n
IGFuZA0KPiBtYWtlIHN1cmUgeW91ciBzdWJqZWN0IGxpbmVzIHZpc3VhbGx5IHJlc2VtYmxlIHdo
YXQgdGhleSdyZSBkb2luZy4NCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suICBKdXN0IHRvIGNs
YXJpZnksIEkgYmVsaWV2ZSB5b3UgYXJlIHNheWluZyBJIHNob3VsZCBoYXZlDQp1c2VkIGEgU3Vi
amVjdCBwcmVmaXggb2YgJ0FTb0M6JyBpbnN0ZWFkIG9mICdzb3VuZDogc29jOicuICBJcyB0aGF0
IHJpZ2h0Pw0KDQpUaGF0J3MgYW5vdGhlciB0aGluZyB0byBhZGQgdG8gbXkgcGF0Y2ggcHJlLXNl
bmQgcmV2aWV3IGNoZWNrbGlzdC4NClRoZSBtaXNzaW5nIFNQRFggSURzIGFyZSBzcHJpbmtsZWQg
YXJvdW5kLCBhbmQgeW91J3JlIHJpZ2h0IEkgc2hvdWxkDQpoYXZlIGRvdWJsZS1jaGVja2VkIHRo
ZSBzdWJqZWN0IHByZWZpeCBmb3IgdGhpcyBkaXJlY3RvcnkgYmVmb3JlIHNlbmRpbmcuDQpJJ2xs
IHRyeSB0byBtYWtlIHRoaXMgcmlnaHQgaW4gZnV0dXJlIHBhdGNoZXMuDQoNCj4gVGhlcmUncyBu
byBuZWVkIHRvIHJlc3VibWl0IHRvIGZpeCB0aGlzIGFsb25lLg0KT0sgLSB0aGFua3MuDQogLS0g
VGltDQoNCg==
