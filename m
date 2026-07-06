Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518FD3EB0FE;
	Mon,  6 Jul 2026 08:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328222; cv=fail; b=JN43BXNGhaT2MguJnouhR/ti5CDp+KYDgOULD7n8gjinpuXUj8BWbJwPd5EhgFcsyD7W4BTOPxzfwz2wklzHqFFjI5wEGZqjdnbWDSZYX2ivCZ5e6R3hjC+9d31YM7DKLBw61sXsB6DpOJeZ+Z8ZKRsY8Z7RiotP7dznZlB13r8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328222; c=relaxed/simple;
	bh=mp0BMS20HhDW1mBirFJBlBRpjbuLh7tJvAHj/2ugMX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMt6lDFXm5OpUaphIvMskDvlfTOqv8OakuBUNNFEA9IJxQCoGmqYpBjk79M0PZTsW42KOGK21OSLQJbeToxKWoQ56CX9MOr+XtwSOIwg8b75go2yAYo+jAHznHTw3oyJ6zBdlgO9RovWskJ4ypu4N6v6deccfymJnpXqrUB4fgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=be2iH5Tm; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ciSPj7gW; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="be2iH5Tm";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ciSPj7gW"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6663dKAc039937;
	Mon, 6 Jul 2026 03:56:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=2sO5GSe2hjnixD9CHZcZ9tdsZpT0zRXJ2/X3WdxmeeY=; b=
	be2iH5TmGwO7qtAFFVy57FEz3yauPjpd9+n7ZahJX1nr4x5g8jTnrCqQVqk0anVs
	r2PmXfXpjAmWcLZ5Sk+TfCKzv7etT4vWNYo+0xnW/Anid1vEdc9Z2Nol31qM/e6F
	UjntDG4/HrL4QufJMSpFzHAtBzbwO49xShVsWw3/4B8pDiwq+rsLflU/dtPu9naJ
	w6O6bMWNv7xWcVYY6ZjJWdVTjCvP+768Ha+pBsYqREXd0eA5sfiPkSox0R6nbl0N
	yN+U8XbK0odcLOCoidEbVDQe7ATkicKdPM72/tL43QIKwLWdM0LMnyEEh8cCytPw
	DfTBWDgOlV1S+xytKUi6Tw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020119.outbound.protection.outlook.com [52.101.46.119])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f6yjxj1ga-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 03:56:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9kh2RvsQZE/5Ze1G7au6SeOUwJpKMiztPRT/5vwJM9o7C1WG5zbu7RR6j+o65XIzjklqgNx9C04YfjirILNsyM92Q4Zn2dGNT9cF3P86DsCEYcVMYtPVmkpB8iSsb2Uc5x2Ib+H5OMF7jstWox9RtHzAxU0WB4o3DnavsgCpA+pFEK1qqnVEgXtPMX28NU3eaigPzhxlFSgIuKqyx8c0bwWYR/i2U5pfLa6DBtMR02NLZL/og9wiZD4peyISbHvzj60NwMNR8QdSIoFS/RWYxqQhb20sjMVVff0S/JjLWMiHC4UMT8AKBVtWQBtPJF8sS4vmNeIVAX/k2cXGiyUUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sO5GSe2hjnixD9CHZcZ9tdsZpT0zRXJ2/X3WdxmeeY=;
 b=tgK/3KvinxxiLz6HxSsYpXpE3H2POzxu9jWvt+zxz1/XKMqrEAmwbXC83thN0arFmwfmLps1bHwtabNMKnLYwPc7Gq/bbUbVMRXNh98oD0XBPx844mXfYygs2Q7bl0U124d88Y6VpckdoiMA0ztV21m27lmSIYbvM2O0RXTtHiG0gxJoh7rHisze1pm/nabcspy7/Wgb+xp6M/vEGpM2T10vOEdAzsXTAkadCqSSWT7V42UApDvQSYODhWbzJmccdhHFRmLbQBNN2g8Dk3e/qXLSdrLERxPCfrH5reQN/5Ek32AjllMxgswLV47cbE3u+RleN5XyBBYdzAme/lPDAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=chromium.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sO5GSe2hjnixD9CHZcZ9tdsZpT0zRXJ2/X3WdxmeeY=;
 b=ciSPj7gWezJxiF/anNkZWW4AjCR+b63JrVQ9KuK0KU1tCeUcah+ggZP8r8w1g5uE1cVV3e7lroP4MH8stK7R2DUuKbxD+pzPZV2Jfd/+xaCVYC5KUtXXsnswu9nPfho/u/aTCTEMtJXOIrvTTAnN2dzVUjGK+gJD9CWUp2oAlRA=
