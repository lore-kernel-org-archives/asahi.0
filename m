Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0313D75AA
	for <asahi@lists.linux.dev>; Wed,  7 Oct 2026 17:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791394613; cv=none; b=mkoBKK5gYLF1G1Of3mYhwQbirhJUA8QCseU7Z1Om+Iwj99FVnZK21gen+LJoPchKFUGM3xTcUn7qie3CSt1shPUwWs2lit5ffQVDSvBL2EgGG/5UjTzqqnsaWb1DjO/aT5ErDmBqMCudN62j8bUpd441T/iXj4I+/LvLM9mN1D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791394613; c=relaxed/simple;
	bh=+6NY74n/C5omuO9JoYsGCZJp82CiewUdJckTC2HfRIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mbnk2ys2RpQdyV+2dBtObxtymGKFkgH0t4KlU6N5XoGnt6IC4yEUi1xMrnVHp6CC921PrPgAn+xqYnfUJjJLBu7/fFF+59ldC1ZyXN8ZlknN05FGD+U35K5VQ26U0CAUnfvBJgxhNV9L6YhtjERsfeQYVej+FVmlSTQR4E8avfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GWkuaMYm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eTkAP0qc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GWkuaMYm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eTkAP0qc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697HJLF4031067
	for <asahi@lists.linux.dev>; Wed, 7 Oct 2026 17:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ppSelj+LbGu462DrTIiLj378C/LDIJk0hCQ7sXm9YU=; b=GWkuaMYmvttLGWdx
	Yhyxy3cHPd8w1tL64rsju7EXYjQiJaEpYJutWTHO00eHVlC1pZ7Fshjrr6O6Co1t
	fOAZ3B/3qSpZatwz9JwsVmkksLP3/EbGFfF5rjx8wPAIA0acOi5DIixp9DXcoro/
	IN2ZfK2ug/Cz4wRfTZrNXkP5CbqZGDvB76CbjhpKXo57iUP7ZCjemJW2BhDnZdSb
	JAdwkmD1wG3cxrNilnYkTVWMuqpv+oJ/Zq0AXrJPaxykgRePQ89yLoHAWW/Jf+1Y
	SYOuB8gXGtY7E3tMCfN7CRnQBbbDRomEVPhuWHfs6KHYXoJWwrWbDCTvr4FGk8sm
	7GNd7w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5tck02s8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Wed, 07 Oct 2026 17:36:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88d2d26a8d5so2367800b3a.0
        for <asahi@lists.linux.dev>; Wed, 07 Oct 2026 10:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791394606; x=1791999406; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ppSelj+LbGu462DrTIiLj378C/LDIJk0hCQ7sXm9YU=;
        b=eTkAP0qcCPoATC/z0/c/t+iMfEZ5tTdJOS9FaCNimEZhPyXbQekY2v6dLWf1MJJEBU
         VLSpyi5Rv5HcggR59NcOZ0B85dDjItSnubqHVurepX9bZJcxmEyLe4s8WsJ6oBXZ0+ax
         /SFXXxt+A5+wBJKYuG9cP8VC9oLiaEbzhGCe/AySE5lSZZAzBo/IBDFPPnlI1avBSQtJ
         uLdLftxQmLdzrgE0tDzYWpul4JkwbX4k0e3I/Tt18scxx8ORFy7mwupzpriwvsfLWyqY
         gVqUHp5JczfU4KJfDwx88YxkPPQX+2W6grpdKRV8rwhpi49F3peKEatCBk9kDsCNu/CY
         C3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791394606; x=1791999406;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ppSelj+LbGu462DrTIiLj378C/LDIJk0hCQ7sXm9YU=;
        b=ao6MBMzsP3ZaT6UE0hefHO3K9fPTqQTv4/39uAR3+pcq6PaPuaM0c0YoTbKQzcygFp
         uW+TdeMELBpg8CBzdnEwkkVdvfY16kcCHYYLXF0hNq/M0CNy0ZtVyU8UzDp63dIsAnlr
         Qx74Slsr6CNHy1aTMFhgHEqcxyX1bl4siTXJepiEaCWLRoWpyyzjZjlo+VgEa0JutmNV
         rmPCC9p0O6xDLzA8gu1M+4A4hBu2uDcc87qnT2+vVCBkksKW7mcXh74jpYFIOQAc8DEv
         0ayo2G7K68QBY7fbU8r7UP183Ipax6Fn5NdP96XdORCS2dlyxDoqUEMvmtZ8xI1KCgjF
         k2jg==
