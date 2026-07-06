Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0012C7081F;
	Mon,  6 Jul 2026 13:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344238; cv=fail; b=tYFVXg4ev2Dk7DK3xh5qp/0Yy5r/E4/1pEBvZp218U+qhZMD3kr2RIFQPdFlVVr2+S/Q9NxxDbdGbwuRpgKaczKNHnehPWnp5DH7ovGHloLtgvj6wR9lMpQDWNijLNmYhnJvDQqihYi6iIjx1h5QDFs1hXOZPeCaHQrBiakqHgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344238; c=relaxed/simple;
	bh=QTWy6P+LU1w8n1X25dNjww153VurfIIayfpVU66q40k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vau11P1CjcnEZ+j8Afogsyf94EhfPCz+ds9e9e7exlo5+ou/2W9WjC3lxWZ6ap1K7sNNUIAgqX5sus/8OkGGXAhcbCzeuRVSw/ntnlC1CBv0W8ZReEdYTHXGpElBTncJxliYcDoNcSjyeQFsbvPkg8KSzgMnJrNclsRYDp/U+qM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=P8JTN4sX; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=z6WOvB4Y; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="P8JTN4sX";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="z6WOvB4Y"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6664uRpT164142;
	Mon, 6 Jul 2026 08:23:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=wWy4XozZDXPU8Q0SJD
	3IF+5karK77IPavcsBJvDJzmY=; b=P8JTN4sXo/ZJadlRUO3pVhgtEIbi9W39Ys
	4bXVQpHfKdUDT/voJgU41UXxXrARLuXGIqwOe1dwX4QSIKaxzp6mUOM9++svX1yA
	CDFN8b+kUpQYztNjb7dl2c02mCwOHoC/gK8SZcbpTbWq4qZC7RMEX1vz13Kt2/8w
	R+WTb5A25ehCS/9ZFsNKhtPicgN/ym2bZuFSEYfW8PeRyNgefVUHTrehjyqmlp9K
	oJEVmfi/1rgdBZlzdNz9lC2kdukQpzuAYj6fdp0bis1GZYOdvvTpa4saT3fDyVRe
	qGZyilk43mja+gvGbjkSDpvH5DLuh/PbiO/SKokq34+t1fM/bS+w==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020095.outbound.protection.outlook.com [52.101.201.95])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f6yjxjc2d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 08:23:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTXkhG6XgzgrutXZkNe70HXO/q0/2yjR3ld4TD+EZYYNFAjIy1TNxg7+IvuPkoRy8El2OLLxd0liDk2aWPfjv7NDzI2JElsEJaGSclnnPFsxlYPBvhaGgYNQPrqYMyWZIpMLb0RebV5cRSIxvavf5k5dKLrc9zQZCLNVy1hfY0AOXxsmJCLgwr74LAzhh/mXJQ7XXs8YuVIrk8aC6vI9wVyOKJKUrXXOQNJzsEcwNR66nR9wJ5LPZIFsYLlCYURidfFMzwuM0Ypa46keLKlEGkIyiR4VHzoK2uQ8Ley/7TmY0OfFmMkrMJkDDBQ1hHI1jwb8EH5U8tuICX4clWim7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWy4XozZDXPU8Q0SJD3IF+5karK77IPavcsBJvDJzmY=;
 b=rLGR8mIQeB8i3gePT//fVZED7h7qC5lpAnItnsWaa67xZmAzIJZCm4rSylAffwcndVYUm7Ab11HeygKDaqouToS8B0DZtRS1iSOOM+QCEImieuUvlwXmidM7Qr5fibv+9RC1b+D0UYgnMt2yFpURYNu4Y69i+ta+cxPnKqIZpOWO41eAVjz0aIO+bHp0fwNQWgqvk7OnOYdSXmp3Pq1ghBqSIkf/c0lcR+diMLsD60POMvy1QCmaa8yw3m2TvyfCtTt8tI4VrqPF0IXBhcq6YLHDN3HcbEF0s0KVJVhkSFL4fXcdLlcFfSqh/epHlJ1tvMtBMzPOgOtYibak5Ly54A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWy4XozZDXPU8Q0SJD3IF+5karK77IPavcsBJvDJzmY=;
 b=z6WOvB4YcptFO5S9JLMw2RK1isL8eXLTbrwl7YSwNNkVyq8QT3PAgEwcMRYeAyToB+xBa1Ibk0zPM4TYExlGwf/VU+Q2JnaYaR5feMlTWDJOhOrIID7aN3elde+VxoyMHJuOeSl3NIpEiRkeIJSknMSHmW0rROKnTC/N3EcJzAA=