Received: from CH0PR04CA0011.namprd04.prod.outlook.com (2603:10b6:610:76::16)
 by CH8PR19MB9143.namprd19.prod.outlook.com (2603:10b6:610:26b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 08:56:24 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::24) by CH0PR04CA0011.outlook.office365.com
 (2603:10b6:610:76::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 08:56:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Mon, 6 Jul 2026 08:56:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 390AF406541;
	Mon,  6 Jul 2026 08:56:22 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 216A8820244;
	Mon,  6 Jul 2026 08:56:22 +0000 (UTC)
Date: Mon, 6 Jul 2026 09:56:21 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
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
Subject: Re: [PATCH 15/24] ASoC: codecs: cs42l43: Use guard() and PM runtime
 scope helpers
Message-ID: <aktttSJJchwnslLR@opensource.cirrus.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
 <20260626061329.23264-16-phucduc.bui@gmail.com>
 <aj5a7pgaDoN30Gs5@opensource.cirrus.com>
 <CAABR9nG9jDfK_wqS4Akfz5GL6HvZ-RkpPuYx4Q=vMn5jH_0foA@mail.gmail.com>
 <CAABR9nE1GAPaOF8jx1C925POe9AbgkPs-ZRSn9hiTEz-_mvwTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAABR9nE1GAPaOF8jx1C925POe9AbgkPs-ZRSn9hiTEz-_mvwTA@mail.gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|CH8PR19MB9143:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f17c657-1fe7-45c2-256d-08dedb3c74ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|82310400026|376014|7416014|36860700016|22082099003|18002099003|16102099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	+icy7VYDJNtb5RgiGKnUrC9+9KDA+M+v7FopXkMkX/8mZTxdHMnAZcBiT3r+05AoLeOaFwt7LsVOQ5KOVYFcE9sTDiRw3y+BJkA2/Vl/XFUnMCKSg62VOnLsvvB3UgEveSobdeyH5IdwtPDsCsRVkQhEhZJBLj2NfE2B5jmB+wNtvKnWDmXSuKSezIDEB9RI1SGzjg09mj59gOYF9tycOVxHHpl/SQrpn9tFjvo6k654FTXKR0YYHnU5F3KEan+fvoG8tnqUier1w6pY7dXS7OJe7x05SSQlE1T9E/yLjmxHgVuDlPZtCynRbYVzoikXnw/YLOEaF+cm99Yp9Tlk+sfFyc/sSkEFnum2fP9P2bNe7+igOuVYeK9E8g3js2N/48y+BHIvmm7ZFA2lAJLUzhbHuxAYcnk9Ck/grc+K6yb6+P3HHZ/HSh6Tyxy+MA9RRUiReIi9B/PRi9DKMWf2ugJKo2h40kJSxdASN4/0BjfeA4wsP/VVvZwbbm7nc2lrwfoMqEh2JwHO1iDvEyl/w70smGBxHaOsMnVQ0mnZWRpbVUhSQtnXZauDDo9xjl/RS6cxxV4UNBe6/QC65Kx/Q54MQ0Xo4adCUfgm5LWWCAfW94CzorkvQmXtz+lzwpzzlWJ1W7w8jb3Rlx7VSmUm/uk+xBrShDqOQJ1gnCJq+KMo86Jd9GW//VdSoeHRb5dyUzCF81v4nfFtbB2cc/CtjA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(82310400026)(376014)(7416014)(36860700016)(22082099003)(18002099003)(16102099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JAD/p+Ib5qlo/r+0PUzPJbFKQdS1VUCY49GkikxGwI6Gu+/rd9onHvr4FQFZTixY1TodV2EgxewCeOBfukCzR/Co0zAtnqH6yyyLnHeeh+F4rwPVq3rN6K/2UVLap5QK4VYLe9lveGeoV3TFNUp4nfeWJF5zn/FLLmfyCkIPW6hBK/H6WgIqykAYmxyx+ohoQpjjJZXO6cTIpMtBdzgtLnLYQxevCxa6VBjxvlVz7NhEm3JOacuYuxmIwTfCFBYHOqYh7lAoPJzcgUlRGeu1CanD37wfP2z+jJXITLrfJyU9LYxsbiFRWqjnbb8r0PB/BZqM+eKYMRamsnSwbOeKG+YiEXtQfo/lYu+JfmCQrf/1oaZXbgw+fLUtTBlZ5guyk99vfPIwMYEqCepNMJ0CEeSVXIBok70ydJoWnwY/CJHpvwa+UFAuCZJpOSH4fz/b
X-Exchange-RoutingPolicyChecked:
	BVzB+m1//xaX54CZTXhwYKJn6+p7XFxLE1S49cY7ZKNrb9jj8AOYcNpw77WxSnX2tDcuAyGA+Jvb2L0ewIg4CpZTTXMp7FXBFXvA8Q8wYgf1c6WpD/MO0uGk87G20hsPcLrL0MBo5qA2nF69PH+mz7P4hmuPG7lbZmKjKJwLlDQbhOoQfV+FCl4SL0rrEm+idsL6ZroXjNB9isjpY0yVNxJfH1qEYI4eXYH+DvfaJ68IR99gjB018Bcjd5GpmsKqaq/Ad4KUGULrzgCYo/3dV11u8WnguSyslD4HyX8hgj4bCzekPNAydb71mTWNImA0daOBxawNavfnTimBU6rs8A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 08:56:23.5023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f17c657-1fe7-45c2-256d-08dedb3c74ce
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR19MB9143
X-Authority-Analysis: v=2.4 cv=Fo81OWrq c=1 sm=1 tr=0 ts=6a4b6dbb cx=c_pps
 a=dV5UnTNaioTBtvBhj0ZdMg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=1zdhAJUpVw44TqpUR9gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX2dBdu+Ci8gDJ
 +Bk9Y8t1yPQJnrG7pFTjQLU2sjWXLKZ1eq8/VbkiGQzStM9i5FiDhlPlzKBXdn1yBsjtkAhCIfZ
 9MEsUYqf4FGM+KJe4f1dz2sGKXkVQQk=
X-Proofpoint-GUID: T6FAAIhAqqD6bvXcuPCfDbgNAP8VyBH-
X-Proofpoint-ORIG-GUID: T6FAAIhAqqD6bvXcuPCfDbgNAP8VyBH-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX/QyQcxJ02NDv
 xFzb4JD3l0Kf8gNfCq5+GYktSgF6G3GNZZZnE9HdDCX0v7Jp35FadXoLe5TX15lBDXRymB7122o
 Spiz3wamaRA8PyuDYdIl94bDUBLvYaEbZ/unB/aC9HlcPeC8GeJkdiUEVxRuC4aqiIHuaHhZ2ZR
 ZrwxS+liSB5R1sy6NPDQ1p/RhFoD7U5F7NrZRK2hJRf5pJCX2yd3NmwBy76324+t4Bhbd/AzZCN
 wVrbMvT73SYiYrMWN/JJ98Cil95Ny4JqMsP1VBSfcz+HKXtdfAMvAwYtipwp95vytfJVpkY1DbG
 PsNBZz5GT712lVgg0YjAF1H6xOtFZM4xoyzBgbTiILUNGhlOYS9YSOyKnTbJbaZRYawXkaABuPi
 MAOcZnDYIrycN7tNhTZsobNehUrw7qw0b8cznr1OqAKwrGT5q2M4ksMA01hsXlB+Y603GX1uFeu
 e0+dflEIowTpdXiwylw==
X-Proofpoint-Spam-Reason: safe

On Sat, Jun 27, 2026 at 04:50:31PM +0700, Bui Duc Phuc wrote:
> On Fri, Jun 26, 2026 at 7:57 PM Bui Duc Phuc <phucduc.bui@gmail.com> wrote:
> I'll factor the duplicated code into a helper and use it from both
> paths in v2, for example:
> 
> static void cs42l43_apply_accdet_config(struct cs42l43_codec *priv,
>                     unsigned int autocontrol, unsigned int pdncntl)
> {
>     struct cs42l43 *cs42l43 = priv->core;
> 
>     regmap_update_bits(cs42l43->regmap,
> CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
>                CS42L43_JACKDET_MODE_MASK |
> CS42L43_S0_AUTO_ADCMUTE_DISABLE_MASK |
>                CS42L43_HSBIAS_SENSE_TRIP_MASK, autocontrol);
>     regmap_update_bits(cs42l43->regmap, CS42L43_PDNCNTL,
>                CS42L43_RING_SENSE_EN_MASK, pdncntl);
> 
>     dev_dbg(priv->dev, "Successfully configured accessory detect\n");
> }
> 
> Then both paths can simply call cs42l43_apply_accdet_config(),
> avoiding the duplicated code.
> Does that address your concern?

Yeah I guess that is probably the best way to go.

Thanks,
Charles
