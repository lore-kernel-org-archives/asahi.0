Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF6F41F7EF;
	Mon,  6 Jul 2026 13:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344089; cv=fail; b=RqNEumigHTJJDi5XYpE5Bi4EkCG+w7Th/nPDkJhQlOxKa9LBaoXLaFmYhYmNOpBNMHJP9ydvxWfYGYw5ETxUWwpRjrxY0jTN8hJdPgtxGgoSgbzbp8BmlSfOjbI+5I3ou9uZwm/uZBWblIRatPJ8KOs2EYaLe/ts63hNjyI7xK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344089; c=relaxed/simple;
	bh=zcY5lZYUhXVGCvEoul9FLLuPjA9PW+aZMzbi0eFhQHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWr/rbh9HMB/0cNDMF5VKYahoogupkU9kKl/0PpMsNZrR/kuYu4WHI4KpDmh25dNr8S7lX0aGE+ithq11ESINRixQ3I7wU3ugAMl1tgGQxtJ+Hh2On+68u5Q8p4c7mqA65radoRg5k2nBY2P4nmzflQfFJ8ZwdV4+G2AvdHRqdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=UC6l5OCW; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=OZB9kQsT; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="UC6l5OCW";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="OZB9kQsT"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6663dKP6039937;
	Mon, 6 Jul 2026 08:20:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=o3PBosJBdWsry6QJse
	ttt4Z9CIRTfWSfnSj1cUQBzJs=; b=UC6l5OCWvoRJ8S5RwlNMSbfKa35IuB03nu
	SXXCTdUk3x2zpg6qnL/T23FTM/QQfJ7Oed1NBDQ1WZy5SMc21xOrhrq0ARNN3Yzg
	juBQwSpbnyxktXNCGPNpszjJS0CFEsQEDZzzOaUT/ubJFbHBjO5VnDSfuWouzZfz
	GwSbgWKgwcwLTradGSU3slgvm6L9rC3EFaOH6BQnnOTf/KxMpkv3sQZb2yXOZ5IT
	mJh0bCB1S0xsvZJxNhq7Kcg/167hjQ7UslTxEL6YkmIA8xvB7RR/5NJHmGCphDzD
	FK7FROXTwV2ASbfPhx0sBsaT1ZBh4/3YKDNuSeNNerw59ZGd9btw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022121.outbound.protection.outlook.com [52.101.43.121])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f6yjxjbya-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 08:20:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MsSBX9ket6zRnjkTX+/Gjo0Eqnev3xRhTkbYQ1BtNCLjLmoBexVu1jM//RaciOH7aatdFiHj1p9frCVcr3oCvA/6nSlqwPLMCKrL85KMRXHnYIp/hPz6UWU3xToyCcLib2XQf28REd4OxOUZqMfcUoSJSe1mH/4ZnvHNGrFi+OGJ3gTx7x4+AFN4CObo9dhkd8VmDu1dtnKeiWcPPSDUiNImbQqIjDSiIm1bZ9CJHbcDQ9CxG2pClgH5LLk/nsCf7l0LC3gG7RF0bAPmQG67lkJdv5Tc8hfMNnwHAR/hb8rfMmtJcSqQGvOAGegQ15iF40f6j1gWazl9Kz4JkZG1aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3PBosJBdWsry6QJsettt4Z9CIRTfWSfnSj1cUQBzJs=;
 b=GfIGob68FsA/PbH9SrBC7zIwEFuCMel9y9G9M2ZG7v74HcMwepot5VbVkyXNtnT4w5ApfLkA+kF65VKti4HIx+HsNDGv6EfOvBwN1mQUCls7F4kcddOku2zPmwYxTNuGF+dIf8ACE37/m6GCACbTsCWpRRPkKkQ5nSCicgwaTFvgPjlJ6MbaTqfASdBRieQy4cCWpCn6at5ik3IP6A4DCmRLfK4uyH0DmMnJ2/DHXib9D3HbPL2b1btGxkixL/B2qs+NY9q0dRflguMOXSaQ4lIJpg7AWLXcb8n8LgFaZCtE/ie2baSc2KHseEBRdJ0aHEdH9xiS8guW4QWRmky3Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3PBosJBdWsry6QJsettt4Z9CIRTfWSfnSj1cUQBzJs=;
 b=OZB9kQsTcgvziPTycsAUHYRRbYoWakUz8aEAOsRsy/Zs7NJ7O40bagzU3jgTZgxkPQUdcOyCriwj7SipEBkj6NszebF8UrLoSxFgkgeJYbjoRYKZ0Fr6tCEi6nZVhVJBtDn+RLAO5Zs4UR9lCXyHgHjkflEEqCtR6Q2QW0SJqMM=
