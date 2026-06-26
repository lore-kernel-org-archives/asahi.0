Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614F83CC330;
	Fri, 26 Jun 2026 12:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782475424; cv=fail; b=O461TccMyOmRnOXf14paY1ijKJ0PE81mshQEOL/Cf+XEnCaUvzIrP+KzgoGQCjRzqG0Z01byd4QlTLlvGlbeosonSXdO9TPJPjwGDlFwNjgJYXlLgDbGB4bIHxjiFZNJoJNJqLwPRmEXlL66zQIczvcqOnXhZDXppvpt88Knrys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782475424; c=relaxed/simple;
	bh=jxn+gVaNTlVlxBdQWhBSNNxJL6ol2aTQKzsZMB6Tj0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9M0SKcYKhroPwu9+yhz4lMkmR8WC8qB5Iypejr/O3c7puNnQJtmjnesgfWMV/HiGrca6eh9YZT4ybr4ydGWPneSOPKzWLzNXy/oELr4gxLy/cBeolUBoKTqomzzCmJswucVgv0DNPD5ipPDnnC/mitxNqmpfjASek/S/+6+VNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=o8Xx+VFt; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=w+B2VQ5s; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="o8Xx+VFt";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="w+B2VQ5s"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q5bs0w2299032;
	Fri, 26 Jun 2026 07:03:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=y2mSdIghDbZ/0MCl29
	xdbazMdXS3hVvFZZCD5/kcNFg=; b=o8Xx+VFthl/KzgAhFV4vjoDNjzwEIgecHO
	Tug9n2n4XV2lri5lfnpT1ASC1DMW9TMo6ijDCFuYRv/9SjGv2EBI3rJyhB8H0sdP
	GPXcqX5o7c4WvyrSW03gII5e9Bx9IsT26yN47PB5svhsppByU+pmNGO14r6FGoov
	w+iq73pjjkhktvTIHspNE1I7zqA7fx7cIQQfpkvUU5ydw/LawPdvSOk6fOZAwnbd
	i+FieYHh2uMGW2fOCaYeD9gNuyUv9IHyOq3fRwPDEum4mY7VaYlJUcl1gaGUUN81
	s38HzM3nT/csjvNtU7l/7TnFpSnp90UhaneqKHWwrtezzJ9HlA4w==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020084.outbound.protection.outlook.com [52.101.61.84])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f167019de-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 07:03:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZqadIYe7nhE+PZHKZ8ILzwEXJrREuDoo+IwI/CfjGJNLO7e5ECeCisfyKRbZCv3yrkT/O43JlRNi6jwQJLK0Q7SM+M15KoAzWH12WVDfyQClSo7PST97ZPEKapNs69DHltE4gei3kIlpkzTwtjb7FPUMZ4OpnGiqoiSiyzQeibvt9DqnfgjdO+1Hps7RmjHycTm+mlwmb/sNnNSr446BBsomgrRnC0JzGuwHnP6GZ6vYKRWHWpSz/LYXEBbViob5lMtRO2Jaq9nPI0u1aHLxH1jlMAE27/ZQJTsmCu1CdiTkIn/bAJTrDV8d2tNwp1Ee04LorY9E/CuIuksuwbTmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2mSdIghDbZ/0MCl29xdbazMdXS3hVvFZZCD5/kcNFg=;
 b=ZvypaqlFSMz3WdIYFSw++Cij6rSBiIpqYmRrirEr3FjsCtuMpkFjn0VsFocNFDXTrp93/unjbvCfbHfYZDsyMr135+jbUCPAP4+pG8trhF0Bx57jKmh+8XyTMlXikR6i239Bl4ZjzvdcpjkLlmLmAeet/e4RV2xR/oLndAQc6AmYVC/dxvC0T6Jgs3QNT5efLQTDACmYvNrL+3wqibnm9zwc1DXH21QMYWSlEa/1LzSgoeHgr5CnCVBV355aJEWzNGndkekIfqHr13ifiEb6tm+l3oqoe39wvFViKvmOaeqyR37e4YeCWoWcRHvo0t+t59sMQDVNt+Oi0KgKIxvcZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=chromium.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2mSdIghDbZ/0MCl29xdbazMdXS3hVvFZZCD5/kcNFg=;
 b=w+B2VQ5sE+sIvsvEQhnP2F2dFnNi0tYJIF8UQCBPMrmpTrjXaIRPRG08Lba3Jsa5m8qzFQviYRoW252qKN+yT59zCHMKaf+1+kLUDlX5EkhegsZokmiJOrHrHte2853Jqy3MFTmKjYYlG7jMm7HYw2HUnxX7UKia7M0kGaCs0H0=