X-Gm-Message-State: AFuF++m7oKlCLn/3XP1DY90vFwdabaRsdtdCxFNPo/SorL1BsQ4fOjPl
	VDCbQuMPDGEdgRw0AY4L8yIkCFy2+G+Km7hH0SSvNeFjN8lVIvGD0uB6Kx08ka84JBU31T+Enjr
	DjSMm7PXjLjUt+vrb4kTQCWBXJqzCHuub7fL4P4DDfSdmaCwFvSpA+UsjSg==
X-Gm-Gg: AYBFou0TtqTzrBN+IAPRI2kDcMYSMNAo6DPEXWDvAYaG5bsdxkHCCxiKVG3HzQdsfGS
	iIxhdqCG1aDKSM4BKCj57vgbx7plFrn+CmYarJTQRaEWYi0HZzMzoq/jLxY3R3ycTjDtiO90M0g
	AG6tK/8yTN/Gvb5ZH9bfIqB1PnWxnf4RFVIqK+NwnxRF+2Y3J9d20bxZvdddOTPS4+Qv5eBhinJ
	M+zn5ge3uO4gYQQhej1zOaUzZCMUVeZJRiF1+T0SFOyOsPMeqNnywksxQKA316wy31V2fCkebz6
	TTMHjkAytvHMm8aWnTBsYtFJiOiAtSqbvyLVhUWr8YrBpfI3tWobQI2Q3+XxYRXSFN1XqZO1e0l
	dDUNBvWxqfpHa79B5JUMNZP8jZ1Z3
X-Received: by 2002:a05:6a00:2350:b0:87d:b6d3:256d with SMTP id d2e1a72fcca58-8904434a3bbmr4021101b3a.2.1791394606326;
        Wed, 07 Oct 2026 10:36:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:2350:b0:87d:b6d3:256d with SMTP id d2e1a72fcca58-8904434a3bbmr4021084b3a.2.1791394605829;
        Wed, 07 Oct 2026 10:36:45 -0700 (PDT)
Received: from [192.168.1.12] ([223.230.93.214])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892bbd8dba3sm616161b3a.53.2026.10.07.10.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 10:36:45 -0700 (PDT)
Message-ID: <602b728b-d94e-41ea-bb19-dc8bb3a0e9e5@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 23:06:35 +0530
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/21] ASoC: ops: Introduce 'soc_set_enum_kctl'
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
 <20261004-macaudio-v2-7-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-7-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA3MCBTYWx0ZWRfXyVGMjpIYxOyp
 b9CRowtH6Oc2BusT66cJbyLSXZbY2Xool28yIwaBqk5+vosNjPsC3pKMoKYfMTo74x1D5HMSStH
 ZGZoPki1MgQPUaYtmzHXBoOvqgn4EevXGNNsQYlnhG00kAAOveUjan5ugXVDfJQQiBPKaOg7c4S
 xUqtbH9yxl3sBVuOnSN6bJpi7yGXv/JQy3ZL/1BWH41K+JU34t4jqXZvMHqHyWxVIb5DZcklM8+
 0yR34gwtfaxasmhM+v9eLXgyGNTYXvQrthFdO+8CAjQJlJ88+CRnpvb/axO+WtBbINfNhWLMvyE
 /CwDnboZ/vwAHQilr0eNuVQRimJNpjfd4g3sVzcWtcAxfEvYJfkRnQbJcfoZB7AHNBRoIsiWidR
 bVAqak4MdIu2oNbyLxA2rJnwjCR+lbPZuLjX1cSmzsXE5ZMfMCALkgIGohA2Ymw232DXQLunI9T
 Xpt+FSlvXM9+AHnR0cA==
X-Authority-Analysis: v=2.4 cv=N8m8hG9B c=1 sm=1 tr=0 ts=6ac6832f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZXy6yrx+fn+bJIgs5eQ1WQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NwbpVL58AAAA:8 a=pGLkceISAAAA:8 a=xWCIabhjMllZ6jREgyIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=tNWvAHffTtQgx3ZTRG8Q:22
X-Proofpoint-ORIG-GUID: 3eEmP-ul0f9I8EK-Z5rbBbOdjPOuRaWt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA3MCBTYWx0ZWRfX8kgZO3mCKu5d
 jo2iTkGvXqWY8uvcBhO7FL0JTOlsT79h2R9+aknWpOwhnLfV1aop4PUurzflbOQY1JPnVSqUB+Y
 z2k8PrxuFbuBMsgFvOl3aZUdy9abFoY=
