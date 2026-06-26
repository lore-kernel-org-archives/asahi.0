Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CA0379C5D;
	Fri, 26 Jun 2026 12:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782475408; cv=fail; b=o+5V8Aw5sL/y6jV1A9xZx09BIXT5usjfcrz6IVbgVNVHKeWIOqta3d0C2Wa1Hqxr/AKCGDLVlx9urR5DVvSwcFr9j8xeZV/UxzH2gP6UR/wFhC7++Pgj62JQq2s8pE+Kc0Ri06+46l/Km68w41bcU3qPq+PYtKux+7N+hnGKV5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782475408; c=relaxed/simple;
	bh=FkAiKyassnAYvgZblY2zsA6BvMZ0WX4fBhFjKA0qhtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQfRtuhyeRRP6dY7mg9GC1cOl8K4wIFYwvj5AtfLJ9q5RrzB1CPj0OowST5S39+SSpWtR5hJvvaGd/aTdH0fG5f+6s6xfmmbiAtzh3g5NfZkL++ZFKik0rJgkBLY3ZXhmTL7BUYWIGfsFOf28lPid7xq32o+eTiADJAjwMpF/pY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Nv9GcUGC; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=svGX8d8T; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Nv9GcUGC";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="svGX8d8T"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q4NNlB4187582;
	Fri, 26 Jun 2026 07:03:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=UDX/Yi/rhQl1wyxEXv
	E7rrmQRnJo6B6de/d2Q42zuY4=; b=Nv9GcUGCJhBsbWCnpKDfZGBzc2Qzd7BCSk
	fbuB5SVZrKOGS+BmK8InWgXH9QUa7Lw/sM/7JmGVrp4MkizPprL8aqiUUWQtO5Zb
	MAlrVJy4USMJTYECih0SAJopbkkc44wXILcsRzgwKThv2YKA11TJIg5wAOE59bQd
	+w2ThUQU90b4Esttf8b+ZOnI7wybqqVdXWfdACKGnnxOxvRQ/dTW3qILub8VC+Mo
	R6fwAcue/3jwcuLd+A3ybggzmV9v6lVwY9taYDd+e9osg8JnSuQd21d27X9dwYio
	j5vLqbdgTmxsfkSBJ05EArGrEhZDuOkSAWrq+HWEthurX1QBhyHg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022090.outbound.protection.outlook.com [40.107.200.90])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f17gus89n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 07:03:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m4X2X96e4whQU/tXBMsFD/FWZrWLy1UPukpaO+fr1ix86ugyYD2dElNEoVITIWKsVT1ac6PybolqdE+3dkya9hpXM/TTmWGxfYblYt08T1JOOHkIRIdXYmE+bF11nEWglLW7nxHU02j47f5L+rqTX5azl30W6IuovKYljG6Y7kO9QPjnt39NXJ1nsIQziMOuPGj51PYe8hV1JyS9nU+b8J8TvmThlIb0qL0tVcZ1vlkBL+ZJwKFvXPRFbHTUhKKmIVgvv2SYwZAn5ppgzAbdYbCPtWZ/V+IHSn/C5CEzsa5W93uJW6GI0vuXy8Blvn8QP3CY2kfCvYTJJTW4mwXs/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDX/Yi/rhQl1wyxEXvE7rrmQRnJo6B6de/d2Q42zuY4=;
 b=oDSE7JjaONG3hd/CN+2keMnnKtv4iuurnngUXG5W08wr3lEN3Wk+IlBTur6qBCbaOQmVhAO+OHIDrIS1iwFeXJmeIn8egXAhv/e9eRenZxTceTtG0AZ4uyUc04vo8+J3ofBsfkNvkm1la5/Ckllbi44V+6u6DcImTPTzn3tJL6eBUdMlLKUSShwd+HjtPGBaQoIH+KBmxg0eIcCf/4+Cc3VVQkl7kqMFViQe4mbw35CE2PG6joRTQzWbHjv8D+y7VrdhjKnsaPK/7qeM5tu1ovoCLdITcuO5rwrE3ktTyd030r1xoqggowOpWEQgq1xXcE7E1wlaSL2HY0k8CpGVPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=chromium.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDX/Yi/rhQl1wyxEXvE7rrmQRnJo6B6de/d2Q42zuY4=;
 b=svGX8d8TciPSaha2oqLObIt4rkYNkHiz3pFMiWLGciYdeUOTEg3rKCOIH5dLP35XK7E2Cnglrdq+4oks+sb5H2llxRfWlimvQaXJj+SARk9iGoCCcLAruXs4gIkbnw/birs4IyEBz/VfEsdz9+BgOrOHUlNSP8rdB9HPXuEX4Lk=
