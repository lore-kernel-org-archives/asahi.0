Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AED1414DDD;
	Mon,  6 Jul 2026 09:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330735; cv=fail; b=IOg//oDQ0bnFE4f4je9SjH4aS1iqjsOQK21Rr1bM/XmNv3Gbau7bX0lkoy4+3eroxpXtZqlzD7v4gnBQCDSxTt0lP1XAzQKPSrP4x2NLUJaIkP2xy41YALR8hbecYbEvhAhWV0BCJ2fYfeChrxOE4Gr9eQRYpkr2laFIVLcm/UA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330735; c=relaxed/simple;
	bh=QeXW7Jxr4b3h3m7hYOOAGk5sCXM5yGgW0tb11VDG8/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dW5Jf0DEXwFRTJRwhBuIxtH+BeIPUebRH+fo/yYE7oJiGEKl/nO0hau0eF/3suNPk0mMtKH9NASy0jr+eHJzTwf4+Avud/fsj3zEC1EwIgpUHlBHsuot9udXbcvi3TIVDyE5eoctFwBMAijsqgBN4jqCHrmOaiWtgeAPBY0E2V8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QvzNAHWO; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=LFZ4yQUW; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QvzNAHWO";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="LFZ4yQUW"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6664uRcr164142;
	Mon, 6 Jul 2026 04:38:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=4WRT2bsp+5Ksg/JNaTAJBpuf/6Pq22N6M2r5ifmZyQw=; b=
	QvzNAHWO6VNr4sIOquwWSbvZoDbrgJQPGifCkkO8yKMk0TaZIzNL80I/5UDDfwn2
	uetyQRuS8w60oQ3XYk68bmAkS6s5R97aIbegAJxtoPJtPnJNIdnoE81Xkth1f3jT
	C5kUXzFm+4txiaI03S3R54orw/L4t+0Npu1E998dNce5zng5A0CiX0WYQ18VTO0d
	9065cQrFssuSp7rVzb+sKOXFIY1IWVvNjtVftbcNZ0SR5LXFWMZnRaJQX7MQlO3c
	y5xOMDaMWZ3ObSTaOTKRzGJl/4TIs1QLaFq8+Rapj2AfqLRefDcpKZJL6H5d5poY
	aRnFVBskrG8mxiS6K+dEdA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021117.outbound.protection.outlook.com [52.101.57.117])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f6yjxj36x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 04:38:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nI4smZc/VtiZBjHqELEZQJDm7LiZCWAW7Yb47lHibZae3ogQV/BjpXAnwxCxhZWjjlLy1qkAre0DROizzA+BDmZW1w/v95RTgwtCexI7+6wz8rQp2JUfACmny+dzY5EZwcc07ku+QiHpzOBZOncxMFVNixM3ZHvmG75PJN7hXKqQr549AWLl4jXNh2YeAWzrYvxlCJMcutacO5k5YjfBn+lfMn15wXKIenaxqQuOoXUamgcBX+4dqBj8+wzzX6iC7DNjcx9ZYqoHYcSPk5tPz2dHmoq1Hwtd/hplUiCYnXOylVzWen6DgmucrFQ+2t2tsJb9mDehARxuRttE5d0rIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WRT2bsp+5Ksg/JNaTAJBpuf/6Pq22N6M2r5ifmZyQw=;
 b=nX6mcTPzhKe/vq6jcfDF8BB+w8NkKpDo8HGPZrRmRThig+MhAezjSjTou3592A1dAZyU9BluUy/FAnJiIOJ3HisgFWi+zY049wScF9EfykEuiwL5oZpGA0Ygmvb9bFgSsK4s2SjeLAtewfdPPm4pLUvY0gxo1muydE82lR0VvS/3Ze5cWj3OuvGuDV5vjuc7pTzUW3gjzJnxDtUvuMrgf7MLlFeVu7R0IGrOMW6mP7XEJvejJGSvJSMgKaT+tR2nzuhJxrDUxzJP7blQ02XbMLaUJsd/6DVM6iyIZmOEMr7Q2g097IcZ0aYOFNWXnhhPM5ghrLMH3Jl1rOgXpZYWLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WRT2bsp+5Ksg/JNaTAJBpuf/6Pq22N6M2r5ifmZyQw=;
 b=LFZ4yQUWsjcDPF1cOwTPWqJ4Pg4OItUO3IteoEkPWc0HxVosPZ/sKMexwGQww9uXt5v3ZTG/4oq/GJBHeDaj+40A1xhcDkAMhxyanmdVJxh0OFd7KmjfGnkTvE4IoItgxYZbPY79pS2WpPoEM2Ny0G9jKfUbEdfeNF6tBjuB9+o=