X-Proofpoint-GUID: 3eEmP-ul0f9I8EK-Z5rbBbOdjPOuRaWt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 clxscore=1011 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070070



On 10/4/2026 11:33 AM, James Calligeros wrote:
> From: Martin Povišer <povik+lin@cutebit.org>
> 
> The new function is to be used to set enumerated controls to desired
> values. It is something a machine driver may call in fixup_controls.
> 
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>

> --- a/sound/soc/soc-ops.c
> +++ b/sound/soc/soc-ops.c
> @@ -505,6 +505,75 @@ int snd_soc_deactivate_kctl(struct snd_soc_card *card,
>   }
>   EXPORT_SYMBOL_GPL(snd_soc_deactivate_kctl);
>   
> +static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *value)
> +{
> +	struct snd_ctl_elem_value evalue = { 0 };
> +	struct snd_ctl_elem_info info = { 0 };
> +	int sel, i, ret;
> +
> +	ret = kctl->info(kctl, &info);
> +	if (ret < 0)
> +		return ret;
> +

Could this initialize the control IDs before calling the control callbacks?

The normal ALSA write path does not call `put()` with an empty ID: 
`snd_ctl_elem_write()` resolves the control and then calls 
`snd_ctl_build_ioff(&control->id, kctl, index_offset)` before invoking 
the control's `put()` callback. This helper builds a zeroed `struct 
snd_ctl_elem_value` and passes it directly to `kctl->put()`, so 
callbacks that inspect `ucontrol->id.name` see an empty name.

There are existing enum/mux callbacks that branch on 
`ucontrol->id.name`, for example `rt700_mux_put()` and similar SoundWire 
codec mux callbacks. So this helper should probably initialize the 
callback objects from the target control before calling into them, e.g. 
set `info.id = kctl->id` and `evalue.id = kctl->id` before the `info()` 
/ `put()` calls.

While touching this, it may also be worth heap-allocating `struct 
snd_ctl_elem_value`, matching the nearby 
`snd_soc_clip_to_platform_max()` pattern, since the ALSA control value 
struct is fairly large for stack use.


> +	if (info.type != SNDRV_CTL_ELEM_TYPE_ENUMERATED)
> +		return -EINVAL;
> +
> +	for (sel = 0; sel < info.value.enumerated.items; sel++) {
> +		info.value.enumerated.item = sel;
> +		ret = kctl->info(kctl, &info);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (!strcmp(value, info.value.enumerated.name))
> +			break;
> +	}
> +
> +	if (sel == info.value.enumerated.items)
> +		return -EINVAL;
> +
> +	for (i = 0; i < info.count; i++)
> +		evalue.value.enumerated.item[i] = sel;
> +
> +	if (kctl->put)
> +		return kctl->put(kctl, &evalue);
> +	else
> +		return -EINVAL;
> +}
> +
> +/**
> + * snd_soc_set_enum_kctl - Set enumerated control matching a name
> + *
> + * @card: where to look for the controls
> + * @name: name
> + * @value: string value to set the controls to
> + *
> + * Return 0 on success, else error.
> + */
> +int snd_soc_set_enum_kctl(struct snd_soc_card *card,
> +	const char *name, const char *value)
> +{
> +	struct snd_kcontrol *kctl;
> +	int ret = -EINVAL;
> +
> +	/* Sanity check for name */
> +	if (unlikely(!name))
> +		return -EINVAL;
> +
> +	kctl = snd_soc_card_get_kcontrol(card, name);
> +
> +	if (kctl) {
> +		ret = soc_set_enum_kctl(kctl, value);
> +		if (ret)
> +			return ret;
> +	} else {
> +		dev_dbg(card->dev, "Tried to set unknown control '%s' to '%s'\n",
> +			name, value);
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_set_enum_kctl);
> +
>   int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
>   		       struct snd_ctl_elem_info *uinfo)
>   {
> 

