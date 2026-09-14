Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33040385D99
	for <asahi@lists.linux.dev>; Mon, 14 Sep 2026 09:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378249; cv=none; b=hhDhVZN6IA/Gc8RhBYtZr4FlJ3CQqLQoeS3YOuNJcete0Kh6AQhcCdeG3eJimkLdBI3Ho/5LcC7RealaBPSHR0PL7X56hsunWtP4NwArdPSJ1kuHY3Ws7XQ6DfL0SzEDREFB2dAX409M3ToBN9FwkmSoHUjfDebhv+hUuSLT2Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378249; c=relaxed/simple;
	bh=LaWXu73lrgxnM+WOLeLQIIpfXYsTiC4ZzLiUEwSFXJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SSLqpqQBq/J1TVP+gheTu8qfV9eTyivxqhMZzdc3NJJdC1lt8TMKn1yaywsZUPwBujG/i6PLetNioByUh4CT1SN6fpyUaIMtnzwMrSjsMNjQ89SyGhJg7Wsb5fH/+PaYoaKLVLc4Ul8S8kuex4/GP6vM8mUSHmCLwTrJkvgiR2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JaxEYh0A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZnEVUj6n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JaxEYh0A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZnEVUj6n"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ikUo4057510
	for <asahi@lists.linux.dev>; Mon, 14 Sep 2026 09:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QwC6/Am/Axhts9IelVPAe4AEzQV5uQbp1jHkK1vCAXs=; b=JaxEYh0AgFuASaKu
	libuXqFtXFTaPSkzhi/TZSqE/gMgE3Kb5DiXYnnO6C/lKjVoTG8Z3/iEDGoqZlpY
	MdSHWPMqmEzhmVjY0IjxWAVv6la9fSa2lqPgYVstXCEoxwosnzIbCyKbEwHGCukC
	of6ehNzI13uGONMHKCG7OcAM6k9HnXXSeU29/4BWE1x8BQJG9TSUNug+niSMA08/
	JUBE/ORKYw5lisXX3RMUPHKN7+g1o7eHm1TRTgH+ZtSNTe6FNLzjakK7shCMnr0j
	julbwe4DnRPkHv+9ViHp7g1e88xbyktL1c+KX0bXZwybjYzzJ1yJH1sDBPo7UNs2
	sHDSeA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hssrhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Mon, 14 Sep 2026 09:30:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso545768085a.3
        for <asahi@lists.linux.dev>; Mon, 14 Sep 2026 02:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378246; x=1789983046; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QwC6/Am/Axhts9IelVPAe4AEzQV5uQbp1jHkK1vCAXs=;
        b=ZnEVUj6nnNrpBam7m52cZ9XjOkw+yBQXt+aOE1THn+L/qpKpTNnfu3fY7toOg7nDRx
         68ZMqJXu7YK7QtrN0XA6na4hPMmNQlhkIM0/g1vAjPVZ0IETSZWr3RmMFodnxSocZ42B
         +F3V6gqVDousI/W+6+C8+zZXq1vqzpQmeuGyc9Cr12NKSoFQfyH1nFon2w4zBTEvJBld
         UFSH5yUD1xlCspxfabrz+l324/BYb6Od3FaxoMcnJTjhmfaWsV2LAFngL/vcj9ErW1QL
         oCOrwi7wRlJP36BiovxHzsanv6kV+/XaGpOewJz5GAc3G4Y0wETOLJSRdmhcnXnKcMuO
         hILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378246; x=1789983046;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QwC6/Am/Axhts9IelVPAe4AEzQV5uQbp1jHkK1vCAXs=;
        b=ccLWZEjhul/QUZKPMa0dj5ytU1VlQWDMK2YDDIwiybYtdqeF4qVqIoynUe4aH9AY16
         01I2A9VJiZoh7PycqfFWeoW5dGb9QLI5n544vNEcZCtTUKJ4ulT+ncspjBDH1LZX40wM
         6xd0zyN/Vl91oIT7EdgENuksU22cTXCH3mShYf5L7y8SXdyC1pTSap0Dx5ZplvRjJPh/
         grh8w7NkGUyTOIutqwdP070zVHmCVQ6K7JCyMnFD38tTpyBpTFKBcd0W46aGSwEq94lK
         6e2Be9MwZ8oDxt7kcQODdtxK0xVkll1NtESqbX9BbP2ReD2uAZHGT+mtYNb4kkzoFMze
         pxvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFQy3FGtiy+TcPvUeoBeUgixWUFJsJDF2LN4DU2ui0IgQF0Wl3qq0KY9UwTjbnGKDSD4IhjA==@lists.linux.dev
