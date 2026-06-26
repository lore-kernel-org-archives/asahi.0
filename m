Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC343E8357;
	Fri, 26 Jun 2026 10:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782470426; cv=fail; b=IXil2jL4wQCrSlU8yIwuNorIByD2oPR4lT1821Jcdf24siori4XX7i5fbXh0c6iWqJdRKeM8nQFvTx7K+bjAcIGP877c5cSXvsIFZI6rTNWvwLr/mDv3YtGplfTzM/rmCDSjey1mRtF7lE9QpbREpH9JcC0dlbZw5tIxdFUyi6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782470426; c=relaxed/simple;
	bh=vdVOn/YtSNWEZE4V6Z72rET5q4yu6tIKaRwm787eB4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWPwomaNomwfoaIxqaHininSXIH0Pxlgrp/nrL66nlHmHjAKAl2kjLprE5X7arMl1ZhaOdwQZHVDUVCC5KdxbXXIDca8FZAIuHBzpKJH4jGudQQ13xJLjbMZ4kcdQ5BL0z4MEk+uNwiHC7zbxFsQHMVCbM6JVJqHs3hANicU2S4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=O3Wj791I; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Ln4LNeJS; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="O3Wj791I";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Ln4LNeJS"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q5dELk121177;
	Fri, 26 Jun 2026 05:40:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=bRTMbhyHU96kb/WODV
	18YvBrJeZemIEpq5HObdjTBFM=; b=O3Wj791IPBII7TR2XITiAsIAosqa8KM0P2
	N4OCcsDn9oRAnlijPuL9kVUUMhXYyfAUZgGdRSBRWZp+YJ8uFl+1lgfvo4fDQF2W
	GezCEdfgpvo85LmCC7TJ5xd2z4SeVkfmTlLgGjWVcA+odXN7Sz1tA3WBpB1XR4mo
	PqKOMmn6sdZa7mdEUlDJ4+hu2Sskx4Cnb9x3I4qoVJlJNNHALYNAEm2/uCkq+AJt
	7KJjFEOQzmGlcNMh+rLVZ9rBpYr++IxPRe86NwW4KJfLpH+vhzYz/ISB56Vq4OcJ
	WgUgMjFb+phV70tBDDVAKT9TlokorJu24eqAUcLTzYQ6hyF2WO6Q==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020072.outbound.protection.outlook.com [52.101.193.72])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f17gus5rk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 05:40:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwP1lRk+ueNjtFmLiQzV41QgasvozXUsLmb2w0AbISRKdSlipx4sB2lqXwIXb+a+syqMcjCgmU2WtQVqUTnQzAnUlsODvQUGyXPNCyNNY0RjnMzeUi4ojURhIIdUf+PGeU10vXAJ3Zg2Js0+U3p6TzKXh+UJGlu1BJNBWnbJsMTKSDmO9u5uoV3IsnWrn2jgHCDONCkFKKZxxxSkEmtz64NuLxs6mVUO+PwI8pzz/rwdqpRp5FwgQYSxi8FkgFP9oiEDh7FUaPtRmdLR1wG5q7rPTMvUrmurn8J+kT8lpBsCBUvxoum/pTqt6XbQHVMaPWnt52Cn47+WI1YQ9Fhbhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRTMbhyHU96kb/WODV18YvBrJeZemIEpq5HObdjTBFM=;
 b=bowNKzEcXrmR4QGxzQoJu/HXEsuCJu758Z2pHfyfYa1TMwo+vyIxmu8S6arK8UjWfoKTkc27bdTwHxRW5fqD3dvDX1/qBCCdHp5HIsz2VuqYcod2q6KLymz/irh0zEGheMtSOH/8raYjR0Fwl11U4Orw66axdLnMhTe3+299EueKMpwog3YtSmUJ2VRETcPlO1Ka3PharACoWjQZV8t2au19+GzszshE4JND0uHHdxA60HvumhkOiuV47bS8IV4ZoRiLfIOTpBn3AJW+y2vyvQZD9vSKfAuZr6lLT10RkgjihL6A09mTlqWm/cQm7g8XDYFHz6ZkQZi59rn+2UQv3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=chromium.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRTMbhyHU96kb/WODV18YvBrJeZemIEpq5HObdjTBFM=;
 b=Ln4LNeJSE6osRQmEesH9JVHL3grQVXRUTubEjRHG52HNNEPj9+kiRdqeTZwqZxXUo4v/H5kL0/W0R5gMmzx8cv6dmnYXDkTbWR48gY6T3oxXQQz19jofc3keWo0j6HeULepuHYYQR63nkk2O7/ejv7mE3y44zq/uaay6Pky7pNY=
