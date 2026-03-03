Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011054.outbound.protection.outlook.com [40.107.74.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B24367F3E;
	Tue,  3 Mar 2026 02:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772503918; cv=fail; b=PPf/RoO9Lq9K9dwua33eTOFt2rxWmJiC9Z6CJr+Fk6p4gINdRIjO31U2YhVxhBziFaNfqw3VIXABcNnDCgKdnwOKLitNbSY0mDehYEcntG+yd5CGRsngNksGvibd9E5j45nrUuypZfOX755jXE//tEVHJZcZU+UoI+Eb0eUw7vM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772503918; c=relaxed/simple;
	bh=IgkQ92+3JSFfn0Y8ecAOrEKvKfT+a+74UFGZ3yRndSA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Tv6GMj4ZHtVuHar9Yj6YPqsJzEduohEQbZDrVvswtCDjgn8CxxCScur1hlZDTLRfp8oAKQBF3mM9oAsUEMPSUj1bG7/rN3e9t1+mJ3bTHGeQAkOF1ha3Q9efyEXpQoplKqkNLON/CHMUNHccKQAskm13tfNGw1dLGhppgzjeNMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=b3DYysXy; arc=fail smtp.client-ip=40.107.74.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="b3DYysXy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xDnmu8iLp1PyqHxn6Q9e13AatVhUBTciNgeNVlZbk68f0y8fYscenHK/ZIeJYRT28xIeIMy7lAeN/SyyO2keookknQ8cSghTUTeDRhkmUOOdCv+1YkXLD0aly7dMZ0F291SkZdAjjbyxTJefFxEeG7DrqImJURhJaSagO7N5n7cO1rGb3GFLWVXPp8337tfpoUEG+X14i+eTfWR3W4+zaXPrzEIqfFhKvMMCmd6xQSjVsEVqfBNH0WHJ6H3Vq88R7D/8jtggfT382/y/Y7r1gmsbGmkC4EEUGEereGx54JI7YUKmxjfKPzxq+573N8yaKbYe+fRNZaDATW/yfSK2Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSamu9lLSlLaB9BslfpiQCTx0bKiqACI6FjwwQSiH8U=;
 b=gwg01xPV5fhggH5WaaGkKiCK+y7m+mA9M1C6oP6YDTOeEEgg9gwcqzLnPVNlo7diMjWpErXX4Y9Wgc9U/+Mx8kDmLVdZ3bOhIt6uTkaYQQllZCfZqJ83EpKxOUFueEQfE6Jt8Yl70e+5+/YRCRUeVW2DR+HhJFO/qTk1NULCVwvLwGi3RNjf3mDxrE4xRMaJcDY36/UpNUOSAirG0adUldV6/sccw3G9b0g26sIVEVhf1g2QX0Y/XKRUA1ammHIqThGpTNFdErEVd5qyTbqjNkqgewWibZdSZ41xBQdc8nBF0bIv8nqQ5WkBt+tB+qEJNCSJV2o8QshZfSoo5vHdKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSamu9lLSlLaB9BslfpiQCTx0bKiqACI6FjwwQSiH8U=;
 b=b3DYysXymUJQRLFFKLT71vMzq8K4QchZkdpUTu3evR8p0N0gc4v9PfGcf6dZ89h0u1ztkAHiAvSTJGKDT9Bs2nlPtY696Ok6U5ptES3ng5cZGnzOoJ7Q1xBioDjKomtAYLuIE27z/M8oaVutEwYeBFvQ7BdBbbSy5B9wVL3ISBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OSRPR01MB11584.jpnprd01.prod.outlook.com (2603:1096:604:22f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 02:11:52 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 02:11:51 +0000
Message-ID: <877brtacgp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH v3 5/7] ASoC: soc-dai: add common operation to set TDM idle mode
In-Reply-To: <20260301-tdm-idle-slots-v3-5-c6ac5351489a@gmail.com>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
	<20260301-tdm-idle-slots-v3-5-c6ac5351489a@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 3 Mar 2026 02:11:50 +0000
X-ClientProxiedBy: OS7PR01CA0182.jpnprd01.prod.outlook.com
 (2603:1096:604:250::8) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OSRPR01MB11584:EE_
X-MS-Office365-Filtering-Correlation-Id: ae74de98-5573-45ab-7355-08de78ca3bc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	5mLgxrJJIcfh7BH/S3mXkQPZGq++/3BQo0WxdFIl4z4jMwFgbYN5mJj+4NuEPgPVXqehIkuzBMDx4s8f0r0IZUTXsvbxq4Ftes2Nsl/qKbDHgkbisAp4K776Ma4+YVgph8w/iU0xOtOPfMFO+NpE5hbTSfXVggQ5hzul3nYxvPIOf45HtdfXhR4LKWKWhO297m0tQvD1ORvotU7zZTKzY5R37WCUhT2+otgZWyKOgZJ4K8q7w+rJY1hLNagHezN1v27nbMfsexIZYQTS1EkyaWl8M22o7LHeMsRHzzqw+AncdAGguhPcKXst955o//AEmz8h0gemTXMizUa+MV+/f68cj2vdRTaDf8nR8FQx4lUk2ZmFDHcDcJj3AI3a3ItKSjEmK7/is7HPGmXbmVZWmC9Atp5apSi2koqKSD5122R/aDLRof+tletIQtLHU1vOuNujHwWHWIAWylxsysvo7xvjO04hkdW2oH+nz/VBA699s0rHGSJEDEvzHyG6ezjZsyPMtwDgWLSz8mMYhzL0unn9iJ0HuV8Vabh7OBq/NQlltgID1k4h19MoGZYt3zvHw5s690Ki5StHmBjKHZ2xYm64XG0PIkwcxXWKGXEKIA1m9zQ6d1RNQ3lcVJZxZdkjyzfIag8AlErJtjCBJDSP/ch6MfbQWEQGXVtL/CJo6I+IfnJjWPntlhXWTmrxqBjE8KJZvlFHTIX2pmE8Oa4sN0Et9jq51BbGcpxQgbYgbJgsJg+yMyDKZuWYevP3PMzcQg32LTQRhApOEHTRow0kfsb+Lid1No0AdpLWT/zGD/4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j5ieVbM5l8GECg+vGSRKwnPdoHjja3Ge0lA4Ts8Q2kN6XNR8BMAz7nV1yCAC?=
 =?us-ascii?Q?kmNiq/S510AvDMlr6LEdrgK/gR0QJri15Bi/OHOEERFLDHiAE0q6QOhpMDGZ?=
 =?us-ascii?Q?C+dTuES6qdZl4O5VbBvJnfKd/KPvQ6VnhIIJOpOyyR8WI1Su0bRomhCryB6c?=
 =?us-ascii?Q?USOzKfTXtmWG8r0z3hrdN/w1eB0AZfU0hUhUiNnOWr0rtNCxGqJ7tabwj/r6?=
 =?us-ascii?Q?MAC51v9bdGnq74mHziSTJe1DmXkmhLEIMEfGzwT6/ZSLp1b8eBHeLJNSSw98?=
 =?us-ascii?Q?+es9FLY38HTSDKvXpvHLchnLUNr3m6UJBJwklVlzJue9yE4loNtPDF+grSge?=
 =?us-ascii?Q?51MjedSyTIAwHSrrNvnwvnTyc7lobKCIPSqd7a9i+vBqZtJXHXIKHEW5oSrV?=
 =?us-ascii?Q?VJlaaUmduJJLnpVXSjNtglU4fObk1VkSvo3nbakTbW7ely8f9nnvD/q3IIVa?=
 =?us-ascii?Q?qJcwpCf5Whuol/2pXObpfXmcnQ0xRwPSaJRyjmdvnIfChmBLbi2ETRxkdxKB?=
 =?us-ascii?Q?KG1su61feG5B2HO+98Z26tz7we0UbzhZ82QA+pcI0sl1uao/4q6VbHzaIS0a?=
 =?us-ascii?Q?8An9OgQvxv9NNhkyU32H/lwsmHhZJVmyMhKKk/Mm/lfNyEkf3QkQ/CPOud9M?=
 =?us-ascii?Q?09kOSBWzr98TzgK9rAEtJEfmSyCe4X/+nEe0d/8XbexlwURfsfaScAQvuoM0?=
 =?us-ascii?Q?ph2tPrDNWO2CThDT3v13z4/AKWgS3t4jpw2J1+XfRvyZQybiMGFCsi+DXHhD?=
 =?us-ascii?Q?kchCpX0gxNkC/x1zfuN2TfNPM7v4yQGG+Oadj6b/2OCS1uPV6rMcpVMyOegj?=
 =?us-ascii?Q?vqiKnCS8wjSP4lANBybmaZySY4vSOImYoFGHJFJqD4e8OJVgSjlUlWFQvbM5?=
 =?us-ascii?Q?30vP96NEmpRSl9JZI4452tlwsgUqLESaq4Uc+mp9WjpF7B545uzbU1Uc+qFT?=
 =?us-ascii?Q?0t9/GraqhzohEXT9Ye3yJl+Ykfuc1G3arKhwJqEGkWKPNWh5HbCuKJJYz1Fw?=
 =?us-ascii?Q?WLdLJbJvrUVYV+pse2hiX0bdoAZ9N/03YkXqhEHi++jg0GmTFTbAGdeS+oHc?=
 =?us-ascii?Q?jYmHdriV8OG95elJ+I7Ymz6A+ONrwj0Eb5L+YJBfjIwPfm0mq4HUWMTX9+em?=
 =?us-ascii?Q?rzxvQAv1JQ128/BwgP9L6iarw5ER3l9qARuQKUdR/9L5a8EVlL6ZU6ld0S7w?=
 =?us-ascii?Q?kQmriFZPt7vFIVAb7gihhijwgWcuJWX6jbWEJjQ1VFalLbX+dl95fPbkS/SK?=
 =?us-ascii?Q?xBQA3ujjTCpa7CkH5AohJh8JdvFXLVatX8Kj/5pX0YTuhRNQQFw+pEN3CEaQ?=
 =?us-ascii?Q?vHQOXO4xCSxdRwPng5BsTAULMVprabPtPh1NQTtBiNIRtRpm/Gg2LweUaB9S?=
 =?us-ascii?Q?xLTPWD/8VClog/wQ2Nrjcz6ByH634F2vHNSqR6Ojdqz3pyUH6FhwVGz2TcXt?=
 =?us-ascii?Q?kI2+NdjwB2zYITElfz9tmHotR03mzZoUiawScqCyzEfEmTeClejwuU3JBwau?=
 =?us-ascii?Q?QYQCdeuNB3qO+QIUu6InXeQYVoHLaYjTtL49uAO1ThLSIPV93bPCXh//4U3w?=
 =?us-ascii?Q?vZSguLe/ms0UXnQwqqU5m52jeQZ9p3T1KXXoZgq/J4fU0aSm3qzAYYuADEnk?=
 =?us-ascii?Q?dVP60i8y7GwRhswdM/q65HEhFPP7oC+vgkfB8w23G0dm07UA3F7xlbKBrheL?=
 =?us-ascii?Q?YtGCAkR9E5fGZoitaIdnYV1y/nScrO+lGYhTeXJ5YtZGaYulGu2OSPCTYiSs?=
 =?us-ascii?Q?h8HkpDscVtNKCADJegoe3+4WbOM/GC7lVc7FmLF5yUQTVhewqbCe?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae74de98-5573-45ab-7355-08de78ca3bc3
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 02:11:51.8558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWiB5suILr1nHB3cc6pl50XT0JwSzg6ioY994SrjlmApFWlptW/tWxAhos7hYMrD9YqsmvOyDKqDpXLIb+TD/qLaxIA/TZxXd5Sc81J3BMqv67/GpYS2WKJjvU9h5LVn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11584


Hi James

> Some audio devices, like certain Texas Instruments codecs, integrate
> configurable bus keepers that dictate the codec's behaviour during
> idle TDM slots. Now that we have definitions for various idle modes,
> add a snd_soc_dai_set_tdm_idle() operation to control this in a
> standardised way.
> 
> This is useful on Apple Silicon laptops, where a single I2S bus is
> comprised of two physical lines which are ORed just before the
> receiving port. When a codec on one line is transmitting, we must
> guarantee that the other line is low. We can achieve this by
> configuring one codec on each line to use its bus keeper to fill
> its line with zeroes during the active slots of the other line.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
(snip)
> +int snd_soc_dai_set_tdm_idle(struct snd_soc_dai *dai,
> +			     unsigned int tx_mask, unsigned int rx_mask,
> +			     int tx_mode, int rx_mode);

Do we need "rx_mode" ?
Only "tx_mode" is enough if my understanding was correct.

This patch-set adds new snd_soc_dai_set_tdm_idle(), but no one is calling
it. Who use it ??

Thank you for your help !!

Best regards
---
Kuninori Morimoto
