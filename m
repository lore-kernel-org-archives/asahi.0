Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633884;
	b=UGxWcseovvFs13oQk6Wzs376thRW+i+p6Xw5MbaJ3hzkcuowO/RsUkRgh/wWvqiBNi+C
	 LrZW+iQH6IXX/FCdUL8NNlg7H/+rOAPh5wxS/OZC4TOh/MeebJesBt2tWKrd5OoSWxyDI
	 GwkcYYXfSkLZNQitXdW+nJZn7Dv2orD+lWGKWj2wAF6+9y70A85dfS0g4FeF5OFP+cvDZ
	 GtlJQgu+NzHwhpP1FJjd8Q20KK+prs+3qD34H1KdHsCcwF1eaywam4ItjeeWl88UASn6Z
	 Gp9gY3IcbcIZUpH8N+oym7i7P+zmWN1rfj1S730LnVTMBoRLzBP4vXqlcYeVw3jO8ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633884;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9Lmc9ZuDtQesUq6ptN86YNOl5Cy8kKECHiXEOM6FEWI=;
	b=UcWywQmytbpuMQB9a1TaT/iJX9icbdoDwtMMjanpYcRsEXDmo/xgZlLPgaUIFka3n/LU
	 y4NzKyidmoqI7w4BFu/X3ro/PyjHokmwI5yKeQErAlDQznMnPR8j+wYBfo8KqsOMfEIdR
	 DHiag8uXn2WOGt7hXcnqv6aRAXSXj/sZb/wDAjzCXBr1jAGmI0LvMd08/aAG71pnzcymi
	 P0FLb/HqAGF1tV96+aEjSLKRXVy5Mf3pxowX328IxhMvRbEEoN70kXLgm6B2igWo1bfnW
	 whba3kHtLIiqD/cFPh3pCkb1jAAPFze8Fp3c1NlCZ7yYGVWsOFNLi9YDE9IwDgqlDFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bsgq6CEF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ng5t7XpZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566BB606A32D
	for <asahi@lists.linux.dev>; Wed, 25 Nov 2026 19:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 566BB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bsgq6CEF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ng5t7XpZ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJBGnV1795283
	for <asahi@lists.linux.dev>; Wed, 25 Nov 2026 19:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Lmc9ZuDtQesUq6ptN86YNOl5Cy8kKECHiXEOM6FEWI=; b=bsgq6CEFo8+A2X+S
	O1jQKVPFh2bfPEupJ88F5sObe+9XYZnPhqSpoQ78faphgN0EkHz3+7I+myKO/V7p
	obHz8Y+WlK58QLkywQnmYwKk7kUuTUAGzGacpyaCBAYzqKnKZBeaqa9Hj/ZNzH79
	3cqynNNNBuNhjYyyfIDHEovVJruqeKdEOZ7gdndiJqXrL97xc0V1ypcdeGB31Dq1
	cqWrDeHGk3Y7yQ/Kf/7TiXi38481O/9qfAhs0gEdZUVQybtVOp4MXrPMDosMkEAB
	FyVuyIJjRO1yoN+reYQX4E/7uu4EZnv2PcdvffeCftBd2Ir8NGqOUR1dL6gZ/JLy
	mW/g/Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvntckc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Wed, 25 Nov 2026 19:11:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f040c6e0ceso58250485ad.1
        for <asahi@lists.linux.dev>; Wed, 25 Nov 2026 11:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795633882; x=1796238682; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Lmc9ZuDtQesUq6ptN86YNOl5Cy8kKECHiXEOM6FEWI=;
        b=Ng5t7XpZyPFc0RTXu2Ywf/aOG1OJEZsBNa1xS/RrJDAmEOHFgg9N1bzeusN6C4osjO
         FNpaWI60Okhtvf5WEMwoZ3im+zTaKyYEtQXgohB0HVsphe37IYFOmuBW/QahbSNK2J1C
         zkwpmYwX7JmEFSNC6PkE23SSI/KA+2/YZxTY3gCBvuaOVJ5g4Z/AeWrYXJdEQy/QF/9p
         HDL4qzQhT2EgVdIJxUiUFA9GvFNEZC7M9idV+Z68ByPOi9czNY/4PTie4uDOqrYbetEW
         u0pCL/tf3qDPhGpeVxrRGH/Lfqa2V9xv4zRaidFgdNJaH0cW1IT23Dq5m+2nyNOr8ubF
         reNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795633882; x=1796238682;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Lmc9ZuDtQesUq6ptN86YNOl5Cy8kKECHiXEOM6FEWI=;
        b=Z7n0ZBzpu7jlovR9SIt+HMu9Oht9djws0FVftWMe4Jfh6XIkMP04RTToMo8M2bOhBR
         QeYSu/YNUIZsb9oVxZezTUml1U4DGZZAZNK/cYR18OdEZB5WCxGiJOJ9mg+mBAHHH6pw
         zWv+aIvcY96tk3djouhBJEo0Lm50YRjax0mJLcDS0fzC9OUSc2juINjycigDtwJJZGdh
         PfcZWIkdhQFdclaD/F6j4ny3WaBUDGkItugD8mjTYfoluFB6+53GZuJR5dGw7VhVQYbu
         CPDSQN1npxJQRY9egDyzhteuvR43XhSDM2/FKodz/MgMIjNdPWOvSeYo5A8vk3Tq9wdm
         zfeA==
