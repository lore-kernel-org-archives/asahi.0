Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B919F485CD9
	for <asahi@lists.linux.dev>; Thu,  8 Oct 2026 09:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791452085; cv=none; b=LAT+u6OEFBZ+j77CHpex6UNc+EzaqNUv54x+1dQxowWSgq4vesC5hmM3JdVWh7Hw+R6D0J6sIN36gF51guhu25pQRc3GG3cmfo/p+kJgA2S8nRxnDkeHL8Zzp/rWRSz15oiwI9cZmSgnsBu0FhmIGT14QCa67gpq/ee9pknxdFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791452085; c=relaxed/simple;
	bh=qDTPagCMKXfXSQoAQtHPcRyFuFiVXChd3KWcBOa3Mv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mWBrqpPIe+Pu+X3qBLb0BYv6WF6wJlRk/YuMmpRULGv/bVWZnTFfXK/in4+0IcWegf/EhV9endzGDzA2kyKICAl5SwnPc+rqq7orsGJwpdirjTEkK6dNuRa2O/iDZR8LtHi9SP0kB8Qpw5NikUiEqeCqcY7QDcEqTid3+rugON8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ewtkd9Vv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RHfZPmoX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ewtkd9Vv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RHfZPmoX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987L3CU2068017
	for <asahi@lists.linux.dev>; Thu, 8 Oct 2026 09:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NHzdCrzB5CwJNMDm2rJXhCb7qWjOLhdrunIo0lH9wqU=; b=ewtkd9Vv03MTGYw1
	yJqi99u4KX64v67wjKlDurhKecn+nlTJlKHFcpY5y9zKLUqGTl4KIP4IuYJhZvbQ
	Z+SSJ8secrzcFE5ePquEgmOE6RI1mYGzT8Ajq4yfHkXl9nK6/BWEdzgVQGzQllYY
	QY6pUoLYeiM2d2kIsho1zEJuFiRBDNNYfHSXgy3XfjVJFZnfv96iBGEZ+upHW9XH
	jS2TzYBehdQzEg38TBKCKBieMi8kOLnuNCpYll2XysIdx7+0L2PD5d2U6oEkUiWC
	YPftL/TO3NGVF9qkSSZpuzxQRrBwtiUR3d5uZr0lyTfwXDkf1JCEJeCvinFWQPvL
	giRHng==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3j6t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Thu, 08 Oct 2026 09:34:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa4e4684bso83485395ad.2
        for <asahi@lists.linux.dev>; Thu, 08 Oct 2026 02:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791452081; x=1792056881; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NHzdCrzB5CwJNMDm2rJXhCb7qWjOLhdrunIo0lH9wqU=;
        b=RHfZPmoXEG+8MVMeb7DJ0o/hM2dnKukP7HT/QBA3PWfZqQ3I2mDCmteg5c16LDdieg
         B3z3d1JON/ppspfvrfehoLkcfbQuuKT9FHQTYcWVeZRG+yo1fh4d/0fuZ/0EMMVqxWJz
         nWde39Cj/0wweiQZpfA5ST9nhIMyP76bvPpzloK8Gz98m332G9W0FfkoGaqVH04k93kr
         fckIUpPBnBLgz6KrF4GnHGXsj69NvMv9ap+1IAqJhsXVprofSvLsDlhu9rztyBsjKy4k
         sMg3ubl0pV34RU834LGXy3nkrX44YSH9hLyPamAPU3LA1MihMAhNG0ec3p3oh0TPjDI6
         RxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791452081; x=1792056881;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHzdCrzB5CwJNMDm2rJXhCb7qWjOLhdrunIo0lH9wqU=;
        b=iCpScVhPOVwWSSOTBcaR1ocdiGV5KiI+Wdvonx9Rck+R41f1jbnnnviMhe+AMtUC9+
         6I+uG+XuPrDrreDCOGeSWXZIwE2MyALbwXwrex/+/bH0aKt+8Vo1WBCLwmiOgVKsolar
         ernVgnilYJp+U/JsYdvT2qFQcMq1kVzHVTx5Ba1dT9SxcUz8PUNDv8qNApPuifVL2BfW
         R83+KfIdruT1dJoxlge6UtEqnifaJTNDHFIXvuw3BOZ3ICBdLauurHw6pl4BV882SGtH
         m0UpvplLCW1cVJ6JvQiNXUeS9rT2eMkgBI5Gs2ESEjYSmTFvgFsRV5xnuh92HPKbypz5
         vfXA==
X-Forwarded-Encrypted: i=1; AKwUvBzRtsO/n2XHS1/S18rLWQXxX6p92VB1gIM9CwuS3r8wLqPqDoW88KB9NzY16KN9ivAGAekANA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJf4liLmeuMJjTQDX1JUGGZBCdcQSpogJ8oQksBtHCv0PjPDil+
	CUqu5SmA8GmNKuYrdEKqPp2IWAlzqKowJ1SAiS+u8lLdCFcR7+1kPJoB1Q19X04D/u0RVrDQZPd
	vgpQWq3XAKCt00uV2wSZZN05EpNaMNtFeveOMQrbfh/ADy3qgBy0fkhhsPQ==
