Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0A53DCD9C;
	Fri, 26 Jun 2026 12:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782475471; cv=fail; b=pl/XDR3OHe491nltLQWOIZYTbXxwa7l3R36x92uMypDorpuSFYKehStazBbZGpth3Z7eEvtITJh58WXZgeM8jJXDhpTfNCsSO/DRrPlHskPrSSSw2sqg7qkR2tE8glMzKyT8xUKcy4D8pJ1KvNrrCnpv4OslrCjkHuECOLnTI7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782475471; c=relaxed/simple;
	bh=rQUIHjyA/iOTZSrBVemrj78yThvFT1O05W6BTRSmteQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XhtJg8Fw5Y9D4VkV/oBXThi1XrA7/TRZDA0H+9xrHrA6R2YgJ9QLe09p/0RczEUn/QtFPzErQLBZ2jYE7wUJezWhuIZZcq32X/7EZLmu4WtGR6KYA02Iao4uoH65A6SKPiWJlKbsIiYbdyfn547upuSdBntP53GESNHgEVenwew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PAn58nGk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kPwJ4c4g; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PAn58nGk";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kPwJ4c4g"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q3XCUv2095346;
	Fri, 26 Jun 2026 07:04:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=9AB4/jsYXgdlY3RRfM
	4XGVsW++ZoXG+BChpTAEyEH9I=; b=PAn58nGkbxCbzob8FubYIA2ClwLaePQR7t
	MeuL9aoYbEb3/dDtxsDzsvcrJ4bpY7YoNkBuIo3p4La+Cyk4ki3caNnLdGZ2RKpv
	hBT/cp4ZwuXdH6gk0oPRzJQg83SRQKGiIxhHN7SIhGWkpXoppMNLEG4Y3n7g+HQc
	F6QkhKjwtxi/qHJoN1Aap8ByW3TNO1xp2lGt05oiCn4dQRm4TByS7QZmFXTzUyDU
	mvVSZrEIm3Kc3iDDEHdX2T1eQxQBqzrk+cJD4N3Phze/ygpmMXLQRAyMKph8oZIv
	MfOg3a5Pbp3YrXB7ZHj7loA+6e2h+XdAI3c8keCyTtsgbdSvhl9w==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022083.outbound.protection.outlook.com [52.101.48.83])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f167019f2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 07:04:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4R577e1dw71ypbh9rR5vu116RQwmKrct/3FE3M5MLLbiLVDtZGU3cMc3j7DRFOCioB7lPCtx/0r1Pv5TFTCcQ9ceQ9bdXfika9EikNHPV2cpC4GtjMokTHTt+ouU7ti2TLb5urxeBplnzb7A++p/wg2L7NrHhPRKFx0QJhu1oXr/NNXy2Sdq7+edzl/2TmI7ooP+yzu1jehvKkuTKREu+h/VvVuvHYZLtUFJyFuMyuD7FYwuCROKM7keYqlVdKGyFHFUiM8iVavYdBnVLnlqKqNsF9oDa1uy9Cz8pU0aebChuJKCrMGgrJHf4IgM9QQyDS0ghUDna91BW0pY0XK9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AB4/jsYXgdlY3RRfM4XGVsW++ZoXG+BChpTAEyEH9I=;
 b=c00WKWYkewIOse9Qrlfh+4ltjxb+ZuKiwbmqPZE6iQ7LcLgFr0z9EaxswnYjCKYfG0W9HwhCxLnohUimtKphxcWtgR/VjTtrHkkJp10WbIJ/kyqRTUVPkwBxclykNRJR+6lCR6eWGdOQ8yDET09ZzVVzzFepnYNmK2oJTJboMVBRXiNjpZnUnnCK6HY63k9F5cSkoHk1sdigQrfjwg7Jwsaxf1CPIwiP5IMqd5vPj69Jjy3QpPdhCf9pYOeyPuEpUczpW/BWM9DEtFnX9P+JXi+7o3VqWl4XmtLGw42Lb2p7bvHLiF/TmjzZ9UEyedNhmXfXnnA4dF3ihX1+5omdkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=chromium.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AB4/jsYXgdlY3RRfM4XGVsW++ZoXG+BChpTAEyEH9I=;
 b=kPwJ4c4ghBRJAVysCoLNVuapM9JdxyKqcBuEx97nWEeEhs/FzOP645W/Sbpm4eHaDxGq/pJ2XEdvH15B1BK8HYoJJ6bzqCMUmQLySfaiDqP5XQe3dX7QxItP4Zs8dQrT9+eCf4Ow+v/fBcH/sMg3O65/5CWfbscKBdaHhC1ce6s=
