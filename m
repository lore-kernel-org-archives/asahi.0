Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F22C1990A7;
	Tue,  7 Jul 2026 08:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413559; cv=fail; b=Gj7T8Uo6+Cq0g7y2qz2z3O+ClDvctupYMwpZkrQsjoqftA4pIRIiWehlQZxtXomjH6ONA23Cc7/nuSSoa6DtaL9+LW68yiVWpMoqVfJvLBO0UP8/600IUsRLq4blKLMr/EFmU7VXxdX92kIXxMVhgNeAO7LVrGxHcoiRadcazn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413559; c=relaxed/simple;
	bh=YnOaR81JdCM6oSSfYJyQj6dASpTiVTuXXps4BSJqA4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3WQ36tFGDVoIJ9dLdzyWbgw6FzNstRpxTEMye3fZsCByTLopyvtwixG6nJLROE7YwoIdLSrrpf9KRBC3X0lPyTpjgXKgha/8RX/5dSsmJ408t6VuDdb+g1Fh367u9MiuHpAQqXl++vf1GWS5NzXO3GwUbLVn5ZhocErrPOJoDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dgggcg7D; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=YQSVJFYq; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dgggcg7D";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="YQSVJFYq"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666Nip8O2868634;
	Tue, 7 Jul 2026 03:38:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=uQrpY0+g/et/gELylQ
	RAb5G6tjLNikJS8huGF2MGNXM=; b=dgggcg7DMRUhIXeslLp2gtYZrdKlF1c/Ef
	cBLN4axYYmomOYNUDE95YTo7qAGXft8kO3QcZpG4EN6z8qORPa7u7yWUlCUZVQ9i
	dHw6ehDGTNQAkPMomxxx4SnBlGO4xQEhEP1284dvJHbLWwlPCcZxTRuk7EaT+U/Q
	tCJVU8Qbp/Hu/6nOJm4vzAWNCrmQqibRAcm2Dsg8nIaq3/2dm/D4H1Ovjc8gA1UX
	Uh3IVOJy5kR7mrnP6x0KdImsR0VBMoK4Z5H0NiqyEN1h8foNmOrsW4PYVE3ZpMG2
	Rd8UcQ01a0UxIx4XX8bmMuNSqZ8pSengI1N6hTjkSjvoWOD/Mydg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021103.outbound.protection.outlook.com [52.101.57.103])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f6xkjkwkc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 03:38:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1TKZUGBvmzXxtcVu9M5SCwb45Bz1FJYwzaq/0WH0E0juSZpdRBTGxrWLjnElvUc0pj6d1EaBNW4J1yZk0w4fHv3a4EydOFC4dxi7dqbTJBSvJ4tw7E21TccTtBvDnqO+sWl1ZFaExoiwigf9CAt6GmNQbmnoK9Ff3X1E20d7EeWLm2wcbtwWSb2yO+a8Qt61Egsm88mCUt/3G/ZY0qVrLusiN0DRVlyjb8YuWuydQjcjbbLT2+WWHqfa25y9ARrX/pq9tU0ku68GUNaTixQmk2Tz/A4ic89WAmCXiRvOYp29vYTa+MxAkq1lcZkL5kRQTin91IMhtieF01ZeKYY2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQrpY0+g/et/gELylQRAb5G6tjLNikJS8huGF2MGNXM=;
 b=tHFnYIzemmLeX2ziM3wkT7Udz3mjrQpZ0XQHl+Zn+8kC2s78rL+/Js0+Olq3/D3nzch7empYW7I6xPvd9a4JsY6gL0/GMLyrELJ3RMRv8ZTNcOGGJ0zp2fJxI8q45IzZ2fzrcBFb+WH8aTi4Q3P6gQbzoqiEqsYrOVATqBKXoNCOJW2W+81B6U9Vhzqt+To0it3fkwNNFPnPLGDYqWvVaWH5N5xwLd4iV9C+VRcSMkufq7PAEGuAtjs5L9BdgKD6fmmMf5gjeal9fc8S4ftbhFXuraCsLk/oF2u6U5Ed9kru3lNHC4vUkqiHgBYSvCNbAniDKBiqqBsb3rQAJYFAYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQrpY0+g/et/gELylQRAb5G6tjLNikJS8huGF2MGNXM=;
 b=YQSVJFYqR+uFUIpj2ZjD4sOazYB8sf9Q/nbtfsOE+okPLsszbPh+CZlRjVmDIyCFhEmlVnTnJ6AlQoSp1FxCqvxngDQUFlwCHDB5zgWffFWu7xmyRcNtrHHkZlIsxk8nPaiCGcuOz4rsp2IWz9XVrWl2GjQUHDFxLIHaH1dDOr4=
