Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380C74432FD
	for <asahi@lists.linux.dev>; Thu,  8 Oct 2026 09:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451786; cv=none; b=W9STJgpITEhsOiioJpNjVMXHuor0mX36Rvai4SxCkXUdES+eyX0A/c7gc6t718u+9P8ZtyL6I0V/xcaR33XjuveLNOgbkvz3jViecg8bS3orap0H/jlMhrDbBsAhmpAqKkao6Sv6f161n155TiWTp1zvGgICrBzUEwwqkQ8bljc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451786; c=relaxed/simple;
	bh=1o0m0qm/3wEfMh2Dfbs0Oz1kXCVOudS0M1hkMoN9am4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZUmtNwlR2giFe19VEyy9KE/t6cUtPhvMMxPKwrqh2ibHE7wv46lOqoNgOJxImnGrjIL+tsdMk0Y7zgQJfZdF1Ys8/xPOLy9RcMXRQKieSRwwwEnaC/s76NUDvGc67EeqGFR5EC9XOBzK52wBjXhmZXtZBJHehsSmfS7HXL4Y90Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ffMQqqlr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VBfQ75dG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ffMQqqlr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VBfQ75dG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K3OX2189789
	for <asahi@lists.linux.dev>; Thu, 8 Oct 2026 09:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3sTNTjoZI3yr2Mv8Xvms1V7V9EOCR4IuljjYgHchvNQ=; b=ffMQqqlrngRc9MV9
	3LljFSL01DDjGEACnX59qfF16x6zKB+5G67wXlhJ4wUv4zv8rwm2FOzyOtnbG2Bv
	YiC1BE1yWYDxH8tALMOCUoES5FGood7IUrEQkeNZeznK0x3Xto0q9/bydUAPSyUe
	ZB15fNOF58GzTRGUTkqpNMobZk0TenZxxmkAlnUtnhmsTfx6txntq00BGf6W5/WJ
	CsQ/lEOJOkZgU4BCNSkNEtjO1zEauOqElYaKLf0K9r1xsVavJJO2poM+sauiLGp5
	75/kHFny8Ap6JQT1DTgCNgSXVwqR3mvgd+m2fjvqpoA5NbGVhMYVKmTLoZJfDeXc
	QwHcCg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3a59y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Thu, 08 Oct 2026 09:29:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ccca9481fb6so3342254a12.3
        for <asahi@lists.linux.dev>; Thu, 08 Oct 2026 02:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791451773; x=1792056573; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3sTNTjoZI3yr2Mv8Xvms1V7V9EOCR4IuljjYgHchvNQ=;
        b=VBfQ75dG/CEOjzGLrPGueUjrusNKHFDqFJ/z8+R18v+FFnZ694u7WjszLR7vRlXqoX
         xfyAeXmu+F52DAtavuG8kTP6EqoMtE7LW5sqIHcCyF0yg3pilLUePJ9VbqQwUc7Vtfdd
         Qv08NjVD3APo+1eG3+CmCaCifcNUWdsllTYvLumCzzgJGIiyoyLxHVABb/9dXcZJSEYh
         ycEuFPfmTBcLlsCk5KjHYN/6q6cQMHuj3U6AjaH+KbxnNjUbooZkt9KacNlpbabP35f/
         AUryNIgRS4SM9XdFOu8LDBRvsQPYMe2gRnAJQ4dwM1QKp4+eLgq/wIzkvcmGBbJGC4tT
         /Qnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791451773; x=1792056573;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3sTNTjoZI3yr2Mv8Xvms1V7V9EOCR4IuljjYgHchvNQ=;
        b=R9KxkJG3oVp2D7Fbve7Ujkg8ve0EQzb0ux6eNbool+0UxkGFr1zoj/RSH89rAPLGeN
         hVssy+15mkhVsBxo3JGnsGQQ5D0Gu6bsdYOoEpCRHee8GNwk15Wa6r38xDJz73xE/++1
         9nIcgDeKjGqJBVj7yY3OdHUfyp1OuBxifuw/nqGYxTk4mbFFEItC/RqSQ3196YwaS/hZ
         DPpsdQs8aOqv0MRVN7fXEIYtWfrnseJIQJuN4leYWfK4UAFtkHj620Ok5NPv1AuurIvf
         TdzD6r9chWs+O+WXS8E8BGXumZVzu2pdCPMLH20c9MPSl7pYQweYdzI5XuaovAz3lD1x
         s4Eg==
X-Gm-Message-State: AFq9FYI3mDq54AhIuqe7FJbIRtG0TwDhOIoU+QX4hn5di6X01RSRcRuU
	NyLOn2MCwMSXnLZoWl/ObZ/ZMpQV3mL0CNQx+GLejjBZ5l39SrGHNaMt6ShBS6Ot8sFWraAH67f
	rhHTC+bBfwLDccmPXqcKfCthl3TdXk0wroEVk+qVKLcqslQcvPaRbnKUF7g==
X-Gm-Gg: AYBFou3+Dp6vu3BfV9jYN2e3MAKZ+NP+jmqixSzESBY54KY+O8bnx42tcH1115eNbOh
	OI2vV89fifEZXp0xtd1nojrVRZJbNLoTHoYUN+AUAPbZGODpwDB3gsL+XX9yunFD87Os1V37Cep
	3jZSNgtCxof+p+OnY2TTESiXNHlar1apGlTzPdc68od9CnDqHgGdytdr35IqsN5p56ztz7QROlB
	ZUYc2BDi08CZSCMl0ckSXQLhE/hF6n1GT1gr90FLb0ySlbe9J6I80dLVOzfFLdaAp3VlNPNVxkG
	JRhjhmCKXKwqd/BpJvhhJp0FzB72d8hszcUr+lO1acG1W5xxNhd53B+58W9PEkaIQoO8e39LFUm
	ISvEEEPGiy94xh+C8HOjh2ASjlg8=
