Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24DF3F411F;
	Fri, 26 Jun 2026 12:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782475576; cv=fail; b=XuUqvnCzhFv2IDfVsMzEvs3gS83GoxVihaR+WjQx3JanRMX7psC7GAYiQYvVJqAvh62FojFzqAzwlIlYWWUlyNUJvkM66iWBHi5hcDn43Ojq4wAogpTK4qLfY/bsC35qGi4qfuQA2GaqSYku/CDdaqLGN0RVxxljSuh+Kv6lon8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782475576; c=relaxed/simple;
	bh=Ge3fuJR8craRLA9DbDsOWGgfk5OobbcIkiDF6ajrKjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/66Swnp2arhwmD/iswYYIpma6BxDsf2/ksIiknHxsAbC5Tf5pmyTWjLiEoOprBHLf4/N25U2IUFSQnxlqqjkfTrrXeAxAvLnShlVwxD9eDxKxXKIsyG2qZA8zdMBHruGcfmxqmcKh5OoQLzFzTg3VoqVYNsl0jiwpD+gDUQ47c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PwplES5p; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kLSVnER3; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PwplES5p";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kLSVnER3"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q4NNlL4187582;
	Fri, 26 Jun 2026 07:06:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=4ITYy5Pt4LIX6vfLaG
	A8rTkiUgrhVYU6FRtwVD8q/sk=; b=PwplES5pf5Q++3fM7kQtAaxWHiRWs3rnaz
	5z/2LrXwYAiMT0R1t60xuE1NQ5T3Tz27sYDrXV0vKsugV+Vti4lh2NYzo/8zAgkJ
	Ua0MWHFdl/Y+CatTy74a93NMxsdi24APYPyaWYafHBmG/2dKkgH382rHhhmU/AFi
	4I6CzUO/aBz3k63HB9o/7GnmMUnDbRsRG2JK62HGVles5kuJgyVhqVBF7D78KJBQ
	KtqK9IDJfTtN/tdHkrDgAof2GEHMenrCD7n2b7/cjdyyOaqM+/O4M3LVgwbbXhtH
	lN9LzmaKQaiCR9twjl9M/BiTf2GSm6s/jT8LMt5UvMS4ragXxDDg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021133.outbound.protection.outlook.com [40.107.208.133])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f17gus8e8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 07:06:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnKTXlrJ7YDYGkDzFFOA/T7kDB8AEfCbZUlUPmvfirY14jqY2xxe0EmRYL5voPCi+VLcph0i44nXWFAOoysj8m6djmE6z2L3s3WS3eHyijCnMTqCayVS0h6JNEEEGauvcC1sBAiAEc2530lY1YbWxcAs7Crah9hLDXD+asaUAZm2zY2VbkBZA5XmaeCWFfZGqYindAQ3ZT303iD/zGg4ljMu7xtPUDsMKnc890s7UJkD4VAFEeApemu31oMHa8K5H2hOEHAhl0nAgPpQxFntgsLkCFqNc07bYRe7LinyPNJ6J6lpNDYSHNsA/MlLL6TpQsOwMfUb7aElFMk6Lum9JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ITYy5Pt4LIX6vfLaGA8rTkiUgrhVYU6FRtwVD8q/sk=;
 b=K/5QgrOrsQ0V8TuRvaWA1N0DguU1vcMzssgp8I5jXtD19EYUfow/15lHPIZ7cHng+7wRFkT2sg9FAWqgUs5XDskNpHW94/isxL1MIX+Pfz66lk7lZv8bVHVbNMe5Ik12NxYNQhcgR81qbvkjd1ATcfHT8+vy1JCYPBBbbGAugs3rAtwa6l4klG8tlifFSdpkSBzumyhNpy9Yq/WoaTPN4FKUbFavQTzjzkJOTaKtmmMZIFxWPu+BQST1jDyrj60ZolVAyLjP3jU0j8U/tnXib3kLClfrPw3UGfYp/wsm9X6oN9az6RZZ1X1VF9Py+Co3QBPZ/4AOxLjGYOYNlb4hlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=chromium.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ITYy5Pt4LIX6vfLaGA8rTkiUgrhVYU6FRtwVD8q/sk=;
 b=kLSVnER3JFiiYrTUgraeh4bi+31NHX7Ri//MYrqR3lNk+fMhvY4tc+2bg9nsdPIjf7Y/HAVE8axPP0gcLJxgdu4yz1KnBT07ueWt1p3feKINEX+ZcC4LOY6a5emsKW18Rq4I2p5ay9+8OjahC/iLzn4wKhMC0OeMuTRcUDGR+Ok=