Received: from SJ0PR13CA0174.namprd13.prod.outlook.com (2603:10b6:a03:2c7::29)
 by CH3PR19MB7982.namprd19.prod.outlook.com (2603:10b6:610:161::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 09:38:10 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::3c) by SJ0PR13CA0174.outlook.office365.com
 (2603:10b6:a03:2c7::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Mon, 6
 Jul 2026 09:38:10 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Mon, 6 Jul 2026 09:38:09 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 91DFF406541;
	Mon,  6 Jul 2026 09:38:07 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 786DE82026C;
	Mon,  6 Jul 2026 09:38:07 +0000 (UTC)
Message-ID: <44cda59b-8ea0-493c-99fd-4c8d4c698e4b@opensource.cirrus.com>
Date: Mon, 6 Jul 2026 10:38:07 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/24] ASoC: codecs: cs35l56: Use guard() and PM
 runtime scope helpers
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>,
        Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih <tzungbi@kernel.org>,
        David Rhodes <david.rhodes@cirrus.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Guenter Roeck
 <groeck@chromium.org>,
        Benson Leung <bleung@chromium.org>, povik+lin@cutebit.org,
        u.kleine-koenig@baylibre.com, kuninori.morimoto.gx@renesas.com,
        christian.ehrhardt@codasip.com, Linus Walleij <linusw@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thorsten Blum <thorsten.blum@linux.dev>,
        Chris Morgan <macromorgan@hotmail.com>,
        Dan Carpenter <error27@gmail.com>,
        Marco Crivellari <marco.crivellari@suse.com>,
        Rosen Penev
 <rosenp@gmail.com>,
        Weidong Wang <wangweidong.a@awinic.com>,
        Teguh Sobirin <teguh@sobir.in>, Val Packett <val@packett.cool>,
        Luca Weiss <luca.weiss@fairphone.com>,
        wangdicheng <wangdicheng@kylinos.cn>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        chrome-platform@lists.linux.dev, asahi@lists.linux.dev
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
 <20260703055355.244898-14-phucduc.bui@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260703055355.244898-14-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|CH3PR19MB7982:EE_