X-Received: by 2002:a17:90b:4a41:b0:3ab:c80:9362 with SMTP id 98e67ed59e1d1-3ab0c809861mr582617a91.35.1791451773139;
        Thu, 08 Oct 2026 02:29:33 -0700 (PDT)
X-Received: by 2002:a17:90b:4a41:b0:3ab:c80:9362 with SMTP id 98e67ed59e1d1-3ab0c809861mr582594a91.35.1791451772573;
        Thu, 08 Oct 2026 02:29:32 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a79babsm3415638a91.6.2026.10.08.02.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 02:29:32 -0700 (PDT)
Message-ID: <dd8a9faa-9d6b-4846-b38b-711df8c2d6a8@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 14:59:22 +0530
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/21] arm64: dts: apple: t602x-j47x: Add
 speaker/headset jack nodes
To: James Calligeros <jcalligeros99@gmail.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, ajay.nandam@oss.qualcomm.com
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-21-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-21-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac7627e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=oNl7twi5fxIAqsTzne0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNyBTYWx0ZWRfXwTAd0ktK1Xfi
 tZjdKpeH99drVYvw0fA6WDZF8DWgnxqJ4toohSu6Lfuy8yKYG4ruRITavzaOki7KptmJejZsv2d
 ZS9YL0h4daN68DrXrROkaA+NIWh29nk=
X-Proofpoint-GUID: UY0dnkzfLHT97dIamcsBDXL_pCWlJpw1
X-Proofpoint-ORIG-GUID: UY0dnkzfLHT97dIamcsBDXL_pCWlJpw1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNyBTYWx0ZWRfX9jr/8I0Z6vI0
 Gh0Ni4jtN+0LbqO7e7i+tFqGszZMJ45gJrskYRXWVb0UFFlEUHCOO0n7fK1tswutnA28y1OyDPE
 58pN+xC4REVXhBYVZ1h+Uat42TxBXEIljlw9RnkZhVXMq32ZfXkG/38na5WWEg83sB3G8PmtqPh
 xAydDgj8UDU1HNehoM6IMidBYG8VoZHXSGggNZ6DiRU7UVKh+7dYHpM/VvNNNTxeNQ/I56KKQbC
 6nyBzC4zCZSErvNWSw4DaqawtfI460zjwJ8TH1MiXWDG5bWGqiB/IRkj4UwC0aNAt3IGU2Pwff7
 +J2T/E9uMLIojhsfE+EilnresRBZNDHvv7cP/cmJydv0y9Dwa77NJWPqdXP7zsE18yY2vcBogg4
 /uZ9GnOy/7aXuwZUiE1q+Qijx8vskXHVqxzKuhqr4ccXOfAtcFqeemW9B13w7X+JbdvgRNlI4ct
 jlh4cIPwM54VzLHQRug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080037



On 10/4/2026 11:33 AM, James Calligeros wrote:
> The M2 Pro/Max/Ultra Mac mini and Mac Studio integrate Apple-specific
> variants of the TI TAS2764 and Cirrus CS42L42. Add these nodes and
> advertise them to the machine driver via the sound node.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>   .../arm64/boot/dts/apple/t6020-j474s.dts |  5 +++++
>   .../arm64/boot/dts/apple/t6021-j475c.dts |  5 +++++
>   .../arm64/boot/dts/apple/t6022-j475d.dts |  5 +++++
>   .../boot/dts/apple/t602x-j474-j475.dtsi  | 10 ++++++++++
>   4 files changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
> index e3c2635d84fa..7b4c4ef471be 100644
> --- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
> +++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
> @@ -46,4 +46,9 @@ &pcie0 {
>   			<0x300 &pcie0_dart_3 1 1>;
>   };
>   
> +&sound {
> +	compatible = "apple,j474-macaudio", "apple,j473-macaudio";
> +	model = "Mac mini J473";

Should this be "Mac mini J474"? The board file is t6020-j474s.dts and 
the root node identifies this machine as the M2 Pro Mac mini / J474s.

The fallback compatible to apple,j473-macaudio looks fine, but the sound
card model string should probably describe the actual machine rather 
than the fallback model.

Thanks
Ajay Kumar Nandam

> +};
> +
>   #include "hwmon-mini.dtsi"
> diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
> index 9fe17f1f7f59..f8f776f9eb1e 100644
> --- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
> +++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
> @@ -36,4 +36,9 @@ &pcie0_dart_1 {
>   	status = "okay";
>   };
>   
> +&sound {
> +	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
> +	model = "Mac Studio J475";
> +};
> +
>   #include "hwmon-fan-dual.dtsi"
> diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
> index 32938a3bf96a..153899f1569b 100644
> --- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
> +++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
> @@ -73,3 +73,8 @@ &bluetooth0 {
>   	compatible = "pci14e4,5f72";
>   	brcm,board-type = "apple,canary";
>   };
> +
> +&sound {
> +	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
> +	model = "Mac Studio J475";
> +};
> diff --git a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
> index 926bb4ab77af..7f1faefcf9bb 100644
> --- a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
> +++ b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
> @@ -36,3 +36,13 @@ &hpm2 {
>   &hpm3 {
>   	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
>   };
> +
> +&speaker {
> +	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
> +	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&jack_codec {
> +	interrupts-extended = <&pinctrl_ap 59 IRQ_TYPE_LEVEL_LOW>;
> +	reset-gpios = <&pinctrl_nub 8 GPIO_ACTIVE_HIGH>;
> +};
> 

