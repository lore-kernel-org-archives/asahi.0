Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AD03ED5A4;
	Fri, 26 Jun 2026 10:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782471529; cv=fail; b=l6BRGZfj85o6Mt2yJRtpF31NmrPQh73EO16NMF8OZb7OtrlYUhqnWZteC+qiKKYh0vRCwpk2kthm9wtDwFKTDAGy+PmszHOuqhrIjQCv4jru83CJ82fWYMDekmZV0ipIw9YDF2pNMIlryOHMmoRFFkLMbuVEn3n5Y8DkcRQBjsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782471529; c=relaxed/simple;
	bh=NIjJG1tC/zIEDnZCu4Ofobn1Q+6pGrjy4+YG6XMEoKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZWzjzJCUFiwzweuYEwt8zoQIHAgcmcO2alGblTQYaAZY0rRelCx7AyJ/8QmzCpE2A/KPdV0Q0ItxsdZMwxTgNIihmiBiwM8Zq+J8VYF/CndJDm1hCt/ZkBdqQqqgckLZKGNdjx+Mv5bEBByxEzqY/THyEtCUs4K8n4co2Bdk3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RVW01VoY; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=DcWWlH72; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RVW01VoY";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="DcWWlH72"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q3XCRk2095346;
	Fri, 26 Jun 2026 05:58:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=fUIp7oOKKxZbh1n/Hm
	MCVKreQfwJnFs6+lRmVx9hqQo=; b=RVW01VoYQvdeBBQenD/v471tfjkrr3R8R9
	bdhNHnMKOpxR63+ZlzmTjOQY9OEr5JihItLUlG+zRqF8zcBVeYZ8MEiByrxKaD2u
	0y/j4ihQoA4v4Vd1sbhKtarZvPcKtmibn9hBC80591HrqS5n8+WvASgcLaqXi/Ye
	RddQmhXRxmrzY7CRvsYBsHnnfLx0e3R2ngJoizPGdhObBDZ39CF+0WreNJNw98fb
	mmVsTbXEbqY4g4qw9usQziBp82uneVzvtXemvOeFAmSKHzuUZsgU0eR1uoVesac4
	K7r0GH8m++JmmdvwfSA2gfwA97UX+TnlRgvqjX40uxgI1k2+OU0A==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020084.outbound.protection.outlook.com [52.101.201.84])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f167017cc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 05:58:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EpZX45kZu3NW8/YUzTPCN0PTFEI9zcED7xUsVgFxAskVpp/IYeDZ2ptt3BAYAX1fqH33pPBuuxGkHPWdGHeAQ75p4CUQuzCpd3V2Y8MebIXdR1kYLZwPCXhXUzBgiUkMzk7kkbYYarTEqpYiafY9tytTAL81Qb/S2nnAZgGa4QXK4MonxPyRaOmNMCiGE/tLUROknC6o9NCK4dqNL4EY8M/DoPuBVl5417RZqlCOSrv5HP42diUCtYYoWwCZVR1t/+aXLiw3XysOfYid0EsX6SUcAa+31q3oyPW2uCUQ2ujecfWbupTiWLTnkTn+e8bhPsF81b14wf2BKvm1gS2TJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUIp7oOKKxZbh1n/HmMCVKreQfwJnFs6+lRmVx9hqQo=;
 b=N+lVTlUj+XbwO+qV1v/0aXEbv4d9m2Gx1yOdCstTIUDbVRWYOm6A2+vWz8ggVR4yc+dLkpqcPLkXlWAlVt/KXgnWKG0U/SN4N1j15kZCf50n07zblEU985/KpwPvpN1mA3INptJX+MMczVkqXoEavlqqMBPYPs5Iw2HRjCuzOTI3PSQR3A+7j8qa56PDM7bXX2meo0XdmXcDJxFTY7VWMA2F7FEKqMi6SrbHokRW51GXtzEzj1B7NB16xQaQAYPdNqve3hXd7yE+ngN8LYQAVEEpaBPBUwIxzx+4OfeWgnqRbys/J0d/R1bz88nAmcJr0jJa2gc1kCrE/hi8/9t1eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=chromium.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUIp7oOKKxZbh1n/HmMCVKreQfwJnFs6+lRmVx9hqQo=;
 b=DcWWlH72KYdpKTAGhHgwhCTf0co7rI9sdw6gVk8B8f39HRS9mv9OlVkEZbkTBVOxzNc2gQta4g19FV4aJmbihwkGT6BhcJrft1OTIJ63Rnlnt4HkhN9PpGTs31/lcTJeAXAGns9CTXfbdBTd8eNtNHfwuhzv9zKeZTq58JNYl+s=
