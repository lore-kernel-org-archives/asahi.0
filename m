Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB33726FDA7
	for <asahi@lists.linux.dev>; Tue, 29 Apr 2025 12:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745928580; cv=none; b=sGAq0uuW3iwUOGUJJ/0/L0sdNBJ7Lw5ISLdQYj0Gxbp3RBaPzLLXONHeuAXlTZ16wcVhcq9d6kZ8CJn1QFKgujDQ5tvQ3XUfoBLEO4aWvGyx9JpP+kV+b2E+dCNWOtOJXEXCqd9gRZk8qOEiP1uJao1FA1xFwdu0I0sTlPdiqIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745928580; c=relaxed/simple;
	bh=JI/M3TugvXmROCbZWvHzHoi236mkIUCGUMYXkYi7au4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=okEV2v6gGAkyL+hDFfE4EUFLlmr/Tt4AI2qCuFE10pn/4nKO+Phyee0OxwQjk7UnQnVYZf5XNsF6hsJagj4uLHwN+VAnHrkhIX9Jd917Xcw3iG7+lVinMmoeRVMR8AbkqTqhmE/edbPdWCKOn9lSbhWxLp5F3ZwGVH+MVZ1anks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkGLmgB1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkGLmgB1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TAKtur000496
	for <asahi@lists.linux.dev>; Tue, 29 Apr 2025 12:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yAp0LdgXVQkJihbVytViUFNy
	VYiIbcoCGNDRQ8jMoF4=; b=KkGLmgB1DUQVYWqXwzauECf/oT8pq4VmjVHlEunk
	60PS2gs7/H0DESvhb9ZkWdajJVWYBc8XZJ6+r3VBlX/PrWCpiVFsMOKOjWwsLZ4t
	sXQTvabHEZhXvFjTVeV6ojv0tXyQyMf+4VwIdfW/+cvhKbD2+Cptb0qLFNbYBKOV
	kCgjxc0jZnxjzNKDyp8jynZy9R89u8Wrt01rbIVpNTIlJHDyWm9hQWyDs49ffJbI
	SEEtVDUFdikzuWOxvPwun+mTwUweeuxz304qGFE9FgTXReqbnwaHZSozHf/PX2XC
	DS17DjEVCDPYU9BhBSG7uHOMyzzuv/3KfNKxuKl89G/dGA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qv9mf7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Tue, 29 Apr 2025 12:09:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c82c6d72so962324185a.2
        for <asahi@lists.linux.dev>; Tue, 29 Apr 2025 05:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745928577; x=1746533377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAp0LdgXVQkJihbVytViUFNyVYiIbcoCGNDRQ8jMoF4=;
        b=CeroFY92r9V39R+I63pgfL0E/uG0Epv5nsvcmDCmta4p7itBF4VaKCUySQP9AM4/t9
         Hg8MLm0XsnqpihjzzjG1aOURYbEqPc5rovd/MW3zQ9ft4Mqtg9JMBjOqK7itawAFkqFw
         +4xLWoYvN2U5lAMdcKDoSa7/+u3I66kyr/WSJaTCvCU/PKuTINaZ0s+CDjOOnUdHzK/U
         6ezwjoPLw0PSwrizGfiA9b9EKSIdxW0v2GHrvmH3wXsXP3jQ7o+iqzLXo4Wav6Ei4hG7
         GH5B2YqkOimTBYTGay/hpwWYJfhMpsGnkCSfnvrJJjOjkCOToow/EmyKs1s140iby3Vk
         +vWA==
X-Forwarded-Encrypted: i=1; AJvYcCVS2JK9JjEVJFkX/Osc/u665BdpAfG2OxmRlGYJDAa9hCXDfQP2O+eITQm9XEItabQX5jHaCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGYXn71bMDG4OoPT7KDmEqOvPCbCT1kpc4PN7ZDEooWzqejZ0s
	CGYWtKlDg8XKSjzqBCZANhNImAPZGPXTxleua4zAbNId1oy5wW37E9enl87wgsJteLZiQcduH2/
	Dky2Da9G+MY3Sk/Y1zrrFHeVqWbYsF1DBce48culrBER9huujzNhiQA==
