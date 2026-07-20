Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA903CCFDE
	for <asahi@lists.linux.dev>; Mon, 20 Jul 2026 08:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535799; cv=none; b=MViAFqsSQWgJcfPWJuRBaFWoAtYUkPWWQqjmjN+4/LLmThIqDK3FOgWphTZMvKgwzUFXtggVK0Ms1LeKZRXgu/58nIooN+9DriUhBaBz2QUVOZ5UkQ22Jjug6L3Zy+1f++dpTZ+meyGqbvyYwSm1QDPveL9oYNVGKFT6YJpWIKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535799; c=relaxed/simple;
	bh=8xulqPcrGT3G4v6kMgpUnZtZlTdQx0MSEYnJpaZgohU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dvLC1dnuAAxxsuV/U2IBCnQNAMeaHU6RAOy37zZYMu8DM0OYH97X5z3Rp7meJHjtidKIMpluajD/022ToAm8W/lFj2R0JwW0VEUlY46cDk/py3DrSKZnzBZZ/fUEFy26h+tpEHEXrg0fA0LziUCcHujncK1joDXvQqv+N3hF0eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CkVgk1Ih; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kz6B5kzV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CkVgk1Ih";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kz6B5kzV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RYoY1506325
	for <asahi@lists.linux.dev>; Mon, 20 Jul 2026 08:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YdHOvi6op9PZsp0dCdMAIUCpZ6ygglE1WyUlQZxnVkw=; b=CkVgk1Ih0dV7+IyQ
	Es3Q06Bw345082P7HpCeFPGlxI6iZQDQQyVeO2wnFJ6nEWLotxuEAEs1C0mpygnJ
	WDSE+pcDLL2q99BpBfrvlPnVUoHF5kWXq1Jd+qpwnNy2V2zMhQHJDLPh+MaYNT1L
	cMtFPa1NZD/3n+P/mlyacQ94Cx7QYgDtd/SGZIaVSPg7hiQ3v0VQG0ZQ9e4bsnMQ
	Hvz5h0eKO6KYdrEmsIOtkFVmeOgw6HD6FoIwruXrj250UKIjPvJqL53tJydBXNzh
	LwPyWkT1+gGJTvsvhgIs5zb0vI87yXpy4L3W3n8VeZWo1wPFRcvselcERU+0tt0F
	/9NbPQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bvw5h1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Mon, 20 Jul 2026 08:23:16 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso14068979a12.0
        for <asahi@lists.linux.dev>; Mon, 20 Jul 2026 01:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784535796; x=1785140596; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YdHOvi6op9PZsp0dCdMAIUCpZ6ygglE1WyUlQZxnVkw=;
        b=Kz6B5kzVEH/QQCtx97h+Og3irwvtpbJ2wZ9GFgOrg+pU9uECckcytVCN3fm+yNAs7p
         AQKjAeK6DCv6fmO5VgQYsaSoe+Y3TP52M+glydHhGMLgCR5IRME/84SK9rC5PGPDcGlA
         vZ8285iS78uUNH1YW2A+bYX7USOWbiuLBn8l5Ml1UbPJli0Yvyk5Gm+Fjsi8gv/Hnq9P
         UHgjcW/V4J2FTSX5qiZ5VBPfKX0qY+2LWB35iV6xzEWCzhqQUpnmD8Ed1soqQag1IXoZ
         vger2Exx/OipuVdUk5YxQOmmRAT01OpvDwUFXdk53pugk1N3hH2vbaVCZny6A6pCZQsy
         bjpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784535796; x=1785140596;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YdHOvi6op9PZsp0dCdMAIUCpZ6ygglE1WyUlQZxnVkw=;
        b=Wa3zLNkikM6hlfqkcwr4dxLmFMKuY+SICI/8azHJ8Hq+wLYavCCC5tZMtZxorYg2l+
         VB9xo76T2R97S6dqO+j/ss/lEivfzPQ9leX8XoWQHbxaP+q9yaZWmUdm663yREayEMj+
         PYnUAsKbPN+GlNu4hOdkCpMfNVxA83egKW/7+PpfR6NhLcri7j8A/bsXok750BtRInAe
         vrm/xBpoLqZhX0DNjvkHz1+0CCMLD5kXS7o7XOKsYnheHC771p38vZC6/ysu4haRSXqL
         34vmhZNDRXUAxBM8JGFRys3Cr9iRginVABOJEUdlNJHHVitQENr6MvlozVx4nhhV0vV3
         owgQ==
X-Gm-Message-State: AOJu0YyWvVTN4kpcYcOCgpZWQ5PNDk/MMveRPFxgUpFWdv29FEYYc6uG
	lXE32eFTjOpSoow2Hdn9yc7o0QL2TIaU5A9VLeSKftwn0cKucM0kcQfseOYZo4+ojVWQq9QqZ6K
	LKZmBPmYzbav7H7lw5LgaD7KywZYnoRa0ycVj19kS2a+wdiiS4zPHd79BNw==
