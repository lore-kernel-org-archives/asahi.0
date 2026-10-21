Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575883;
	b=UgIz++TJwkNlkHr1hPgSn+z9jjulc1NfU1yUS2YmJna+M7hf0jX55+zdWZO8lQE1+nal
	 s4sBmTk9+s1aiKmEu4vQOdPGeDIXLorwp1siFYKd3bkXNyaGFr0USkFcLpy5HeQrCQppd
	 IJI1fQfYY14AfmtJEFeNHVJgBcFueaRBbiHhWqGC/qZDLEUodufIlMOU8aE3y6eRJMiQj
	 DRim49Yuq9dhDJ9Njr4jdLoNumnHw+HfaNX6PjNSlNI44QlONxnO4slygCM+jW2IfSEcw
	 bRItR11CBPKtnHLSmOafBLHcEDl/bPfVgXrVDFQH2aPo+5CYMqt97FjG5g2B9rqPHGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575883;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZICGnoDUzzWlAQIxspOsX/uJiYZvuNvYB+Jhm0X2C4U=;
	b=X2Vf47zHik1vydbKQzEfP7bnfGZyELWVyTKpBluGaTCxHBKQ1TMQ/mZODbGRVR4jLsnJ
	 I0sEag2fbTGqMOYol/73hF7FLlq2T/e0WqPHN06TtBfioCjnrAraIO8URVu0/KXPLRw6U
	 p+IGvqDw9AIRCTH0tmUlzn07W9qy7H3h6oxrWmwOtYhexCX4QJl803Z0WgOboTXqi177z
	 0uJFBB4POj8Q6Js78dMIAZAf1xamu/IXMaqFADHlVb3A3MCk1tqR3SpBFfr2oABqjjUVP
	 xhbLg8Fzpp7/fAyG37eS+QIeLn4oMDRSjxrbgdy4EmEDX1ODXz/ymSfMqLH0ZI4tyoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ahXk7078;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dZFbn7jY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31E4606A31F
	for <asahi@lists.linux.dev>; Wed, 21 Oct 2026 09:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E31E4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ahXk7078;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dZFbn7jY
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jCnZ3711978
	for <asahi@lists.linux.dev>; Wed, 21 Oct 2026 09:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZICGnoDUzzWlAQIxspOsX/uJiYZvuNvYB+Jhm0X2C4U=; b=ahXk7078Eg6/b5Ya
	BEW6RV60mcxyAc3S+r/XwNQA8a5FhN9ioUdntl5Hh2qEPJaAB6KJuZlvz+rwprEr
	g9xvPfooth56P+Qs5KIVFP2xPsqNgZwEUq5snCTWrGa5e0dF2G6yPPYDAGQItnKg
	81trmTb8mz34C1Dmny8QhvNV3lb85iZ+kxmKXeA2I2S6OZ3yk9DIxFvB+qojIotU
	Z48gmHMqxhI7tsRmT7aDo5PSGmiAvuftosIIImUw7c6r+js6IcXjgqXE20fKdRBV
	4WH7b66ZvGpz36jOQ+09QSNZX1NusCJY5yu+W3FdP3QLkRHhpjiCi4AfJHXpISgh
	DhIygQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v3c1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Wed, 21 Oct 2026 09:44:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so8498085a.0
        for <asahi@lists.linux.dev>; Wed, 21 Oct 2026 02:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792575881; x=1793180681; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZICGnoDUzzWlAQIxspOsX/uJiYZvuNvYB+Jhm0X2C4U=;
        b=dZFbn7jY/mZMQKRPLDJJSXjh7ZMDl3YM6xdcYX1d7GJEoTTEJbcIuJWIikH7BTHwhU
         oHLGFd5HUPd6dLtT+h+Q3cVFTyJXxRAf7ffQlbdgmLOOGiLDgyrL0hdIIjm3ctkLox+Z
         Pg73axFajVNqZ7ruUhIC3NTkbfLXpEFSkdqt6uTkUi4slc2TbrBEfgX0Pb4wZ74TGS2B
         cF8roNWzZgHVv1F5X8ZYyeBlnq0ISTfyu5c/DR011eWl7djUPxMSK8aEkU+sXoL71zPf
         ZcgcYFSujzpLAne2jK6DlW6D6bL8+riL1V/9MwLHt+STb4TMaqX1RQ18DSxgVkNAxp1J
         nQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575881; x=1793180681;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZICGnoDUzzWlAQIxspOsX/uJiYZvuNvYB+Jhm0X2C4U=;
        b=ZPc016QCcAhqep9QaA7KXZE8P+SsByMvs9skh+ztGaXotjnEswwh+HNOCR3JzbtXgs
         +Rc8hVbWQIGr4nJq24HQtvNp4iRFpdzw3Gv/EjWS6tNjyGhIwcsiO09vjhMJeBGW3mqD
         dn/Y84IHocCqXmaEgbZloouCDvorNdkm71D1i3CT6XVxZeABgYQsImxr8fGbN6wyyCSB
         jzTjbbVC+eMoZXEkonXK0P5hODY7lVUyM2a0AWyZ16FOn7akX8LPpSJgl4+3FuW5xX/J
         +bwSoY+S0l+n6rBnJXkZcFmPEWJBmYZj9gG5RLw5xKhjCJT6fpdJTyv8W2p9RFRXTDVA
         CigA==
