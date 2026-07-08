Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515563FC5AE;
	Wed,  8 Jul 2026 08:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783500666; cv=fail; b=RZzrpH0M/c3Z6Hbsyfzk3TOWcEh8oFnoGjU5nDDddjNHtYfV0TPH93Yi4wXr0Lg9ejwsL0fdoHgk2ThXw0FpfB2FSPzBs8XbJGAcU0pR36QK2NvB8/zMFDc7OUJwueB4JpjPD5W0xIHDrcPG7RFIRylHVw70TFD6eEUyQBXRF+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783500666; c=relaxed/simple;
	bh=02Lvt1PC0CJDohdJqk7wRGF15XAQfzxfEC9uZINpIEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AmjX24mF9W5iBkH0RhReJJ65foosv03x75T7v2w9KyJwnBQiEssWdANzJvapWd6eZ6ihX928R6iMJIQBVo9U/nVmk+UCOCCBFxde7tFx+mAe142vGnDwt5upnQvv+WcrNmqFPcVDEhh46CZ1r4UmynYK7MReAdkjJQbCasKOJyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hyYCY2bh; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=dWbg1zJz; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hyYCY2bh";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="dWbg1zJz"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6683v2d41543079;
	Wed, 8 Jul 2026 03:49:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=uNx1UZwrR9omhBE+L6
	j9R7VtHWdvfYET2xf/0Dmw2rI=; b=hyYCY2bhANk3wBj/ehEu19RjZ7QNmzrkPs
	Z/dCGXD06MF1C5sRWAFVIjYbm/NExELpG6MpdQ5ytxtsRlibaga5BuyoFhG+1Sc3
	qDx5Ec5gqeLlfkWOgsBBFdqDLKteH1IpefNgUDwsPY0rhPEwsej1h3DGuNxeupu+
	w5OgH4YoI+/cTJB3Rde2YnKeK1h/rzIM5Aav4QiPMJBo055r1V4qJl6KCc7aelRW
	7OrMcWnnNs8MAATLTrf0nq98Y1ZPeiX/F1OB6Tf1mTgCDfEAyYGlCvylZxPtJh2l
	VfJ2nwOoo5xG34CcehoOjaQYFlPKohu3kvNdNqPo+3hIg/EBFoeQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021107.outbound.protection.outlook.com [40.93.194.107])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f6xkjnyfh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 03:49:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSHd/2u2PoZdjT0YRieOfFA7EnMNSdOWw8YMZczDbvy3ozX8ziJ5eL0u5KYs5EVZxzg32gSbFTDCz2sgGsMYQbl8/Pj6w78B++pudl0dea4893l2Dxz2eLT2Mdx/Ric56k82Pff1cHbk8yDpWxPDDzWfQqTIaH9EF+bYCVVMZuw+qucd3+RFX0QiadTQhQVEX1JjTCp333daXDQiMNj654CJ9LZ0lp3eb/y9pue9qIaBUgo56GidRUz6+dHGp6xBol76MSQ3FzJPL23MWRjH2azHOw6SFT+PvgB5B08EFz0GA7OdAlCqTZk0xQhbpmasLYLt5yyW1fgqFrX4dZ/zsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNx1UZwrR9omhBE+L6j9R7VtHWdvfYET2xf/0Dmw2rI=;
 b=yghDc7xQwS2iUM6TSYbm/nBIPUEWoZ3M1ljIvy9HkKoOxzx61ChbvKmLMW97PBaWiPezSfXH7UBoenSr7U18jTEYdMs+4W+3gGQV1xhFmMD9HG0b9eOw0l92DIqF58DQjRcDbYLC4L4X67IIrvW1/kjxBGBSOTTBS1QxCIGIdAGsEgJ6XSY1WwcjP9g4r876wsaNnibF6Cmw7vfOzU70/lu7YWzNnvHfED2Ne+0I5tcuXm8BjHz4x434LRtjk0p8xSfKg7fsvNUCpAwVmnIehbTV8s2DVB08XNTby3ka6WGOVgXW7lQl9834gUprjw+Ip52FYuorWLxBeMeYmRf0HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNx1UZwrR9omhBE+L6j9R7VtHWdvfYET2xf/0Dmw2rI=;
 b=dWbg1zJzGs4cycrwUMCYMphUIhq8PtF58YOG+RwlD31ggUywM0NLRtuE8To+m85Ggtnv4MO/TKSZ8p2NbZ7iLFHLhWCaMIQWxLdUJP3gnOIqE8kNwnDtTA+jN5v5xUONfBwiRzTOil0linqmCBzIkV1yXy6vJFoLfHtnNbEsKXw=