Received: from MW4P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::13)
 by CH2PR19MB3752.namprd19.prod.outlook.com (2603:10b6:610:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 12:06:05 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:303:8b:cafe::3d) by MW4P221CA0008.outlook.office365.com
 (2603:10b6:303:8b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 12:06:05 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Fri, 26 Jun 2026 12:06:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 63BCC406541;
	Fri, 26 Jun 2026 12:06:02 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4F04F82254D;
	Fri, 26 Jun 2026 12:06:02 +0000 (UTC)
Date: Fri, 26 Jun 2026 13:06:01 +0100
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
Subject: Re: [PATCH 03/24] ASoC: codecs: arizona-jack: Use guard() cleanup
 helpers
Message-ID: <aj5rKRHcU6emmdon@opensource.cirrus.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
 <20260626061329.23264-4-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626061329.23264-4-phucduc.bui@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|CH2PR19MB3752:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ad929c4-6e53-4a1a-7862-08ded37b4c3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|61400799027|7416014|376014|23010399003|18002099003|22082099003|16102099003|11063799006|4143699003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	GWPjllLSg4vLYCcy7HDMogQ0Df9h3B1aNufeesa50Es/vDuavZCm+X/BsWkSuJX7Lvaoi5hmS6yRiklSpCD1JyuaCWpUkTPNS0cYhdfuCM9DUpzGPRgLUPevj3a2mc/AG3RAbo/waSj61NSvbr/3bBOneBI5rj01RVPLwQp4r8mYzR1S4hCO7K5Z6ss9l/021lWY5gKrRgnEk2o+jLFK8GqyoUkmk0zX9DyfBLrptG5NJ6q3kbCQkkKomAqaO46yZTRK9/6JRiFbGLtI4e2abpD+wgkwwTg0LFHWFbE2Mufv5imGPSea5ofyIjUpNrboYvf4aom/WdRZl212NvFAOIF/2ZQCaUqguHt//9Jvlem38y3zftQ3C22pbtCHyJt5KLNcMPbSo7tWkTA/1ao4X2US2wuVa7Cs0U9oHMH93lBlKUDNl/HRgS0tmhyowu710ijCL2gDc/Y8dA8mYLxnVaC+pVBb8kaiPMDAJgFYcJE6Lz+hLEGLWWg7i2SMkNguShOhcYRY+eEPrSpQ+WAiZPUVGv5COI0Qsyr/zybVgmZViqZ6xaaLZecwQzHFfkb2C9jNuBc8DHmh30x367JxcKb1qU/hMJMXDbsOquQVsUPSSm9BGfwDM0ByYVjQC2n1d6JjYhHKOtp8M9Q8i2hfQlU2gldWjA9gFbs21GTkoaQ47A6f9vQ4VNpjhUg1GNyczy1t1z5Y9Ym3K7sGGSRBKw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(61400799027)(7416014)(376014)(23010399003)(18002099003)(22082099003)(16102099003)(11063799006)(4143699003)(56012099006)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lzfZ8JHd3OxIGIz9RdtABoPTMC/+eZOve3yMGFinKyAqm6Blir/brPi1qCkaa7Cr8ATcLgA8OFNxVPCm5nEPyXb4R8pZtEtuE0MjrgIxqw3/dKd/091WQc5wgkpYbftnAnd0S1X0RLqc1D5tM/vAgFJ8B9A3D2noEVpHXE7g0B01FH3+NyVS4b1/I/G//XaFiHhCWi1Y3yCjGZVJDWbx7TeXYh6Kf4OrKLJLDtSdfqS5nVJe/b4oU+KyOzsz5myqYxHNEs1Lbb60VBgTnHwBtnUWZpN++ya5M3k/zG23kkm2/ApC/OvxpVTG2PHyOGQCguHlhJHBF1aoRiMk83hUd/LgvvAMukmLVRFBzPdx3U3vz/KxbZ7YMWjpKK6eOpQ38KaQpT5ntbTra4PXm00Dp11fR3fBiXZB301GoK2hUJMrgrkvRrP/6bbYjXTcjZd6
X-Exchange-RoutingPolicyChecked:
	BeEk1rGxxCx/L8sbw1KMd6vhaOZQWeMyOcdWr7e3q8o7Qhb9m0jZRaHZkgX2YTMCVMigkn7sUZn6QAY8uoEcNBCYNBURIfhfYSeu/4P3JthgPdAwyb+aprN5OQUuZM6CveK96FZqNS/89MUl6zQ+GfLFtByBycpKmeA3NYk4y0vLdNvv4KcHw432f4rIKxLCQ01Hay+L65wEUvgX3EtG8J+C2qRPCDq9X0ci4WHpIuhmMNjMyUMLsjA5lcWwwmUFBy9/6QLqsWoH8VLOkDWmTz/JTmK/XSeVNN8GpLWRv0ORlrZP5fCnxCGSV2N0q5kIL3rlgN7EO+q+gmd75aDr8A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 12:06:04.3523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad929c4-6e53-4a1a-7862-08ded37b4c3e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3752
X-Authority-Analysis: v=2.4 cv=ZbEt8MVA c=1 sm=1 tr=0 ts=6a3e6b32 cx=c_pps
 a=oB12z6Vl+/cAOQgROE5n3g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=rdK6ULgLj1a--fJ8iPQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: mbJ7JqO4m0nhOGdCbuP4wxoTsiiO2_zx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5OCBTYWx0ZWRfXzQMdyxTAnVvR
 sTCzP8Q25cfqVAqSwa9nrJbdOtRPv/7lmXxIgyQxJ/5RbGVyTMawth5aHOvo5sb6a3e6By7btKW
 cWr6SMbiwYjK0PYZxb01GR0ppDbFpwc=
X-Proofpoint-ORIG-GUID: mbJ7JqO4m0nhOGdCbuP4wxoTsiiO2_zx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5OCBTYWx0ZWRfX87b7sG98p9oG
 EgK8CXUnHs8N9omJj/sJ0EW1zGuQgpQzwPZQ3EB6QHnC8I99YbFbakMpHMqWLcaboQhUozAmBN9
 IvgZi+IluHl+L1mVeeirgOGJPBPBrJdT3lThIN5TAVYhp6drEh9JA1ROE92BXToShA/DIYkbWV3
 Cc6eaZOXKO+y7LWsvabwzT7mc87oR43XEBTrhT3aZ8lkJdD6mFDFoKuT9/EW7sa/chs4/WI8HK6
 brIr4eiv1N40UZFf1v1Tr1LqOn2QH+OdaL6I/7XDNaaCiDFBwSaoz+3ydTl5Jvp8lOoe5Sz5/iM
 4Qa5vEIPLGGZGGmWBdaygorm/TRFhrQBWsxDcnib/e7q9VsW44jPYWQUBXMeQbcRtC1DCwgvqaR
 PJCJTdwmhWJZ1Mhzs+VcGxA3tnre8WtlZfT2u15vFnoc7AFY0dRKTJ4+QEhC8zuCworoAHEqZL1
 yXQki70tL3e16g2FGug==
X-Proofpoint-Spam-Reason: safe

On Fri, Jun 26, 2026 at 01:13:08PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() helpers for mutex locking
> and PM runtime management.
> No functional change intended.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
> @@ -1057,7 +1051,14 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
>  					   msecs_to_jiffies(micd_timeout));
>  		}
>  
> -		goto out;
> +		/* Clear trig_sts to make sure DCVDD is not forced up */
> +		regmap_write(arizona->regmap, ARIZONA_AOD_WKUP_AND_TRIG,
> +			     ARIZONA_MICD_CLAMP_FALL_TRIG_STS |
> +			     ARIZONA_MICD_CLAMP_RISE_TRIG_STS |
> +			     ARIZONA_JD1_FALL_TRIG_STS |
> +			     ARIZONA_JD1_RISE_TRIG_STS);
> +
> +		return IRQ_HANDLED;

Like cs42l43 I am really not sure about this duplicated code
block.

Thanks,
Charles
