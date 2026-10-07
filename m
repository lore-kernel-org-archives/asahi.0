Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE064AAC41
	for <asahi@lists.linux.dev>; Wed,  7 Oct 2026 18:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791397055; cv=none; b=a5+hxhwyQhVgpxeQkFaxaXGpP/qu+8vIHSxOCRGt9sX7sGa3jLJ5TFJLH6oLP1xQ1CKnHCz5VNMGmm951VFLt9FouCHVZGHwYrxFPQIKGnPDmlK+8wDDaQhRkIJvFvTo+r+bBME/SdpYT+hVShojJSWGxPf7WR9m6T4nM+H7lUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791397055; c=relaxed/simple;
	bh=7p1E68LhKBh6yTqP7m6fWj1obK2raK41V5zAFLXEVsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fiL4gVyNEdwH8+HCB/04aYmLLVIIQnTOxmuy/Q0V0Ge/VMDVHkM+Kk8pcUjitcgiAo+a78s+sCaM/Kn88nP0jaPBveYcv1i40RCeG3jKbcEjBN2URuA61OdY2uHO3z1gqcicx6a6ZM+Zxk4G3XqZi41mU7RcuU4yjN0aFEVNROA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FGEjaKTK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KVl5GULX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FGEjaKTK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KVl5GULX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697IBIto503352
	for <asahi@lists.linux.dev>; Wed, 7 Oct 2026 18:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HzfN1dEYOJJZLs2bxJwMzeI90eUiWQZ53IXN9K6O594=; b=FGEjaKTKiTMns4jc
	ySHa7nijzGtMIzNX1sSiTKtCsnriO7FROVZ3uqr95gbCSh1QEPWJTvdAjroTzvh7
	vYcPaHGJ6Ni6uDM+Kqv0tkvF65ayaBCtGgwTBk9gPPqQX5HrxgEOAVQtIbMNMQMj
	Oo91QuNpT9Dnx1I0182YQ5mOj09u9Wpx0oK/t9LZzDnhtmCbBYnMGadTb8IYul7F
	3Svyd2viG0xYmLfiWAq2CXnj9ztrwoWhjfIZQs/5z909hqEd8GRhoJ5FtXQHXuTv
	PhFEUlCW70YfasD5eZZt+1tvYLBw8YdQm5heGuDGBChfTtry9UsR+gRyN4xv+I4o
	b0OzSQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5pv717sr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Wed, 07 Oct 2026 18:17:32 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35158d674e1so4978056eec.1
        for <asahi@lists.linux.dev>; Wed, 07 Oct 2026 11:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791397052; x=1792001852; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzfN1dEYOJJZLs2bxJwMzeI90eUiWQZ53IXN9K6O594=;
        b=KVl5GULX7+R8v90+26ZnprGpSht7qPNhPPaUNgl/1RQjBcliW4LhLrN+KrDdCA0I0C
         nHee2BI7VL+ULM226e4qmW32J1S7NA5Wm2e6JuL3T5siJzAEgJ93aypxz3Utuep1JtCW
         8dkl604O8WEbZlv6Rbmyry9Uk2nhSd7F/ni/zXo5dSdmdafKdGrR0zHGS+PiEWWiANIN
         ohtXniGmZCIBTBbmSOGYEpPP4fHrAB7SbEGDD6y/8r0wM7mosbPA04w5/9EtGLj4uuPT
         Mj0/PnaV2pfeIk8b5UOcscXAa+3hwwxtBkEDxrqfvIh9tGDORPsDD5hMvwqMxbfD1D52
         faqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791397052; x=1792001852;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzfN1dEYOJJZLs2bxJwMzeI90eUiWQZ53IXN9K6O594=;
        b=AhKvNrEhlU7fvvs3g3VhfQg7LasYumEZ1x7wg5RU87CEsvFbLPpBjC/pbShHGjEQk0
         eSdaL3PnF80b3L3HQi56tCWpDSzGNu79tijfVTUNHTNQ3zj1HDxGqw8vyHWRRGt/XFHh
         pmk2KY+P5HEfnUBVYSHdu5hUWFh0HQqFRXu+asnNFmS0xrMcFnE4h4WPMzArwDKPIArC
         DxEgIfH+mHI2uoQh0z0PmhuorA8lNqO6+3qYNxkvuFeikIGc1V+ZYvj4y5RDmMo9FcGc
         /6hOI6WsWiWUAIGUpMP/yBC9cBZ3HJEdGyoay+nFRR+QBF0TUtqI6p4Q1VcsHQtJU2No
         9mMQ==
X-Gm-Message-State: AFq9FYI2SnEG/mX0BLgRBs3EtCH+lzucvF+COuiWpKzd7djjtbN16u+7
	l7sCOisf0p8cWjJBg8CA1ZRdkAky4myZLwn7qMYxrHvLZr28wFNT5GAQtxiXHkm3ZYgAENjxaso
	8FqJw797wiebDh+A4dMucL8srJHniQtkbwyw/sXO2SOiaSWsS2uckl0qwCw==