Received: from DS7P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::17) by
 LV8PR19MB8571.namprd19.prod.outlook.com (2603:10b6:408:267::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Fri, 26 Jun
 2026 12:03:33 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:8:2e:cafe::34) by DS7P222CA0005.outlook.office365.com
 (2603:10b6:8:2e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 12:03:33 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Fri, 26 Jun 2026 12:03:32 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4D157406542;
	Fri, 26 Jun 2026 12:03:31 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 48FB482254D;
	Fri, 26 Jun 2026 12:03:31 +0000 (UTC)
Date: Fri, 26 Jun 2026 13:03:30 +0100
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
Subject: Re: [PATCH 20/24] ASoC: codecs: cs47l85: Use guard() for mutex locks
Message-ID: <aj5qkpO7omrTWegM@opensource.cirrus.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
 <20260626061329.23264-21-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626061329.23264-21-phucduc.bui@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|LV8PR19MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: 780d5cf1-2abd-43d1-cac3-08ded37af1cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|61400799027|7416014|376014|23010399003|11063799006|56012099006|4143699003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OFz7pYMSy/ttzQ1sgo0HfF6fYnnRfd/c29/fd9rsEsEfQHZMaiKEPfQZxmeXX7nP27lrMq1jzq2AN1uoB5/2ZFLL2nq8/EDN3Dawz2NXdkC9vqrFBYf52VBQHtOkIkIRlNkpAQ0Nl0drHLLPYht9NcmdTyhehMv1UNOo/6Dpltw1cOyiCQkbSyTSPqSjlj7AMtcOHyzRkFVOi9hR83rv3epRj5fo51EyuDe3kHGxR3IZs5cj/uj7rINYQnRLmU3+oDGLrsq38/oo21N9b4NzdN/m8+tUWEz3dzrz8ldE702zfznK6hA3xWdqoyadnbcKpyWsibPWU92EJk7t8KhLa/foXMbK0SxeQkYwx7fLUNEZ46j1ql5zxhDRGWDobyTHfmlDvDSkSDTStVEMQUD2NcSrqmvVGL+Ry6sJ3IfheitjH/iw7NiYtQ471ByadZf9MquX3R4P9HWi0Ojhtvdbp8gEYo8JNo3AiRrvAHHKfYdKYvRk3ojqgrWKIA0P24ujKPFOP5zXHLyYVAuixj+bwKi20nVMxZh4yvSLFPNeYJIFWRi4I7ss9LNQiQ338mWqledl66jl8yL0hwVS3uyZ0HoWDZmBkI01J1dCHoH04qKmF5bYfk6XU92SnAluHXBRT40cSQKgVz2HH46/r79D0Fto1egXk/fzY3VBfYOmMLQXVoFvmKolPgoqhw6pmL7JJXSHdza6SsFuh1weZbo+AA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(61400799027)(7416014)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LdwGwURSpAJckmWhgSiUi9tTntsks6kjRytYxHNmQFbkSU0VSSno+TGN6cJbi8X4fD4wLMRNITYcNujzOcQgI6HxL67z11Q++fXIesA8YsTCPHmOAwXHFAlre/B6s8DBeQi18K3wsxV7AVitfzCevtMiwPRPQ9iyBjfyzTzdLsUu+Xi6bc1UlavlcefFRVg5mPSUk0jOQQwcu+dBpIYEPTmr8u8GhGsPa9OqWr5U7S/LDzFRDbIZQioQV3F5MOW7+74UsFQwmTBOOO5R28b/kS3d/9BavzXVONS8AliBpEQykIfncN0u30hQL+2FsIdRNCZPG24XSDWwv2LTstQCB4Qpu/zr9keTqaatkZ538Imp9s+f+YBuxvb+ubQFLRVPMCf7lyUrPW9t+aFl/uWdhp0GWf4TNxmw/2nZkmgpkroKcKcoqWmwormbIFX/n6TO
X-Exchange-RoutingPolicyChecked:
	Lc/ZO8pTRSfQwzzbc1GnFDbA5Vs5XkO1OuCMTAPsK9qXXpmhuUXKudScd5LSo6UYZlN5xFYH3dCZmhtGrDkGuwYnENgIIwxnBLLeaQY9MO9tYa57Dd3yzwWlDc1dabmpgavnnDvwKhEmAxU1ley2Z/MDqzE9LUpTc99eUjqjX/R14d15WGhvpyHeTWMQpSLBmjB3jy3AU3aIjGBE9rzmLhilKoAwhU8o1wCSd5+LKL+Shsusc/kLUexYUW5EU+T5BS2ZGJx3vun0Yth49ozDaYRlDQT2wM2XW+2Y3MlZoYLzRgqT/sDr3b7zPGcaDuzlpfPj3SpVO7izgGyvAphF/Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 12:03:32.6817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 780d5cf1-2abd-43d1-cac3-08ded37af1cf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8571
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5OCBTYWx0ZWRfXwmNjRzoRXBve
 0LDv3hzLoQygo/SU3JCEmC47W+a8hchuNOxNFzjBSsekZLrx1hL1gY8UiPEVMVZ39Yz5PHSzfVX
 iEmsgQLs8F0dnBo34OUrGLFoeBgH2L0=
X-Authority-Analysis: v=2.4 cv=foXsol4f c=1 sm=1 tr=0 ts=6a3e6a99 cx=c_pps
 a=n/INy9n90Tzyn9GwErGIDg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=2LXkwXwYv1G787AwtbYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: A0ZNlpA9QA8TVPn7BUnLPRA1KtCgwsxx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5OCBTYWx0ZWRfX99G/vhC/8Zr4
 bM+49c+xJsyrwYsJEAma0T34G3dZRfbTM+SJUAc65vwfAcJW5B6dXbl0oOe9vb/4vuJ4HzTLfcp
 rmTrYNRR1+JdVeu/QAivHTd+fb8JMAEA9uRTBKtKilyHg4ObbHMhHCYApzP/LbO0CvF+yl1USfU
 qUG+Q1LuqWluIUNGW5Gmyt3SJXpXek23b5wZu64mrz1sdbRqP5YTkKIXQV0kP3QK7dEvEMNCcYU
 ofPkBd6HHOBKdTfZn0NTIcxmTzS2Q5tgfNwVj06LeqakK3b85OnXlGQQLymg2PNu4Fdzcz/YJkE
 OQhoMW0l1KyX2ab8DFz9Zh73mcTGvDOgDBIF19zrq6xFURj7SPbYDGfHMfHHfZcE373nNt3cP99
 SxP+0A84n7v4bKadACh9OYCeT63oN3zbt8rYmpkg53cF2FnDYeUVKerpMkQ3jd4bTLGQ5q5B3Kr
 6Xs5QI+KXaqfc2KgNUQ==
X-Proofpoint-GUID: A0ZNlpA9QA8TVPn7BUnLPRA1KtCgwsxx
X-Proofpoint-Spam-Reason: safe

On Fri, Jun 26, 2026 at 01:13:25PM +0700, phucduc.bui@gmail.com wrote:
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
