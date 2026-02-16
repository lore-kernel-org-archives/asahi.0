Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8CA25228D
	for <asahi@lists.linux.dev>; Mon, 16 Feb 2026 11:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771241593; cv=none; b=iVH47Bh0zWS3UdfH37mo4Ble+XkUlOr68pSmORkJdQdwjVHSDTYXw83YZcvEpNH2t/Z6GwMJnyRnZWxjBL77cFlpTI6UqYauSGXd+oxR4PwdLqr6ttgDi2OsgPqU42XCNArJ53IzyDRt+uSgb6zrMcv8Sr0OiNsjYNFJE/XW9nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771241593; c=relaxed/simple;
	bh=ChFEic1PwSQE3UFd8bMc4tVEqnhtKIyfSrvydjuuJzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rSRCnqBiQI6u7eti57s4KuJuuLxdr8EFh6N632xBqlAuM4mS6/FXtUZQJueMEbrCRBGmPQBvrb73Xrq1eN+WJ8WjEsAeNkty06zlvw92NV/mOUgKjBfiErFHMrf27mCbsVCVYAqz3+BJSYQ2U9YtzgZUMbiw7Dng7yQA74X0RUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gF0EyuMc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DlNvTTq1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gF0EyuMc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DlNvTTq1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G71lg2987905
	for <asahi@lists.linux.dev>; Mon, 16 Feb 2026 11:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pIclpm9YAFgNaTOb1aVxFMRktPn4/nx7W1GhU742dSg=; b=gF0EyuMcIE47Mw+D
	5SsIFmu/a6w1MJc6tKppvNuMefoloiTrD0GQC5JAfPmjO7dEZrSm1ejwqZbEB+p+
	2ncCfF8pluKv8rN9KIXS7bPkyP5VXQmrVnCVAtIDj6l0LCK8qAgFWmGOIqD2sm20
	uRnj2Ox83ZuuuAGpo9WIiUkVGBWorX8CBZB3I5q0TfaGZSA4HWrR1ug2cpLpB1pT
	ZfZexHwe+APs4id/nkySL5qb5uqitU3/ytlU+WIbzNVslL6b6MTKzOnBHwLbzART
	owjHnCdxj3NGAzlwM0mfxl7Gglqv7jjKhIUme+YvqMNUBfXPMx22DuXCVdUz1K9m
	El1TVg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cagcf4dys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Mon, 16 Feb 2026 11:33:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb5a76f13eso79528785a.2
        for <asahi@lists.linux.dev>; Mon, 16 Feb 2026 03:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771241589; x=1771846389; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pIclpm9YAFgNaTOb1aVxFMRktPn4/nx7W1GhU742dSg=;
        b=DlNvTTq1ssjYX2SFP8mJNQUuFZLeUZD1MFCAtPw5kFqN4lRkQX/+cKjE3HinOd/j3E
         TezEQ/Hv8vgJVlk4+fExdJfBU/Brq4MusnNg7my6M6vIIrUgZQaO9qtpIAPMmAh5/rTU
         3wASAlRyNFRlzYYgA8r/Alp5BBmt4ImqTh90OsNTDtdxLt4z05WOrv7dDexcc6b8cCQU
         8roTBfM26g4QGI3w9vH5LaLYTFo/ZluxMafo/rn7M1FpPZ2YdOXgwe8cvHDZetFlqJAU
         SBTVWsipTw2zHiLh8dNq+IrQW21Hjq/NGWleTlOevGpYaPCHSrDifQsmqqdaZkQdInkE
         S8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771241589; x=1771846389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pIclpm9YAFgNaTOb1aVxFMRktPn4/nx7W1GhU742dSg=;
        b=Ja3Sd5vZeROdH9eRAtWwb5DTH/trfL3OCPjhotuPCNAt+HmE6rFTj4YAyzCHKQxjZ8
         nh+FcnROAJMkGu5E+KtI1LosyD6/x0R8tjWCDQ4aVbk0K9TpyL7oinn0Y/CxhRlpX6kZ
         6jQol3grDSGO/Cdy0Wb5qq2eWUUZSjzVJ+Bwj5Wi8Hwh6aCsK1hBbaABdHNyvJ1yWb4a
         ohlIxxzjAh5YbvFm+hYH1hNyh/VCd5yfHYGDf15ClmG4frM26RXkvfFHmbaVkupAg0ds
         ABUMBAtFWrH+Dzg/Queqf8FbrwcSvLUm4S6Fs35CDNMC2d513yL09IjGjQxcpfOS9mNc
         CsoA==