Received: from DS7P220CA0043.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::8) by
 IA0PR19MB8132.namprd19.prod.outlook.com (2603:10b6:208:487::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Fri, 26 Jun
 2026 10:58:26 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:8:224:cafe::25) by DS7P220CA0043.outlook.office365.com
 (2603:10b6:8:224::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.18 via Frontend Transport; Fri,
 26 Jun 2026 10:58:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Fri, 26 Jun 2026 10:58:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 189B8406541;
	Fri, 26 Jun 2026 10:58:24 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 15A5182254D;
	Fri, 26 Jun 2026 10:58:24 +0000 (UTC)
Date: Fri, 26 Jun 2026 11:58:23 +0100
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
Subject: Re: [PATCH 16/24] ASoC: codecs: cs42l84: Use guard() for mutex locks
Message-ID: <aj5bT3fCP7UzxP6Q@opensource.cirrus.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
 <20260626061329.23264-17-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626061329.23264-17-phucduc.bui@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|IA0PR19MB8132:EE_
X-MS-Office365-Filtering-Correlation-Id: 713a4ce5-ca81-40cc-674c-08ded371d8f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|61400799027|376014|7416014|36860700016|11063799006|56012099006|4143699003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LfmdHNKEExLcqqv8HGI495QNsHd3rRSLEDxOG0oiSiEuUBk/3OGlUhobqRPsbsUAzto8peq1bU4R++qKHaiZkRmoCW7LAB1ioqFGAn9aHYPrfVCF+8iDBpJoAihLWoP0sx6wOEuXKuq/Y0wp17/rSw+zuqXCexDJiqd/fwkvNQsaHD/87dQceKB6H0CuAuT6I9Ctfrf0t05w/q/6NSW1fKf8wlcLI+VNuxP7ZjdSoZ92nEXh+6KRbO5cYgnIhYkEzJx07gF9Cc2En9hz38k6RM7rE8KSLra9ZqF9II74ERIt4paV270U5PAa6M+iUQadjREgNm7xHgjIYxaZklNRzg7NlfRZ2hS8GwTzCk5lNAfifrERFaIrvrH92uiT7+uT9QJEcc9UdL62vEduPEpol+ocJNlk8wYGUUwN1SyDu3FteeJOwZUb23CNBBMyGHIsDqaQdPt7wgVRi3rxhgwAS0ZAIHBdDY45X2dwcI2RJGSEnlkpt45SwcKGuw8fm/84SHY56/qjD7kxn4xw1j6uodoNLPMcHcgzJX2Ftx1kfnQ3l5LeuPx9SzMyfbTzchRS23pRZNAbBBTgiuO3GbWA8CLAy855GbOFs4ZYlt4JafQDwYPeQXd0bOMOleE1uifHdmD+xaW8uxwvoQQEcyIwTckSnb9cjesOLTTXdWNPuiM2sh/9AcQRidf2hwC/oXSHcpvx9FJ0khn+FtlG8W+WBQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(61400799027)(376014)(7416014)(36860700016)(11063799006)(56012099006)(4143699003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lnQKZ5lJ8EAgiS1zk9e22EvGl1VkCp/wSP74JV89yLY8+HhkPXc+16ixByPXC1VBzIWAk7/QQ8iQB+HICjKrfO2gFPepqLceFc1ZFVukwvDyt3MKNWKMv/6WnugiBfRysJJXwukOTrkTv6tMIj+E6Ql6NwMLNmUYEQkNn1tRqx2rWYfJl5K8jMWDGwxegxLT3ub23d8ZFLK2bHL5Vv2LJQ1JPaGi4V9bqnNeEbLtiDISdyuB+jhejpturK0PCQ0mqdbbo/q1+drCVftcydLFF2DCVuaN2M/DhXpBsReel+VRLLOC8scl7DKxd34TwWNbO1yFvoBN1IdXGFHwnyAbjXL9DW4tGibLg6yEDscFhCt7amjZMLIDet9zhYhCM5JtYyxXb2PuLaPdJ/zEs4swvg3lLogC5P+74mmi6/Oi3qaSYUCwe+X+CE7mDNW9qdZw
X-Exchange-RoutingPolicyChecked:
	aM2KlIZuAQctL2R6hfXB9HxoaEjmGZ/55nk6nC550k8iwyIUdpZeJYptzGr5tB4QbEjEPUyryIYuoZW1Ic4uryw7AVKyD/eSsoIxKdBfLoL7oNaBomaKr60WGOpx5tql958jvV54HtjKJXxWbf8EnnMyQUs9p3cOptvs/6en3N3cMjBYB6iNQE/MR4AwUL6I6P+Yo+vnkO48lUvDLHkY8Z3YWotS/S8VZEUAW+8E01E/unY45//raZuGihdXL7h+77VmpNX+8tO7Gmb1PhaiHgDljl+zq7xpAuJirj6g0U4FB42n2DwdR/7yyauAuIGjrSxsTfNcuGLCk7t2SqjAMA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 10:58:25.4869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 713a4ce5-ca81-40cc-674c-08ded371d8f1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR19MB8132
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA4OSBTYWx0ZWRfX/NrtPoRaHtQb
 AwCoL61ZCPbcKMkE3hZv7kkYReB0NHg+HVbSP4fyfilv7XVwOgwW3DPaSbGLB0VU/TqOIundXeB
 OA8nrMUmLX5oqtV0LnaYOG8W9G4ik+I=
X-Authority-Analysis: v=2.4 cv=foXsol4f c=1 sm=1 tr=0 ts=6a3e5b56 cx=c_pps
 a=MpfTxiBaMh6MIwR6HTKnTw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=2LXkwXwYv1G787AwtbYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: XdJdTLdphe2OFROO1zSzLAjw6tETdA9-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA4OSBTYWx0ZWRfXzs9jR8S1kt8w
 qdgKuT/pPWU6eAa3qWJBj3Hy4qfuglBRJjnazxcF4tWZYxijv1xqXc/eRuiCL410+8SRb27H71z
 IbBNXdOajA6sK79z/9SxXwtdt5vvaYMTt2DFCUJzOzkgoQFJ7I6Em7S1l6keG1mILkWtP7AVCtb
 5NOxo0PCwnYl8SnBbt7B+atYkD+hUojdO9nAWhsQkSVa26QsP+3chp68zXpmKfmYslsXflEBu/K
 PBwnLsk7M7T4Mit7kPKXfh8BoNLLc6MvZIhlB8J06gUmXVIiePUjgz3DhS2w/MKLsgacm46H6GG
 XbtTDOyD0mR7Cv+MtfeCPnKsKKArah1uFoEIICv+T8hiSV0ZAx58FbiifS0r2+iE5XJZKuneglj
 HxSC/AaUGcwYWLAYsVrtz1SoKedUpHrkd6wwSGQZRRDfC1sr8PxQmE8d1mMRX64ReDpNuKPaVPD
 154AQrKZ333FmCu1QdA==
X-Proofpoint-GUID: XdJdTLdphe2OFROO1zSzLAjw6tETdA9-
X-Proofpoint-Spam-Reason: safe

On Fri, Jun 26, 2026 at 01:13:21PM +0700, phucduc.bui@gmail.com wrote:
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
