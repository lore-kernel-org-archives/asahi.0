Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444923E1230
	for <asahi@lists.linux.dev>; Mon,  6 Jul 2026 08:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326512; cv=none; b=d3SVWSk8MlJONd0UqRKP0i0IROEPwGz4IvfKCHP2GRp/WVTKHwlDfbZBZNxW7c5wd3m4emLrbHQ3n+IYqqbbfHK5+Dq0nSijoQbYhlJD6X0DtkQQDwOTNyIAn8DU7/fifI4LribTxeRb3A8ncJ12504qQGUJAyuOpPU5n39IOF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326512; c=relaxed/simple;
	bh=JJvjvXzlCcli26w+i5Hirhm7MyXZ6wjDQGioyQ2O3Fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xj+G/iwpeGZ0bE/sN16N3lZkAj28SbfiX8cOYnfBHssh5tst55RF09qDFenSF/CQ9vl89WiST3V8HCSRBhOeS3hT2DoSizAU0w9l3+TjDML3rirGU7KKb5xu/lrZV65479r+AgBGySyW7hLgN0pxmHJ72wd91HcN84Dg7zfs4nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jm0Kg9lS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iinW8Qs6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jm0Kg9lS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iinW8Qs6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666841so4156901
	for <asahi@lists.linux.dev>; Mon, 6 Jul 2026 08:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XAhBIVcIgoBMwzdmQI01e6U2QYtMrrtbbOHKP8KiZ8E=; b=jm0Kg9lSibJvV8Yi
	8hdJzAn4zgpP2byZ5O4vxPHA667bXVLXHofUt568kB49iHxnfwvFhctaInLtCjCZ
	sjNHRodxgeyEI+K4Sh5SeEFuH+eYubHtMfiWH/bAUEFyu7LxqpBoChobn1qyHVpZ
	1rLLI4FJJqj/Yk953HEONXVBT+N6ylBmW+SjTQeQEVhfTmxCK8O9BG8vaRt3Exir
	JXmS8JQhSMmJuTk8SMinF8d+mY+jVTVBRkY8NqkZa2/Ot0bSxasJBedLFZ9P4/jy
	oIqrv4PZJHfl9zhVgr7IHFht7qp40w3MPq61gyA4heu2IH0hVtB6bY7pBm7HdH1D
	jKj/ig==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9833j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 08:28:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92aea0d801dso252076085a.1
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 01:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326502; x=1783931302; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAhBIVcIgoBMwzdmQI01e6U2QYtMrrtbbOHKP8KiZ8E=;
        b=iinW8Qs6y4j2oRo0Wg44Afnpd9hDTs8gBGGyPCmqlGUEjqwJF5XSCkbfswzckImp1j
         2X1+ESMogzJkx8+EDESkddy7CqJ3q/ThQKoXxatKUpEW5iv5UyLU8btYjE8NGSGOyGVt
         H/OiLT3aHaryfRJqppuTMIUy4MjMrDNSvKd5xmp6X0rzo7LI9N64dzsbbi36sWfsNH7I
         B/DwZdhK7Vhebni/aCJV3Nb3UB/fkw9CTN0BUNz0If6snnkauCn4fIa8AjY4n6SMt7cW
         p9DiUYgJzQkwWQjvYPpi/xdGxUphGDrxLRuxXuodO2gcz4wamS1qUG00AMcPTbIpzKsM
         xeeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326502; x=1783931302;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAhBIVcIgoBMwzdmQI01e6U2QYtMrrtbbOHKP8KiZ8E=;
        b=gDNhF9QeRNEu+Og3e4FK54poRZtEsx+7GI4ELdq6Jm3TZEdls4zqjXvr06N/bRpAT/
         dhYiYPB/PJNh9cRZvCcD1E9UhM10Wl8BF4zrwmsHTJ6NHIYj11RnooocnU8AvAcV1qyE
         TgYVbJ9kketst9oSiJaeAPGTVVsNsmku5tzFzLJAoEsrcnkqwKRjD+m0II8jsNaDALWN
         LGTpqdV3CNphdNp5i227ZhWUqhYxTroxYrdz5NbLFJGztD9ypO57hjaH8fOZ/cRggjYG
         d4XshVtInyn+J6sM6pzzpgUfyZ/HGKIV9atkfl0NaZxKRS8Pj/HifK78xzdiF38ubks+
         S7jw==
X-Forwarded-Encrypted: i=1; AHgh+RqJKf9Xr9lkpF/EchYiM1ieSvev4b4wFNY4J+I1UnvX3HROu0nGqeLhPWDdbzPnyoKjHeHkOg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyrE516fAdshdldZArb1PgisUc8JejEKCY/k8cIlcqkgCMb4Ljh
	Z0MD2XL7bHrdbOl0imgeWo45ARZErPKuLC3W+G9L5P0wGarEd4J1AaitBxKlZJ+1BEwpvg3WN0h
	z01GyNKg+m+c3JXRb+wpa4cpI9ADmu4kCbhis6fKW+b1Alh/Og7GJSyQ5Lg==
