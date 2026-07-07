Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D815325CC57;
	Tue,  7 Jul 2026 08:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413697; cv=fail; b=mqPogm82s76PryZTlHYxlwAyRWjL6FS/DZ5s61nSg+1dFNdf1/5Q6v+BkYwCUHSSGZ0T3DC+Q6PNEUcUk3VirKx0DNEv9EE9OqOcq6ebz+VeFAIF3gfrOvYL9pCfAQHDkyzpqe3S+g+xWZV/u9ffhyWr+cAYyhFojNLgFDBQoHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413697; c=relaxed/simple;
	bh=tuLf52gZz9qp36cUOtVANkXFxAt4uEf9Xyj5WkwCODA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qK9YAc/nwKjgU9T8yE9DBk7FPcG2ZLqPW1SQtVc1UTV7EkknH5kE/vyBYtJ1Bb5z/wm7Fg6ZeB0Is6JMOzZIuaYQkdyjLTkwd8YHTG2cROZCp2yYB68PL28oci508IGg0U9X3XZcJ+Ta1gf8j+693xfZiP92OPiJbey6/59Hd88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=VvGdiJ7v; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=yypeFBWx; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="VvGdiJ7v";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="yypeFBWx"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6674sfRE2515866;
	Tue, 7 Jul 2026 03:40:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=188Dkoe42cELY7rpjh
	rf4pS7l1oZFv5c29Si9pC1WjY=; b=VvGdiJ7vtrdMh1RtaBkMgc4J72Qf3rQwc/
	9i3RHRZKDQpK+UrXMA9Hg/j+npbcahrUEiCV/ZQH6PWx9dyadO1j7AJCdbHNxBOm
	ojIgIB1bglrNBuyZP9RdDHTLL9Gyqkx4czz3jZBrzTgaMWaVHTIV8VmcstFzcFPV
	dSpH24fVpFRtkWTOJeUQkkKAMsdiv3QmcBVbjucrQAyWebpQhSw9D/3kdheJ3NF8
	crdOkPOrYVejGrnZv8x/OkfV2V5P7kWP+rzb7QAqd2dQc+B7q/RRbC1XiCPwPgjL
	DyXvOeYNMO7di9g6bzH2YE+I7NzXN9FM8pidyuix1jrS3GXWs9WA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023130.outbound.protection.outlook.com [40.107.201.130])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f6yjxkt24-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 03:40:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZkAwyLdQV38+tL8m9fiHBaxQN8Q6mn2Bp0tAaAYNJMAjAorncJekIC/cJ3B8Pq3QloRPk4o4ZCv+WW85796HUKdsSPTnNXaSMh5ukBGspsZyvCZWyF4kd/aKv6gTOW/RjMKeaKulRALwLxLVULYHA1cJgh/2gFjXKvtyWSmB7p8I/oMjJhyRmwbPBnX5y7MjiYdSwnztI4MUxOdDfWwlpVlWXSz+Tc2CP18eEPXjGmd9drH0A3Ix+mzGVEzDGlhA1CMttZjXg4LmkI+sQqd8HPRtvh43QKVrzm5NRCuAG1liQViyDUiEM52YZssEXPfcNVTunD6cPlOjblDZomhJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=188Dkoe42cELY7rpjhrf4pS7l1oZFv5c29Si9pC1WjY=;
 b=hYhXqm62d3CaZT9H1QSlKHQLL6/meLI9M0iSw2++QmIBzfVQ5JDIFWHK0GLMzBsTdshTt+rGred7HwzsEm33f8T2SycbZriFv/zs80fZNX+Z3m8Ikby5knMZs+OCAE7N+kYD77cnhHTUbsoHIU3zLFc7mx8BRRTF5F0jgzdMkuSnBfffO3EmYbMfEy77jkOglSzAAqX+W02d/q8UvmPs4bUNssZpDKRSVBZ889HKmZ1z/f5ozUNPTbl/IrTm8ZNpFIYv3gb4ZyGXX91GPnBZhkMuC/966dILd5KcpridNS1jQlDYox+XroVCB9VclDBDEA2pohg7IY0N5NZXTmKIww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=188Dkoe42cELY7rpjhrf4pS7l1oZFv5c29Si9pC1WjY=;
 b=yypeFBWxHvLjWGITvPHozofYCZ3QHldCmqeqLfGrLoh5mKWDwVUzoSLtTUfAgRtrFwMFc9wHfGtxe126IVRIM13qoHNX4RbY8QgirCZaX7Pk2E+JAZs5oGD2bTIRTSWtJeMklzJnBs/7izGdjSid/M3u5Ih04F4dGLH/tEPYi7c=