Received: from BY3PR04CA0005.namprd04.prod.outlook.com (2603:10b6:a03:217::10)
 by LV8PR19MB8493.namprd19.prod.outlook.com (2603:10b6:408:204::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 12:04:18 +0000
Received: from MWH0EPF000C6191.namprd02.prod.outlook.com
 (2603:10b6:a03:217:cafe::a7) by BY3PR04CA0005.outlook.office365.com
 (2603:10b6:a03:217::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 12:04:18 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6191.mail.protection.outlook.com (10.167.249.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Fri, 26 Jun 2026 12:04:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 743DD406541;
	Fri, 26 Jun 2026 12:04:15 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6FAE682254D;
	Fri, 26 Jun 2026 12:04:15 +0000 (UTC)
Date: Fri, 26 Jun 2026 13:04:14 +0100
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
Subject: Re: [PATCH 22/24] ASoC: codecs: cs47l92: Use guard() for mutex locks
Message-ID: <aj5qvtWtLI4M85YE@opensource.cirrus.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
 <20260626061329.23264-23-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626061329.23264-23-phucduc.bui@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6191:EE_|LV8PR19MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: 138db957-2de8-4407-6260-08ded37b0c82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|61400799027|23010399003|22082099003|18002099003|16102099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	s2fVP2bcT8QmQO/FfE4kJZWpNQnJbGJAWBLMu3I1AzyKZMDxDswbjHEgG4Bb1GJP/eWRliPOGSFv43aB8GW1I+/bmjzrpQlj+vne6Jf0A33rlt/hYMg3NenmRt9nQfBTzafRZFJ9MSmFJC5RC4G9GAi+/MsG4B8tt9cB0Ilt5HErwFbt1+zo1shP5kjfFFYb+8b5aKnN+cbP88/ebZR4V25llxITo3hVbzCnfqt6Jmt7iZbo7E5Ol1bAm2ChUVI5I8h6phgIxDPxn8xAJVPhYBXkrNTzFAsPYSaDDjRaemkkRhiwoa2u3QkaFoseH6wuxIcmtQVqIjBgY+XzfKhqQL/akyKioiPVwmT+o3fho8mqo1/tH5SPask+WvU+UhjrU1gevAGMX4cwuE3Q1MSLmZc0+O1M9Eh2JlJo59OJKY4dCUezJnZXwH9nez6VgR9QvbPHCaNY38Ix3ecCYBxrhsd7ABYSOrSuPl3M4EK/rl/6ETMB+SMtWzkccGgdd1OQ3XWVC6YH/dyhXqmTkpxOtRKrs16I1us/wfCnf1Zg8GUnKISlUrtIMRFsdgNmU05lMGulRwBUXinwxWu0NEmRZiwIUHB24/9NvHGmxCvKjiCZR1gwtqXeWyE63OQc8LDbWSECEfHzk3VEEZCQJA8kR3LfANlRYdBJqtkj5nZESXOMG8fkx529o0Jad79zFzSMkGfHjItFbTIYizbE6BfIXQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(61400799027)(23010399003)(22082099003)(18002099003)(16102099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fH39/sZhfrusae/g6FUcEECLoc6sUnGj54KIjIPxFSNqNWPqXLkByXFiG/TiWW7cZZi0+ucgmeVwCvLVM+of5T0xvJSAaaQJcNibaHkg6D7nI1gfuCvhs4hmrZIxrK7MCGsmBQH7u9j/CgylVgvvFdZj4LeQi58gA5w18nqCH/pEx9TZxXuaPD552eaBXVMdgSGUnPw7HxnmV4H8VqHHoSFH4HNxoqbwb7AY79eBpSEggx4B9P78t6TG2fAnFkBKUEhVol63lEpxOhPi+lXUDiDgHmX4J/3YF5lFyJRvv/eBPCgm6PXDG2VQRorB2CHu5geYbad3h4buJePiOLaAwL8oqBaVm8sw4T25ct3ylp+eM5kbn4C90WlTor68/OGCuVYFnM89Cjfta05TO75mHAwYoqmDU5e2/9qdoDwuRZ8+l8T4Ih95OsuKiS//YWMW
X-Exchange-RoutingPolicyChecked:
	GJqUXIMjDEOZA133sepLwXPgccWDbPMgRy/CIDMQnrvQ7WsRLrt5Hxj26owMQY+jB5y1ZgDQteya+1SVa3KUjhZAZOJmG6IxtadnhPLo7ECDUihOmwZNAv7JpeTM84OqVA0nM4lJsKCNBlxF124Hsz3H1PyZvDSr5qOZ1iBEH3Dg40tMJBB706hMguEeTbaFXtRNuxbpL7vbm8eaKIDR8jFY+/XpGU+qRvySqqN2GdYeWDRPmnx88tn62G/QK/Hjkgitx4JXLr0pvJxrtTY3pEj2q6Zc1ptdLCR84gPUdi/K4HkkFdI+HgWxFj0+J7Con0mnfVECfnzA5lR52zh5Yg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 12:04:17.4297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 138db957-2de8-4407-6260-08ded37b0c82
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6191.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8493
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5OCBTYWx0ZWRfX103OY9AoSyMI
 1LVuV9IOFLlP2oygzqdfGpcmpxLNIJ7Kd1Z4BByS2mfy/+X1TQ7PXKmwRk7r1HN3Kj6BjyH6Vgi
 QUSUz4fMUK49yUS30X2AVFy+ADQSHZs=
X-Authority-Analysis: v=2.4 cv=foXsol4f c=1 sm=1 tr=0 ts=6a3e6ac8 cx=c_pps
 a=80uo2vwcsYp3yIYYF8sMvw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=2LXkwXwYv1G787AwtbYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: Y-YnWnT0jaI7i-vh20_LkU8jx_ArGyJN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5OCBTYWx0ZWRfXzHnS0J315VHE
 zQqBX+hISZN3iWNhmz38EXowWPABOBOs1nAg6cXRWk+Fqrxg+9Ff3GpMRdpdwmweF8M6tbxEeSL
 wgUJis2T5fRRej8Mt3odDVFV9TpDDG0V5LOsIg4ShP8LNJf8/S16nJsgp0tJJc1W+IiVphCXBmO
 YtJW3PoEDrFNTQOkrocepVCEaqHdbv0T7McnncqQ7pLR7kT6IE1Tp/eQM0piUBUn980QEOlJsKi
 BHt93CAhnIadDU7KH3ANZ1+gA/Ey10aVZDVUTyVEhJDadKPw8YQgXUn0rSV7QygJUYHaSJH06jB
 1B2x9UHZYLPXo85/H2A9YNLcrB3UoHC6Iy3ug3absiV+ICvLIrKqUF2fMW10PVhLbnKXWMixAeY
 bcgjG37RIGZUpr6LbYSTFV4hM3ccPJWl0OhRajks4xtTYR61/6haloU2mC12s4qIBYcMZ6IlyC7
 iFXt5xH0dgXrs6cztkg==
X-Proofpoint-GUID: Y-YnWnT0jaI7i-vh20_LkU8jx_ArGyJN
X-Proofpoint-Spam-Reason: safe

On Fri, Jun 26, 2026 at 01:13:27PM +0700, phucduc.bui@gmail.com wrote:
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