Received: from BN9PR03CA0534.namprd03.prod.outlook.com (2603:10b6:408:131::29)
 by DS7PR19MB6133.namprd19.prod.outlook.com (2603:10b6:8:87::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 13:23:19 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:131:cafe::1d) by BN9PR03CA0534.outlook.office365.com
 (2603:10b6:408:131::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 13:23:18 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Mon, 6 Jul 2026 13:23:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8B8A5406543;
	Mon,  6 Jul 2026 13:23:17 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7147E820244;
	Mon,  6 Jul 2026 13:23:17 +0000 (UTC)
Date: Mon, 6 Jul 2026 14:23:16 +0100
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
        chrome-platform@lists.linux.dev, asahi@lists.linux.dev
Subject: Re: [PATCH v2 23/24] ASoC: codecs: cs48l32: Use guard() for mutex
 locks
Message-ID: <akusRO57FjwE6an6@opensource.cirrus.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
 <20260703055355.244898-24-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703055355.244898-24-phucduc.bui@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|DS7PR19MB6133:EE_
X-MS-Office365-Filtering-Correlation-Id: 72fd8f80-a3b2-4cf4-417f-08dedb61be61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|82310400026|36860700016|32650700020|376014|7416014|4143699003|11063799006|56012099006|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	BO+m20W5TxJcdUgEnEAym7eRSrVTvgz5AjfR32t7jBBUzjL5Q6Lc9uGUTS7NZg/WzgIkF/WY29uak2LtpBBZMSMVuKWVTaoUIA9XPkmsGPFU5jWMnZPKzABPf5jfMJXm5criyhD+MEvLyqHClE5G5wI7qlg+LmJck5PWX7yp1Fq4SpNBbPbRpfpXzdmx2KJOSieR3QWhxdM1q18M+CI5YVsQ0GjGlt2JOkhcC02TknbtIRkUKQkxspF+d+HxwY8iKdCwpy88BxiL65ERzPxX0WTfrkNido+DTMXnsoG7D1ztm4yrraZMZ0jNf+Aqtebo7qLZUeSQgtZGdhWxLlzvWP23x7NdvCF3+Wx6HNFGCb3QkjmuIarA8Tddgve78Vmzo+kigEJgZbzq0/cMKGFMZF+gfY8h5pGt1YP3Twi29z9r7eg2GwGY7QA61TV9lKvqLxQpaz667DOY2W/rjTJa8s45EjNZQq4Vy9vstnlRXsU6uQj2UcztKOGrzaPHBVdV71llU3eyi6ZvDKboTfGMOySRErE2BSTuNGMrH4wxJt1rPcTfQyi3A0xHenZ1qeX2bGXPtcRvSRae5woxiMEzc2ohqeKnqaftw1yAEc1tsnhuzLw3Fr3NOf/4BqrNRRxpovs57DAKwYJmTdqBmtr6/5/OsYivHFHVGeVeQvVhzmu/M1V2+fnt0k77G5ttrz+pR6+63wIe0DGRe/3lSdsk6g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(82310400026)(36860700016)(32650700020)(376014)(7416014)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BqXMvFdGSLYTMwvUa4kouvt9RuORlqs1kSBErKc+P484ylubJHOAksrem+B8bTiby764v5urvNorr6piJLpqGYhH+uHIXWPaK7L+ux+dR7tZrVajeoQPWhTyqL7lWZOk5UlajrD8OyKdC6u7kjugNU4kvW2YDZRDg3DQlpsiCNVwG39BmsYKcco+tcJqebh+63yPjgmL9KQkprn/RzEBCkY5j8fib6aJO2EWtfrMNvCt3e+UkPNV///UMit1AgcmX/NdhKJDUeKSPSpPAiNmo7Kd9J0CLx0OLof3tkZJtPnXPiY1ynxkR0Dx+x7LXCwc8+Q8k/usxty/52phIeD+yyTOVaEdu+qeU18Obnm0MnCH9uJ7uRW/9RQ3I+vquTwrWM7/g18MA+yKLeyA3SNDzP3NcvH3Bjl4nEhg+3j9EHaPZNSvS96DoLBMHlV3w0vE
X-Exchange-RoutingPolicyChecked:
	hbC0iNkyoZJ4DYBEPd2hEFK6hPPgk02Nv4XsiG8XrDYH+isbxgeD1Tygfnlik/CsXlmHFRRiZHxgkWljqRIG5k52n2ouzsUGNzJF8ViSLbLf4gFDbAjp66vEqfLRAt/sbZjf3ey/zy+NVIbR97w+i96MJ5zy6785PmVk1kJiVPzqK3ZoBpKbHzydeIB360mdAt+tRLA/qFNpJqKjxfxRdaTLCIMTpm0bZOJS/MtLmuulauh6RDqtLIxvOZ5W1ShCVzn8jdurHYKUfkthttfO9ac64Vn2/oG/IaSy7XS7eEBTVnejQO9i4/R6Sz4BpUmiAMnX6g3sR9loONFx95wdig==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 13:23:18.3683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72fd8f80-a3b2-4cf4-417f-08dedb61be61
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB6133
X-Authority-Analysis: v=2.4 cv=Fo81OWrq c=1 sm=1 tr=0 ts=6a4bac51 cx=c_pps
 a=kIUNUHS17e34GyAlH7lOBA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=2LXkwXwYv1G787AwtbYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX1BOclkNblsBs
 /e5mky7KqJ3kWozDerMTqHDaEPEB8qLbyVYQuPTi0k4/ADP5q5mg4QNpeDbreb7IKyxn2t0clOc
 FXaIllKhMOpUUVQcoNeHyGs7xg88iCc=
X-Proofpoint-GUID: d8-6rcpusi8o_0YQKXdY2gCPygcQYmz9
X-Proofpoint-ORIG-GUID: d8-6rcpusi8o_0YQKXdY2gCPygcQYmz9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX3JV6isbU+Xbd
 o0tPW+xoX3R72gcOhnTD9sV2UAh1gOefZ2SZKP6etAPxVRacJP+XcR5bl+XYF2+parXTxHh//ef
 kTvCNa0cnenc6h8wrg6Rcog+zlGfryndrcH0b5YTfHi1VdJimOXIUsV8QWLVE/pvil2/XpwzZ9L
 aLGso/tHe1/RkDtN59v3R479Uhgrj9r5nf3OT0RcoEaeiamHOUK3pqxh9RIRgMsOta7zImYr1Oq
 /zzPhWel9nm6bZHWsn+0NXVGZ6NO0VnyOwHV8v4GkEAv+kekSRaN28idIBDCm/GM+x57MihGeod
 5AATXmLMGUd0G06qRSTBbMzAbEoO/JUUdWHS1rzfaG70pbcCoZWGi5zLTOYO1EoaJ3viBf421Ue
 snuLizxUvJvYzumix26HltstNb1tpWRccAIa79qsHY2TFh6N9HHXxG7S2PZfobTW5ETLAYoC3T+
 DqkJ1+GgwbvTndv9dQQ==
X-Proofpoint-Spam-Reason: safe

On Fri, Jul 03, 2026 at 12:53:54PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