X-MS-Office365-Filtering-Correlation-Id: da1dbb37-8d28-41ec-cc03-08dedb424a8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|32650700020|376014|7416014|61400799027|82310400026|22082099003|16102099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	/hB3eaAuvKmfEQ/tX379jQ9tpTnhqqF7HI93GQrIaBW5CDwCyBNVoUxigvtwKWhFMg8iqztGbxU2BmXGN3tn3foACl22WmK1/8SsVOgXjzRF/5DRTB800nyZH2W7qI3cwIvZ5LDwPeX9R3P2HGMLQTT+6VwGV0Lah1XJ5JCUrHCMYZoNaY52063uc2MkTbl9RAu/k+masLtFUx16GbUQwEPt6jyz6cL/xLFSxHom2Oh2CdifxsbHBpOO3I1uvBjxZCMHp+us37dIntGNyIKJN9OhBmfdKVl+dtx9PhgtaJRi6mTOaq+8vYBA/GatUJ8WVYXs3WV65yThtV0wFqfaXzJNfyFVtAVWGVAg7WYHs/3AFMZluhnfotnqa7lT/jWJJ18bjMs7tiHKb0L46qHJZRW0mm37C9MCrIMqP6//ZyvxIEhFI2Gf2ypJ3aa4pF8grSbZf9ybnaWlBxZlu6DqZIXU//ct+VVM48tURAD1+yqpLBZrMcOyCehPZ65N5BQV5uFxCPg72U9x6R7HAvQH5Din/2qyNgS/2QDGszqiroIFa7P/C1NvenHcgfjjKDGyQNUZn7IjOFxUvILesXdMTKoRMMecj6gMViAwsH9cT6k15oJo6zDfsK4MhyhoIPoLwDCWCHOog/YemWNfcYT8B9fO1ICYZmu2XIYW5qg3EIw3C8UDNowTWauGApAbNFxpD0U60z5OSx3oNO0Qz/aIeA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(32650700020)(376014)(7416014)(61400799027)(82310400026)(22082099003)(16102099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8Dr93COZbUffBUd9c7Hp8PFgcqfxV+jRcbTZbHJB6NXIgegGMR6jk6f2/L7dZ7fC3gYBkwdEQr7zS6TCh2lwkbuYBM3QKQPRdfr/dcqV2pAdPL9w9zBfvsUz1v+dFFlaxxBlsZ3wuH1/vtvkHWXSlux0uB6HDT14fLSyJRhno5bwoRmgZRdkPZ4YiNBqg7FsBjUNKnGA12lDcuj3G5b8g0yITwuNs1Hd5xd4BzEGTFOu4zHLkg8/LJG6C7cW/eDmFYZLI4GjomMkVV1MSHpwJWEVMZAZtzTzRhjL6epPuX+IAvuRAica752o3mSmMGGzOCPwhVMNjuBU6qiFjqvo0I6FBw/kmt/8+vqRtcXi9sFQFvGRfrDstH2qTDXWdBhN3ZADmUjM/VgXH/Q8FiKvv2O8sPD/Vu7+y36GXjwK6lYwXIE/YF/nBUmdv/EnCp2p
X-Exchange-RoutingPolicyChecked:
	BRmtkcdqTq99G7Ur3HxeKS8mp/ZHellJnPnjEPQV7fzTkWimlFqeHtQIqjB4mErp9RIDvM2mBoPHKkZq3lQKRTildTJQyytu6IPxwS6i8a8iqhx84sU+V2Jb+xY1wdcRbsIbY49EsBeroeXMBGU5yKjbilsbK3nwIltTum5EkqE4QvYgczmOvaW/OqJebdSBUspAZTDKyus0ePeVCaiD4OJa875MsmA6EkrpfUer5bnjQO/yr5uYlIT8gc/GUeeCYpyYzxYDC8aMaqi4eyP0hM2FAUwztEaouC6h6BEKQ5oOSL+URTIuj5SZvAl54S/AWJx120XFVhmoVXeMnQbwXw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 09:38:09.5127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da1dbb37-8d28-41ec-cc03-08dedb424a8c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB7982
X-Authority-Analysis: v=2.4 cv=Fo81OWrq c=1 sm=1 tr=0 ts=6a4b778a cx=c_pps
 a=r9AxpyErILMAMGkhi/VMjg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=f4hnm11TH2sWa8F2bgYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfXzgzyIRFSzLRT
 SkUtJmHq1MYR610rT8HOC+OlkGEtxpAXOVwUcQamP/VF+eegbtmFeMUgTzohQ9uLo/1vaxukGr/
 mbK5PAFhJjFGlhrnbj9TVx8QH11cDno=
