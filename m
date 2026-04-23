Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D05A3ED114
	for <asahi@lists.linux.dev>; Thu, 23 Apr 2026 12:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776948319; cv=none; b=TC/DOCNRkOu+ROgngkMiszLVf/1alY17fLJtkr+kKTGPs1K/iku+cJjYXj4STYyKULgm76wsnyKEZ6xYY86FfbPScHf0g/plkVGL0BimzWsLb5BNz/6VHIYpgqwmaYDh7xDsIDSAwgWx71juT8QWA01jIej5SMrB2RhJ5q5ToSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776948319; c=relaxed/simple;
	bh=BRXUU6ztqr1lsb3f4orzbSrY/H/lvrHRoUjqXtc+p8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PC8o5InPDVX76SpAhHluIt7q7l0bJvDaU6ajdkgNcbEDDyKoy2EW3iMv7QqKadn6m/p0BpWUuFXu1SkeEwlPx8KKVBOw/aQpUxdhSfRVyPpbkvA+I/ouScqlebdLXld49c0xp522w+YVviVkaw7ypIgijNBl2/Zc+EONIynqjxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f4KeQ6v7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UBdb8/4p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f4KeQ6v7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UBdb8/4p"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N94jJr2319458
	for <asahi@lists.linux.dev>; Thu, 23 Apr 2026 12:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dRf9flM23evHV+dCjZ11/3wA
	eY0NjlVmUaCb2MHl7Rc=; b=f4KeQ6v7smM+6vkjRyPOX9wXEYAtm4U3Svh9O4LA
	F+Ut9ODMjODxPNbgXzx8vYsDdabudfLWLc0zHnFv+oEKiz89nUOO2sQPOHS/+ZM3
	zQT6oMIVkCq5Wp4R3VTgnkYwX6xePFRT1MC0rIMz32csoNRax4q/mT6Yr/+zL+9C
	7OuvYNvRF7g+TmXzCH7lNo60EkNeNnDFHwVPY44uYX+2fEK1axSGxBuE/TKbVwb/
	fm24A7Rzdi8ERqvvgbrmTj90vCgNjVgjSS7A0elPrw1hQn9gGEzfn8Ty8iz4A8An
	nqvE0T5Xjg8h9sNYtk4IJbU+TIpW+LIBNd98FbPRTRXSOQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqgfsrv56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Thu, 23 Apr 2026 12:45:18 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-605e5d95cccso5320275137.3
        for <asahi@lists.linux.dev>; Thu, 23 Apr 2026 05:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776948317; x=1777553117; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dRf9flM23evHV+dCjZ11/3wAeY0NjlVmUaCb2MHl7Rc=;
        b=UBdb8/4pU1wbO0tH24gh0H/+a+OJA+VZpOFCSCLbiBFwrWwGDT8WDDjljl0Mq6ir5A
         ugyTAY/E8k8AryupLv836raBvqwBUcdVNTnGwtAFFum6e0PP+4st/338adkf2GDkUeVX
         Z8W48PVPl/ycAIUlFF3g8J1tf2I1kzuQ8PecIPLKNy2fP+Zex8/3rP4OOkPo+dcBSoN3
         /FsrDkxG/2x9vP+/P5drkxAhM4N/fyw+tfxITcizNTeBnKv2zUNrK4B4EIx0aP6F4839
         IfmHu20YXX3Z44ni41C0I8kCEJlBJXqj5pf8RQyMuvr/Cgv03OYIIoxjTOWyjQ0RjAGL
         4xxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948317; x=1777553117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRf9flM23evHV+dCjZ11/3wAeY0NjlVmUaCb2MHl7Rc=;
        b=WekYlimYuwCS7fvjnRWjtop0qaCKe60AKuJ4pOxQIQDzQz05wAVRyfz7C85nxc1Q27
         ypJXimO8XTWDAnLnhOrB6a/EqD273medNUY8JiHQhBOrekmaUvFlWrmzUEOGKE69Dlyh
         +oJdkfT2J6C6aNYZKOpOlq87nR6AbwM4LuyyaJhiCnTfp8WAHx9pRwuaywcugL21JPaC
         8f0PSfO26GIS//+H2ChW3FDYLc3By4S1ojetY9krEALcOYhEXpCHYdsBj5OIgEDm+6fa
         GGdssoPQdNjUyXBZiTx2O2tIouGCt9oWKk6SkoP+nlDDHm07/G/Huca/IeXU5AJObdwB
         l/OQ==
X-Forwarded-Encrypted: i=1; AFNElJ/6MPD9OCdN/U1mFy69bmDPjoQHvZKP8a6x2WHqqaXQX12AFaOI9FWbvLX+J0Hfpnkj9fOWsw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJHb6QInHPPOpOlKtm0AWl6uDr0Vn9r8hA7ps7ikyppapLsCDI
	jdoav7JGdZtK6BKwTR5T2iYpoMJbyo1yI1Sod5igDAclPXtacaZsFzPrkuCb5pJZS2kPOBjznQi
	V6H/BJQtQHU7cUwiBUN+sedeH+mJPa5U7qNWRajGu6SQZzGURIPIJAqcHnA==