X-Forwarded-Encrypted: i=1; AKwUvBx3b+qERXpJq9xSl1d8oujUaIel/9KBX7NpyDOPcAcgyHqmULsoMYslGZ6Sxxp8jZWBK8wHYw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJXqZy1785LEH75QGM2LcsJ1cbENYN687JdfVAchOX6bYAxkIf6
	D4/IJgWQ+sWoZ3Nj9GrzoGniIBFvA9Yvc1VmN+5SfFdMokpKeXrQlsdcGjMoSqP642UyHoP56xG
	D+s38HrASiHjWL48gTGgAVKLdGBMziM7cgVJg/g9vrmA9ibbhwdwLRbMJ8Q==
X-Gm-Gg: AYBFou2mPEL9CIEhtGhSdVYirPmXDazKAO7yPmihm07qxLNBAbY+yvr5QlonPUSQ3Uj
	cXcFU/8l8vr5VMN7Mf2KHtAE8x4FQPbDoWZ4qwwR/Evf2vewfuwvEFEJJ/cmXr9eNvrGDKarRKK
	BFEqTy0z7e68skdDPZPWOkxcKqY5JeTGRNzVRbRYKgIDw9KgpNT7DDlHNieqU2h3IdzozdRsHoS
	n0K2oFMlYWTzUPuMj0e9/DWpNhyy84DaR9VDRdOpvazKEk9uYhRDfJAoOIqXW8pklBSlZHCsPSB
	3kC9YxF4VAvweDxLOMo3GD6+gjzyisn592A2sAjMN998Qi99N2eSL/JSTrYAXmdOq4xEOQFltrN
	dPLtlL0CTv2P+tPeSG5idnQ==
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr367396385a.3.1792575880960;
        Wed, 21 Oct 2026 02:44:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr367390585a.3.1792575880494;
        Wed, 21 Oct 2026 02:44:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f7cc2csm59794166b.24.2026.10.21.02.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:44:39 -0700 (PDT)
Message-ID: <8ceba969-91d2-4b43-81d0-b26e7139664b@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:44:31 +0200
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port
 numbering
To: Chen-Yu Tsai <wenst@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai
 <billy_tsai@aspeedtech.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Peter Griffin
 <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Troy Mitchell <troy.mitchell@linux.spacemit.com>,
        Minda Chen <minda.chen@starfivetech.com>,
        Shyam Pandey <radhey.shyam.pandey@amd.com>,
        Wei Yang <yangwei1@eswincomputing.com>,
        Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
        Hang Cao <caohang@eswincomputing.com>, Li Jun <jun.li@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>,
        Yang Xiwen <forbidden405@foxmail.com>,
        Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
        Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stanley Chang <stanley_chang@realtek.com>,
        Ze Huang <huang.ze@linux.dev>, Aswath Govindraju <a-govindraju@ti.com>,
        Roger Quadros <rogerq@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
        imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
        Mathias Nyman <mathias.nyman@intel.com>
