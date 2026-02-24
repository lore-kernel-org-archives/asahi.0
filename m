Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AF833121E
	for <asahi@lists.linux.dev>; Tue, 24 Feb 2026 07:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771919264; cv=none; b=pICOj5Dm5zJZrZXpFYam19Gie9z/JZbhQdZ3SA2KRjh4n0QWVrACwq2ZRIYESgsS2/g2VBJVx8FMilPdTKktE3WYy7HaSuakKDTN6OmQ5+XLM/7CnrPCLQkCP7tX8VZLVYSx+nbFMvsnQucMA9U/78rWWEdrg/Jh2zFZg8Gnrcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771919264; c=relaxed/simple;
	bh=uSSCkgsucRzlBVF4MBhmS6fCMT5rOHKDP8+phMGopbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g2UxpPbWk4tH6Z49/OlhI43lQ1xuneKMOAVUCKKOMC/j3/jsa5fvtMusJA7pq0XSkN/ZVVyzif80OKeecfbIxw7LAeHbFdJSyjPIpu05Zv6LPGQSRJsWxNackLFGDQ+kSNb1k7jrj8Al/VyU9oA4jfUgQ4wvkTGKDnG6EsxekbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NceJLbXF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/GBqMCo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NceJLbXF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/GBqMCo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4Leoj2570067
	for <asahi@lists.linux.dev>; Tue, 24 Feb 2026 07:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/Nkk8MNVa9p4aBb4Bn0e8YFq
	a4T1gMfbm9SGZ2SOdBg=; b=NceJLbXFFswAoCLY4fsBziPCIjA94G8N/Mu483ej
	SSFCBFmhpx2FrmRUAku2eBUDNEZtsfcJEuCjmRp0OZjkHS4vMUD9dckAx/73YAHJ
	rpkYZDYDP6a1tkQsiA2u06/JBS0ynPfBInxGZoXyG1CopIMQ1KGLhpi9TXJuWpcq
	Hlkz5hB0Fttc1NKR72qbVx6yi7Dep0yDKB4R84KawSzV1ipPZyQpV9aIsESSPasj
	oRX9c7mlAJ/It2DadH8W43NCPCkgBkorwMndOJROz1JaIOzrzvE9CZYokzW70WSE
	q8WZkrht8EHu5Ic9nsap8TL0KnZi8Q6DCRGbNBFcT91Lng==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y3c9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Tue, 24 Feb 2026 07:47:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71500f274so580434785a.1
        for <asahi@lists.linux.dev>; Mon, 23 Feb 2026 23:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771919261; x=1772524061; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Nkk8MNVa9p4aBb4Bn0e8YFqa4T1gMfbm9SGZ2SOdBg=;
        b=h/GBqMCo86U/zrgTqhCxbdKoVZY6lq5U9sf9YFXsl07botHlrmT8M70H9qIw1AM+rZ
         nPlZWHSJmyzniyWhW9crNc88cjELsd8etYEKtIc8XHgdLp/5NS1ScFp7bm0ibl+z+0/T
         bLAip3UWOOQH6i5nRAsU/YCpHlT8JFOx8/XcN1XrkSpzwl0vk4QYQn3EOHepyeqjZ9bG
         Tzilu36Ih4XGE09mbqftFFJbMspCkwEPTsUV+MMc1SGtTXrZPalEWjxg4txooGuM8JAy
         H6qA6E2X2gGMGIEoWQq+uEXTMEprj4BNRGsWYnrPqKkyIAJfsPqVOf72kJJpFxE+gDFo
         dSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771919261; x=1772524061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Nkk8MNVa9p4aBb4Bn0e8YFqa4T1gMfbm9SGZ2SOdBg=;
        b=kmXX03NReHrFYTtg4ruF8X28Zq5wi5S40exTiwkoiyUMVxb3tYRQXIPKnAJQeNm/2z
         MvQv9N8PH9zrO2i87Y7ZJI+ioHIj7dckMfyW4X0y1+gnv3rEst8d+UWXG1K1SmQLdADM
         vfbX/tRBEhqsHiMInSSuIuFVCVpE3cEF1jVDG58moFZlcT1vOk7ryriaR90VH8+BFoEC
         KGA+W0oFT5Dr8XrgojPjB9IG1Adh6T8JApjd56nMA+/gw7gna7QvkpbrYU/+THDhctNa
         fAzBzGD3F7BAVbxt2n5hY9RNKoXXFnbHBOnniehW2FbyUJYcae2ekyeZI6quF10z5tVq
         lpMA==
