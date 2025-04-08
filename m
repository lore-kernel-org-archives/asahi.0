Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6F8268FF0
	for <asahi@lists.linux.dev>; Tue,  8 Apr 2025 12:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114043; cv=none; b=niPdTzkUfIwy8Sdc9CVmXYAeS41za+hyj04NblzZi4c8Oz7J8r8c3SX8m/MM37kJIDwTsGNRn8+zklJv3LRTr9bwg8hJtRP7v4cy6FjSsXa2oWoIr5ZNIuxawzcIrKIrpEcZQwblIHIXICgZmrsYNsjat+482doxbzgA2/vr30E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114043; c=relaxed/simple;
	bh=RsBPK7j4kbPYorSMzSRdpXlw2ABxVst+sciibcAWJ70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKVk28+Kx+F+LhA2gO3beYzuW4WoAQRCIh0Yv9Kzn/sdWH02iXnIvf++2TrVz/hvnHSW9yL7JCfLJW/mcJrfoNdN9DOjCWDkuICaDEm+SunfB5m4x9gUEwLLVQUTCp5UHpB2TUJM9utqH/yLM1x8IWe0ikTIjtaBLcrOObR0pLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lqaKm3Ua; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lqaKm3Ua"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538Aj7KX006556
	for <asahi@lists.linux.dev>; Tue, 8 Apr 2025 12:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NAOBRVsjJlHCM4CdITK2XpsG
	lU7ZTqgOAiQblGZfMuM=; b=lqaKm3UaJkGn/9imxJ44ZTO0g34+ZC0rt9Box9zs
	kbLzG8ygIFFJqC1cGFGMuA7PSRNKTWRi44hoN/Le03qLh8KdaQx2u3ZLbNsnC5Xm
	Ut8RmiyYtVAJUSR790WSHIc8lf6BfdVyI/z7By0j64549PQfHFDGE3Tj3TEY0nvH
	5g47J7MlDY2RNbLUbhvBtkUznFGNTK6uceO/r523upDptkuadMDfBs3NY/zrLj5L
	yXYNAUoztzv9ZcEyNbZqrGdrKpUJEjf7aCbNBvUYFEQY1eFFKfQl2kCfKNxKistO
	hJ4+lMQaygnkkMeMRS7tHBekwbEOF/NJ+DCG+wWY5h6Fpw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftfjnu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Tue, 08 Apr 2025 12:07:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e28d0cc0so983522385a.3
        for <asahi@lists.linux.dev>; Tue, 08 Apr 2025 05:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744114039; x=1744718839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAOBRVsjJlHCM4CdITK2XpsGlU7ZTqgOAiQblGZfMuM=;
        b=K1k14Gr81Mv8w+udf8ynQfTP6cG3Q0kGTZcW9nkTAWEVlS9fH+7OGSl8lbzfQZE2AE
         WUY6dhwk2KzXD1Zl1ZacAd3JAwIg7pD+zJGk/Ca1GscPatJkQ2IgSsYG6AUIfuRlzQC8
         oC3FDTpkJMANJfPX240MDNwR5Vhexeu2GZTG7yVF5bC3qCXsFbWnCpC3lrhwjNL0F+j1
         r0dmJCoFtpPGLepGmgc8KDvZrWONCwKdOpvGsxr4TARbZCnk024SXB8xrqXY6wc5OHQp
         T+SIg7ccnyGts2jqzcHKtoNIo/1OMVHn8Fv+A3ew2s7pzsZMKiWHOFqhWpAvqBnQTGqJ
         jFfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQON0wBhLkDrHeMlqGih37RVcUnMDsYS3capNee7lVRKjQl32occCiRAuYCarcekzo+QjP0w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFqqG5f0+1Ws6LzNfIxAHkdEDKLYPDsUSNp3snTchkv4Pt+bT/
	jHUfVxGyRPevuO2s7jo7tlyWKYxZsroA8ivdo2JXXpWwS2OTfjgOF/gnldGu7Ai2S+3vTRkex0u
	EhuS34P1lM5IuKC1EKDE1HlUIXnNemcjUYLbMJiuzSZDrqc7NwDIv9w==
X-Gm-Gg: ASbGncsQ/48mjzJWBLvXlWEkDnD6KdNwMPX0sCCn+oq/4AWNsu048qNKOBXNBOYLF1o
	mBUBbPBoLjkA52Gfqo3tn+tZWoTjjtOy94uFtkbSNBZNYMNsNGnWIbFZCvBxNLJfnQKHhoN+5EQ
	EAby+P0JN8bKTMlenM7xD12iL5QG43tDjfTFZj0yyUMFTKiXVXjMQZUamOYUe2c2IVNW8omD68U
	f288wE/oasXKqPcNUoQghMreCvFcNMOqkOYWj1a6FrOHmWELD5va62yWHCWgDGnz66tLr7y53Mn
	XiRT6qIqoJZO9uMeXSl0hCTCmFqerXXpATkiI6vcZdWoq5s9HJSd9Z9AsJFm5wt//6vxXQ8W/9a
	IEpQ=
X-Received: by 2002:a05:620a:d8c:b0:7c5:5d9b:b617 with SMTP id af79cd13be357-7c774d531e4mr2062271485a.23.1744114039102;
        Tue, 08 Apr 2025 05:07:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOm+0STm+ulEUG2g1OSycLPEpwZd6FwOx4lE88yO8te3gseQuW/5R7Tv5qddqxIae781y5XQ==
X-Received: by 2002:a05:620a:d8c:b0:7c5:5d9b:b617 with SMTP id af79cd13be357-7c774d531e4mr2062266785a.23.1744114038665;
        Tue, 08 Apr 2025 05:07:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0312454csm19167511fa.14.2025.04.08.05.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:07:17 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:07:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Anusha Srivatsa <asrivats@redhat.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Dmitry Baryshkov <lumag@kernel.org>,
        =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
        Hui Pu <Hui.Pu@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 07/34] drm/bridge: lt9611uxc: convert to
 devm_drm_bridge_alloc() API
Message-ID: <63airbm25ly5svkym5fuahnlli76kshtq566zjjdswdhoatk2o@wi4uyz5xrnt4>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-7-42113ff8d9c0@bootlin.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-7-42113ff8d9c0@bootlin.com>
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f51178 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=v-JOCnpjkiGUajTo4vQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: qoJCQjfCUAg-XvgMCaWeTwNAZXe3VzON
X-Proofpoint-ORIG-GUID: qoJCQjfCUAg-XvgMCaWeTwNAZXe3VzON
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=830
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080086

On Mon, Apr 07, 2025 at 04:23:22PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
