Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010065.outbound.protection.outlook.com [52.101.84.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FF42FF67A;
	Tue,  9 Dec 2025 16:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765296706; cv=fail; b=pyqfXSZg+siZ7pPN7kkfOfdf9FsPeuyN01befZexMIVva2YdzIZJFbHEa9Z9qZhYh+SA/Jwqy5YT7FrIiHOEQr8LNvpLGz/emCvLkw9fG7Z3Phd8PQVUXD4DXMZqI06zJK/uDVxsEliQ8yH7CLvtLHj9gy6dVey+Z1LDPwAq1sM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765296706; c=relaxed/simple;
	bh=2Ygr/XBTYHXjFMiNqGk91XErasR9I4i/YxhQJ1d78Eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EACUAG8SJVfjOV2ugzRZkc/krm82fnIx9tt7N6eiKYDT1YUeLVyi2SECYcdtlQsEkXqPPePBnsrPnQMEcmQPWCsrL+t2Pq26wjv5qmc7HHdYjgNVd5DoIvGDJWAJJ/UvxQiFzxK4624BnxVQnwKmAfnKKn7d+CAM9z/SShcFs8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hL1/Z9nE; arc=fail smtp.client-ip=52.101.84.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hL1/Z9nE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6DR2vYX2DTU9FdaNPJnBIW12TKQVp71TF5MwdS2LSTRoBQkn5xnpa334rS7HmvYmTBk4LjndqOc7qilKIQaMnaTu0I/PoHaC2KHh9HcIzNexOlxzVRuG7xDv1DkkmW7Da7oo9F4TvSi/W6vGQy225XLJGUVJY/xts6DvOBsC6lEP5WCetnCvAMwzLwTq73jkG8V/HQ3vqne7J0hwW/xRkQ6GZRIuUWzIo6kFB2AjJJrpU7vBNw+x7av4lC+j6bUWqouD8fHqPfOjR6ZEnDB1RKBHEvqjmc7+8+xiIrnT6/Keq4Jd2mfRe5pWlp3FXRXtdFLrjbqWB3Q2MeEvv1AkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4KFW08r+yqfgwdEN88Xa51dKEKC/Yo/BohaJZVBnjI=;
 b=sC/hflHgyntk7cv3D1xNIBeDAPafcMpfg9yncaC8UXnCkviniWt2a1YykcGGJ4EwPqLD5lzT0B+5eDTft4f/LW8GeP4lxTM8jOTLCoEhYGqjReU6hjFUdBGv67YJ6vk+lJGLRuqSn5uLLy3WxmPNyaPi8fmt4ifZRe8vLb/CAQXOaY1p2Lu43XQD23VflPzj0CVK1dMQevtgQWTIG0UrHC8A8ytbCZIfKdLG2niex4jF99L+XIrFxNSaeQz5epwcnKmBtkW63LiiDRcrMRdkA0DWr2g1nsG4tgB85XiNFvvEyR31iAA7DG9eLdoj56NUclYtdYC9mQ9dTzcekzOdlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4KFW08r+yqfgwdEN88Xa51dKEKC/Yo/BohaJZVBnjI=;
 b=hL1/Z9nEzjmPk4ig7COMktk/tdk1lA+cUppH+uAbsGV0omLKQXA0X5kOSOTFVo3b0KQz3f7y+Oi3kBTjDpTil+P+a48MMygmCL69cALtLmDIXVk3Op29PADXjciOTSq1IaqwzoSIMw5Dt3BRg6FaTD1N6y4Hh+GLsjQuvLmatv2ZjO//9hIcWank5Zke6LjOMrNn/pc7RDWELR6wdIpWdyqVTY9HyRX9kAmxWsu3GfysZWOmm/IrKNnyXWwnD7kxtDpqXsvRm0z25yOG2EyJGGzroOcv+VSMEeJMjw+tMv8O/IN6IaBDd6RovXQSNRQoWw/22Tcf+8cITfRiHbz+KA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA4PR04MB9416.eurprd04.prod.outlook.com (2603:10a6:102:2ab::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 16:11:40 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 16:11:40 +0000
Date: Tue, 9 Dec 2025 11:11:31 -0500
From: Frank Li <Frank.li@nxp.com>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH 2/7] ASoC: dt-bindings: update tdm-slot.txt references to
 tdm-slot.yaml