X-Gm-Gg: ASbGncvo5eXzbItcPUqHAo0n++fVrxjPgPoCCENhN0yw/MnX3l9xcrmOv0pi9QgqdXi
	XN016Xc1ExZvKfW3JC6SKxlq1W2odXGtUgTI3XaSuunErCAWingEtqwk83YHQ+pE6O6E58LpSIx
	1AfYTK68O/g3YWBKMTQWTlPtVAbJjm8HsemPVqNr3RLKO4o9ysrQVqYpzu2mJzela8bgDSeafQ8
	MSTBcO+oBVig+vwvBYmdi47O8xEkuqlKjPftiuf5wakDydNlkUlTCNIEUckNqQJiQHYY+APrWb6
	yiXWjL+Zi/zwVCQdUTHzTKTZCyWhglHIdo+2ZQ/vaCO9XKm3a1Yd0PhTPLu0uM9VX2UZBUI7/Gs
	=
X-Received: by 2002:a05:620a:8802:b0:7c7:93c7:83b8 with SMTP id af79cd13be357-7cabdd8fac8mr556720785a.31.1745928576983;
        Tue, 29 Apr 2025 05:09:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+WiBW2dMdMKjL5rCtckyag5tI3q0y87zTTMxYAoMUgZTNEX197tRyQ4loVEQ9A423pNGqNQ==
X-Received: by 2002:a05:620a:8802:b0:7c7:93c7:83b8 with SMTP id af79cd13be357-7cabdd8fac8mr556713685a.31.1745928576612;
        Tue, 29 Apr 2025 05:09:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d16a85ecsm24278761fa.72.2025.04.29.05.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:09:35 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:09:33 +0300
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
        Anusha Srivatsa <asrivats@redhat.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 07/34] drm/bridge: lt9611uxc: convert to
 devm_drm_bridge_alloc() API
Message-ID: <lg5hhtncppqy2vreut2z7h36mmnuzn2xhw7asrjmftqg7koaqh@as6jetr3pw3b>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-7-8f91a404d86b@bootlin.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-7-8f91a404d86b@bootlin.com>
X-Authority-Analysis: v=2.4 cv=AO34vM+d c=1 sm=1 tr=0 ts=6810c181 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=iF-wyJFYdUVxq7VKmwgA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: zXu-gh675esTWgIV1utoR8nEqpXiam9b
X-Proofpoint-ORIG-GUID: zXu-gh675esTWgIV1utoR8nEqpXiam9b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5MCBTYWx0ZWRfX4H/67O8ypv5M KzCCKKZHYsOJJBjyaoZLrRQS+w8D2wUUiWPh8wlXAEntZGQGGKtRA8+vG/Yy6VhSUaQhLa06Jq2 Sk9l5BTlJCTnR17dikNFsqbAnNfh3/LHKxoj18+15rOjCnD3psKwgYcrZOaWKqdKeqZlNDOiNxe
 Kebn6Vt4N6kDVjMt5HQCVnoxLKJ9IXEwzIM5dZIjUmgdUvgInI3MHBR7x8yu0uL4qGew083UrkU E1/Nr581iAHx96NUNbNC07S6jI6vP0sJhg3HW6sxgAb/7FFOKWdRWlmOuUIrBFS3iTFPdokDDPp y0ILM40ESjHfNQGFide1MTXVNM4kqaRgl+PgzKoyJAUmi57hojXnaj7xcW7LJ77ZJe7hyAsPsWd
 vEhkQobFHAw58+wSX/bs2+RtGOrtIwAhPLO8MsvCfvuACpq/XndvHyNSxRLXEkXOf3eaAkSu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=868 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290090

On Thu, Apr 24, 2025 at 08:59:14PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
