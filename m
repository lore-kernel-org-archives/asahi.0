Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDA13E172C;
	Fri, 26 Jun 2026 12:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782475453; cv=fail; b=cGMWIHEriXYeQAjNLiYYT5ZS4sxPQmffemAINh0aki+Ppx3/+xVRxwGf2pmFIPCAwyMBbbJwVBYZAM23h5IRYvHCDc3sbLt0oY+YcN2jS53sR6v0MvDpLmZ54qtCBrAUYrEC2eaDAmtvyFUM1Wju23qU5reWv7HS87CJOoHwCQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782475453; c=relaxed/simple;
	bh=I9Dx3LQSFTFQL1uIT6bndXTX+q1pd0YdO28vZpLy4fQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5OB76HfDIroJYbCrBphGEtKlUeMWPmp0HA6+sPuwNUfYFbPir9DoBN+eZR93JsoYuRJN+uPlncOqxvO7SdkKTQEz45E+XM7hjTY0HRnzTQeNDWW/dMuoyjsC5oWQBSydK60ibZbu3OASjGWo8m205yfozUxafcxoQdnbZcn17w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YLY0H38C; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=JrqHgMkm; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="YLY0H38C";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="JrqHgMkm"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q5bs102299032;
	Fri, 26 Jun 2026 07:04:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=ICiUseac30YFtyDVmR
	DUZmTGMS2S0HOlWkakYBm8AB8=; b=YLY0H38CjIYOpfAJ79HA/UY8ZPbj+bz1r6
	jA5KEpLKDQGnhLSmQ87w72CH9SRpWn0jEC4pQx4pyfpwL0vBw6ATd6Ws3zX/6wt8
	BYezAd7nvHm/cKLWwF7N456ch/blIQ5FPDhvCLzTI3CbGzpxZqMaocaTRIfpUGgx
	1g35byvCl6Ou/vZDX4rwVBXCejISYX+kWVvHttDJ9uhL/8ck9pI2Nsynlsd+WLaN
	Mdi53Q3sXrR7AR7n2ZbIvB9Vs7hScAECgVLzGCGcggoNMXMDlJlOsqwiBiaU8S3T
	sUfHqjvTIHuavu+zQDXL9Z+ddt4UE7rjcAd96C5KqEtd3CFQs+fg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021104.outbound.protection.outlook.com [40.107.208.104])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f167019eg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 07:04:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INqh6JTwzvgfjmY3/HV/nAhIXs4azHULv7M/8V0G/zAaYJAUuLe3uPy1pljssnd9xfMbh3Kc2kMFySMFlfRjagC5vpCIJVubw57AF3SzU3gZjAAGvqxIv8e56G9tetTJ/KBPvyA/iknIHWjtF7r3BaR4LrlROtPIabu9r3yrCDAsTRzVwfVtNSAEpdIEJBEE783/VjNyufRhhN+N6zHeT+W6Dh0DKnPcdNWWPXhUov9ViaT1S2Yq601Z7lMnDg3I159bUwkri6emJ5qfK/yEcQItFmUtA55uRIHJa+k4HqmUrpIQZv0Oez9NQXz4zwl4Qzl4R24a7E68UkhRMLs/FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICiUseac30YFtyDVmRDUZmTGMS2S0HOlWkakYBm8AB8=;
 b=lXeqS5nMXiwQL06pxhIest2syEaC7wZakBnPKc7zwo7JVhqCBNZKFuRYR2AwYJZJJtEzzQ9vR4mff8FpVyOeh9XHL2m4LmVvlhyo/5M6Q+gKbIaXc7KbepOLs75Kx3KxF1Gqwclegng68hyZMTmGb3J/ckmy2qwrpyvKa1EuFsIOOEQaGOAI5qJsGYteLzKMSbXAeIMUCKv9VYwfJoM7J9HRbHyRqKX5jQkF0LDVBnGRo/CaB+GO0lRSRjI/NddS3GaFjIDwrdWRw80C6miuwW+3Lc4jjQevGwXI7WkWD7KfzKPSYP+e/yJyj/oVcoeFpCjMVnpTU/mMHMAr8hj4Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=chromium.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICiUseac30YFtyDVmRDUZmTGMS2S0HOlWkakYBm8AB8=;
 b=JrqHgMkmMprp0sENKAsaPz2m2x3yc2XToU2l3q/Ej/Q358t4Mxq5vWHVOEFLUODS7brMpkn6swNENQjyQZp/pYnwK5csJJkU+8QWe6MdwuTEZx9HzpWdpS0Cwd47weMkAfIPmlLvsjH6PmTg84mf5/vP5F8Kv6FkAbFlm8nVeEE=