X-Gm-Gg: AYBFou0oHrQqeBFWOEH9TJFxBqjoPucRv6E4jo14qhPlZtEKKnPaPMczN30x5Stv6/u
	Nzp1DMxll6lNgx/o9aVlH+LKE+vnMpPzQqAguMomNuEwK26KMGna4SsBTHNAzXsGy+TAPM1lBGM
	I7TS/x+FGYhthcc9qfNi6biLKdvX1Z72rPB12sf2M3YR2HmEeD5NkekQUvPIB+iOahy5KtrnCEK
	bafXfKkH5Rc/cHVm0Lg2srWNlnWEYBpUCG7kZJWK4RPLM936+NEUpp33CFt9J0cyxCPh0TNSGUi
	Iru0aijdJ7PPO5tiJ9beSa8/Y8zfWcyFieknQNRoNzMGPTOYmsVhtAit42pvvWUc+Tgc7aRmtwa
	DBz2S1CyICgMhCZhTmXhNw1SIzL8=
X-Received: by 2002:a17:903:3504:b0:2e1:35f0:6822 with SMTP id d9443c01a7336-2e5ffa150bemr49850965ad.2.1791452080645;
        Thu, 08 Oct 2026 02:34:40 -0700 (PDT)
X-Received: by 2002:a17:903:3504:b0:2e1:35f0:6822 with SMTP id d9443c01a7336-2e5ffa150bemr49850655ad.2.1791452080181;
        Thu, 08 Oct 2026 02:34:40 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604a46604sm22029495ad.72.2026.10.08.02.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 02:34:39 -0700 (PDT)
Message-ID: <041edb78-acc2-4832-8500-28db58db1529@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 15:04:30 +0530
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/21] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
To: James Calligeros <jcalligeros99@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
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
        Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-11-7b47ed6335a8@gmail.com>
 <31d91f44-3f16-4a4c-916c-f4d8107d371e@oss.qualcomm.com>
 <CAHgNfTy-h8m-XBBzW6jSNBz0dVe=vXL6nJ3VOqgMjCbsK_t6gA@mail.gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <CAHgNfTy-h8m-XBBzW6jSNBz0dVe=vXL6nJ3VOqgMjCbsK_t6gA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NchzRGD4 c=1 sm=1 tr=0 ts=6ac763b1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=k_whtCd4PG3F-9RvoSsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNyBTYWx0ZWRfX7kEpO0ycGogD
 WL6xS7tPkiE2b9nzRN7Rqb4zJHv4dSY5EDjueYChxiHB5cAqqjQFlArmwbo+zLZvyrX0VstxlWB
 mJ4dEMFSrbnhkFKmmK3F8qsZy3+AghM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNyBTYWx0ZWRfX+SKz7lx6ZWqJ
 mRrj2+n/NWPJEBpnSF1yXXJ72GCc7DJC4vQfJv8a1r7S/f9gPdt2MVfhoE3aWx3PjLOwBQ/dMqO
 xAwxx3IVhzAyfWF4KsgICThEuH5CbVMiDueunWSMYqzSVojROPK3h8Byyk0SyqzmWmn6Ik6TwNK
 Vq1GhCGlJuVbe3AqeGbcJLwRRPgF/f5MOyD+ghUuhAryFxgUhbHD9PU1iuJlo+Hm1iQA8Ceg6Rp
 H0AU7IJOLdDVers5Tt8ycXYgCpOr+p7xw4BaNAQZqo7joNejr00KzOMwY0kfDe5v1JrLRTqegR2
 IAFL/OrTxku5DkFZibiWmRvjZNhzzwmMXX/i8EkAFkDeKciQIz5T8AzuAcWN9c/i2AlgWHT/0e0
 PBh77ClsPyfrMhoa3o5yIhA753NCx92kOogOHhzNrAwYoCgRgl/72K/9tSkJGy7gLU7U8huuoXD
 o7zSt3Q0SDsp9g8jIIw==
X-Proofpoint-ORIG-GUID: gb-5jI1qV4Ytw98nqAPmEE06bYtSuzYD
X-Proofpoint-GUID: gb-5jI1qV4Ytw98nqAPmEE06bYtSuzYD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080037



On 10/8/2026 2:16 PM, James Calligeros wrote:
> On Thu, Oct 8, 2026 at 4:33 AM Ajay Kumar Nandam
> <ajay.nandam@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 10/4/2026 11:33 AM, James Calligeros wrote:
>>> +&i2c3 {
>>> +     status = "okay";
>>> +
>>> +     speaker_right: codec@34 {
>>> +             compatible = "ti,tas5770l";
>>> +             reg = <0x34>;
>>> +             interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
>>> +             shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
>>> +             #sound-dai-cells = <0>;
>>
>> Both speaker codec nodes reference the same shutdown GPIO. Is that
>> intentional for this board?
>>
>> The TAS2770 driver requests 'shutdown-gpios' per codec instance, and
>> GPIO requests are exclusive by default. So I would expect only one codec
>> instance to own this line, while the other appears to fall back to the
>> register-only path after the GPIO request fails.
>>
>> If GPIO181 is a shared physical shutdown line for both amps, how is the
>> power/reset ordering expected to work across probe, suspend, and resume
>> when only one of the two codec driver instances controls that line?
> 
> We use the new(ish) shared GPIO proxy stuff[1] and it all Just Works.
> 
> [1] https://lore.kernel.org/asahi/20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com/

Thanks for pointing that out. I missed the shared GPIO proxy dependency
when looking at the DTS nodes.

That addresses my concern about the shared shutdown line.

Thanks
Ajay Kumar Nandam

