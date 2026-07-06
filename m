Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DCF3AFAFE
	for <asahi@lists.linux.dev>; Mon,  6 Jul 2026 04:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783310542; cv=none; b=m4b5I5umOQq18JXRWVWzd1el8sgrUr+tfvHPGEFOGhmJouVGfBEsuGCWC1J+Cvw2MGSmIpfSJ5yUeP2iWxWggPYJJCBJqWWSLYjaDixXcbc5e+nFcyUuQ50zxV0nTFYLGXI+ma7WDD+R+ta3QgPzNDeu5/Phq7ZdytpWDHrbbS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783310542; c=relaxed/simple;
	bh=/zEYG/OBL95Gx+ohWenrEwBrbR/oRwYUWrQ9Ykaz6mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X7wgQIUTg1CQYTC0blJgCzRi8i4h2OmQW5puQLgiRwu4k/dhgJ9E/7yNsmqDHqUEDcTho0XHoZb+k7pA5ICjdhRO85pUq57hWFZcwYL4uxfIh1lQ6970stpiKrtQLRsT6mj5azNUnMTzezHbsHXANMBuj8fRfgO8fyk5ZhAzJuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l+8T7Kr/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VcExn64l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l+8T7Kr/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VcExn64l"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641WdC3402248
	for <asahi@lists.linux.dev>; Mon, 6 Jul 2026 04:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xYD6MPNhjaepPf2j/e7u1phNicmKefuDIWGw2TPtec0=; b=l+8T7Kr/uK4TBVTU
	Pcq2uNQWgznHCUVF8Qmxsw67O2OAN+nsf6KRaiPXzLCONsxvRKUZ4vI+yl99aJrq
	tVpZERs5rRgBWlIROjEBXbuTDLMgxDOn7H8npFh/Ymse+K3bomTsmztmn5Rwk73j
	nkyY38gI8nAyl94Re7RikK+nYVm907iR3A8S+vxeBgIVmbRxLwnTWT3UVB9nurhA
	4P4qYnZntKBVE33u8YDID2KTUtFHPJuU2RCkYlyO330kFpDeq5ismBB1OysQ/ATg
	xEZe5gS8IrSeDF7jyPn64X5Lcbnp9BsHTlpCyvFaLYHAXYdIEBsBBSbK8Ggkm2Bl
	gsaPcA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgm41k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 04:02:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c9a700dc0eso19875235ad.1
        for <asahi@lists.linux.dev>; Sun, 05 Jul 2026 21:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783310538; x=1783915338; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xYD6MPNhjaepPf2j/e7u1phNicmKefuDIWGw2TPtec0=;
        b=VcExn64lgGKoLqn0fuxuZ1aMXpx5ayzWbmc2YazmmHxB8tiBTJjVh4H6/x228sMpxW
         fehj+0/cUG6s0S+F5LcK8m30sBhLzfdEOlmwl2z6bVcIBKjp+Fww1jDfnVH6/0Li0Akc
         GunHbz+Yomp6bzyacpDuahrVGFnMG8w5XwWttEIye3rNIKXvuIMPHaXoY0MWD+N17/uT
         sd6JwCcJC10elkhjB/tQiLdn9hgKBpT0y6nQKgWd6eeBZr4fufy1RbhmyDowkVJyPEPp
         H2xZ5usCgz6l0ABw17gXuZHzPyM91dgMRHN3s7+8C69rwZn79NMekrY+1fz6mD2TisxW
         v44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783310538; x=1783915338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYD6MPNhjaepPf2j/e7u1phNicmKefuDIWGw2TPtec0=;
        b=EDEAL/6VcFzo6Cs2Kyo+Ra+3Sp8uIJNmKBsVgmLConkO9bv6zolvQD9ww5OySz7akH
         95PHvk1fmiiFxNuG8MCyjCowv9losdYnL3/R9uakaYSHoiaNZIZZzLX/niQdIX1CZuP0
         F6YoyssWSUr1MgX0bAfuZCx7W0ZllGlqBdn+IOGuCMJvgkuSSgz8Y8DwBTomut8+V1dt
         9TrT3XWCUW8aNTUpiQ+BI1PbslW8jYJWZchVKbtRgwvoJIIlybT7qzsrLw6x8vfqXYx7
         48YHEvic3L3ta0Nj5llqj8wDQBKdJ6dVvDEWandinsW3qRioSf1dx+YhNfzleAbY7LOm
         6qrg==
X-Gm-Message-State: AOJu0YyUyY7yN5+ch2HcJ6iDxGtaUdn7kT3q7SMj1RnHSdfHp0vFy4PY
	G9+0FASbt+9ZZ0i8+hFsUPcvSxP1+FxDKGFRr1TuM8m8M2NQea+zAWeV1oYHyuFvJw8KZtZRRW9
	gLMUj8xmwbIWwiVIRnYBLMgCNqwsFDFgUB2fRMm8Guqqs0RsvrwUWaXAwEQ==
X-Gm-Gg: AfdE7cnD/wP4VpAsrmoIKaJIvIef4BnsaT5Pq7Sd2WnbxBxF1v+iNxsfVH+bfXv8gHC
	S3XVOWdcoH/iyQN7pK2w9i1isO0dspC6guxmgFZulQe236Yf1YnC+2H2twO2uoVJNmPux9J3LYH
	Q1rWPbCPJHl7KSYvNpa0w9kyTykejJMy4IaCzl9iL1N7ERLSZRoALffWineqnqPl+39y0pVJ4zT
	y/qB04mqGo6BLqx/95GlScZDaSXOpqL2SDcJIezR7bTdzV3rmgFGhM4A6EP4CWyuZ5n7Lr4rsjg
	ugMBMfanQEd/PifL5T9SVQvSZtitGW5l559+xkezev2jKtW656hUDYAIiyBA9WRIaRpcNTlcAh/
	xi0tv1HSSlMdZZ5y/NFk39xqz2HGlcYFe7ODQtRVKpDtSz4e8SNgKZyoKYb9rzPnMeB3D4SaeFc
	MJZw==