X-Proofpoint-GUID: xsPg1FCU7toIV8Sbg3Z8eRqvI7ELs5Wt
X-Proofpoint-ORIG-GUID: xsPg1FCU7toIV8Sbg3Z8eRqvI7ELs5Wt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfXzzZ8UNZeUuTW
 XOTUSeSF6y76kiMg3gqovBxduMxgwMn1CV+CYzumGfgkG12e96PF04MwWE7Qw0N5d469W9f7BUN
 zlxPW6EyGgz1KQe9LGQicv+AI8WIX6hcJBBlCvqzuk/htW+3c3pC5+24MKCpGpyF2n7DNa3a1YA
 7Wvr0PDb4wnmT+4NbiQy5Zjj/7pU0EiVmZ2NihkweNlyzb6I725HMWwTR6hyFjUEe9lWhmozSzl
 bQjAoHC4634Oue551HiqFIDFuioRD7h1Je/ssjpJwU/9C9uxzAazHiLl/biIisrxss5ULKVQ2Cg
 ngpxvK7/DzhMUhKYwOqiwZNqc5EtVnE8pTYh2o8iAWmTZo1P9+7xbzfjQM19p9cnp2SSjIArfKA
 bjP/d8hzbMzAkwtvPgSLJ/Az4a+AZbG0ZDUOKqa6mqIOeu1pKxAw9O0lM8ZRew1TQo1wE3wYqNl
 OJkYmxxxKdxbxjztgaw==
X-Proofpoint-Spam-Reason: safe

On 03/07/2026 6:53 am, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Convert the interrupt handler to use guard(mutex) for automatic mutex
> unlocking and PM_RUNTIME_ACQUIRE_IF_ENABLED() to manage the runtime PM
> reference through scope-based cleanup.
> This removes the explicit cleanup paths while preserving the existing
> behavior.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/codecs/cs35l56-shared.c | 19 +++++++------------
>   1 file changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
> index f14e2eaaa4ee..73fe1cba3f5b 100644
> --- a/sound/soc/codecs/cs35l56-shared.c
> +++ b/sound/soc/codecs/cs35l56-shared.c
> @@ -645,18 +645,19 @@ irqreturn_t cs35l56_irq(int irq, void *data)
>   	if (!cs35l56_base->init_done)
>   		return IRQ_NONE;
>   
> -	mutex_lock(&cs35l56_base->irq_lock);
> +	guard(mutex)(&cs35l56_base->irq_lock);
>   
> -	rv = pm_runtime_resume_and_get(cs35l56_base->dev);
> +	PM_RUNTIME_ACQUIRE_IF_ENABLED(cs35l56_base->dev, pm);
> +	rv = PM_RUNTIME_ACQUIRE_ERR(&pm);
>   	if (rv < 0) {
>   		dev_err(cs35l56_base->dev, "irq: failed to get pm_runtime: %d\n", rv);
> -		goto err_unlock;
> +		return ret;
>   	}

Should change all the error returns to directly return IRQ_NONE.
It looks like a bug that it checks rv but returns ret.

The reason for ret was so the error and success cases could use common
exit code to call pm_runtime_put() and mutex_unlock().
But this isn't needed now.

The local ret variable can be deleted.

>   
>   	regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_STATUS, &val);
>   	if ((val & CS35L56_IRQ1_STS_MASK) == 0) {
>   		dev_dbg(cs35l56_base->dev, "Spurious IRQ: no pending interrupt\n");
> -		goto err;
> +		return ret;
>   	}
>   
>   	/* Ack interrupts */
> @@ -680,7 +681,7 @@ irqreturn_t cs35l56_irq(int irq, void *data)
>   
>   	/* Check to see if unmasked bits are active */
>   	if (!status1 && !status8 && !status20)
> -		goto err;
> +		return ret;
>   
>   	if (status1 & CS35L56_AMP_SHORT_ERR_EINT1_MASK)
>   		dev_crit(cs35l56_base->dev, "Amp short error\n");
> @@ -688,14 +689,8 @@ irqreturn_t cs35l56_irq(int irq, void *data)
>   	if (status8 & CS35L56_TEMP_ERR_EINT1_MASK)
>   		dev_crit(cs35l56_base->dev, "Overtemp error\n");
>   
> -	ret = IRQ_HANDLED;
> +	return IRQ_HANDLED;
>   
> -err:
> -	pm_runtime_put(cs35l56_base->dev);
> -err_unlock:
> -	mutex_unlock(&cs35l56_base->irq_lock);
> -
> -	return ret;
>   }
>   EXPORT_SYMBOL_NS_GPL(cs35l56_irq, "SND_SOC_CS35L56_SHARED");
>   