X-Forwarded-Encrypted: i=1; AJvYcCVYLRTlYWVxhqNCQmrt18aEyg2vhw40MlfpW1jhYGzYldM6AsMsVrEeoHHI533uXmTo3GWzYA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwD8fjW6DB1yqmBfCwoovJxFCuQ79Ast5Y1ybW4m67FEIRFZkrV
	yvrBXIzdMw33b8SH1iI0Sw7GijVGFyvYhact+5cKY7AEok0z5hZIjhVGEpw+sRMrzagN1hDIXej
	6at0zirPrFsn8N0MPSGHv4Msyohe9E1aZ1j87XV61nujNQGcup6zrFKoZEg==
X-Gm-Gg: AZuq6aJoo5Ouihni0T8eOIVfl3e4fWb2CvNCwPxgekvo2wxtO2ErqepevD45Nb1lxqp
	hnyy++wYqZnGNuF0kbkS2fd6rR+n5JC4XQrwk3IkLCe3YOwlFEIdJprdTgafVWA4TMTc/TNHKn7
	XMyTpDveQ2e1VpVZQjpmDnY9+BcDvs/mUGIePtMFrIyW8EPzfI6FXpvke0xg9qqrVUP5XdWLDlU
	nlVT1JDldwzBPLnKsJ4nBSbpH3+YfsBfR+ZP4Uivb3uefvwMYb+bkt0VDUTRvadLtiwv87ymiTy
	+nM3V0G3Des78Q2622aHamyUv8/KNZzlpfVdYowL0+QB8t3xEWqUnvPZmroiCVcTLoZ0ub6/RPu
	BPliABUkVmK1JqOIlk+0rbMKv1UcU+1885K/DZQCWTmD/mkDlwu+Y8CjINEVb9hCYMbDtVtVgkZ
	3uQVg=
X-Received: by 2002:a05:620a:258f:b0:8c5:3892:a554 with SMTP id af79cd13be357-8cb408477a0mr993926285a.3.1771241588868;
        Mon, 16 Feb 2026 03:33:08 -0800 (PST)
X-Received: by 2002:a05:620a:258f:b0:8c5:3892:a554 with SMTP id af79cd13be357-8cb408477a0mr993924785a.3.1771241588450;
        Mon, 16 Feb 2026 03:33:08 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7626bfesm241879266b.44.2026.02.16.03.33.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:33:08 -0800 (PST)
Message-ID: <5647539c-de68-40c8-8dd0-bf078a086696@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:33:05 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] phy: qcom: qmp-usbc: Simplify check for non-NULL
 pointer
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260216110413.159994-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216110413.159994-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: p6igXRjz5xWYAwhCJkhrnJx72VMwcYqS
X-Proofpoint-ORIG-GUID: p6igXRjz5xWYAwhCJkhrnJx72VMwcYqS
X-Authority-Analysis: v=2.4 cv=Sc76t/Ru c=1 sm=1 tr=0 ts=69930075 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=rQXAbXeZuVbgsyajZegA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5NyBTYWx0ZWRfX4/dOuKoURfqM
 l2VjUu8J23NzZqAWF+OebMxy+49t+XmS3wvOpTnGsSp90KGrhmMjULpIcdSNwbLKaKXNGXbXJ39
 pfpLDtTHgi5c3Ef/7zv6o1opnS5hFypvGLieXVchyI0cZBuP/9SBK+beigl0fzZLICnlcOCbKN4
 JTiW+in+esXt9DH0/0P6QB4QTMI62G8uk7CfVB8WeoUL366j3W9K7jKLzn5kqLmaT6+7S18G75E
 aOq4ma5e7oBJ4djM6H+/STBdesHijZSqj+YV0CCvlQHVMu/hXBzF8ARQ93Zn8uM+ZupAafWQvTh
 Kmh9DE1y2jKbW4Oh0c/T0GLWAkY1qaftvE8PSoizermere+8cixFw+YqL1G2ccV7A+dbydC2di9
 dVmt/Yp0eIC2nl0hzAoiyGMBkpWZ5kh11HQDpjqkFJv2U9f1v/cXWRRlZkr1agD8gteYetxo/hx
 sLlH68AD3vF0y7nTArA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 clxscore=1011 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160097

On 2/16/26 12:04 PM, Krzysztof Kozlowski wrote:
> Pointers should not use explicit '0' comparison, so just use standard
> evaluation as non-NULL:
> 
>   phy-qcom-qmp-usbc.c:1682:31: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