Received: from CH5PR03CA0004.namprd03.prod.outlook.com (2603:10b6:610:1f1::6)
 by SJ0PR19MB4432.namprd19.prod.outlook.com (2603:10b6:a03:289::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Fri, 26 Jun
 2026 12:04:01 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::56) by CH5PR03CA0004.outlook.office365.com
 (2603:10b6:610:1f1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.18 via Frontend Transport; Fri,
 26 Jun 2026 12:04:01 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Fri, 26 Jun 2026 12:04:00 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 21D99406541;
	Fri, 26 Jun 2026 12:03:59 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1C67E82254D;
	Fri, 26 Jun 2026 12:03:59 +0000 (UTC)
Date: Fri, 26 Jun 2026 13:03:58 +0100
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
Subject: Re: [PATCH 21/24] ASoC: codecs: cs47l90: Use guard() for mutex locks
Message-ID: <aj5qruNPuuhGRTMD@opensource.cirrus.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
 <20260626061329.23264-22-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626061329.23264-22-phucduc.bui@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|SJ0PR19MB4432:EE_
X-MS-Office365-Filtering-Correlation-Id: 17777604-01ba-4ff6-1700-08ded37b0272
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|61400799027|82310400026|11063799006|4143699003|56012099006|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	58yH2BV9y302kGLFbBrJxM/uk8luXeAGPJDt0gM+FTD3Ly+KrtojGJHsjvH/axf3Rg4kgH+izHhB7ro1RCrItZbx4Ik3j9GVFq+PB90qcHkUsn7rbOxoF6s0QrtIoz6+ckICkNKEiiz3QJw+XqfeGn9Hr7q2kbCJ91/hY8tz6xyHmASSvAD5NYYiwiMdYsRyQ8Spc954gBYXR9u/D6tQv1UT5twBPy6RAYsMPqtOyltk/XkIqM5gDhbCdUig1DlHkMWUUforLhubsee+Gk23srZu/u5gSR011tR3mieGRwYrLcIWcuT/sKfP7dnhSXVuqykbzo3m5rXBuc/aLVziJEKM5EjDpBdWU4ezsaOVY9VVvAZmAgSMVuUS1VeBtVirOszP3s7tFiZom/BkXDDbg4Li3vHYGtERqTTdksGInNT2ODtMzxFBD/536GekgdABgj04i3GtjUwyApMkqayGcSBXyBDTaVqHH6JDP2r4EwMUpAhgaKI5XfL0vna504ReBFP9sjzVlYkRKwhDcub4d0xuvf/hW0R34CbxNW3BSVdSXhsEDqU+uSirRVr9aSbrZbH5pk+VuH0QTZxRU/BwrqGK9sQ7WxM3i+ymcoNad6xKWQ16njuBbMkUjJsqYH4FdSemWodSDQQ+Rtz204lXYbc/2FVAJcrX1ftoKosezd69CxL3RnvKLrmZttbOZJKdy6VsP2YbZaAxMPLh6Scl6g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(61400799027)(82310400026)(11063799006)(4143699003)(56012099006)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gpKI4nqoIgq0YiD98HLVDvL9xj61zFAovQhxYMLpH3YCP81nyeSRi5YHjTOLkw/IbIQteYeopHHKXHU/ebPTjE9sr05SS1xZIQSVQ61BvAUcPdokpLmlFf+rSEPCVZQIIfOoV0yETUxMMXNGK1/PtinJKZgqs7BIURa8ElCH2ra8PIoh3fR5QSHP/1QOjWgf2H5tnwmbXxsc/dQq8iI9vk1WSwkB9yX+0CvHzJwYK/N9Gqm2EtHSKnedpsVLUYzAUMOQ4mIJxDvusd1jvkq69aTxrQB/Ly8+CUcEts1yImxTGyzDKcFNYKWQFRDR4nXFq30JdmbkGN/GvDgg3kWfbo7h7sGCt/1FntvfioPwQqCoZnUZkyZ43I5AHaASlaieh/nie7Z1+TF86V1QrCBbaw/D+P4qw2OdLgOAyW7hgVRnFGRY9d4oCuZYFz2Th4hz
X-Exchange-RoutingPolicyChecked:
	TpqK5RpA9s8ynCW5bjKgadsM7R0YsMuUWam0Z6eSqnS5ytkUHz5ZZbD+dXKPn1kcmOneO9fCa55C0V0zTSJMFZUSMZdZTDNZyQZ/R11BGtWExxvZK2BmeIxPGzXLy4RouEB0hQ1Im7hLcE3KD49qt1vNFhxvGkfoa7+NSUxMYpN2NYlA81SlYhWaaX5E80OGLIuUcj7HnwZb4gNQutg1URxaS36VirXWyLhZmaPqXC1uAbSJWfP/NNKsixRrXaGW8MBg6pkw7X09jya05447d9XFz3ajvPh4lrRxPgwRNz0o4kfv4xQi5WBxEAnMtnQUY4o7Mt5WoIbNAJEKaFmJiQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 12:04:00.6296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17777604-01ba-4ff6-1700-08ded37b0272
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4432
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5OCBTYWx0ZWRfX2Z5evKZyApK3
 o+APi9R40Rm3DrVMy/iDca1wCPCNx83qjmpaShfFVwKduqCEKZwpsBuuAHhrXc4eJThwzeTuIqc
 HoqvlkVyzZcd5St6ItkDmke6S2drz24=
X-Authority-Analysis: v=2.4 cv=foXsol4f c=1 sm=1 tr=0 ts=6a3e6ab6 cx=c_pps
 a=jSq2D0RH6kfjLa8OhrZnlw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=2LXkwXwYv1G787AwtbYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: -SnE2jGg6z_00XU9V3RNn1psHgQR7Q1H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5OCBTYWx0ZWRfXwbsrB7cMzDz0
 XLg5tDP8zy4q3Ztdizn/vvBIlI1SX0wzvJgwwjOXpccQfKzJ3sbdRsSBtuDPPDnQJCq5fQApqUz
 akoDj3v4pf+oFAUPZWjOhSz4C5JeeAoZIN7PK1zDX52kyktLgb6KFkUBbo6KEdEkc0e6fJkAz+h
 qRyQvsDEbpzNglDFroHHOg8sbmyF7yIbRflzZMSGihYG8DGXLzSUa2dQ5FZwgMEKmp+C4jQa1JT
 h/AOmdK4MO2GlKJTUiTKf8OYv4fkDdI/+hCjTQVmc3jgTc16uW35BXlr8WV+nG3z6J5TlO8bTHW
 4ywqacDSdkf4HaUdotwMiPTUK2fEAxcqZASKLEoGcB/4MDgOE6z6bVm/TMdIvGa7xJJKHYwxBeB
 L++RkZOszFRaNTnBHukHtH4Wy+0sEM5rdTN31UBLz3VPO7pNxZJfnp7Z8iPoy/gB1u4yUn7BKXr
 we0aDoEKzrvKBCjTApw==
X-Proofpoint-GUID: -SnE2jGg6z_00XU9V3RNn1psHgQR7Q1H
X-Proofpoint-Spam-Reason: safe

On Fri, Jun 26, 2026 at 01:13:26PM +0700, phucduc.bui@gmail.com wrote:
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