X-Forwarded-Encrypted: i=1; AJvYcCW6gocjbSNcagVU5CY7AauMc2erA+iJ+/q0KFWXzXil2bM0+A5YK5hBz9WTsJtZUxr4pitx7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzod+ujkzfog9yW1Kg6L68x3aKmX1va3iHOmLYtusdILbXWnWVI
	V9qEwxkyO5hXVEfMG6f/n4ZAwl5lQ1IR8sZaQtZwvakW7nGZEhHfUPvu1QBc/VhSqBE9epJdx5n
	mS2pj2BdvilTxWbEc0emqtEku3PEi4vJFkb2XawnYO9FTWt9HkWc+LuBzEQ==
X-Gm-Gg: AZuq6aL9h3ptcHxVL5TtiYtXvcGR6tMWd/nOIfT6jF21u6csrEpEa5i7T7tj9MsgKPV
	xmVwCADz3s/TVIh4i6KrCPMFV4vqbPUVCtmp98kyoGyL8iBxVCOK9j/z9VS1P8YQ3lzDtRYc0PO
	S7zfuPFlUSU8uy8b5jfQUFNgI8KfsXVvawhE3OPowo3RqzHRXG/nOmUerSjqHiluvcHNheL2Usq
	AViMN1f4nT+Uu+oSOyxjkOARbtF6/ChTqKnDLPuClk5+QJwtJsXHt+w3J8VYSHli+UCPSmEO10s
	KiLMNkvowFFXFohjM4csLBJvzrfLJxJcwDTtit+mefLtN1w1WWM6/Re4zuQ+uTO3dZ4/slyfKH3
	EvAIiziH4vKRuoIltlf+9jOXIYmkXHh2asTAj9FhAF1zpkfIjiNPI7JBpvZJA1YRufje0HBQ52P
	fktcHMf1ogeGJIhDe9DjfxOSaVNRnlGlNfyLo=
X-Received: by 2002:a05:620a:29c6:b0:8ca:55:ac60 with SMTP id af79cd13be357-8cb8ca98dd9mr1369020985a.78.1771919260992;
        Mon, 23 Feb 2026 23:47:40 -0800 (PST)
X-Received: by 2002:a05:620a:29c6:b0:8ca:55:ac60 with SMTP id af79cd13be357-8cb8ca98dd9mr1369019885a.78.1771919260500;
        Mon, 23 Feb 2026 23:47:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb44fb3sm2024777e87.61.2026.02.23.23.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 23:47:39 -0800 (PST)
Date: Tue, 24 Feb 2026 09:47:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] phy: qcom: qmp-usbc: Simplify check for non-NULL
 pointer
Message-ID: <itioeaycenubrafp6qy7qknshokosgicgzfzndwrtpj6bfcsxf@penpm5zdqk2e>
References: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260216110413.159994-6-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216110413.159994-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA2NiBTYWx0ZWRfX0tYY9GysAwPs
 N/t9Hio4C0e0VZJIWOgqUPrIFuuqDtItF9Gbl4/Igb+fprdl+Vjk6DQWoBPoyTLHOshNwu7GsOT
 c57PWbyBnknL0qv3gqIIuOfp2WPB3xvLUR/xVcnFpublkSJvBk16rY7n0/qIKD1rLb7D5pOMj6B
 8ABszDYjSFCxwdHPtya5UX752WVM5OFHS2rojIeWcHN98g6tIUa6nDCMt9SWDFH+dDSRX0nY1vw
 zRNmtzU8Hq5v8U7L7Yv+QW9ZJGn+v3YAxwhB9AWj4+ycPpd1dglCYgs45oEaAfs9LEQpLmPOuCn
 kJFUvADmJwKUxJi3lsRXmokRv9brRsqkPqgme4GVu3J1L56uVQS9Gw/RfmcgcLghG+YuyNdAHFD
 yW7SQNg85tfkRH2EzLPLddABjaXwRNf7vWWq8LAnrCecvT7o0BdwZ+LjUByBCvGdBl2Od6pi/Lz
 Wgw1QVgU6Jtk8V8f+UA==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699d579d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=rQXAbXeZuVbgsyajZegA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: T0YyJf9kJFUWS-6zhLqShmIuzBBx8INS
X-Proofpoint-ORIG-GUID: T0YyJf9kJFUWS-6zhLqShmIuzBBx8INS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240066

On Mon, Feb 16, 2026 at 12:04:16PM +0100, Krzysztof Kozlowski wrote:
> Pointers should not use explicit '0' comparison, so just use standard
> evaluation as non-NULL:
> 
>   phy-qcom-qmp-usbc.c:1682:31: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