Received: from PH7P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::25)
 by BLAPR19MB4371.namprd19.prod.outlook.com (2603:10b6:208:272::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Tue, 7 Jul
 2026 08:40:39 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:510:32a:cafe::74) by PH7P221CA0011.outlook.office365.com
 (2603:10b6:510:32a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 08:40:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F67.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Tue, 7 Jul 2026 08:40:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 17867406541;
	Tue,  7 Jul 2026 08:40:36 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EA4A2820244;
	Tue,  7 Jul 2026 08:40:35 +0000 (UTC)
Date: Tue, 7 Jul 2026 09:40:34 +0100
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
        chrome-platform@lists.linux.dev, asahi@lists.linux.dev,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v3 17/24] ASoC: codecs: cs43130: Use guard() for mutex
 locks
Message-ID: <aky7gmh/etqjPUjK@opensource.cirrus.com>
References: <20260707051006.20058-1-phucduc.bui@gmail.com>
 <20260707051006.20058-18-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707051006.20058-18-phucduc.bui@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|BLAPR19MB4371:EE_
X-MS-Office365-Filtering-Correlation-Id: 41fe9e19-7a1c-4f25-19a9-08dedc036b3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|32650700020|23010399003|7416014|82310400026|376014|36860700016|61400799027|18002099003|16102099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	s4DtBebwZwybBMqs3xUIjIlVOTC1D6wPYc/wTr+nHdY/Ii4+otffE+07tJYN1QumPdLQteENahiwumoI52cWwV21KAU/vjiiQiVja8EU4cYaY7c+VgK/N2b4EBA5fJJUTSqt55dafyURyfkTo7KP4g/3/ulWLe+2CVMqiQmYCxqlhW0Xzuj4C5D+6j4BfQEKbgxBnxQH6DLpfEA6L6Y/5GwjFvZK+hKdwzpqpsldAE8mb79wa5Cukc2UQoYJfvfQec6ZKuQq4Ss1NPRpaacgl6SnfuQZgJqHMoAZeWf97emTKMiqbO6L+y62h9ey3SVGgpeWBj4i32VrIhtntyjoPVURCPfUR9Drai37lt3bXVrFvyEUryrdBdrgrcMUxqpnmC+T65f8r/XPShstD5q4mx1VjWzXXOAJyCqy51PV6DwkfvNMG78xJXLsV3IGpsNJzHMK8kONG3ziGf7HmbQvwnU+/I3AjFkA98yZIYsgVxDw4E8O5m8I7kcfGT4eDb8gKgqD/o2qGv3VNYH2nX21lP9TtLvqNuWqQtIiiwip9P/MQSrwYbj+TPU6zGBQRh+iLU4PwKx7T6Xr/sSAI56nuc0PW01gQU/34/81nQsS4A7CIQ4i1CRC9hMu2IKNrtJMiCzyeWt6XfAzagREd/Jw3q8zPWdM3/VlEmbg24EockIYmfOZdz+8LYFAlaatvaw5VorD9xIba3IGuQdsjFJc4w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(32650700020)(23010399003)(7416014)(82310400026)(376014)(36860700016)(61400799027)(18002099003)(16102099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xgU5lAf/kMXneO+5DGEFW5ag6oRvX94dIaK3E1UQXfb3pdxIGIxcqalzbcLqVD4VoxCTJ+aIu9PiIdeQC8k4EQQZFNWxE0mUq+6z/UJLXJhbw05lhLMbQJGjF8T6/AkFP7tMJeQCdLchOcz1klC9UmLatAJgGLKbafGGmIme0fUvs4lZDEM491Dw8U5gOOmjHgf4KmnbMophsjXbtB+ROm8Yic5D4MScpWK3G2BahsfnMnFO+O/PCtAPrNlay0EoUNpMeIyDipU/3j5uQePHajUXE5R2EsEMYMqFmZFijeiNh/rHCbw0R0jqoKhT7GuxwXxlUQxhNYOuQDrgi1klJuRxflpKiiDKjoHOJmBLrpfqoXsVlSZYD+Za830h6d6ouT1cdMVcyJXx5ZhDmr6Ua00jSGFfVUPhtIV1Yq2sCZXriTzGOvgDQnIpEwy+NXQj
X-Exchange-RoutingPolicyChecked:
	nY5L8/Mho2kgtgmGVdspIqtch2Oz+EgcvIF5x1CYhBpgAqkpMrPjY4uUzZ7ViYNJee5MY1NulM98agvxGLJHcRbSWOjVPezTqzPh4RVFFhX3/znvfrK2UKZOG7E6+2oHsi1T1cDvBfeuaieRgtYLawG6V9d+ESTApHdXTvdlTd5h97tq0MWqyWjh3oUVBQUWwp0S+FbA20dRDzj6klSL5zgKkKwIbxMz+EUQVNz3bOqzZI+6W4qrVfVtXnT5lRrBvyB3XgoBRKDSmfTLi+EbO6xTHv8o7BFJTLYr71maQii0ATTVOlNwp6WhNWaKZPYeJJQBVLd2BI0ZmJgF6TCkxA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 08:40:37.2813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41fe9e19-7a1c-4f25-19a9-08dedc036b3d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4371
X-Authority-Analysis: v=2.4 cv=Fo81OWrq c=1 sm=1 tr=0 ts=6a4cbb8a cx=c_pps
 a=nEDKMBs7eiJgagyIvhaA9g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=M_gLKefM_e-GH5BkgUMA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4MyBTYWx0ZWRfXxUKhSEE2R3zl
 z0apeiuQSFIlFaccwkPqhjzGPQWSEMiHG6vDyXd8GBxmIeC1PeBMhz2HQ/hkPVPFHoDQ9STXFSr
 IBobb00IookmXkfTUykc5+TAHClq6QI=
X-Proofpoint-GUID: 81GNoniRofXfi1bzog0_Kt78smGwm22Z
X-Proofpoint-ORIG-GUID: 81GNoniRofXfi1bzog0_Kt78smGwm22Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4MyBTYWx0ZWRfX8f+tlJpflSQg
 5dgx4aWDIyss3Mt0rWzb7zBB+KhKVd7n0B+UQayBtIAf/+GncwBoaNMOAturaAzEqf+Kp/nn4s5
 RjYrg0jKfNzS5xvkBimSYUUKFCHmIDB0OAaumjQiTeaMdoqBSoWXjjNWMf+vNxN5dtGU/QbXXYh
 w2BQtzIIdYvgkRM2GjvujWg7oMWe2lc7z9zwAn1crHoxRar+hD2d8rNlQPYiow9qtIhsNdiO7Dt
 SSJl1ZrBrGjPJV/G8/QG+Y87frbjcZAPuKh3/YmVQBFKKn5YiHEnMZ+KurcMgP9BoenIZU8xJ1R
 KUWlAp0SghYaKM1LuObVwaCbZMBqdJ3mE5M5BKSMLjOYeJzXyWeW1XcqIkKN9fCLQjf4SL7oi3w
 hRbI8JujXRqAEEUXQG6/ZA4OH3d/vlub9pwS/+QUxLMfAx46ErKB70HHqhXpYQuS0L8K7ISHJFO
 /0yoqKR9vA4mLVULQOg==
X-Proofpoint-Spam-Reason: safe

On Tue, Jul 07, 2026 at 12:09:59PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
> 
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