X-Forwarded-Encrypted: i=1; AL+hErFvrI7XLVDkeN53h2qsfF+2tjBli7BRvxKcst2jOT3mVMTnxy6JIFCOmLfiABq3T7iJJbUvdw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/zyv+SR+nZXPZ4CAPCMtk7rJlvwAioJ5nTwrqld73F6UAlEAkp
	lmx6ZFwJ+28YjPuQFTak+/Ea4+des+S28X1/N2JozI3ha/xaocigr55zrCdOwP4lMeqR+L/Ka8p
	5oEbv3lb2XFMun4AA8j6i8DFL6mkx6scIN1ZBna4agHXE8g+N4e7nWeAxAw==
X-Gm-Gg: AZFdTZePbH3l000BgLB812mgMA6KZtBMwqMdDjOBp7uAJPvMhk2pqUb8vUMXnN6VGYX
	qQPbRpDA1aT72r6+KQUEx0zha1DJSiMgVGse3emoKn1suirV64GS7R55n7UfIYP32xnwMqA4cLf
	mGVR8CzZQlRgOWpu++MOlpKl0/XGKRh2iazHIOcDepnkbg4OEB4YFw5aYN4snPikMKHu0YmKyDQ
	H3bphpAbRi9UWBLYkfwPg2o7waMB18BMT5jdnAYGtSNqBnOjUys3lskWgLA0aJenFikP7+R+5o9
	hm2Kcw2LzAoPOltYtVDh/X5Fll2wjDoX/wMO8vao+cLhSudcobFWQ134TkBVqtCXzoyU+TQowO1
	gltAuSpdjLc9jKtG4TW7UzputnWqZyXlUn/4xjiFW8XIEDTgvIp0IKvRh+0tfer1OY2WPUILgrS
	EHH9VAxYWYWQYOUoeLg0YC9YDqZZcpfZDXUhnHW9qi
X-Received: by 2002:a17:902:db08:b0:2f0:3e48:8cdd with SMTP id d9443c01a7336-2f03f16acc0mr184690195ad.46.1795633881705;
        Wed, 25 Nov 2026 11:11:21 -0800 (PST)
X-Received: by 2002:a17:902:db08:b0:2f0:3e48:8cdd with SMTP id d9443c01a7336-2f03f16acc0mr184689725ad.46.1795633881124;
        Wed, 25 Nov 2026 11:11:21 -0800 (PST)