Message-ID: <aThKMzyrr1oY35Vj@lizhi-Precision-Tower-5810>
References: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
 <20251209-tdm-idle-slots-v1-2-38dabf6bc01e@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209-tdm-idle-slots-v1-2-38dabf6bc01e@gmail.com>
X-ClientProxiedBy: PH0P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::19) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA4PR04MB9416:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a10bb59-fe3b-4791-6987-08de373da330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9lHxxUWovktyynhWHm9W18mzQc5qOY0YYm9NTiJKJ6ZucQ41ttLb2d+T4O0z?=
 =?us-ascii?Q?6NwXsei9f4y8RvolxT8Eua/vzAelmT35gqGQq4ef4lKEZybQdyf5uN4MdRvj?=
 =?us-ascii?Q?D7yzAlVibTnXou82jXNPhI/en6gaDyqpChEMdBKAn+8yk1ZmxmlADgsziLPK?=
 =?us-ascii?Q?pA58MB78E+bhtKjDv2xuiHW/IZy23QBQrQKhVkAmrKfcqkkR8TTMciqch/xr?=
 =?us-ascii?Q?+LhHm6SuIVxmh+88lObS5qU7TSF0TsP+0ybkbUx2stE4wx2VpSdYQehy9DZ2?=
 =?us-ascii?Q?qDdoZIax7YpTct3Z+ne2q8l6PulIEGkQgeGtDzMZE2LQ0cyqam4Y8qaj2Z91?=
 =?us-ascii?Q?1vtBWBFJ1nffl5oxGe8YvMuD7SfGzyap018psCSDbg5Aog+E4vh+FMjvGvfG?=
 =?us-ascii?Q?LVlR9k+AX4VtSf7c4RB2C3HNpbfQjGkgOC3EohV8NHvSuREJo4OKUbBpbjYh?=
 =?us-ascii?Q?9xN0GqKVm4YRFZl2RniyjlNo36AMfmhr9jn4KJ2aIjc1zU2F0D3yRjfYUt19?=
 =?us-ascii?Q?4K34mOGdu1X2rcsG/UmEXp43LcKfJprmEJZfx6klnDbnPfmTd3bViU3T9TY3?=
 =?us-ascii?Q?4ItHy26lzZGHXnC0D9SVNY68e1WoKZPVI68ZIzsOpDDk1YsoOJmZLHmooawe?=
 =?us-ascii?Q?PXlxQZzfgJV5U4803Pp6EKxULHcbe7qg8wgB7gTbaVUlu+cDEN0GdMhKyVXJ?=
 =?us-ascii?Q?Qa2BI3oHZQvpxcEnhI/cFn5nffCp2KADlE70bkOVXRJ2TtVLQUmoprFpeDIi?=
 =?us-ascii?Q?ZcEeL26K4FTTViik6x5hlE8/l+gM8305q/dV+espR7F0QTQGTA836d3a0szK?=
 =?us-ascii?Q?2DgzPUIYBQp+TAyiIbwpPqPJ4CwKKdErUDewiL0tWdcJLxlJifgRNwvAsyxv?=
 =?us-ascii?Q?S/QzUhT6FC4XL9MPWLEcR2OS4wRsRmxkB8xXBW5CCKPPOvvGcmyvS0iMkU6N?=
 =?us-ascii?Q?JAUDMPQx074Q7Jh6lH/9jxNOyHIIvDstWtLACUYd3XQj+1so/uNsdoZ37a9T?=
 =?us-ascii?Q?Nb/1/HRDmDDXv09UenZvYq+ArIuEYrqOMWZI2dl9yo7CUGQqlGwV12zknuuy?=
 =?us-ascii?Q?IlpMLIsT+HPl5EAS34fN5hi7+HiJWMWpJmeOskcGZymeyL3VZggn1qDxwdLH?=
 =?us-ascii?Q?KuvYmG5Duf0L8LMDcmr2SjbFho8NNcXb2ouF5n6rnSfs0zAxHGGG+EnJQsXa?=
 =?us-ascii?Q?ot2CjfMZW3M9zM1GtgliF+F3h0xuDq3WfoIgTeKOCoSLPCtxn1BJIRae2qfP?=
 =?us-ascii?Q?vS2kvpR3mGEh3gKo3PDfGX9KlEOZ52mI45g9m0IcqJObRpJFw2HI/5cTo+63?=
 =?us-ascii?Q?YXISsz92h5c9dUN7RG2QvDsVYZXXQIW0qCahOK0pPGeHO5+vsYCN/CFF/ejJ?=
 =?us-ascii?Q?B3fCmMqaQIM5R7eCv/IUoL/SMBjaozyZmI6XTuScrHsVM1zvQ/7CjtIcJem0?=
 =?us-ascii?Q?BPAsjW5JD57N3M/YFZL7DmG4MKE+WDj33HVODCqUXSEj9pvM0z+p65nNlQRP?=
 =?us-ascii?Q?BodKzdIhWJKPMyKAG6DuNkr93rmVXisy2fxo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BiwRFCPYTqMjLNGo0OaUyu7xb+p/kTBZRKXTeOmpBFg5QvN/au8cWzSfp2RO?=
 =?us-ascii?Q?fy58rvPcQ2ZBL9PMiwZBfiL57c/1LLVcjF2Eu+t/P/iQVuNw1+Fn0tTIh5wO?=
 =?us-ascii?Q?Pat+DOhnFEOo288H3DnT+Y9sMIKsv6yrXhjsfPLtRimwXhR5KH/EkKCYzQ46?=
 =?us-ascii?Q?AZXXqmVpECA7vQaKUr7FNUO41VwWzKkqCOzkuOEP3WOoBXoi59arY4G7t2g+?=
 =?us-ascii?Q?MLLVxa+HNS5GYGh7NMD4e/x3XNeVwZmZnK+x5KjvoCD/EKuuP37NzSJms51e?=
 =?us-ascii?Q?KD0dZFryJc/pa5IroCGBFpiQO8M3FzJh0mPQsEImbSXgy5qwql/PIUnq67HP?=
 =?us-ascii?Q?o61gWskbCwcdUDKQW2nDLbptBuUCNf2kYzlPEP0zyZ11pwcrShVxivXOZtbm?=
 =?us-ascii?Q?Zkke0ydGrIUCDRTWY/LPWXFQ0nGuAyXbvVXoonlse4DMTbwdq4YJgC1q1Wkv?=
 =?us-ascii?Q?sEZyjGVlVewaCfX0UKcZIEw1YXrbFraH1KLXPl94+fsvqB+6rg4t0glt1Tfi?=
 =?us-ascii?Q?Q84a0UJgJCEdkJpYKOur4m1+B1ORneu5KiUb7TdkSEDZqmWRkeTNA4aa8X9G?=
 =?us-ascii?Q?wqT+5ihn12V3vqxCEw0qfaa2M3WXtq4gjmNav8WLgZEqhepyuwJYJK0acyMf?=
 =?us-ascii?Q?ARjDdBKXCnLhJH06slrnfvdPz5wlQWW+Tl4J0qJOEeOrrDcPFDQJ7y4sPH8X?=
 =?us-ascii?Q?UIuSQ2KV4fphqfFhQZfzZ8jm5HqvDKb1O/i2MAAM82pWpXlHS+8RHkx29IyO?=
 =?us-ascii?Q?Ohttkwr1vHJiGke26izNbFGpImwwh1Ma/wdP+jAHljsK5JHlePukJu7ys4sY?=
 =?us-ascii?Q?O+x7WNF4clUhp20HV5tUt4Xn6xqeuHvqGcTwOGGHvV52fSjrS3c9Z+u6M0MS?=
 =?us-ascii?Q?Za5zQt621k5zjiLzyqQoIbp1pZpaf9UKr/yCCYM6QzBcuMrvifsmonE60Uez?=
 =?us-ascii?Q?D3YlrwAJ+HXni5cIiKGbToRAs/DZj/olWFDopxtLFxAgS+WHaL2idGaSgMm5?=
 =?us-ascii?Q?JYHEB/X1JMZWJAXnVvo+8bJpiVkgeQABuEC263zVPDnUXlVHxQePJghIvf3t?=
 =?us-ascii?Q?arZ0OAIxG0oLTENgldqjsfvme0NaN1dxuCmUXIez8NAtNMSZuEyXHRB2pKTc?=
 =?us-ascii?Q?05EXXRFBkeaGgso0SqPsP21R72nflrzEDfl0OU231R1ashACrwpyHkjA9bPN?=
 =?us-ascii?Q?Cm7zR/smXSxeOnEo74aty7oAy7ZZamsWR6iEtDU6bz8npRaKsRLWKs9Rgsq+?=
 =?us-ascii?Q?AumbMe0bj0nMxY8bvZ56Icplp8pcK3l2E03wZYUN5+SjViBxUNzqp49xa0iF?=
 =?us-ascii?Q?AnZYqPdV5AvV7TkOWAkFiknV0fQGjAxMOXdhQaenakoxeZWNbGiCpb5RL+qd?=
 =?us-ascii?Q?x5qSqSmCAEHe6TNHtHNHXBlU2kusakjPomdXLuM5+hoIeXbVHdhPKc7Vlq+L?=
 =?us-ascii?Q?PRCMLDULkbOBBzCkwBFyYHIsHTkDLvglVGXmRHl6eySB6OqXzDWBd+Ny0y3C?=
 =?us-ascii?Q?p2AahmFOE5YO11UCewOwf2adfIlxV/fBp4A3nN4pzsjpgKtLTrvx4r7RBRap?=
 =?us-ascii?Q?oDG85T0Uyp//rWEWXHwWw4hdyX6L4i8JniIcaiP4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a10bb59-fe3b-4791-6987-08de373da330
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 16:11:40.5181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jUSmJsUttC7O+/Ki+aWNHLtAzl7itOER28/92IOwLfZevvK3tTPnuuf/wnjY2/kM5iDzzFoa6ITwQlOf7NlrjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9416