Received: from SJ0P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::32)
 by BY5PR19MB4052.namprd19.prod.outlook.com (2603:10b6:a03:222::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 12:03:14 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a03:41b:cafe::36) by SJ0P220CA0024.outlook.office365.com
 (2603:10b6:a03:41b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Fri,
 26 Jun 2026 12:03:14 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Fri, 26 Jun 2026 12:03:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1F326406541;
	Fri, 26 Jun 2026 12:03:12 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1A28182254D;
	Fri, 26 Jun 2026 12:03:12 +0000 (UTC)
Date: Fri, 26 Jun 2026 13:03:11 +0100
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
Subject: Re: [PATCH 19/24] ASoC: codecs: cs47l35: Use guard() for mutex locks
Message-ID: <aj5qf2+TmhuwxyMa@opensource.cirrus.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
 <20260626061329.23264-20-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626061329.23264-20-phucduc.bui@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|BY5PR19MB4052:EE_
X-MS-Office365-Filtering-Correlation-Id: 67ad93d5-d925-48e7-45ea-08ded37ae6d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|82310400026|376014|7416014|36860700016|22082099003|16102099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	DhEc/woJ6/q8ClY9oxHQyrr8cYnPbFUg4K1NGEw/cVgH48kbP/SA0VZAA9DNEadqz2I/z9m4/aFDhVjEsce9yhCMB2KxhuQWPnjoHTOu5I5uqBHGr+5D5rYq7lyoCeUCcWI6QjOnGV71rGqUfs0MrAf1H5IR7fBsRTkNJnX0+R4hhv1wX5CczfgAmoTNclZky/kpRVckl/YE6QoHpl7VQK/+k3G9GDljuhUOrpIpSrFXRNC2Hq0JoTh6pQsImeO8Girx4bga1qZbGSVCjpElKtDRGhuN5MNQyEhZuKZmslMAKKLP68kWxB/wC5bEBWPABsdnOzVMWQoZ7aKqIWavt46n4AK/+ITiUdTmtt/PyDj4DbMZHLrVcmH2bdrrKbS185B4K90mEcruCy4kHj6A0LKOTkm+uRt4eebIlcKxl3O83bowfn2d6K4Wcu5JIwTpZUbLM8wgScZ9RxLI3zbb+tBdHztdX/kNq7htEoaU28SHGdylOb+iS0El3JAUA67XH0pFppxaVGFl/DB/rLdg6mVAcT4xDdjbvc7MmMfD67kHJwz/iAf+LWJwTanpAx9UsuyhQJuBCMUUumpcLfxLtKF0i6QS3njS8YdJPktHW2fr6GZCLOjWMefeXE6ECQ69YovQpWNu1EeLCnfv7gON5LfCIpMvqnCDOL/HHPArA0TQqp4HHG93LySXYrPTMog3zwxOCoPvkKzooaRtbNjNww==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(82310400026)(376014)(7416014)(36860700016)(22082099003)(16102099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b2UyniKd8diVpHe2Ibd89xZhIarGKZwysc511TmKNlrpGngRb4ZMzejILII3g4LglQ3a7o/WeEIVwDgI6jZ+n/YaW1MbtZ75/HJ3MgYJVuCjz3jX+E/bCeO918NIY7y7YDSswQwt2f0YgWy1U4sX8B5FPR2PQ+x0oqE9ZUH8Z6flhw4to9MEiCAztrfj+Badq3yoBA7KGfhgL6vTtWF5H9llm0bmgPQ7IEiRYdk5ObtqiIGEhT97Hmt50ODaQAGfG95Mfh7I/6D5s5KePqVKnrB9kPMT9mfs8v0s4r8v0uQAdZu///Xtc4XJdsQ8niuAvIk5B7P81D8auqMtiJXxfM7BErQOkWP9naDuNXoIJB5L4zUcSb86aldd1Pp3CiJq5b74RH73Tz1zA8evnu5woPQN+U86dQr2v42WcYL31ruAwN6BZiS/t6EPWQVvl9a6
X-Exchange-RoutingPolicyChecked:
	rKoWDHm3EJB0/ugb3mjC+a26Dtc2Efwi7kCycKvvnZaanRUitZSR7QkNcYasb5wTj0tvgCOKX9Kr+D7XvKCl1LeNxGPv3yqRSSd5qf+RTSjsNMnz75DXno95KuSJghKPl+4HjsbX2xz0tZ/tQdvg5UW/eaK17Df6Qc6RJpXr5JoqtwoBQSstBpWAtxaZ0qkFYxbhmH9CSJO1fMaA/WIddGtdrSnfT0fk5bwnou96cY8U6t0NqdBCbR3xIP9pa3BYDrHyXaQVJM7hFXOcczyLoahLKbC1LBNFAlGgKxBLyQBLLf1EhXwdInEPZDBQrNauhAROLVtZdpm3blOOCG0zyg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 12:03:14.2030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ad93d5-d925-48e7-45ea-08ded37ae6d3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB4052
X-Authority-Analysis: v=2.4 cv=ZbEt8MVA c=1 sm=1 tr=0 ts=6a3e6a88 cx=c_pps
 a=EQiSdmqO/0h9UsHobtR7BQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=2LXkwXwYv1G787AwtbYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: NhD-rUvDnbl8f3OiS1dVS-zKzyq97z3K
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5OCBTYWx0ZWRfX8myoldajAv52
 DZGz3I/7SNXl+4PUqT8P7vrAdMjnfDwfF7K/q8NuB0k+I2GJtlxirJEULGt5yUKZvWrQsHAJKNn
 M5eGGNdzxrXjWsnQMInMTnB0c3zaGC8=
X-Proofpoint-ORIG-GUID: NhD-rUvDnbl8f3OiS1dVS-zKzyq97z3K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5OCBTYWx0ZWRfX++iBJZNSTGDm
 eRKLjWTj6N+qk3VybJTXvcUuCpDGAjByxotbg+Oh/RMmy8O8ytu3QlfUvaC7iBaYI6mT20q5Tz0
 JCLZHOhx+H/FmP71lzK1DmP+LiZKZlBZ8v6AHgrAswLnBQ8Px57BLmWfQOuWZ0akCiDNnfl7N5c
 MP0vuhQWYWR7fXOT9q37J/vQEG4FgN1LILEqJ482IaCvujSp6/F6R2RhjIcblE3up/zk/svci43
 P7xNlT5b9ULSgf8vK5PIkOUKOU1fMs0ptK1p3+RIwwmpOrxAqcqGwK2ZqoqQx/nZLSj76kX8u7H
 v5/qQxMjaA9yFiLD1luc+7fs5yz7KAWuKVNZuviAcneR4sf0jB6EcnD6X3B5f8MtF24x47PCbtV
 VdWyeXZq5ZmiUwbZR4zRu+uD12y5dih3D/MKhnffHoN9xdXxDXNYaZxLrifWVlq3/b3YHjnNQuO
 166N1Ws/MG6vuQ5WZqg==
X-Proofpoint-Spam-Reason: safe

On Fri, Jun 26, 2026 at 01:13:24PM +0700, phucduc.bui@gmail.com wrote:
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