References: <20261014082037.1774672-1-wenst@chromium.org>
 <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org>
 <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
 <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org>
 <b4c0761b-34f2-42ad-97e7-ab34ae776281@oss.qualcomm.com>
 <8d4d3ec2-3c97-4a46-97f8-048fdf81b853@linaro.org>
 <CAGXv+5G_ig=k-eH8Cp0ES70WxTHcBS2TVj9VmHaG9caROiAuQQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAGXv+5G_ig=k-eH8Cp0ES70WxTHcBS2TVj9VmHaG9caROiAuQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzOCBTYWx0ZWRfX2Kp5rZJtwyHp
 1SpfQJ76se7QSL7yNVt+Nn+xa2tvchFOcKKZNBm4XrBG2VLnxLfFmw+cr6CNwbr4W1bWM1PYS3Q
 hNP8PABXntqrqSlEWd8HaRb5mUycY40=
X-Proofpoint-ORIG-GUID: ClNHOneNFdJxUy7RntOK9uop5L_SO0nD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzOCBTYWx0ZWRfX4MnwMelS09BV
 7q7NYnEdq/zxh3An6ZDAhGTQ2fIG8v77aQt3Fjf5pxMAzCM2dWuXqMNfs2mU+/3Yl8CBRUXBpEw
 lJgZ3zlpZFcQcMSpWXAkLJOBIjgjFybrM3ryD3us4CieYUQzfM8eLajiU/cp5jMv7QT/nrYCo0K
 +a/SMp7Y40pbw8CFPFq2+bXcqUuGitanOnOWG/gOVhHLdZGtSdpS+N8Zd0+tqjJDzvYOoKucHyk
 zx4Q0zRL0YfLmZcxwDVEuscWrT4SXDQM1ubDTn5L2rjrzbyEe6713qdgK6DOC50Ng73YkUhwKKO
 /TuZs2d7UCj4dZVmTjkXA/uwdnEPIwon6pmEAFgjbV+7eNqa06Ao+1VBR4z2s4rr8dp4y4B6b+e
 7MvUaOlDRD4XiySrNTCK1IrM2QQ+0ctR6JOk0dPUtudsps8MXHZuc0DD6upNArfzcUWpRTINRV2
 /83nVbaO4cB2319eB9Q==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad88989 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=iuaGvn3fa_lUOTDqeYoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ClNHOneNFdJxUy7RntOK9uop5L_SO0nD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210038

On 10/15/26 11:00 AM, Chen-Yu Tsai wrote:
> (Cc-ed Mathias, the xHCI driver maintainer in case I misunderstood xHCI.)
> 
> On Thu, Oct 15, 2026 at 4:44 PM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>>
>> On 10/14/26 18:36, Konrad Dybcio wrote:
>>> On 10/14/26 11:44 AM, Neil Armstrong wrote:
>>>> On 10/14/26 11:29, Chen-Yu Tsai wrote:
>>>>> On Wed, Oct 14, 2026 at 5:28 PM Neil Armstrong
>>>>> <neil.armstrong@linaro.org> wrote:

[...]


>> How about the USB4, does it use the USB3.0 port ?
> 
> I'm not familiar with USB4. A quick search says that it can tunnel
> USB 3.x, DP, and PCIe, and it doesn't have its own USB HCI defined.
> 
> So I'm thinking the USB4 controller would be more like a nexus node
> or multiplexing node, or perhaps like a USB C connector. It has input
> ports for all the protocols it can tunnel, connected to their respective
> controllers (XHCI, DP, PCIe). The binding probably would be very messy
> if one controller supported multiple outgoing ports, as each downstream
> port has a 3-to-1 relationship with its respective upstream protocol
> interfaces.

Yeah that is more or less it.

There needs to be a connection between the USB4 router and the native
(USB3 *port*, not hub | PCIe *port*, not RC | DPTX) protocol adapter
where the tunneled packets end up at to create a PM devlink between it
and the USB4 router.

ACPI does that by adding a `usb4-host-interface = &reference_to_router`
property, for DT that's still undecided:

https://github.com/devicetree-org/dt-schema/pull/196

As far as the Qualcomm implementation goes, I was hoping we could
go forward with base1 numbering as the DWC3 is an XHCI controller:

https://lore.kernel.org/linux-usb/20260929-topic-dwc3_tunneling_state-v4-0-63e296346d57@oss.qualcomm.com/

Konrad
