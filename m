Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427E73F39FD;
	Fri, 26 Jun 2026 12:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782475394; cv=fail; b=e89T7iA3gZau9SeocY74HJ3JDGLPhWVpahhxcXFquO0ClAv2IbMYHC8lPXnr7U9iM23CVIeR14SEjaUr/3p1qLqsI+53v8dmg9mghWdDFJyDbsozYHzUH9mCv9B1XupQ90E747zjt8S+FX587l5PfV8pecPMLdS84AE1y47KyCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782475394; c=relaxed/simple;
	bh=aCVddZJKmTVlqm5adLNJKc6R4ZnK5wrB9EotfCMrCLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQ/XmlOw80KBQ5bChQ8/Y0mU22e90cn3QK5qhKigw+z1Sq0oWON3H8Oex26eS/8vD+6rD9UOi83pKPxHnruEepsX+dqHyebew3dPOlshKhJBEScv9E2C17VpeTwgfSAW45HbLRytmh8hRrA6TydwNpoJZGE90AEQzkSNeD+hmIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Lr2VmXPu; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=NqFK82/R; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Lr2VmXPu";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="NqFK82/R"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q5bs0r2299032;
	Fri, 26 Jun 2026 07:03:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=6C9KkffOvLXa9ZL7te
	6T6whdRb6Okq3/Ghe7Kq3HgZ4=; b=Lr2VmXPux7T2dcBSKuEEVZ+EgBhlhfyIET
	1FmCDDo9LUTF1hS1jjIhX9vn3sIzQQNLTxjIZrW1xiMv8W1pIVHtNBzxbfv9ecnA
	ymOPvgD8SzOsWQ+MYb8CSCA5lIK7lEdFypuayMOiCZRcAgRxPgqElRiANRp4At6q
	Jlgt+4a25gphx1cEXaFSfFxIukiIRygnGRaoj5l3j7QFwAynMMrnej7z14+yzn87
	+Guw3pVPdkxRIMJdttaT6bxk2uf5mWXy1YasI2sZ6Kns/EIAa77ntSi0jx7ACSYv
	Iw1jO8KoE3KuUWfWlywQ5XTEPuDuvTkKglCcjbGIFENZrdO0LWAQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020111.outbound.protection.outlook.com [52.101.201.111])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f167019ca-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 07:03:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EAY51adTNcA9X8ibVZBCSWTINpReoR45DmvUvZIdzUl9LszexQPw3Q+ZD019dzYsPEsC6fgIjROJptcDB3RNKRk/r3JY4ekYen/V7885/o3cAG/UfdfpX3N+FR+yXNGVWTDAsVfVdcOTB5r0el+d+aQR3p2ADcVcc5wkxsmRk+QwxXjV1SfkoPDtcZGlAp4/SWOvW7PEEyusEnwMQvqKDEz9NkY56UCtJtTUBonJJ8sF7wsw26CeeNwKf38SOZ1BKzm308mazpYgs5+T+c+gTPt+TQ6D+Aahsht3wVQtfc9UgRrtNJ8i7c097aniGFnFh31tqQ5pJbTNvBfiAhBvEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6C9KkffOvLXa9ZL7te6T6whdRb6Okq3/Ghe7Kq3HgZ4=;
 b=emyAxOJ9MKRF35yL6Gd9IAy1qVfQRMG/DBdwncNlnoc8uWysymuysnFpQnOZyUPyEgfnYECcJmw9H4ZuxpPbAz0JSEfVcJANpC+AxrsI6cTGQ5rqslnnJoEInR2EaHamDcEGfHQ844adPwMVsleYtuvcA+4Fq/tj8jv7fgQoSS57k+3JXUrMWIWwDCmVWbqkdWU/E/uPTUwCFiGihGBu4IR4TRJn6WofmR0qGj8J4UhykGx+bI4QJVkW1+2yXvvTo4Yosan5tOTlNlfd2dR8lAz/GH6LfbAzfhY+LTguLyXGaCroT2eg9YauIgaqH+KcsSv2TqM3nHkNgrz3SdOAOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=chromium.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6C9KkffOvLXa9ZL7te6T6whdRb6Okq3/Ghe7Kq3HgZ4=;
 b=NqFK82/Rfz6ogAF5VWGwi8uU/6QN5Rt9e22uyNg7waiQMPQ7/BoABHljCvGxJBDS46MsFU/bOLAgX9TsWKAKHAB2pUkR+0/4lc6qFZJ6yNCRwwvxWvEyjgkhEAanb98diX3iW/o1S79fuot5GuYa0S4lERU/A1tFHA1ZIqvPcEI=