X-Gm-Gg: AYBFou0wROpqIqmg9OqpWRHBW0M0gakdpE7COEr/zv8imXC5xzF0j7dj0NsLhz0ceWQ
	1ZhqkDRhklDhsH2FIrZy48yxHozxoBUSrjR+nDnB47WxCtg1QNmehn6aSJSggJNAJI19ukYrZ2K
	4uK82pEBAWvg2n+AjjTbXSnNWzGXmD18FLPfqqG/HRQVC/OBxt2YoOX1LrE1ugex/04Frluahyt
	4w0pZrWC6svBjBEjfkkRTI8Ok8xqjHTFRx1cJfjiijBR6jrMbZsSIfRgLMByMyNyS2mXxETXWLP
	iAHGlM4rxUsR3W5WlXtWlJoApn6zksQcRximdSYDU64ORSvKAqfshHnKEBj0NPNFFaNaESi14DG
	EdF6+maBzMaEYxQxE0BMfKXl0utHB
X-Received: by 2002:a05:693c:894f:20b0:351:69e8:d419 with SMTP id 5a478bee46e88-35169e8d438mr1958411eec.22.1791397052098;
        Wed, 07 Oct 2026 11:17:32 -0700 (PDT)
X-Received: by 2002:a05:693c:894f:20b0:351:69e8:d419 with SMTP id 5a478bee46e88-35169e8d438mr1958297eec.22.1791397050030;
        Wed, 07 Oct 2026 11:17:30 -0700 (PDT)
Received: from [192.168.1.12] ([223.230.93.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351735e316fsm980093eec.11.2026.10.07.11.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 11:17:29 -0700 (PDT)
Message-ID: <126c4b96-f50a-4ea3-8df3-a7118870a5a0@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 23:47:18 +0530
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/21] arm64: dts: apple: t8103-j274: Add
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
 <20261004-macaudio-v2-10-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-10-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA3MiBTYWx0ZWRfX6vku23rAXIaY
 XzqLkKvZs7yThOskp+Ky7OHDL92XqHbTWo/4/05e6ZnpdmAb33b/NmO4lsvwqzF6WgSY6fuUj9T
 WRqAwI2yBDmpHeY5M8BNnmvOKev8aOQ=
X-Authority-Analysis: v=2.4 cv=J4I/fwnS c=1 sm=1 tr=0 ts=6ac68cbc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZXy6yrx+fn+bJIgs5eQ1WQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=UKJZ3Gop6vG71Bmy1WEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 1etekFTmgr2s9KDIkt4uiNLi0iRik5uM
X-Proofpoint-GUID: 1etekFTmgr2s9KDIkt4uiNLi0iRik5uM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA3MiBTYWx0ZWRfX3NvriZ7Asa4L
 uQIBvBYU97HCAXCEcndEU9A0R6kTC2+zaVAIPcIEUoqi9ioNpD6OPghYSTArlKtHJOJ0u83dGl5
 1HcasJY3UrWkomj7FMQH6t5zhYmFEfcMLt0cq6pSkmsfQGXlfOTm0SWQLylDdBf8TJN5sw/l9qO
 Sh0JDdgLybdWlpZJqYC+JJq3dDOFNSG3VDdjBWBqzKsULTSe6oRHMGVzjz3tm2acms0lVdBHlwl
 +7bUfMngyClUD/mIIStqMeYsVaNaMMo4Y3ulcjcdKasYkvKcCe2BJn05aeECh0rGrguEjfKaBZd
 EAMjO+Hg466RfnW5h45HeXsPxXZfF+hFiDWPN8TLdswC3ooIUDOyltInllDf2YwvfBApaJUCB9m
 MQij7QnCRf8CQniNdyo9Mju/Ip7ZieSGABOIybnjCd3Z+G6eF+9Xu9IibQuvUenNpYQbey5yrkv
 XjkhRsF3j8/KhdHL02Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_06,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070072



On 10/4/2026 11:33 AM, James Calligeros wrote:
> The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
> and Cirrus CS42L42. Add these nodes and advertise them to the machine
> driver via the sound node.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>   arch/arm64/boot/dts/apple/t8103-j274.dts | 67 +++++++++++++++++++++++++
>   1 file changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
> index 1212852251e0..6121e3a89a0f 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j274.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
> @@ -75,4 +75,71 @@ &i2c2 {
>   	status = "okay";
>   };
>   
> +/* Audio codecs */
> +&i2c1 {
> +	status = "okay";
> +
> +	speaker: codec@31 {
> +		compatible = "ti,tas5770l";
> +		reg = <0x31>;

The binding documents "ti,tas5770l" in 
'Documentation/devicetree/bindings/sound/ti,tas2770.yaml', but I only 
see 'ti,tas2770' in the OF match table in 'sound/soc/codecs/tas2770.c'.

Is the expectation that this node should bind through the TAS2770 
driver? If so, should this either use a generic fallback compatible, for 
example:

compatible = "ti,tas5770l", "ti,tas2770";

or add `ti,tas5770l` to the driver's OF match table?


> +		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
> +		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		ti,imon-slot-no = <0>;