On Tue, Dec 09, 2025 at 07:31:15PM +1000, James Calligeros wrote:
> Ensure that all references to tdm-slot.txt have been updated to
> tdm-slot.yaml.
>
> Achieved by running "sed -i 's/tdm-slot.txt/tdm-slot.yaml/g' *"
> against the bindings/sound. No other references to the file
> were found in the tree.
>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/imx-audio-card.yaml   | 4 ++--
>  .../bindings/sound/simple-card.yaml      | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> index 3c75c8c78987..1df29a556120 100644
> --- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> @@ -39,11 +39,11 @@ patternProperties:
>              - dsp_b
>
>        dai-tdm-slot-num:
> -        description: see tdm-slot.txt.
> +        description: see tdm-slot.yaml.
>          $ref: /schemas/types.yaml#/definitions/uint32
>
>        dai-tdm-slot-width:
> -        description: see tdm-slot.txt.
> +        description: see tdm-slot.yaml.
>          $ref: /schemas/types.yaml#/definitions/uint32

remove dai-tdm-slot-num and dai-tdm-slot-width and add

$ref: tdm-slot.yaml

Frank

>
>        playback-only:
> diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
> index 533d0a1da56e..2e1a5b3216c5 100644
> --- a/Documentation/devicetree/bindings/sound/simple-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
> @@ -28,11 +28,11 @@ definitions:
>      $ref: /schemas/types.yaml#/definitions/flag
>
>    dai-tdm-slot-num:
> -    description: see tdm-slot.txt.
> +    description: see tdm-slot.yaml.
>      $ref: /schemas/types.yaml#/definitions/uint32
>
>    dai-tdm-slot-width:
> -    description: see tdm-slot.txt.
> +    description: see tdm-slot.yaml.
>      $ref: /schemas/types.yaml#/definitions/uint32
>
>    system-clock-frequency:
>
> --
> 2.52.0
>