X-Gm-Gg: AfdE7cn0kQOAo3tkKNfCNe0dpXKp5S4tD6/EEeoMgazzMMzS6WrzrSa4V7Uk/jh9PSl
	ko3XdgKLj3qeCa5cQGcNuBXhFyGP6EJ/WnwhAv46a6/Cfbrr3rK7HJV1eBYmnqf6BefDe788JB0
	v+OAClC0iKEsawZgfixFBqPmr+g6+Rd3T0vDQeMJSUjxvR6DVQ/k2WagAvP5GImdhsJd9xSV6bj
	cg/V1nfy1058rZbMSK2drlo9cYxVxpHmbEQMT+UO887FgVtJG92ITZ32wMmvN9XhCg/Erl0KYUl
	q1Ke5JoXq/HwFp1mTAVTgDFmo9dqTAEveXI7/lsF7WjspYj5caSYg8gJHPHJdOJslWNBWfsA8Uy
	2ZZ/jOH1WnGgE2sddQn8ZFYGE6f5H+WpT9Ov9cbFXoNu9y1jMX/ZeJKVxZnVkVT5bnkHYNrDb
X-Received: by 2002:a05:6a00:391f:b0:847:83bd:6676 with SMTP id d2e1a72fcca58-84c2927e709mr13775020b3a.17.1784535796238;
        Mon, 20 Jul 2026 01:23:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:391f:b0:847:83bd:6676 with SMTP id d2e1a72fcca58-84c2927e709mr13774994b3a.17.1784535795785;
        Mon, 20 Jul 2026 01:23:15 -0700 (PDT)
Received: from [10.133.33.234] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af9f00bsm5233431b3a.56.2026.07.20.01.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:23:15 -0700 (PDT)
Message-ID: <cefa6f15-c20d-42f0-a39e-6582a841b595@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:23:02 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] cpufreq: apple-soc: Calculate frequency as a 64-bit
 value
To: Sasha Finkelstein <k@chaosmail.tech>, Sven Peter <sven@kernel.org>,
        Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <20260720-cpufreq-64-v2-1-72bd9b4e5ca0@chaosmail.tech>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260720-cpufreq-64-v2-1-72bd9b4e5ca0@chaosmail.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 28Lx-mGWV-41-47Pe1WtYvJIwM8CXYtD
X-Authority-Analysis: v=2.4 cv=EcH4hvmC c=1 sm=1 tr=0 ts=6a5ddaf5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=iQvuD4D9eR7FdX2dW0kA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MiBTYWx0ZWRfX7zU/O+rRcthN
 jHoPweNX+uZy8lgOdMhuRrfDye9ChQCuO3ZrIz53dTbaLhwvGM/0BNpPBO7o9S6/XWHZoVN+d0a
 cMRqrGVtRsXxyakzYIBqp+tc7nAWeuxWzBKjHVrt4L/ZnFaKvMYzJNJK3JgpSnwz3KI3L/mvw6y
 wQEdBWute27ORQVVNKfYrBTRp3nzuMeOiqsF38gTdy35P/4FlQUbUlxovCIQt2t5lSmMYnLKWaj
 sLvfU96D+OGFV4QS/BU3SqUViiwZ+11skohl3ta6qyv3aOPlEXa5iTjbR6V7ixnts009ls8n5Q6
 evljUeRXq+w/m5C6ufVIQqszZJmCOSUbpKQoMy53qDAvkH0pvwjF4kyMRgecGDARh45iuBCch/N
 rlkZwkz4cia7623WcI0K+dHnidEb5U8Y048ja3kEUUzD6IAgDzrjLaX0bdFob3K+n6Q6gkGkYJD
 SH26ep4NC92G2Kb308Q==
X-Proofpoint-ORIG-GUID: 28Lx-mGWV-41-47Pe1WtYvJIwM8CXYtD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MiBTYWx0ZWRfX0NNqLFEz42St
 M1LZ6lPKAVwu9btwhWU/Bot2ZZeKEBgVnxPkRevIvsKszlLfK4DhufEy7OEW04itFJQEbdYQtej
 MkSx4bcW2VTcTlni1YUXKGCz5VaApik=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200092

On 7/20/2026 3:25 PM, Sasha Finkelstein wrote:
> The current frequency calculation is done in 32 bit, causing problems
> if run on a future SoC that can boost higher than 4.2GHz. Ideally, we
> should use a true u64 instead of unsigned long and "knowning" that this
> only runs on 64 bit machines, but the core code uses ulong everywhere,
> so this should be good enough.
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
> Changes in v2:
> - Minor style fixes
> - Link to v1: https://patch.msgid.link/20260703-cpufreq-64-v1-1-c406c705319a@chaosmail.tech

Looks good to me.

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


> ---
>   drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
> index 638e5bf72185..5ad274a1e6ae 100644
> --- a/drivers/cpufreq/apple-soc-cpufreq.c
> +++ b/drivers/cpufreq/apple-soc-cpufreq.c
> @@ -288,7 +288,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
>   
>   	/* Get OPP levels (p-state indexes) and stash them in driver_data */
>   	for (i = 0; freq_table[i].frequency != CPUFREQ_TABLE_END; i++) {
> -		unsigned long rate = freq_table[i].frequency * 1000 + 999;
> +		unsigned long rate = freq_table[i].frequency * 1000UL + 999;
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