X-Received: by 2002:a17:902:e78b:b0:2cc:98b4:e7e2 with SMTP id d9443c01a7336-2cc98b4e9b8mr26412305ad.44.1783310538322;
        Sun, 05 Jul 2026 21:02:18 -0700 (PDT)
X-Received: by 2002:a17:902:e78b:b0:2cc:98b4:e7e2 with SMTP id d9443c01a7336-2cc98b4e9b8mr26412065ad.44.1783310537847;
        Sun, 05 Jul 2026 21:02:17 -0700 (PDT)
Received: from ?IPV6:240e:45b:7f94:5e4f:58a7:34e3:be58:6dcf? ([240e:45b:7f94:5e4f:58a7:34e3:be58:6dcf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7765773sm42121215ad.40.2026.07.05.21.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 21:02:17 -0700 (PDT)
Message-ID: <70ef1fd5-ec5f-40e2-b5fc-f8e1978bc87d@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 12:02:08 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: apple-soc: Calculate frequency as a 64-bit value
To: Sasha Finkelstein <k@chaosmail.tech>, Sven Peter <sven@kernel.org>,
        Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <20260703-cpufreq-64-v1-1-c406c705319a@chaosmail.tech>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260703-cpufreq-64-v1-1-c406c705319a@chaosmail.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDAzNiBTYWx0ZWRfXzRnibdYdBU1S
 bx7K7arPSMykx6JXAeHvwDez2exA6MPnJwBq2UTjk5gJrF862wYVcm6PwaSo+mTx2JT43w+gCO6
 s6ktCGUDX2t5YhXSpzYTxAj8llWpGoA=
X-Proofpoint-ORIG-GUID: z7YXmzIvymFTmjkjeM16MoDiRCrRH8zn
X-Proofpoint-GUID: z7YXmzIvymFTmjkjeM16MoDiRCrRH8zn
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4b28cb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=xkNotnLeK6pRB5HCSP8A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDAzNiBTYWx0ZWRfX3si67YKr5Cy8
 KKcKm9PqfQ31XZ4D39Qq8KINWn1Ta1vnhsULaEnK6DlgZuPrvYa+0ZbFQJh8Uwnfhccypopy1Yp
 Jzy5v2wIk4ANqN+5V1fiJY+5fBwDTwBhHCTg5PvmNLsL/jkHlZ8cDLm/ath0m/9mpFOUaD6QHiN
 KqmaZCZ2VYYf3S3KYQ0HVZiVsWAJhgtSP4pnmKm+kC4FZxSSUeiPv61ZEvaw1tBi4IFmAOkbWzc
 1ZUSP6Ft4ViW4FukgsIGynhK4SEHAvFsE1hqj2yLTEFoAHVLWXhaRQWVj6MYSVcxzizvshmWmp2
 MFnFedFJuv6b0SZKK4/FuIO9LtLGXprcKfJ60VRCPfOtP2RzHrAnIOlRJ4oHTc1QANZ1gBOCGqH
 ueu5v+pK0rIZJVC+fhgmKcg4LiG9MT1KlhMbkuioRhcYqfAZFtQ/xQ1u6HqndhH/e/NxY/1fUL2
 A7LeCWcC+XCP4S2Oa6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060036

On 7/4/2026 2:52 AM, Sasha Finkelstein wrote:
> The current frequency calculation is done in 32 bit, causing problems
> if run on a future SoC that can boost higher than 4.2GHz.

Hi Sasha,

> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>   drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
> index 638e5bf72185..6a0f1d36578f 100644
> --- a/drivers/cpufreq/apple-soc-cpufreq.c
> +++ b/drivers/cpufreq/apple-soc-cpufreq.c
> @@ -288,7 +288,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
>   
>   	/* Get OPP levels (p-state indexes) and stash them in driver_data */
>   	for (i = 0; freq_table[i].frequency != CPUFREQ_TABLE_END; i++) {
> -		unsigned long rate = freq_table[i].frequency * 1000 + 999;
> +		unsigned long rate = freq_table[i].frequency * 1000UL + 999UL;

A couple of minor comments:

1. The `999UL` doesn't seem necessary, since the multiplication is
already carried out in `unsigned long` due to `1000UL`, and the
constant would be promoted automatically.

2. David's point about using `unsigned long` for frequencies is worth
considering. That said, the type here is effectively dictated by the
OPP API (`dev_pm_opp_find_freq_floor()` takes an `unsigned long *`),
and this driver already depends on 64BIT, so the proposed change seems
reasonable to me in practice.


>   		struct dev_pm_opp *opp = dev_pm_opp_find_freq_floor(cpu_dev, &rate);
>   
>   		if (IS_ERR(opp)) {
> 
> ---
> base-commit: 4a50a141f05a8d1737661b19ee22ff8455b94409
> change-id: 20260703-cpufreq-64-2a23d7261e09
> 
> Best regards,
> --
> Sasha Finkelstein <k@chaosmail.tech>
> 
> 


-- 
Thx and BRs,
Zhongqiu Han