Received: from [192.168.1.8] ([122.177.242.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b76sm92424475ad.50.2026.11.25.11.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 11:11:20 -0800 (PST)
Message-ID: <91334dda-718d-40d6-a731-e07056c7456a@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 00:41:12 +0530
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
Subject: Re: [PATCH 3/3] usb: dwc3: Allow glue drivers to override all
 dwc3_properties
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frank Li
 <Frank.Li@nxp.com>, Sven Peter <sven@kernel.org>,
        Janne Grunau
 <j@jannau.net>, Peter Griffin <peter.griffin@linaro.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc: Tejas Narendra Joglekar <Tejas.Joglekar@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Neal Gompa
 <neal@gompa.dev>,
        "asahi@lists.linux.dev" <asahi@lists.linux.dev>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        Fabio Estevam <festevam@gmail.com>
References: <cover.1795559405.git.Thinh.Nguyen@synopsys.com>
 <b0b118ce86d1046d73fdbe297117f993df38cf20.1795559405.git.Thinh.Nguyen@synopsys.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <b0b118ce86d1046d73fdbe297117f993df38cf20.1795559405.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3NiBTYWx0ZWRfX8SmYopovSOig
 nn2RN7DDOj9O6CWUxtmOLWach5IQPsljnIcrhPFoIBecvw8t1acuXr1Fw48m2jHj6kUpSpeNpLV
 A7I9ZrBVMPZXjRSyQgAJ3rJyv/sd5oXmkNUZWoQ8Vl0Mr+IarVCrvkxtyB54u2xafyTMS7f9s6w
 L+xwbaFlUgypUQHBs+zQPhri0NyatUtTQ1Y5702V8g4J2rJoctNmuXL8QkSP1QIrVb1V3FcGAyl
 NTbBzJKj30cNkVM+BolC4o+/NGZNXSY8R8F9fNxZAgwHl2sXTY5n1j5paz2N9u6pToMAnqNhvy+
 a7zpL/VEMbsEIsrPVKcO+qkF3BXZIkkDZolJxFKM/hZF6q809NP4FOj770kg3+i8toUZl8jcYLL
 42KuZ+Y++rxBqmTrHi7Z616pzl1thFIdg1min8E3tovnZwG610/6u4tWevjFWoEBqN3ddl5hxWc
 fdXRY60Mda2FP4NrMaA==
X-Proofpoint-ORIG-GUID: PvLVbza_0rwwvwlH7H-TPVI0SUTZ9_Fe
X-Proofpoint-GUID: PvLVbza_0rwwvwlH7H-TPVI0SUTZ9_Fe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3NiBTYWx0ZWRfXyXFTWyXuo21y
 2UQCwWHGWbktrWFTWTcCyCkcik7UeJq55p3szX30lvgLxCE4oGM6nWHyXLjUkm2FG4Izk4Xc5la
 Vyoc7QufnVdi1cwHaVelvx8YDTFvx9w=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b0732da cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=EbDk/eETi6Q6sYbTlnF7GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=K-Rsm8vN-is5ZCDG3ioA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1011
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250076



On 11/25/2026 4:29 AM, Thinh Nguyen wrote:
> struct dwc3_properties holds all glue-overridable properties, but glue
> drivers can only set needs_full_reinit and gsbuscfg0_reqinfo.
> 
> Replace the properties value in struct dwc3_probe_data with a
> fixup_properties() hook. The core calls it after reading the DT
> properties, so glue drivers can set properties that DT does not
> provide, or override DT values, including clearing them, to correct
> broken SoC settings. Convert imx and ls1028a to the hook.
> 
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Rebased [1] on top of this series and tested it:

Tested-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

[1]: 
https://lore.kernel.org/all/20260914-xhci-skip-phy-init-v1-1-9c46b31a5a39@oss.qualcomm.com/

Regards,
Krishna,

> ---
>   drivers/usb/dwc3/core.c              | 18 +++++-------------
>   drivers/usb/dwc3/dwc3-apple.c        |  1 -
>   drivers/usb/dwc3/dwc3-generic-plat.c | 19 +++++++++++--------
>   drivers/usb/dwc3/dwc3-google.c       |  1 -
>   drivers/usb/dwc3/dwc3-imx.c          |  9 +++++++--
>   drivers/usb/dwc3/dwc3-qcom.c         |  1 -
>   drivers/usb/dwc3/glue.h              | 10 ++++------
>   7 files changed, 27 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 3b2b5fcc627a..369c9ce9f1dc 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1684,24 +1684,14 @@ static void dwc3_core_exit_mode(struct dwc3 *dwc)
>   	dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_DEVICE, true);
>   }
>   
> -static void dwc3_get_software_properties(struct dwc3 *dwc,
> -					 const struct dwc3_properties *properties)
> +static void dwc3_get_software_properties(struct dwc3 *dwc)
>   {
>   	struct device *tmpdev;
>   	u16 gsbuscfg0_reqinfo;
>   	int ret;
>   
> -	if (properties->needs_full_reinit)
> -		dwc->needs_full_reinit = true;
> -
>   	dwc->gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED;
>   
> -	if (properties->gsbuscfg0_reqinfo !=
> -	    DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED) {
> -		dwc->gsbuscfg0_reqinfo = properties->gsbuscfg0_reqinfo;
> -		return;
> -	}
> -
>   	/*
>   	 * Iterate over all parent nodes for finding swnode properties
>   	 * and non-DT (non-ABI) properties.
> @@ -2310,7 +2300,10 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
>   	dwc->regs_size	= resource_size(&dwc_res);
>   
>   	dwc3_get_properties(dwc);
> -	dwc3_get_software_properties(dwc, &data->properties);
> +	dwc3_get_software_properties(dwc);
> +
> +	if (data->fixup_properties)
> +		data->fixup_properties(dwc, &dwc->properties);
>   
>   	if (dwc->sysdev_is_parent)
>   		dwc->sysdev = dwc->dev->parent;
> @@ -2470,7 +2463,6 @@ static int dwc3_probe(struct platform_device *pdev)
>   
>   	probe_data.dwc = dwc;
>   	probe_data.res = res;
> -	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
>   
>   	return dwc3_core_probe(&probe_data);
>   }
> diff --git a/drivers/usb/dwc3/dwc3-apple.c b/drivers/usb/dwc3/dwc3-apple.c
> index 1f474a8bc59e..8289d22e5994 100644
> --- a/drivers/usb/dwc3/dwc3-apple.c
> +++ b/drivers/usb/dwc3/dwc3-apple.c
> @@ -181,7 +181,6 @@ static int dwc3_apple_core_probe(struct dwc3_apple *appledwc)
>   	probe_data.res = appledwc->mmio_resource;
>   	probe_data.ignore_clocks_and_resets = true;
>   	probe_data.skip_core_init_mode = true;
> -	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
>   
>   	ret = dwc3_core_probe(&probe_data);
>   	if (ret)
> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> index 3e90ddf25809..69a6acd84a0f 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -33,7 +33,8 @@ struct dwc3_generic {
>   
>   struct dwc3_generic_config {
>   	int (*init)(struct dwc3_generic *dwc3g);
> -	struct dwc3_properties properties;
> +	void (*fixup_properties)(struct dwc3 *dwc,
> +				 struct dwc3_properties *props);
>   };
>   
>   #define to_dwc3_generic(d) container_of((d), struct dwc3_generic, dwc)
> @@ -137,12 +138,10 @@ static int dwc3_generic_probe(struct platform_device *pdev)
>   	probe_data.ignore_clocks_and_resets = true;
>   
>   	plat_config = of_device_get_match_data(dev);
> -	if (!plat_config) {
> -		probe_data.properties = DWC3_DEFAULT_PROPERTIES;
> +	if (!plat_config)
>   		goto core_probe;
> -	}
>   
> -	probe_data.properties = plat_config->properties;
> +	probe_data.fixup_properties = plat_config->fixup_properties;
>   	if (plat_config->init) {
>   		ret = plat_config->init(dwc3g);
>   		if (ret)
> @@ -220,16 +219,20 @@ static const struct dev_pm_ops dwc3_generic_dev_pm_ops = {
>   
>   static const struct dwc3_generic_config spacemit_k1_dwc3 = {
>   	.init = dwc3_spacemit_k1_init,
> -	.properties = DWC3_DEFAULT_PROPERTIES,
>   };
>   
> +static void dwc3_ls1028a_fixup_properties(struct dwc3 *dwc,
> +					  struct dwc3_properties *props)
> +{
> +	props->gsbuscfg0_reqinfo = 0x2222;
> +}
> +
>   static const struct dwc3_generic_config fsl_ls1028_dwc3 = {
> -	.properties.gsbuscfg0_reqinfo = 0x2222,
> +	.fixup_properties = dwc3_ls1028a_fixup_properties,
>   };
>   
>   static const struct dwc3_generic_config eic7700_dwc3 =  {
>   	.init = dwc3_eic7700_init,
> -	.properties = DWC3_DEFAULT_PROPERTIES,
>   };
>   
>   static const struct of_device_id dwc3_generic_of_match[] = {
> diff --git a/drivers/usb/dwc3/dwc3-google.c b/drivers/usb/dwc3/dwc3-google.c
> index 67eda7f0d528..213c03048aa0 100644
> --- a/drivers/usb/dwc3/dwc3-google.c
> +++ b/drivers/usb/dwc3/dwc3-google.c
> @@ -440,7 +440,6 @@ static int dwc3_google_probe(struct platform_device *pdev)
>   	probe_data.dwc = &google->dwc;
>   	probe_data.res = res;
>   	probe_data.ignore_clocks_and_resets = true;
> -	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
>   	ret = dwc3_core_probe(&probe_data);
>   	if (ret)  {
>   		ret = dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
> diff --git a/drivers/usb/dwc3/dwc3-imx.c b/drivers/usb/dwc3/dwc3-imx.c
> index 64da121a8f76..396d76311120 100644
> --- a/drivers/usb/dwc3/dwc3-imx.c
> +++ b/drivers/usb/dwc3/dwc3-imx.c
> @@ -192,6 +192,12 @@ static const struct software_node dwc3_imx_swnode = {
>   	.properties = dwc3_imx_properties,
>   };
>   
> +static void dwc3_imx_fixup_properties(struct dwc3 *dwc,
> +				      struct dwc3_properties *props)
> +{
> +	props->needs_full_reinit = true;
> +}
> +
>   static int dwc3_imx_probe(struct platform_device *pdev)
>   {
>   	struct device		*dev = &pdev->dev;
> @@ -265,8 +271,7 @@ static int dwc3_imx_probe(struct platform_device *pdev)
>   
>   	probe_data.res = res;
>   	probe_data.dwc = dwc;
> -	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
> -	probe_data.properties.needs_full_reinit = true;
> +	probe_data.fixup_properties = dwc3_imx_fixup_properties;
>   
>   	ret = dwc3_core_probe(&probe_data);
>   	if (ret) {
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 5a68025ccea5..ef38308023aa 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -745,7 +745,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>   	probe_data.dwc = &qcom->dwc;
>   	probe_data.res = &res;
>   	probe_data.ignore_clocks_and_resets = true;
> -	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
>   	ret = dwc3_core_probe(&probe_data);
>   	if (ret)  {
>   		ret = dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
> diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
> index b7ce196e84ea..e56fee68e4bc 100644
> --- a/drivers/usb/dwc3/glue.h
> +++ b/drivers/usb/dwc3/glue.h
> @@ -9,10 +9,6 @@
>   #include <linux/types.h>
>   #include "core.h"
>   
> -#define DWC3_DEFAULT_PROPERTIES ((struct dwc3_properties){		\
> -	.gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED,	\
> -	})
> -
>   /**
>    * dwc3_probe_data: Initialization parameters passed to dwc3_core_probe()
>    * @dwc: Reference to dwc3 context structure
> @@ -21,14 +17,16 @@
>    *		be ignored by the DWC3 core, as they are managed by the glue
>    * @skip_core_init_mode: Skip the final initialization of the target mode, as
>    *		it must be managed by the glue
> - * @properties: dwc3 software manage properties
> + * @fixup_properties: optional hook to set or override properties after
> + *		the core reads them from DT
>    */
>   struct dwc3_probe_data {
>   	struct dwc3 *dwc;
>   	struct resource *res;
>   	bool ignore_clocks_and_resets;
>   	bool skip_core_init_mode;
> -	struct dwc3_properties properties;
> +	void (*fixup_properties)(struct dwc3 *dwc,
> +				 struct dwc3_properties *props);
>   };
>   
>   /**

