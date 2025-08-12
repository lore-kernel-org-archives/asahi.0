Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86092E7F04
	for <asahi@lists.linux.dev>; Tue, 12 Aug 2025 09:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754990065; cv=none; b=AlEkkuwvRhy7a3Uquw/z/G17TpX3tEyM7YaXpJYkkIpecjfEzbx5pXCVG0Bfe9B8oz2lQdMdo5MBAAb+tfXUp1T6ea8x6GAy3jURVigMyH1jxJxtFWfUga+yIUkdqI5UMuIyFIPv/i4yLYkDL46t5ejAkhHntJULWATGH2ZYSM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754990065; c=relaxed/simple;
	bh=Ov0Oe/fjUSgAuHs0OdT4PMNwtGL69MPkRBbW+7CrYn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bJ8PS0U7dafOekHHuOFHHkDLT+fyc9sioGgzzbMS/wKlqBQngutx3tSbyqisXphZRtDgphjPtQ/tSEJOHbWDDJlwmUD1TnRRBmuXwwrbnkeF+/h5VM1EL9GH02eA5WX2Im0ujdXNNWS4YNqb0rPgr4qHvHsY64pahl/MsdDDQp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cfdgQiWN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfdgQiWN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5bQRk024551
	for <asahi@lists.linux.dev>; Tue, 12 Aug 2025 09:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	clJ5A/6cgDIQE2u4HyX9gAv44cIhvX0vHF2jW/8Rc5Y=; b=cfdgQiWNNxQ+3gOz
	tvXu+hfjH5tUiLlCYXVCQj4yajCG2tbwmGSKj8r6EPIclyHu34r1Mq6Yl5gff/Z5
	rjMhJd4x8GzKxE6kL3nIqqhOrnJOSnOb6Nrx14iYpIZqPgyuDd6VhuWRuyrNAynZ
	G9tqJgPuq4rYDPz+y5a0M3z3ORQGSwDcElBx7jEOo2ZRLufvhAIOGqeiaOdTkzjm
	tPMLfaaWIzvq2kY+T0SliAsuaDCHIBCqnpus61yCdav0D9wmC7jEiFf0YfI4ZUMZ
	BaNmNlevD2vZKyrsN0RYsV5OylahioN/uPBIRG74BeWZcuwuvK8/ihxzhffefMma
	RyIkIA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4bj00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Tue, 12 Aug 2025 09:14:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b07b805068so11784351cf.3
        for <asahi@lists.linux.dev>; Tue, 12 Aug 2025 02:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990062; x=1755594862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clJ5A/6cgDIQE2u4HyX9gAv44cIhvX0vHF2jW/8Rc5Y=;
        b=iDANmLE88syASzmCRl/TV46Nl4RMsr5T1nYxZfvN3wSHxWimHGoOT9L/Bx8YJ1F/Vu
         CEjEnDHBmAQFY6IQhR8l/ZxVvnyWvqAIFVmlGe00fQiAKoeQRQs9CfnI6qq6yEv4H8JB
         vOzpzXG3viaw41vqeJarS7ZOcTg/Y02J0PSDj4MmU1npw3DU5yIKVijwx0uAyZNPsefp
         cmWK5JB0etnDcprsCeJPpgAQsGkkwC1S+n9vDL8EE+zOErllvhwQ1AisvubhTDwbOhvZ
         vtjHGWDFMUgTYVYECfYRUugxm0Iwij2zGxMnEq0ehTBiNT1N53/sPXV4um8HKfZqG3tp
         u/ng==
X-Forwarded-Encrypted: i=1; AJvYcCV7rMS0pVwIIzPMCsAIIajD+xiTdK2UltDV+3x70VFB6Jb4erusNIdb8xDlgap+gpC85VucQA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzd3JUsUOTbTw8+hThm+SJcYyO5ME+FHsHgSAgEd+DVXsZHqHgM
	15rGdP24AQVHEArvn/HdikPKbMCaoOICs6J/cxlBFt+J/b4b8miN7pwIoCqX7DzpbDscofsbLCH
	TLJLtyun3/Z2h8jC1X3GxD6ok9HWz1MwOXdOkicrR/8+KJx9HlH655rEqQQ==
