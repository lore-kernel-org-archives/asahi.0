Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F1344065E
	for <asahi@lists.linux.dev>; Tue, 15 Sep 2026 06:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789452318; cv=none; b=Y11yNh0saJfqD1g6camJxfYYsbokSCzN03gKkOskoSJRxSe+Mhc9UDhE2VwW7X57JjwZkJKEhUb/jJkyZ05BHggT0Bq7WHlkJnl9H7qxK+7soBZpRDggNc5l9sM4cttsV6o0n5Kh7QIzzFkRs1xhwuxotuyehV9E4Aie/wcuTFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789452318; c=relaxed/simple;
	bh=lmbl0FDJ8BKHPU7iGiLSRRUOzdLjYSXjkdgoP2gRUcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NkhIIV9xWgKhsvVLcl1MmI917RlU6NKV1qgr7eQioSEYVqjfxQ6NRE1Ijp1mR6tv+gWPo3Pn8a5r3CgqHkVdC3YYlhM5V2V3I1Zurft59JgLXuaL11zWD9iTXIP1IUPRe6jOaStlYXhN/NX+t1E88MbV7owX329Fb3dx37zvQp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IYAr1IbJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WHu8UVmi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYAr1IbJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WHu8UVmi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F2nWf02298483
	for <asahi@lists.linux.dev>; Tue, 15 Sep 2026 06:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+uyBT5Zaxv1RHABZ8zEG0vkgVxe7bFptHBkSRZjYknY=; b=IYAr1IbJLqKGHlp+
	8asmbPHttAf9fAPsgi74UFS+fWXB2zYMG+GRBUm85azZODOx/3pIAfXSSu/i/kB4
	5bwFbvagZrWPOUNgmUNmMOtSw2B3A8xhIMQ5h595xLXb77yE2vHyOUjIVCOCvKL8
	Yh9Oz+g471cIkF59lwAgs5JY5Fd7nV4JAm37hAVdwzirn29fwbNa+0ePm9SfqOq9
	G7NSkTtNk2EEt9l9nuba4rvDRUNDDOb6rM+v9U9c1h08OTLPQkegwsp/wKoqVhOs
	YXbk2bHC1haLukheqGRPl6ExyoQBrMgHSXBLv+lUOau6J3TMBsu0Bj5d29FWLNCr
	Q2ymAQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtksdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Tue, 15 Sep 2026 06:05:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-912330dd4dbso12729666d6.1
        for <asahi@lists.linux.dev>; Mon, 14 Sep 2026 23:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789452306; x=1790057106; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+uyBT5Zaxv1RHABZ8zEG0vkgVxe7bFptHBkSRZjYknY=;
        b=WHu8UVmiA6KfZVqY+oYXK1pcjTR94GpYq1ONWNifptPrHwFIPWvgjka1VIWjrBaozb
         pJX39ISZhLXFsRqSEVr6xl/xMiJkyh/CQKHpLxlT7xaBfYnhyP9ZffdvWFpcnTOvt5Mq
         11YG1n9i7bOiudlM4+xN2enhKnK3P0WdY/YFr8pWJTyHjOfIZtObhb4VvoFahG4Z6AES
         /hekMhsatEVs7tHBm3JZIlqW7gINNT5ME3CSVD5V3uSg/swxH3wVTLqjrVL0eKer7S5b
         etw6mdqNuPuJYjC+oOrFGQA2T0/4sAwztNZCF0qS5rYPhDGHkOf553cmRhOwVIPTSZ5U
         fA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789452306; x=1790057106;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+uyBT5Zaxv1RHABZ8zEG0vkgVxe7bFptHBkSRZjYknY=;
        b=CQ07JHJdWpyFT69XDAbLGNs8Vrqh22JGJ82KTTu1RhaeSCryT99fyo7Z10TQHCV3P8
         U52va6al2VUSKzJbYY8gasb1bw5uMsJuVXVBfjzV6URj7jwR6mT/UufQ+KYtactfk2Cc
         Dc6OVXMetQ7OqGUPJBsP8SkArVIdAA354WCvnvQHaTtL4OdVdl+RDV7gB3FL7r/JMOmd
         FK5a2DHIcauk9x3u1aQ9rl1tacB88tlNbmiov+55ogEOsmE5WaG8odtI4v+I3megVOFi
         +Wi3O5nYj9TiiSvzzCXQu3v1vSzDMKATw7Mywkh0TDiBAjJlef3gTwimQHnj8sZYUovE
         iLxA==
X-Forwarded-Encrypted: i=1; AKwUvBwBE3tDek67t/XYeUj0JknvgTINIdnuKI0B0y/ctAWHnU2aHXJI/dnf23CSEbKt9dgYp06ujQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kNXQ8Phnj/TPh4XeFv2/fEAv4P/yUA792OXFS1k+M+quCivPIg
	K7eg6e51EbtKYAI8SygHVet1rTDODl8/Dmr2B1cg0xk3iX9FlT10XBVvDUSxPUJfG4Vuv9bEPzG
	/gYsPdxUfCdguhxqGK+zZBWHfoLdtmDC5gflQRsVeKDTGcRBtI/NLUGZbzg==