Received: from CH3P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::17)
 by PH7PR19MB7436.namprd19.prod.outlook.com (2603:10b6:510:279::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 08:38:45 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:1e7:cafe::34) by CH3P221CA0020.outlook.office365.com
 (2603:10b6:610:1e7::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 08:38:44 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.0
 via Frontend Transport; Tue, 7 Jul 2026 08:38:43 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5EDD2406541;
	Tue,  7 Jul 2026 08:38:42 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 371E9820244;
	Tue,  7 Jul 2026 08:38:42 +0000 (UTC)
Date: Tue, 7 Jul 2026 09:38:41 +0100
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
Subject: Re: [PATCH v3 15/24] ASoC: codecs: cs42l43: Use guard() and PM
 runtime scope helpers
Message-ID: <aky7ESs2VMIoHRTK@opensource.cirrus.com>
References: <20260707051006.20058-1-phucduc.bui@gmail.com>
 <20260707051006.20058-16-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707051006.20058-16-phucduc.bui@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|PH7PR19MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ea970b-f9bc-4a6a-1be1-08dedc03277e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|32650700020|82310400026|7416014|376014|23010399003|11063799006|56012099006|22082099003|18002099003|4143699003|16102099003;
X-Microsoft-Antispam-Message-Info:
	MtIkbTCtwI7dX2YnI1rJJmCeCVSRKo0PS/ZpHi4HeFpwOpPjVg5A3EV1FFyijbHKAjxgN3+nDvzDHjeKgAeh8XcyWjCTXSlnOmYyaV7T3BAOuiIwo/EiHW93oSh7GUZGU7ljouh0s8kiFhyN/x09q8jz2t0P9RV0NSlrnSB78A2Wvu/dzb11kdhwrMku/zEpDsJMvIkH1DAJl95ACz+leuUVWuANtDfGYWsRdHhYI40lZuvEWB/jhXlo+dMRNrbVbIZE5qzm2cLpZfm3k0cxNfkubFZP3q6Ou8kCwr0+9dfCO9+t4SK1Zi8g3IHp2PXaSpokzWAieCczn/qwQhxWEwyEmaoH6QImd8apGK+yj3uwav3dNn/VwnM2RP3LMm46RTE+x2ng6Fxi05AsnVEV5fcCSd2mv5Vpp1wBrq4w6xDq7FEEtSSy8kcjO5RgMKBfHFFJCcs7kRyZ77Jdp6ovPKm1iNnncN88720Em6fU27ExN5uNXYa1qz4DoPYFF1mLlGxsC976k9xBdS9ZCyW43YVWQW/Tz0oj5zAmhoXzzvTwN9omGx4dLfn0LEKGiXAkM1HCBk7cbTzNfDlbJAXLAvT61byjDl36OXYIgMG+1G3ucvvPs2pbdCY3YvpNg6KrF+llK+Q9+UD7u1FQk70S0zCOTvZegClysqUWIQ41+bCYrxWclNnVia4+F9rGEjb5twquJkLUxCA6fu+tvUGqZA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(32650700020)(82310400026)(7416014)(376014)(23010399003)(11063799006)(56012099006)(22082099003)(18002099003)(4143699003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iwW2yOmGKQ63/qFx7PuRDBB4ZZ2oxTBiEe0B2gqKpHwwHoS+JwjXKaPs8BXxEFnFhK/rzwXNItnqfdhGte/JRC+VfrC5kC4AMjM776FHmWU1d2jbYW6JgActAAjvkQ0WIgerLW4rfVQSl/iKYP/QjXq0CJwkLn86BCbcm56yoCZ2b/UevOMULCSmDDLoIaAQq/9F/3v/f86D6kheVvyzt0mkj7sIPyI5pykh/3ToTM3uHsASdFPH+QHnKYKamCWTEJY7MVlV9bIMDZn8weGP6lXMHIRxZXPemh/Wj/RJ0hKFQgzvXO3EuoC9BZP69h39uCYtboecqiNG1zv3JP3+sefDEF2rPz9vMC5PAYIQPZZlGBlXSZIOH2bwEDaLsk0kbq3P/IH45vF51f8Xxp0pkRQa+V6NC48xXGaseJWGE7SxCAHhSfScW8PLPmEGcRbY
X-Exchange-RoutingPolicyChecked:
	h2d3OiPdd+iw6hyykVweugS6lznB6FxQv7v+Q9tUtBRO5x9Ndz/RdVMrAPZA23RDARUSZ6NRkGBk37P8fQVTy2b6tdWLWN79PPBANd0FUTZmlzpk8TFn9RjJBuJ2TA/i9t4agLnKPmZvvvlYHNFewANmrllA42Pb0rqyhBaSwpahCcEkZ7xsSSIQtSLwHZs7aoNhioZGOao90ylPKY+XnyHE0UxKJ+UHW7S8cTVzE0SaMrCEZO3sDGRoYoceM4MAA/j+S6GhQjz061qFUdr3SC4auxHtaaXz1FqpqRFFmJovCH3mNwEFQ2S20+VUM1YPm8I1TOM9aeuqAYp3+7jcfw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 08:38:43.6697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ea970b-f9bc-4a6a-1be1-08dedc03277e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7436
X-Proofpoint-ORIG-GUID: 4N28gVj11lEtK7zMx3-Xl7sLz83luRoQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4MyBTYWx0ZWRfX6I+wDhQnp/qN
 RVqCfT5bCm14mGOsIl0PjCDFDiaRu6aDVZlNFnUmEojMSBAN6mHNV98roTWG5HHivMpoGn3onvI
 MwoNzDYf9bFv3NDBP4ib+etCDD3Syqc=
X-Authority-Analysis: v=2.4 cv=YYiNIQRf c=1 sm=1 tr=0 ts=6a4cbb1c cx=c_pps
 a=FfGi2H57Qjid8cR7gtztuw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=qrjay9HYIuDp9UovweQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4MyBTYWx0ZWRfX8NTNUoMSl8cn
 yBJ5cXSeerTHpAKuZ8H4vpaKv3bShgUHX730PY/I+0LtWJwPhh/25FoQ7WNSz9MVmw/N0EbYGRj
 dXLrhO/RMSh5KdAnO437HPRvFYP0Q4fMCB55c+kaBSsrC6yF4qm0LHCh7ccgURhb+2iTRlburvM
 bDqOpf3ibUB079qeZr+cb4ZG09/WZiXx4GQIj51rjqqdCNYkNf2veAI3FL5Yn6F6pJDpyq22Vlq
 Vl3JPxxW1LT4vw0QKWzVf9XufqVkYgSqbrQ3uIg3u6ba9Hf4gP51vrXCtBsT0peo06f44E6MLiW
 zU/0rUDuzVv3h68i6S/UcIBWEJO1BV1+CSn6hVRsm9NKYnemQdYQuASTMVSLNi2526l2VMAYUez
 mf3o1yeMavgbsq2as43u9+00a8B+U8HfkkX4GuqFmFZHznRcEyrGYS+CA6j7thqMDP5jNpJyMmO
 nyowEHIIJ+hTrQ5tLQQ==
X-Proofpoint-GUID: 4N28gVj11lEtK7zMx3-Xl7sLz83luRoQ
X-Proofpoint-Spam-Reason: safe

On Tue, Jul 07, 2026 at 12:09:57PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Convert mutex locking to guard(mutex) and replace explicit runtime
> PM handling with runtime PM scope helpers.
> This simplifies the control flow by removing explicit cleanup paths
> and unnecessary 'goto' labels.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