X-Gm-Message-State: AFuF++n5zLQ9eMwoeiwVvpxHZq+b13kNTPdcK/t+XgPrb+84TuwfOkTY
	E4EU8T5NnGI5hhAIeBhRBqmbp7SGYpQ1EJ6ABeLR+X5vsYXd4MxWVJTLWRnlqsXSV7Rfx+TVlbI
	yosakgTU4uXm9K4tmDXi/atkyY8GIvpv6KENHVkmFETgVn1mDLf62IeotMA==
X-Gm-Gg: AYBFou3EDTCcXBlEvt8eGTz9Rew6/Pwo+cM2uFUgTsc/4N9SjlPsM0jWkR6aJwY7tY0
	TqdXuJK0jmH+Yn38FCPcMb9J4WV7ZTwLEmDemt48Gs4HT/V4w2Lt5wIGbIGaHgmq3JKBN4wDK4h
	Pi8NeqJ9bIGXVrMqnJiwsB4tkgoA7NokZ7pTCTxxldoC3+smqKYon3s+sAROKhi/O+LykT/mUZe
	TgxHMQh/nhYadsS7rX/wvIv9Mci402c7hdw4hAaPZ4x+YoitNeb9nqzoTwJ2jdKYBr8XbemsFax
	oMPb0ZWdttI9/z0exfGQ/rMLMAkmb+IRArb0zdNGmEAaAonmRgSPMSbcfG+46Pc3aOmNsEDLNXQ
	E3oevutvVCmigxwvBHyoBf31LXP19
X-Received: by 2002:a05:620a:1d0c:b0:939:f9b6:47f1 with SMTP id af79cd13be357-93a29a3955bmr222695485a.46.1789378246579;
        Mon, 14 Sep 2026 02:30:46 -0700 (PDT)
X-Received: by 2002:a05:620a:1d0c:b0:939:f9b6:47f1 with SMTP id af79cd13be357-93a29a3955bmr222688285a.46.1789378246009;
        Mon, 14 Sep 2026 02:30:46 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5968cf3sm3895022a12.31.2026.09.14.02.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 02:30:45 -0700 (PDT)
Message-ID: <ad4b454e-0774-4870-b743-fd0d82d0311a@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 11:30:40 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dt-bindings: Use consistent indentation in the
 example
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
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
References: <20260913123234.99988-2-krzysztof.kozlowski@oss.qualcomm.com>
 <aqe4U6EJ0cGnV+Al@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aqe4U6EJ0cGnV+Al@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNSBTYWx0ZWRfXxqmsUiH+u8Sb
 ghu9xaPw0lffnrZXYtwphEgCZe7UPH15TwS29hQ2XAVQWXPz/ylRi8pjZeBc9OxzbSwgJvdNkEY
 yoiLxJaVg921LCxFXVps6dv2mppVl3gO4K4H7JY/3b7H5D+A9bRCIRT5X2eg6KrSnPlwqevAlEQ
 /fjP6476I4GuKvT8dmLd1UYKHy8oEk0qh0u1zQarzxgzuzTIDOwo6k9zWEctOub7fOpKEWDFTug
 mci0zxO+xTjj1hW8qSJAzGepplxaDqmN4fceO7WGTQdl0DMFSZaTVSeTEBKzIUYjSM+GzGatH1V
 3SJ0idSG59K3MDxr24oqhHKgfV29U8Ngc5slhVEUbxfnrmZdxcQ75duv2yvsMBxMQSD7Ima/d4A
 2YGwY7gZadRzS0F4MVMwNxds7mNZ1KKBfx0gKleo3YM7pRYcu0TJgOreb7I2mFxnOpc7gID/N2D
 JLcGgzZd2zGhmBj70Rg==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7bec7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=chZs0_0Ys9iI7aL1xjgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: QthYnBcjqlIH1yz3EF5XaAw6Fbo8ODGi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNSBTYWx0ZWRfX3yR7QjairrGO
 kJp7r3hR5PtA2l9NC3jDmVN6DbHfV2CROCT3jbjGkKcsJ4/b0n3rRs92v0EJ+H0gEcNMclx8urf
 bKNfCVHuhZTYHmyb4NjauXGKAEEij0c=
X-Proofpoint-ORIG-GUID: QthYnBcjqlIH1yz3EF5XaAw6Fbo8ODGi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140135

On 14/09/2026 11:03, Charles Keepax wrote:
> On Sun, Sep 13, 2026 at 02:32:35PM +0200, Krzysztof Kozlowski wrote:
>> Correct indentation in the examples to consistent 2- or 4-spaces
>> indentation to fix dt-check-style warnings ("example 0
>> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
>> re-indenting entire example just for that is too much churn.
>>
>> While changing the lines, correct also node name to be generic in
>> dialog,da7219.yaml.
> 
> And cs42l42 which you also fixup, would make sense to fixup
> cs35l45 which also has a non-generic name and isn't fixed up.


Yes, I'll do a v2.


Best regards,
Krzysztof