X-Gm-Gg: AYBFou1K7l25mf3bY6T6F5TNX23x1PtYJjBGD9blX1q438GyE+ulDfZBu/S/frcBZCn
	uV4i9fwSidLb/y1GZy1C4iv1S1Snzmfr09ZPFevRX3fhszNB009GJNAf7LUD7zutOIxFpRnoWhU
	Dn7VZFwtJWA1e+T4UKw+2bDcv9qhPb/czSPJu0HM/rQu3rl4J++yDfgv78Dq+o+bZbrtkRsJr9t
	6CbKO1K0lnyCtQd/GveuhZGypoPN0EN9KzcBzwm4tCMhVj13R2zs+AKp+EoYCK1LJWQjlDLxOqU
	mBisHgKodiB+6dZxGtNytSs2CUOkPkiC0LkzAxMuVI/9z4onv7e6kW/MW9yfq94GFx9JvL4HyiP
	pGEOBta3/2mE/NPNmO7JV/YIyGxPP
X-Received: by 2002:a05:620a:7018:b0:93a:3257:34b with SMTP id af79cd13be357-93a346fa956mr323529885a.29.1789452305681;
        Mon, 14 Sep 2026 23:05:05 -0700 (PDT)
X-Received: by 2002:a05:620a:7018:b0:93a:3257:34b with SMTP id af79cd13be357-93a346fa956mr323522485a.29.1789452305151;
        Mon, 14 Sep 2026 23:05:05 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb3602eesm30648123f8f.34.2026.09.14.23.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 23:05:04 -0700 (PDT)
Message-ID: <18eff59e-e9ec-4c44-8d2f-f689bd5f1832@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 08:05:00 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: dt-bindings: Use consistent indentation in the
 example
To: Mark Brown <broonie@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Khanh Le <khanh.le.xr@renesas.com>,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
        patches@opensource.cirrus.com,
        David Rau <David.Rau.opensource@dm.renesas.com>,
        Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Yingkun Meng <mengyingkun@loongson.cn>,
        Trevor Wu <trevor.wu@mediatek.com>,
        Julien Massot <jmassot@collabora.com>,
        Jiaxin Yu <jiaxin.yu@mediatek.com>,
        Shane Chien <shane.chien@mediatek.com>,
        Daniel Beer <daniel.beer@igorinstitute.com>,
        Sebastian Reichel <sre@kernel.org>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20260914093657.61218-2-krzysztof.kozlowski@oss.qualcomm.com>
 <aqg6VUKriyVANv6u@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aqg6VUKriyVANv6u@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa8e017 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=chZs0_0Ys9iI7aL1xjgA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA4NSBTYWx0ZWRfX9uOflGFtYt6O
 wDbpRlJrAJEEuWodXrPE4Zd9Zsy5/6lgB7PtsxxLpOzuc36ilavTiD4ReMu6AW/x52kSIrJdMaA
 0JH2TMVp/X8o9d9d6k7Jf+GCq0ska0OYXsjK3IDyFO7ez1haxxkDt+ijKiOF65ihbDaJ11JGcsG
 XZVUwe3vK3k4ve2SBBahJbIDgyjKGyZG/O7Unw8kG1WkeRCm5VQUs/K2QlG1Ewvc6MILleYvM/9
 W6B4fD7W2xJd7WYdKz1W6714X9GP1+Rg1H1GBZwXx+7n/l5XgxGDGL9L5gSSrmQq79TdCMksK9d
 y05bscu5whJy+dRDzJh0Nb0lxfUkiHBghjL980jcxMl2sb6G+Ov7gNLn3VOnO84NEpLzSSjSAC5
 pCQ/F1Gp+TEzw5UEhE8qBvrtkOvH2zWstZFUoU00C5LqVF2Na+OP9E7uDfZzH2/td6ivSyBqUuA
 AeuTdIWCpRgoyXbp/ag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA4NSBTYWx0ZWRfX5GMPJLpCeBVX
 604+wSy67z/wwfKWVPyrg7WzZD0n9rWIP//VUWKkdIuQeWTqj7DoIZ/gSKJC4EQkFKny4Kjl+mE
 cMx255JPHcJfo61F3M+SmzH23acJ5l8=
X-Proofpoint-ORIG-GUID: Td_fXdteGe5YUwQMQ4RwwDsU3BIcKnKV
X-Proofpoint-GUID: Td_fXdteGe5YUwQMQ4RwwDsU3BIcKnKV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150085

On 14/09/2026 20:17, Mark Brown wrote:
> On Mon, Sep 14, 2026 at 11:36:58AM +0200, Krzysztof Kozlowski wrote:
>> Correct indentation in the examples to consistent 2- or 4-spaces
>> indentation to fix dt-check-style warnings ("example 0
>> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
>> re-indenting entire example just for that is too much churn.
>>
>> While changing the lines, correct also node name to be generic in
>> cirrus,cs35l45.yaml, cirrus,cs42l42.yaml and dialog,da7219.yaml.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Can you rebase this against current for-7.4 please?

Sure

Best regards,
Krzysztof