Received: from SJ0PR03CA0272.namprd03.prod.outlook.com (2603:10b6:a03:39e::7)
 by DM3PPF8D042BE67.namprd19.prod.outlook.com (2603:10b6:f:fc00::743) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Fri, 26 Jun
 2026 10:40:12 +0000
Received: from CO1PEPF00012E81.namprd03.prod.outlook.com
 (2603:10b6:a03:39e:cafe::98) by SJ0PR03CA0272.outlook.office365.com
 (2603:10b6:a03:39e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 10:40:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF00012E81.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Fri, 26 Jun 2026 10:40:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DBA15406541;
	Fri, 26 Jun 2026 10:40:09 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D100982254D;
	Fri, 26 Jun 2026 10:40:09 +0000 (UTC)
Date: Fri, 26 Jun 2026 11:40:08 +0100
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
Subject: Re: [PATCH 04/24] ASoC: codecs: arizona: Use guard() for mutex locks
Message-ID: <aj5XCKAhWC7tUuBe@opensource.cirrus.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
 <20260626061329.23264-5-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626061329.23264-5-phucduc.bui@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E81:EE_|DM3PPF8D042BE67:EE_
X-MS-Office365-Filtering-Correlation-Id: b9f970e0-31f6-4bc9-0373-08ded36f4cc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|7416014|61400799027|18002099003|22082099003|16102099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	6oanz6SJjHOerZFF+J2HmDr3Llpmfnbv3784CaGloY5G2w3a6lhNMXFxxWAmGv2B/LjEb2sij8nm+ROyhrWBGrVuJ1I/s6Ik7050fkPLC3hAq8xGizcTP4ETkR1vBBhfO7nz0GlRWiVJUe3B6bUgsvd1Dxd6ljUUZmzDN8K/Lmjvim8FFN5D3XwghsiawtjjQWFhAOWtHfAK7GgjYBXHX15Kqp9y9CAcIGHd2q2Lpkfl9xHkqrKhlJeRQMqmWdOpCRDYNIg/kYhUflh1/YiXjmyOV+CQE9s1Oqso1ScTw+8QKrtkuzRi5usREz+9fxVvBUXTQKJySkXnl2+orUNem2A8axQUEcXDU9CTbAM3vg1Vi5ZnmibnLdbc4qQOzDa/9izfU8KU5SlKwoiKjitTmVPJUPbqdmsQLD0TZ4v4cePkQ6iygiDa0NyzWMq3Zb7drYaptST0p5HXg/HSxTTj3UkMzVPp1zcb69k+XL0wnlHTi1H8COtIkOczRVqtVS3hYz9F0Avu/JsXIXfF9UkSunyimj21ktanz1/AmtN+rrsBuH2ypR36jv77jQ5u4D1HlKLvOJq2Rt/t5o7jkc9E02sAY4SeJ2tW78oeT7tgwzctiAsyF8zdOzZaGZeJUTDkK08IkLiwlH8wqR8+VpsgERY56sgqn2dBocb6VuXU+aVMiCzYExfdnnY+fpwTSKO2YlqWlYwjX5WsFGJ7l0I3sQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(7416014)(61400799027)(18002099003)(22082099003)(16102099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NUmBozDLbNAkmIc+t46rJLhMqQQtPlmEPXDeybsgAf+mTG1eqKERfWg9KSNBxUF3ou8STA+IU828gmLxwifUbOP12T+cPmmMnAqQ6TpweccVzJpPOcZd/wSq26ZUkQDfTAOYbWRm9XLw7WSuE+aP2VDlXdYInY4t8VH0DodJhUX1NrxumJnKqOR6aNzksqNQBY0VjAmwydX/GAHMhDS6EPdslDrxWJlQ2cXuwH5pulSwPI49omQqxYX9/+fzq4zU3HEzzZaCbEVG1pcT6PKxE3M2jEBgbZ14p24iHkeZ++QeIalXVT5jFdN/8UBbQpe31DCWWoqTsDbwYeXvMItgSR3FNf2w02lvIp19/JPlGTDxpMi+y8NdLlAtpJA6jDRlDaq5cFU0zIwEaMAyjXnn3nFKgVjD9kvviGYmN53LUMYLX1aPh5hjSbtZXm1bLagP
X-Exchange-RoutingPolicyChecked:
	Z4khepJOavojprEJd1/tGfDw6lHkAXP7/R5xdAsk/zjfbXb1oTCO0F8AVny8KgaKkJW8v3NaYC3HKz5ekbu7sPumRIlgVanfVdm2uXSSm3ruzj39jgzE2duRF7lpC/kupjJz4VsLyBxsmrb9E3BwB6+n4VGgy9fbCac3iAxl3S35+DLqk7EDKmt0VYNaw6FRKDigaj94osj55IyJHMwUOuqCsZJ8bW1lvtG9cqhUwbOWohUVwS50ZEFAXi4sM5lNAchXqXgzJ/x5A/3THAoXqXQbnA0WbcPltFJiYz6PZjegLkkWCfNCK5VQ/BQDkrLYMOvcSfLJLbC+Pv50moXNpA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 10:40:11.2665
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f970e0-31f6-4bc9-0373-08ded36f4cc4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E81.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF8D042BE67
X-Authority-Analysis: v=2.4 cv=ZbEt8MVA c=1 sm=1 tr=0 ts=6a3e5710 cx=c_pps
 a=Zdr5CJPvojCt9J1NFubJrA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=2LXkwXwYv1G787AwtbYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 7yaNQr-5uRhiVevozaSqnGK4pojxL1P0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA4NiBTYWx0ZWRfX5AGigw35C6+o
 ACckTd6R/lOmXYsSge2O2uVrhQRgmi5rosTwM6bzWDv1hgj8lDsSySAPMBmfxip4ogXKhZaBh4l
 eEZkuN9XLY54WMqzB2ZhLtyikKgOsOU=
X-Proofpoint-ORIG-GUID: 7yaNQr-5uRhiVevozaSqnGK4pojxL1P0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA4NiBTYWx0ZWRfX5AmDUEQncKU7
 hT4zJoYjzRTNJ9bnO+L0/V72SaUM49V1OQ2M035pcMEIUPqNTqD9C7y7z87X76phI2U9SvP3Ng2
 Y9o5w16QVxjXIvqNO8pqyhV2SnOdYOUy3CmXMJ7TJm/pmUlg/ntaALj4fqQ5f/1Ls1KuK8rniCo
 /XqeboJNU7Nh6snWPldO9MbruBO4N/3211O9yRMFrjBRdhO3fr3+fhVfYVv9px9DVIyXDy50qYN
 o+xB6KMY3vldowTxIHzWgwa97NGijysQE7Lks3C7zX3dOfXfQK4e9NUqom1gSVEpDMa6zWk4+WZ
 WI82Ek08PUwRsgD4ta9UT+DudeXjNAwzcq8CE0CrKrqmmlvoVbENMzMzjxNDvMDG1ERrYiz9ty5
 4hQTb0BEDKS2+AD/ZoPpeOTfL/eDgWDOsyUr15WAKFd/GV67RWkCjy+hZqmuVE/d//1kOdY4kh2
 fZcgmdVXN1zsx6HWgCw==
X-Proofpoint-Spam-Reason: safe

On Fri, Jun 26, 2026 at 01:13:09PM +0700, phucduc.bui@gmail.com wrote:
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