X-Gm-Gg: ASbGncsYuvtdY0nIsEppLBU1G4tl1SkL7A+t20ZZVwG/IsR5MYKBhvkZykjXjeRVOtp
	OvALSamdIBwLToi0P1+/ZoktXplLrG26oijr51zBnwaOUncNOexiCd1tiIBK45QDIyLcagQ7SdM
	e1TbV0tzurr7KZsyF+g94xRV8CBW8/Tp/5ezeRr6tsXmOjRMugBi2xlRN4E51wNSoGIK8X3tCco
	4nI5bYk68u+opoelhKEzKvpyYKvMzlWPzonq4nDYAlbS6p7xJgXbvSBUVYckkqZKN/q2rnDrCfz
	xFoEqyjchrl+Ptb69ccojAQuts9pv8k3t9oWMaTGgft1mXAmAJ5LD8H6kz8eFmTiJjRI8U8/dFH
	TVF+B1fT/mtzVh4Hz2w==
X-Received: by 2002:ac8:580d:0:b0:4ab:23fe:a743 with SMTP id d75a77b69052e-4b0f4ccc1ccmr2591081cf.9.1754990061617;
        Tue, 12 Aug 2025 02:14:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHV6Qlx1UbGp6Aaax5Fxj5SKbEXoDO3q7jBZvznDhAU+9eJcmfQCUOIdtA9nAu77phChEO34w==
X-Received: by 2002:ac8:580d:0:b0:4ab:23fe:a743 with SMTP id d75a77b69052e-4b0f4ccc1ccmr2590471cf.9.1754990061134;
        Tue, 12 Aug 2025 02:14:21 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a218aa3sm2185232666b.93.2025.08.12.02.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 02:14:20 -0700 (PDT)
Message-ID: <86b3f3e9-8a48-4580-82f4-68164e3022b9@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:14:11 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 091/114] clk: qcom: regmap-divider: convert from
 round_rate() to determine_rate()
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Paul Cercueil <paul@crapouillou.net>,
        Keguang Zhang
 <keguang.zhang@gmail.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Yixun Lan <dlan@gentoo.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Michal Simek <michal.simek@amd.com>,
        Maxime Ripard <mripard@kernel.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>,
        Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Neal Gompa <neal@gompa.dev>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Andrea della Porta
 <andrea.porta@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-riscv@lists.infradead.org,
        spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
        asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        soc@lists.linux.dev
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-91-b3bf97b038dc@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-91-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xgHcpS9VkBnFFqvLTWxD0cGo7BX4_TgM
X-Proofpoint-ORIG-GUID: xgHcpS9VkBnFFqvLTWxD0cGo7BX4_TgM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX0lH8hvirqoms
 RuLWb0OT6UwyMenq21/UT2uqQ4/tFQnANWdhMh4tIOC2we6O3kiHyLUCLm7kz/IeSqhJ1hg4qUs
 XsHWr+Lhht+dw64Qvd6xeb76m6l0+QViIVIzz1MH14suAilsDeNkYsrIvqZYSU4NOSQyzaX0yNb
 q0AIHAD1NSIH2oM/rFmHoxox6PxTDMxyV/qnX/OctRcFO3zF8TETPCIPIBao/UGYHw+FUt5YBfo
 duo116BelhdZ1eL0ERAyZr5v+k+Qnl1GD4mO083I3DrDKb3nZOnzXqTKWGr2abe3rdyI+p7tTKu
 XIP+SoTDzFUk6mG534Kqv6azNQvXuOMBbtLfDd0OPbT+q/qicvOdhHC+sqOhlom6n917fqD/RbH
 lF2ijGRJ
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689b05ee cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=lhVY8u9YebhmjeZYKd4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068

On 8/11/25 5:19 PM, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Note that prior to running the Coccinelle, div_round_ro_rate() was
> renamed to div_ro_round_rate().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