X-Gm-Gg: AeBDietTquoMux8B7cPpuiyoXnIHtPcrHn+IbI68+colmpKR/EeGfBaABs3RHEpwt/y
	Pb2/fTWu9B01VPXyQ7tIP0SDHtkxrGcWMzXBAObzMV3lB9AMR6ELLJaA4h/ehRNyYOiYZD3podI
	PoqozXuUkYCVtJR82Vg2UqNvyF0BBQ2NPEcCi8UOtyT2tR8OWCljfQoT1zAPkXItZNEOsMzPfol
	YYewiUW4mLT/KWEHyoJ/5YDuCU304K22WVyyBS5OXS+o1xZ7gfMJQWIONH+CL0OAbuEE0yXlZgu
	1hwvpsfPv+gTvN2fVFJeNP8wTCIM3YLN/t7tphGie6rVgZ0N9dUqIbH0WMCrKakp66BmVL/b4xb
	PQIOXfp32LEOWTzKPglC/LXSCXb6fXVTa6MK9B0+TW7iRWkjqFut5al5eUx1c+8ggYNDRmoHL3W
	tItnBaB8cFUqg6KDUjM2ItmVUdrBCQZAghg9qYAS1nTg63Gw==
X-Received: by 2002:a05:6102:3e0f:b0:605:19ce:9ccf with SMTP id ada2fe7eead31-616f58af7d9mr13838582137.13.1776948317056;
        Thu, 23 Apr 2026 05:45:17 -0700 (PDT)
X-Received: by 2002:a05:6102:3e0f:b0:605:19ce:9ccf with SMTP id ada2fe7eead31-616f58af7d9mr13838537137.13.1776948316554;
        Thu, 23 Apr 2026 05:45:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb75b033sm41855241fa.39.2026.04.23.05.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:45:15 -0700 (PDT)
Date: Thu, 23 Apr 2026 15:45:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>,
        Liu Ying <victor.liu@nxp.com>,
        Douglas Anderson <dianders@chromium.org>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Icenowy Zheng <zhengxingda@iscas.ac.cn>,
        Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>, Jyri Sarha <jyri.sarha@iki.fi>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 00/41] drm/display: bridge-connector: attach encoder
 to the connector
Message-ID: <wanzalswb3lez6kyklprqojcnidab5fkxgu57lfka45w2rt4ic@xdatq5o7yiub>
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
X-Proofpoint-ORIG-GUID: cWlernbLe9WDFvuJ0UeylHGP7JqWhPap
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyNyBTYWx0ZWRfX05ZLwRq6aKFT
 WA9PHe0IBc5Nyksr2zYeqvd8fEio12yCuLbw+r46K+UW64GSGrIAiUnHf5PmBGtNhi6SKH1b0+M
 /tAu8grH1RST8XX0WyvhwStvl4re1C/h3TGlShLRCCdEoGWwAQtRQ8hIPJ1Sr1tVuDVz1FS6Rys
 3DW/31PxlIdXucx4937WyerTd/jWl7DEbe2AD0aZK5zfuZyIH+Kl8mm43eUiE1NZ7y2hb1Us9ER
 xURbF2wSowod6hvhSQj8Ct319LNxxTSu3kWbpXoekgISqEqaMHmxf2PbHbep/KnZXMCmCkWaEK9
 8q10BkjKRCTp91hkrlJ6hwR5RpbrOTvfABs648gL5Ec1fMcZP8vAfkJcanqODlmbSTfWot0EDoG
 B1H27VBz+stoBzfSuOMm7vbHtGpGGWSciS3OIa/lsj3jAjvNOQYqwxpyKAEHmtJhvdecoiWvMkI
 dRtn6t+Cf8MJo/TDBIQ==
X-Authority-Analysis: v=2.4 cv=AvbeGu9P c=1 sm=1 tr=0 ts=69ea145e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=SkVVgs_SJVxU13IceqMA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: cWlernbLe9WDFvuJ0UeylHGP7JqWhPap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230127

On Thu, Apr 23, 2026 at 11:16:54AM +0200, Luca Ceresoli wrote:
> This series simplifies using the bridge-connector by removing the need to
> attach the newly created connector to the encoder.
> 
> == Series description
> 
> Currently all users of the bridge-connector must call
> drm_connector_attach_encoder() immediately after a successful
> drm_bridge_connector_init().
> 
> This is an unnecessary burden for users. Move the call to the end of
> drm_bridge_connector_init() so all callers can be simplified.
> 

I don't know which one is more correct in this situation, but let it be
R-B for the series:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Feel free to take the msm patches through drm-misc-next (A-b).

-- 
With best wishes
Dmitry