Received: from MN2PR07CA0006.namprd07.prod.outlook.com (2603:10b6:208:1a0::16)
 by LV2PR19MB6031.namprd19.prod.outlook.com (2603:10b6:408:14c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Wed, 8 Jul 2026
 08:49:53 +0000
Received: from BN3PEPF0000B070.namprd21.prod.outlook.com
 (2603:10b6:208:1a0:cafe::56) by MN2PR07CA0006.outlook.office365.com
 (2603:10b6:208:1a0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 08:49:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B070.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.0
 via Frontend Transport; Wed, 8 Jul 2026 08:49:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4F03E406541;
	Wed,  8 Jul 2026 08:49:51 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 254E682025A;
	Wed,  8 Jul 2026 08:49:51 +0000 (UTC)
Date: Wed, 8 Jul 2026 09:49:49 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        David Rhodes <david.rhodes@cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org,
        u.kleine-koenig@baylibre.com, kuninori.morimoto.gx@renesas.com,
        christian.ehrhardt@codasip.com, Linus Walleij <linusw@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thorsten Blum <thorsten.blum@linux.dev>,
        Chris Morgan <macromorgan@hotmail.com>,
        Dan Carpenter <error27@gmail.com>,
        Marco Crivellari <marco.crivellari@suse.com>,
        Rosen Penev <rosenp@gmail.com>,
        Weidong Wang <wangweidong.a@awinic.com>,
        Teguh Sobirin <teguh@sobir.in>, Val Packett <val@packett.cool>,
        Luca Weiss <luca.weiss@fairphone.com>,
        wangdicheng <wangdicheng@kylinos.cn>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        chrome-platform@lists.linux.dev, asahi@lists.linux.dev,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v3 24/24] ASoC: codecs: cs2072x: Use guard() for mutex
 locks
Message-ID: <ak4PLbAQqYrTYk6r@opensource.cirrus.com>
References: <20260707051006.20058-1-phucduc.bui@gmail.com>
 <20260707051006.20058-25-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707051006.20058-25-phucduc.bui@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B070:EE_|LV2PR19MB6031:EE_
X-MS-Office365-Filtering-Correlation-Id: 6740bb6a-3382-409a-bf0b-08dedccde060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|7416014|376014|36860700016|32650700020|82310400026|22082099003|18002099003|16102099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	VZmU8zwWt0N2gvvh1T97wwKbt80ogEeAetQyiauukB53JsjLDfGNO9xOifEj5WlKN6FBpm5D3c7UU5tJ/RJpHWirnyFf+9zVazgejP6+iAunYDuLtMejQVFTd/sAaeWkBA3KpXFogCW/KLXd0Lj0tiydb5zh/4JvutadZ+zWB9xhxh+ZvSHvNXdZyPWrVzOLEubAHAcWXWwK7usubfyKpREKkMOxArf0mbtqqEjjGVdurf/T5hcGHrIXhJY4x8m5ZgeeYOXUtN83b0/B4TKhMtuxqOTFuxZ6VZvw2HkaGp5trbXNENpAkq0Y9uQloAoABJQeuQOn48/4lpj+CM8x4LvXobBcirLBLpky5pCTUj6tOZe0iyXPeiRb/9PsISndjBFMDmnBjaAqfA12dIaaLkDt92a+n+Oq9cigJiX64JETj8DYJY6zinvRVQo5bwFj5cRGXknjBLfMOvHUC5KUAQP3BCfdgofyv9pVWyS4b0nOuEzUanrkBD296Tf1y/R7xtl4OWSJJ9Y/zc7IMpuXT2WpaDGrX+SxWVvtLZ8MP2uD+sx2/vdGHO+pT3RLIqVA0QT/WHjChSqeWoLguok9AnmSF7Bwmi0ImI2bTAcvikqTZKTN5ORzl4qUd2B1xX3hwTkh9tr9kJOS3mD7T+qI2aENv6kQLAcj9P0VrIEQwF2mdSqPp45VMOQdR9oIL0MEQus1cbadrG39V/oG5TFyLA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(7416014)(376014)(36860700016)(32650700020)(82310400026)(22082099003)(18002099003)(16102099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1B1mBRFbSXM/ZORsKUh3AjODv2gg1zHGSp+RC8zdO65h9crbZkVFS3vKcscaTlDvmXDNLYaxJRYcIwMRkJgNDvXbqAdYswbzyKDktFF4HetkPjKT/JWa7OUTllhdLE+4X3kyPniGN/rrcK9GS7jxOFw15JhdIOfjY8F5+4g9n/Z7KGfdgtHbpBgYjHwIWrt3KkLETDyJJgYdZohw5uxdtsWUmtMztHWntzWh6zMFtr8CRJoZGxHadIxAOk5jaLTxggYQmH0rPZr0VNqI6wxVvpBXbkh3wW8wjePpsZMpLw1V6f0SmRDkLZLUrH37Jh87v6gfF6d9PZhgCYyrdZxxv+IpYvu7k8fB7ooZTaCg0+uX94omVPwaA1ABVsihyeyabkKj57RIQOlAF4z/CplVj32QKVUPDmxf++1v2Hl0vdoDTNgLwMUB+9TZcs9EvRwo
X-Exchange-RoutingPolicyChecked:
	VLQHHMpercnSLq7078Eai2DAJ58lhth9WduelAZIlaf8h9HriAPzl0UrHlNV8GQx02jqqFHz3CuqenaRzzjm7Dz3XPDN/ZuPYLns6WqPrrzNjknO7NoNMHPI13HLsg0SwZxzGoh+9y58jIScmmHoQgGpaOWiV/OE5M8RZ7WHAjTSnQ37eYP0rvJotHcxewV2yKPYiPAys/IJm/XGkGZf8CU2yY4DzkRaQ6gYBuzNpfT+WdDGMuSJ7ZT2INW1UUAn+TzgJbkVaXIS6/xS5WqoZVc8srStzndgkdS3v84pfdk0EBrim7if7eYMpcwGJKxe9NsSKi5JDfn9HqpTpcnDKg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 08:49:52.2186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6740bb6a-3382-409a-bf0b-08dedccde060
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B070.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB6031
X-Proofpoint-ORIG-GUID: y69XYn0Ga8v-pc6oT4xLSnls-mzRcMgx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA4NCBTYWx0ZWRfXztvGJ8yEKxqR
 2hxa6HNDd5cL8FIMGM42F94m6/uHwcGr6XZcPqT/F4PDe9d2sxGTmvFvKryu3/StGAie3kEsbR4
 iaM0y5+uLm5z2AXWFUU0Rls7sP9docg=
X-Authority-Analysis: v=2.4 cv=YYiNIQRf c=1 sm=1 tr=0 ts=6a4e0f36 cx=c_pps
 a=xmT5btM1tXsMPZo7WXzprQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=6ALVZA2hRvDcBUuhscEA:9 a=CjuIK1q_8ugA:10 a=Qzt0FRFQUfIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA4NCBTYWx0ZWRfX27q/bQiQikDR
 Yc6ezomQ1DmZ04jtiOtOBP2LSzvGMrpN3Umd/tjJ2pyvr3W7FknNK0pRzu5nuRt9XFF1gP5zZ7l
 j6MoQr9C8A1KsdYq+c54aAEqjUgOdmuxxAqhbskb8TG8vpOQGt0BhFm004Y/2xjbwheNriyn7d0
 fCSRBECV4XjWenefPt0s1RvyY4/uQ3mXuubSlmA75sUYkDMXHnk61CZ9rJVUR/W1axVkGBSOZLx
 O3aRETxGfzeFUmMEMKkB1vEXff2Fl54o1W4wXpiS0Fni/fi9TgJqlE1/aamFDkOuxRlZ2BtGSsE
 0uH9aUP1REQmxJi2cf/2YYvXaOeSm7JwoLmoF7uFujkzX4sq1vq2K+pAjJFS8c+1ksWlOJd4n4Q
 a/V7ewAh63tgtZfzJzNP4LY7lhv33gYkPmQm7Udzr7HnRvFy0uMn5jiKQ4a0EGkFc2jyYoy6IAi
 59pXa1/Z46OdPnScy+Q==
X-Proofpoint-GUID: y69XYn0Ga8v-pc6oT4xLSnls-mzRcMgx
X-Proofpoint-Spam-Reason: safe

On Tue, Jul 07, 2026 at 12:10:06PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
> 

Apologies for just spotting this but the subject line is wrong,
it says cs2072x not cx2072.

Thanks,
Charles