Received: from BN1PR14CA0029.namprd14.prod.outlook.com (2603:10b6:408:e3::34)
 by CH2PR19MB3893.namprd19.prod.outlook.com (2603:10b6:610:a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 13:20:45 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:408:e3:cafe::2a) by BN1PR14CA0029.outlook.office365.com
 (2603:10b6:408:e3::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 13:20:45 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.0
 via Frontend Transport; Mon, 6 Jul 2026 13:20:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 98F99406541;
	Mon,  6 Jul 2026 13:20:43 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7DE24820244;
	Mon,  6 Jul 2026 13:20:43 +0000 (UTC)
Date: Mon, 6 Jul 2026 14:20:42 +0100
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
        chrome-platform@lists.linux.dev, asahi@lists.linux.dev
Subject: Re: [PATCH v2 17/24] ASoC: codecs: cs43130: Use guard() for mutex
 locks
Message-ID: <akurqrft0C/axwzt@opensource.cirrus.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
 <20260703055355.244898-18-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703055355.244898-18-phucduc.bui@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|CH2PR19MB3893:EE_
X-MS-Office365-Filtering-Correlation-Id: ca42c075-311c-43cf-f4a7-08dedb6162ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|32650700020|23010399003|61400799027|82310400026|376014|7416014|36860700016|56012099006|4143699003|11063799006|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	CgY5Q3TzIGYDZGWHKTy8pL6ewi73SJHMNsZHrqk1ahA9Ire82f8yW+T3J+xqg5BiOjNzzGh2SMKSMpL00Cv5O9OqYr2Pq9dsPgK7zlVOKV6nlSMNtfbSKQzGRvT3PrFeaZ8+stJvyPwyupCX1Py2arubK94HMzKSTdYL+Hc+8OCvNlGBBxBtDRor+5C4vJZucV3QTdpetykhPZ1NpQZZ8A9z6FrRQIG2F4572WmJwH41NDa1yE8fJc7f3AdwPXua48kRKSxdDEyazEzO86gUr2/qcev2FYfOlQDLqb56c7WUhyaGn8f88YBuJmG/8MZp8yDF+KSQ8N3g4pM8jtyBajNZot5iHdJE6P3o2FN6jyugUneL5sGZrxaGMDSjKEseN8m1ANS2Lo7aez4c0gALcdtZCnRz2KvOaEAQ9YROZB5f3FqQsHXuoKHenIGpBoOY5tVTVD40EIWSyeSro+cYH/hGrVu3rzPrIs2Okv3K2X4W0BO7GJP4usQ2IpbqUqqj7Vs8J1kkaJU4zz3UzX78NozafIIHazjxgTvjGD7SlnQwuuePL0SKrW5lIwc9Dz9eZSPyZKvL6PiTbIob/k8h1+cP+BnPaH9t0csg33Iz1NFuslz9N0t1LtW9Z8j2N8t+Pt3qxL5trEXL6GT1OzhBrTCPDiUvkkE416zptmrzC8Q=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(32650700020)(23010399003)(61400799027)(82310400026)(376014)(7416014)(36860700016)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CGwSPYIVeNJK0vAcheoaLsQiv9eBT/T2iK6SExJ/+g3W8eqi4N0IjTvXstuhLCKL9H7cud3iGVV3iKDy65vWAS+nXf9XBTmCafnAX5+8bxk+WWlsEfbavizjy127DgtBtY+AB4Y2M1is0aZQS2rcqAYRgzUfJkxQWkXQL0eb2gV7ruOeQOPOLA9nGfgjhX8ifUqjPCkXkmLuqz4sGagZM5KnESdRQ7jiAFlmBAa0qd+h2LCJskDLWebAvAEDGvLnn2G/H/dGEfQg7Ki5m5scOdI02Kxr3T2idjqrYil++6mtpU9leH1EKqXTJB1YUMMzQcLlMp4AoPpyr+kbSI3imD9HLc18mbVgRIPnl2eBgz0M8m6w5EmrcVFdE41HmXtaU//7f94kJf5GT8DEMhP94moZ+hNWtqwbSewUAVFfnDCiuUEjb2YMczItcnmKf8Rc
X-Exchange-RoutingPolicyChecked:
	if7M7PV0vy7JkYGf4X8RvKX5pYfREfDedXXY4fuiMlxKFlH+8tbSuy+kf9SDT7zeIXYO8RCRKyPZVjcVd2Hm8cAIVV/XQn495O1qgOqZYbBL95cHv3A7HnHGtsfR9lFSsk6aLWFroHv0QTJbDcai8fmJuzmSBSAopH1ePYsbSr8kLVGaaUCmvQp36TusKZd9v6o194oJBelTso7BgbJZytGKmSc0HP6VpxojfY4VIKsCW0jx+UJiLfHZ3qwnWAv6u82tL44dCK/7GCuvVn6byuT13XN7bzg4Hpup8JYxlJ+4gGHbT5zVrmUq3XIDLWg0J1rt46bK2XW3mOsmYPhJgA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 13:20:44.5100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca42c075-311c-43cf-f4a7-08dedb6162ab
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3893
X-Authority-Analysis: v=2.4 cv=Fo81OWrq c=1 sm=1 tr=0 ts=6a4babb1 cx=c_pps
 a=ojCuy1h7BbwMffJHuf2NLA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=2LXkwXwYv1G787AwtbYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNSBTYWx0ZWRfX8AlLeKUtwaqH
 HchjOUctH9OQWUGqmzL5wY0dWSvSvr9B1kn++JJFNkVpvDZ7aYa5NNZ8Wa0PMHOpK6hK4W+gIsI
 AvZwzmLI49nV2U55T0TtBKvjIWcF9H0=
X-Proofpoint-GUID: s2a6zIZoYux4sl3CfpQBXfB0qFVqkd5A
X-Proofpoint-ORIG-GUID: s2a6zIZoYux4sl3CfpQBXfB0qFVqkd5A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNSBTYWx0ZWRfX7zSUcSyC2Iwm
 Cy1cD4CQaEQo9W6CQtqj9D4aVZCb5DxB/MIbG9YOnTV9kx3jCqOYTvZvrNXBllBgRDk76Z74yRk
 ZGcV4Eb7i5zyw2LZtlIR/BCRA3sx/2BhLP9xlv6rB1pAx/TX6j/84IxgpQlo4WaJy08DNvtn8s/
 eO1nIsjR7usFebjiOYjqPC7unVKVZkek3ciIazeQomdMROG7GzgeyI5kOb2C88tVxtXzvCuzulU
 RISZuxV5sxCntiSt0AQ57dUaPNFAdnmq7g7mtmdLvieaHecLafobpYseQfYDDMLTvU0b7Mb9ZsW
 Ze3SaOazrzm6lVvltImCTL3aT6eCy63VrznMDccEVEyRUho4a4/TuThoFSJ10SCTyA2sSLAT6HN
 TiVMGmdh5ITTRNc6V6tn6t+PFUQjKeYjlDzbPPHJlUgwIumgt01ZSMkBnqzul9NqREkgIES6hlP
 JdDMeJZwIj6uZxaa+iA==
X-Proofpoint-Spam-Reason: safe

On Fri, Jul 03, 2026 at 12:53:48PM +0700, phucduc.bui@gmail.com wrote:
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