Received: from CH0P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::26)
 by PH8PR19MB7760.namprd19.prod.outlook.com (2603:10b6:510:25c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 12:02:58 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:ef:cafe::8d) by CH0P220CA0019.outlook.office365.com
 (2603:10b6:610:ef::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 12:02:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Fri, 26 Jun 2026 12:02:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 44C8D406541;
	Fri, 26 Jun 2026 12:02:56 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2E18282254D;
	Fri, 26 Jun 2026 12:02:56 +0000 (UTC)
Date: Fri, 26 Jun 2026 13:02:55 +0100
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
Subject: Re: [PATCH 18/24] ASoC: codecs: cs47l15: Use guard() for mutex locks
Message-ID: <aj5qb72LdySXSMZ4@opensource.cirrus.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
 <20260626061329.23264-19-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626061329.23264-19-phucduc.bui@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|PH8PR19MB7760:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ffecddb-c43a-445c-9734-08ded37adcc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|61400799027|36860700016|23010399003|16102099003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Ol/U4FoBy3aZMEXMbUJABTD+RJU3qI8Wv2Il4SeWEJf7j4uw5o1/tPuqExXB/9xKTjHLvuT9AJdwWdxXy5cFlmblsQwVAi4+qYFH55TkgB2Qow0qPuAJ3Hy8Xh2QGti/uJ94zIMtiAWH0A2sj5ZxBDEcubAxrNUNPykz+7IGMPRusmPTAilu3du+nMf/BHLQ8FczYb9vr2vEyTDmjB/Gh9Bvzknm+23rFYYlrKpT0RRTr5k7FQBXBj+P891b/WaU1vSt6OhGNg/7ikaGlkCO1k0KOGlTl59q6nUuYn+mBtiwzKI9cSp+lMXE+Ht8KVItkc+JjIXVAfpH10ap7GVLk7VS4aTcplTplD+xVPg8NRKcFiVAFvYRM8Ckr/gvRdeXHGxAuLV3N88vDc/KVZ6Xw+jfu7t2c24MkkIMEd/XA2qwBS97vCwDrWgfQwi3S6ku/uN8BRK8GQ2PWUHHagYH64frRL9GYw91AgWyQCE8BJQVivFymDKN79PMAj2BYLaKblt+h/z1ei14DfUhs3H1Ww1iMyWlJOuSJVu9P3Tat4hCkhRz35H/gzm1fQJGTGj6mAkPfFe4eGqnGPkuU+1ogpIOPb4cbwH1G5nkjsRmoDE7GPPBBeDPClR+yAaMlieCICyLbc9Zf9rOl0GEppVldBkAJeSBIknu4TXiJAv8F1lpPcNtAmbtj2i5FFOY96C8hnQjoWBl2Gkf3Wk/wctDjQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(61400799027)(36860700016)(23010399003)(16102099003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ih/hBEorqT+fvczGa7W93k77uPCFBC+DEGXsnQmnFTUhkGxgziX6W0QvA9a1L+Hv6pDTSlUgkmoKKEOb5ejFupaXN+synRyzhJfMIz/3+FSNb76g0+Mvk3hSNa7yu0D3P/OKCETZHBaO4dQ/zS8CXgVwJ1KnQypmG9j8ggl8Tf9VOuIn/GMJounc56Ff/ARccKQmeFM5vdqXeqlAs0bKakYIffCGSEVx6iad2dtMHiullddLF+warEh+rRL7gc/qrccBzFo+1g0owTP+6AjNw7r+mESVW6q2sFxblFlwCPL2FL+PG7P74m30wbi033d9ur5CE6iEM43qlB3/NCSVCxBam3zq98vNOfgsCEsArRDDz6h89+EDbOE6H0BX4ColA4CpxdGdJwKYQd4WDR1g7wERZXSivkyPllU9PnCRLOpE/IqiYKF393WC9vQT8ltu
X-Exchange-RoutingPolicyChecked:
	kQwc+0sYpDnUG4ZJTRkui/18HFIVWjhEgJgXDiV9KfEE+g/1uQDssACOzg12BdL+F8QLdz/m0XslRHESI+aZ47nBuhbfmISbTqKjl+x6yOujKMWWk3WyPc8xXn2miSs3KbvoQsBNAbaM/0U1QmCW522SRAeJslwWt8W/Tbfkfe4shEAwuyXxLGXB8ym1mXX9AZhMXGCnFoW9MnU80eVmgXMSUpm59kYpL8t95GWmfV3JnQWLwBxp7pp4bFiLF0SGiMqSSQuhSOKRbzjXRw7IMOJQtHIbJBllSgzvmTXUG+/zxhmdzaGGsgVYGl43qyH/mR8vFXQpOsL48a37l/hIqQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 12:02:57.4307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ffecddb-c43a-445c-9734-08ded37adcc6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB7760
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5OCBTYWx0ZWRfXzUr61EWbkVCV
 ApsaBQ6Gv0pVp+e4+cg9j5iN93YVcjbMn2T8qYTN0K9MedQnks79zXmnjbJGXZ4Yr/irib4DmHy
 FJTUXcWRWScWRbpFFHLM4HEjxLdPby8=
X-Authority-Analysis: v=2.4 cv=foXsol4f c=1 sm=1 tr=0 ts=6a3e6a77 cx=c_pps
 a=oMcH3klX4F/By2Lov16jbg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=2LXkwXwYv1G787AwtbYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: -AHFpOzxzRarP43TH6N-6BrQ0L8ljkXE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5OCBTYWx0ZWRfX9ydbM3ccmTqt
 pJDVrIgN8UlOnJauBe/XuL00wAk1XYdXv6TzFGQU1yinfxFxmI4PDYb5JL9JSklmxpIeL6YUpAK
 RK1zGRACSF8AHWe6IwuK9L7ap8rDJClTjYu9v2Y7jJ+gTHHuH5Ygsh2MjNAr6MvLcSqVVrUWTZt
 JqQBjcg0Dvuh3sUhox4qeC2EhkbcsMJwSyULNrA+wU6Am7Gw0j3SkUw/XNiHvQQqceDQquyQUB/
 9048xwxKDZAyBGNsoCvx1ze5VEc5qQOXr6Wga1F3DgRc1Gy0nGAxdHZyA1DSy+v6XbTr7kI3dNI
 FG9UsX8R19aMrXD/j8vqqqjCzaAF/P4CE3LQYzslTPpV9XUzHfbLGNdj2W2gn+zycqPMKRTmHLz
 CjYVEFNydKkUgG873Wu2VTM9JjlHMxAuqa0/Utq4tIfskPZK2c3nu88XZeC7IND7Et2UnFMU5Al
 XZYLIlkIlrw2W6OwJEg==
X-Proofpoint-GUID: -AHFpOzxzRarP43TH6N-6BrQ0L8ljkXE
X-Proofpoint-Spam-Reason: safe

On Fri, Jun 26, 2026 at 01:13:23PM +0700, phucduc.bui@gmail.com wrote:
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
