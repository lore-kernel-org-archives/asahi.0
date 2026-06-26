Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BE9173;
	Fri, 26 Jun 2026 12:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782476129; cv=fail; b=JexDy+VHznbB8H1mxUfECrzZrTjTclBFzySnzfcoDV0Fu5L4rvqZEUMJtRWkoUh31rlaiV5yiq84S5UDncowc7Gn+xXgE/Od//vaDKEZP/+V7CdAqBrGoiYymdmSrkGErvCVe/P02HI42THkZWvdxSiv9jzDB66/47AME5+Twzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782476129; c=relaxed/simple;
	bh=S6uZap9Co8v4esrOzzfhLju+xQkjdIf1egAzWjt3NiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+VlGFFthz8oZLDokKhQQw67JblbNnv7cSlkd4Prxm1086Dl/XCVj5Um8VNRkUQA1/LYTsuhqb0YO3HreJiUSqWTmxnmbMSGT3aRrbiDkUbhp8Rf2rL78gjVWnXnXt97PMRGl3xpDEY4lgMgeVTrx5NHzp84eXKFslbsTCSv4X0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LDtg3Ghs; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=nP4lS7J7; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LDtg3Ghs";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="nP4lS7J7"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q5bs1g2299032;
	Fri, 26 Jun 2026 07:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=VuO6cavYToD7+ZsgUC
	XP+yNNrvUCcYTf1yoTMd6P284=; b=LDtg3Ghs47JlzYcGS/SujnF+T577qhPxuI
	ScJ7dXabBPlCV/KZBI5wpLrw9RH3ZoNzXs/m6rM9GOHhDK59DKJ4YVrWJmtkO2Z+
	VoNuYzNUSsyfTY5mLPHNe4F7QRQ8lAh6ILzlB1VI4cpxRWFtbD3yQoDRmbYXrdB6
	N2SvHZn0qERQC0n5+NsRbT+r2Hnarg8+27qU09axCf3AFJEtbJ6bWdMGF7E2Dh6c
	aTFJpYnyiTuTuoby1WbLdzv9GyRP3x1Em10gH1OBMlxSRkOsNqMzRfmngB+tkbwN
	iVwgnnD9RPIrTohmcvl7k2nz8jokn0ImM4SGq06XozsVSl3F713w==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021114.outbound.protection.outlook.com [52.101.57.114])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f167019tp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 07:15:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJTuX/4mdFHNIkYV7UYqp912n/EyX0UOb0dHlc6aIg+du9BdOIdDV3hiCi9ESwojCu2hZq+zgMKDYOlkZdl8a4e+aSB5GfLk6QB2xDX1OsOmEy61oxb6RVJKEJ75bFl3JNsW1Y7w0wka4up09gfoPGqc96V3vffhz6ieiEHHU3Vc1PV0c/mxRpHBQwp90jlIMksVk/QMxyCrQX8JCcapT7EBfahRabJ01vHq5J1Ele2DmIfM57TQHQUEoosxPW/uDgju7Sm1Ih1XYZDz94m8qD+CDgMAa/XTCvvEcXA3lB4pOrW/PNz/Dv5r4r6/ndgXKXBhuAYSeH4HoJ1a8uO3kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuO6cavYToD7+ZsgUCXP+yNNrvUCcYTf1yoTMd6P284=;
 b=RRq6IE27Higkprm6OCh6HO0hTLbliYuieHs8/yhYoDqE8BwoplcvyJhAHxILyHlUMWYxlUVGfHpBTUPJbFOG3BqJUqRAaF10UmlhWDKVSYdN+gYXsNXCAfuRKIdDQetNWjrt1fdi51wx7jOXsVVbaLncowVZHCvqYdWIj+e4ONmaKxWzbs3GgKeP2IMDYSEBs3gjpOPHrb0zfnM+vqwCliN24vkBV9lRxCY0W4mXvr/X7Puq39iqXFM0F3EzRzce3zZNAJgW8E8Zte3kTXqhQYW4Ff6oiTYlGX6avzKSDXpdaDbclQCiCNAIK0hQGLf8yETnYIspEWJmLHHnyytMAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=chromium.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuO6cavYToD7+ZsgUCXP+yNNrvUCcYTf1yoTMd6P284=;
 b=nP4lS7J74h+mt/OaURgkqMkceAzjnS+E8pxQrO2T2FEhnwFVEbXaqsO8WRtTInw0dfWQ0lCmxwjcpUqIutFfLBxdhUw4kD0Pr1y39VvbSG6Nf/wEjiRV93mq/a0iO3JIw7iBr9i6imLsy+ytD/kK5vj7lNmOhxGFQz4NhnEVUjo=