X-Gm-Gg: AfdE7cn6smA6nE4z2la/C51pStxPjCaq1RsjMTPvOrF6pmZ6wamJMrXkiIrfLPM4BXQ
	ezsTj4q2Mrewm16X/MhTAvmV8eWEAeM2pfLZh868jqSFwo4L5Y8QpkruQN2qCsnE3SuxXvtwjIs
	/iMCWHpDBnmjaUGrfYLTw49LsT7JyQkclErPFKfR9RWvyy3BxBSR1y7OvZEdox2bWKyhqg1iQSy
	IjvtrXPIcJ+EgPF19pNV8gxS4J96EafmANURDB3ySvlL6m7gM1Jcz7S0ohmHteGqS4S70VY/Z0N
	ea+xFRzRLsRQiSr6CJUwciD1CrnP4ZaivhPIzIFj/Nr5o4xEAXrwHKZt0ezaPo/s38i2q+tgZRu
	RuDIg1s/O8+npXLOnyDWUElN6bZ7BkByTQxcvAfKRDtFnPbk7aaCmc8nWdDziOQ==
X-Received: by 2002:a05:620a:2b84:b0:92e:47d4:b485 with SMTP id af79cd13be357-92e9a4ed0e1mr1294197985a.62.1783326501962;
        Mon, 06 Jul 2026 01:28:21 -0700 (PDT)
X-Received: by 2002:a05:620a:2b84:b0:92e:47d4:b485 with SMTP id af79cd13be357-92e9a4ed0e1mr1294189385a.62.1783326501174;
        Mon, 06 Jul 2026 01:28:21 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62907absm677939066b.33.2026.07.06.01.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:28:20 -0700 (PDT)
Message-ID: <bc697542-b1e2-41c2-af36-b708ca4aad5c@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:28:16 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
        Chen Wang <chen.wang@linux.dev>
Cc: linux-pwm@vger.kernel.org, Sven Peter <sven@kernel.org>,
        Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>,
        Samuel Holland <samuel.holland@sifive.com>,
        Michael Walle
 <mwalle@kernel.org>,
        Inochi Amaoto <inochiama@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Hammer Hsieh <hammerh0314@gmail.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Alexey Charkov <alchark@gmail.com>,
        Sean Anderson <sean.anderson@linux.dev>,
        Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-mips@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev
References: <cover.1783263835.git.ukleinek@kernel.org>
 <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
 <973f3d6f-6ff4-4685-9c9f-b07987f74d98@linux.dev> <aktWoIfY_DdO6gb4@monoceros>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <aktWoIfY_DdO6gb4@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UStTkc_hEEecUIJxJvDTBPDhh99YgISZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX3yQSojYPYg2k
 fnt1bJHZpTRgrAUU/+e3n8uH+DAKlLCKrojmb579Nyvq1zyMD7+EwyqaMuGQ94tL0y3OJE1/otM
 WzsjtaYlirTCItU/kAYJyFw/I2IzkYI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX5P4YRNcSGtQp
 /zkPCflRVUOb6pxWp3x0jeRiFOh+ObgRC4RTQp+24bL5UOjuqPSNg9ag/acq5mDmbP5jATitjPb
 dIAjrPImiQy9vyKWWFTX8gPRgvEwUdLzI1/7dRaLdnbhRO9WYpb+135wLvxE829A4Xgo06FUXFw
 /qYIGJWc2swazZRoWSNS9JVcYw4PKxh7JJtrpkdMq8/lIFNawaQ+nX2lQDbMqTZunIEJzFRhPXb
 4SFrEwR7XiNei9u/cn424st9yjJc0CiOOp2n5j9M4nG1rIV4qRtHcloqI+GeyBXQ/oY7Wq0E9b4
 40luVl7NaNhJTG0D2NANR7WjgAZV89MVGOpfWDcACVSk9k3uof93oMS8tIQqBgEo5dah/nE0ASD
 iXWx1FC/CognOJuWcwi6dGbf9HsOrlfs00wpCXMifVIMUuzui9QcN2xmUwhZ+fIS68D7JMIHobk
 gakBuomOUjaT+C1EFhg==
X-Proofpoint-GUID: UStTkc_hEEecUIJxJvDTBPDhh99YgISZ
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4b6726 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=8pif782wAAAA:8 a=IpJZQVW2AAAA:8 a=TiEZW8bMWLlPbLH3YMsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060083

Hi Uwe,

On 6/7/26 09:19, Uwe Kleine-KÃ¶nig (The Capable Hub) wrote:
> Hello Chen,
> 
> On Mon, Jul 06, 2026 at 08:33:47AM +0800, Chen Wang wrote:
>> On 7/5/2026 11:14 PM, Uwe Kleine-König (The Capable Hub) wrote:
>>>    - Use a single space in a of_device_id array terminator; A single space
>>>      after the opening { and before the closing } in non-empty
>>>      initializers;
>>>    - No comma after an array terminator;
>>>    - Also no trailing comma after a named initializer iff the
>> iff -> if
> 
> This is actually intended. iff = "if and only if", see e.g.
> https://en.wikipedia.org/wiki/If_and_only_if .

I agree this scientific idiomatic expression is not well known
by non-native English speakers, and using the expanded form is
just simpler to review (thinking at non-native English speaker
reading your commit in the future).

> 
>>>      closing } is on the same line;
>>>
>>> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
>>
>> [......]