Received: from SA9PR13CA0069.namprd13.prod.outlook.com (2603:10b6:806:23::14)
 by SJ0PR19MB5365.namprd19.prod.outlook.com (2603:10b6:a03:3dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Fri, 26 Jun
 2026 12:15:17 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:23:cafe::2a) by SA9PR13CA0069.outlook.office365.com
 (2603:10b6:806:23::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.7 via Frontend Transport; Fri, 26
 Jun 2026 12:15:16 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Fri, 26 Jun 2026 12:15:16 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EF5D4406541;
	Fri, 26 Jun 2026 12:15:14 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E31D482254D;
	Fri, 26 Jun 2026 12:15:14 +0000 (UTC)
Date: Fri, 26 Jun 2026 13:15:13 +0100
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
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, chrome-platform@lists.linux.dev,
        asahi@lists.linux.dev
Subject: Re: [PATCH 23/24] ASoC: codecs: cs48l32: Use guard() for mutex locks
Message-ID: <aj5tUdjxlzkDIim1@opensource.cirrus.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
 <20260626061329.23264-24-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626061329.23264-24-phucduc.bui@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|SJ0PR19MB5365:EE_
X-MS-Office365-Filtering-Correlation-Id: f05e8bd8-ca74-4aef-d8e3-08ded37c9518
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|61400799027|7416014|376014|22082099003|18002099003|16102099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	TmVSSm4FqSqCC2rbA9AP+vC8/1ti1cHot7/RPt0xo2/NRuuB+S7wE2SsT3zP05HQQxLgxJnomf05HgmXsvnQ4qGK70xve+6RzK9oYtn0M4tAfZmxymdpmhBojyOopZ7LvRrR34KhwW9HuqLtvmecoPaxoXEFrgkh2Iyk33xePT02Ca4jkqWtV5ynPT1Co03S3DFhrBhaDctiJzqmWkV4S7C6XpzE11CU4avhAMAzDQLSAYu57GjcItVFgOUcPvsrWpWYS6KKOBA6p7cRzuHDj+xuDjP/caE9HQ3GStJr5bVblwR/zXVgKr+P+V+Xk7ntX8YidavudNggt0qvzkg5uIt8SAJigAV8HPgNy+R7b1szZZses2MEG7UMZQgIRHvTl0tCqpB4lP+uG9vkK+aj78KdrOAV8pAYoSmEn2MKV5nyrgiBm7df+REVfs/djVe68is7c90VNe6gRCfisP5EwzjXInRa9u2clPS3pbcJtnNx1f9BUcGHSrK+1vEqvx4FW+YY0f8fGOIO/PHWMaDjWyUolySM1nwzUZ/jAntsoFoRIxKNxteKbaa303FEWeREIgYWWxTPprxbY+u556srTdWImdIP5k/U8DIg8jyWuu9khW5H9EkBvsSJY/M1cCzd0jHkoc2Bh9HKsuw6b6q8kfMMZtIQl0BpuIjwGvDj9HJj5pf027yuLcvkrL8Xecon5nY5gBc4a7Sa8x6IEvGsSA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(61400799027)(7416014)(376014)(22082099003)(18002099003)(16102099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	k/UroFzqXDT6DLlMZpHUF78M8zkq7i73Mpn+TxS1itvy5T34YxFyGapGRT+sXc8d18Q4YOOB539HooJEQbEPuXw5fsQFwTZaOwnh9Iews+TymTtmz35gazOXVSId90RWL6Jv0DRTWbqJ59w3DrshsuvA68dlewG0QQXUXkA2tr5F2+qyDLv63dj7vev4qCwV7eWgkkYoLs5Uc/HsRtPzVprTN1lK1q+daunF81bR9Inwy2KV0rJFL9BT0tyFCO0HeFnTiwPj/LZUC3rs5irQ3pI7k+Ztuw39IXR7/yZ1ltOizmE85LlXUsoeKzUPafc/RROkKMh5d5hjVSSOgQVWneGcQNZjaQXBB98yG2/Pgxnm5hwJLN3e95+7s+wFfe07sIwSo5P4SsKVyPmmDrpV5+Fl6ISVxiS1uBOdRolijetyk4WWR/ff0IuODOz/4zMJ
X-Exchange-RoutingPolicyChecked:
	lP6CUtTImts4rc7q55VHmJ0uVBVLsCprsmKFNpvjmZse5s5iNIm1F3wdg504OCG6mZAV+VYag5KCqwx5EzkRjlxIS8eZmIU+SOscM4QzlQwHOgnwtzHe8urOsd8kJiQNm3PgIOPyUlO++Dabnjb1EdSOXtl0SRNtZs9qFzzYL7UmEeQ2ISum2D2G1doxH/AFGKVVhZpc8K56hjKlZEPGClVq2UVWBlKZTHVy1Hs4FaFbgp61ygEYt2whTlgCxbs4ZibMYXkPjtpdr8uU+sh3ZlmiALUR7u9FdAqRCkbPlAJe/r1G40O5iUUA6t+g3J8Pe+GOrjw65G5wxmqsHkftRA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 12:15:16.1247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f05e8bd8-ca74-4aef-d8e3-08ded37c9518
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB5365
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5OSBTYWx0ZWRfX+/Bp2ern/QBG
 eRWRV0O9R0jzruMHe5QQC0aYXMPJ40peyDWMrKLO7kA01oSULo20Ki9nX2MKWRHbFP8voHNgCRy
 31+weupLbMmHDBJCiWYR5on5iuA0rGk=
X-Authority-Analysis: v=2.4 cv=foXsol4f c=1 sm=1 tr=0 ts=6a3e6d59 cx=c_pps
 a=GozkLUbERgb+jkv198RwcA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=YzK0GkagNc5e2jYrGFIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: zYrA7_-k476nuGvOmMDWaK3v5mo0b-BW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5OSBTYWx0ZWRfX5zD5dOOm3Jsg
 h3w7fHz/Bb9zVW8lgXtu9c1rUjLB0APjxFWQ8mUiMZl4b0Yy5fqByY/5f0J5iSBKrX5ZEStWN0u
 jBn4t92jmSc4GgApe2YKGH73jWf+ospTaf3XaPLZMZKh2KBmZcksvnZMyo/D0ZiYOcD8SMBhs92
 ZwsN1mqQt+bVJGqyRfQX/ocgvpqQ5kUH/qP5hSt2elcftQU4AYHrkYF1WKTbnBSDFInhpUAF/Eh
 jaSjJyWkRGyrPtKjM6TkjkuzU4hVB9Pl2w8UpSTv+gnKWnuOP5D1XmEfYPJodGfcD1sertu62JI
 U0qUvuLJEin6wY7NCbKETP68D7lxbRg1Xqr2QMr6kOkqMO0U7kv5pPipW5t9q6x2INfcPNSsUw4
 56yjycnekVNVilQ7Vwv/LlYfdpO5BzqNv21WqOL6wsWXUlBr4MxKfQo7S3Ekr5Tg/2hkOl8kVgG
 lOWcbTGYSVrIzj1ucIw==
X-Proofpoint-GUID: zYrA7_-k476nuGvOmMDWaK3v5mo0b-BW
X-Proofpoint-Spam-Reason: safe

On Fri, Jun 26, 2026 at 01:13:28PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
> -		snd_soc_component_update_bits(component, base + CS48L32_ASP_CONTROL1,
> -					      CS48L32_ASP_RATE_MASK, target_asp_rate);
> -
> -		if (change_rate_domain) {
> -			cs48l32_spin_sysclk(cs48l32_codec);
> -			mutex_unlock(&cs48l32_codec->rate_lock);
> +			scoped_guard(mutex, &cs48l32_codec->rate_lock) {
> +				cs48l32_spin_sysclk(cs48l32_codec);
> +				snd_soc_component_update_bits(component,
> +							      base + CS48L32_ASP_CONTROL1,
> +							      CS48L32_ASP_RATE_MASK,
> +							      target_asp_rate);
> +				cs48l32_spin_sysclk(cs48l32_codec);
> +			}
> +		} else {
> +			snd_soc_component_update_bits(component, base + CS48L32_ASP_CONTROL1,
> +						      CS48L32_ASP_RATE_MASK, target_asp_rate);

We can just drop this second write, update_bits won't do a
write if the bits don't change and we know they won't from the
read earlier. The original code was a bit odd, but might as well
clean it up whilst we are shuffling this all around.

Thanks,
Charles
