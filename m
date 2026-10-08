Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DAA34C98C
	for <asahi@lists.linux.dev>; Thu,  8 Oct 2026 06:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440338; cv=none; b=su584FNtULa42gttz9qtWhnWFapeJVBY3g+DPF/CW7Cj8Ak7Fs7sYNANmYmN5Wyx4XQsrmdUaxwh0PQd4jdtgjNp8YjMeN79JhLU0yONqjgBtX1+mZAsu8n5e7O0uTRF6C2Q/ehwiR5aubFJICJRDMkiCGiaMRjpQ+FCAp1MuO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440338; c=relaxed/simple;
	bh=EAEruviiYG/N6nple+mn9NdhJEM/dZOzYksLjrNmyuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d54oVLeO3+Zjm/kauU3kCRnrr3UFAGCwkS9vUQxgkDick/WgFYHOBfk4rqk1o4CfMWLUARMhHMn9Xf6+CyXM55EoK4d+XbLYXVbt2WzYYaq2hQcMsp508DvInyjLDCH8xyEe8fUPaxFNHK/gp+AxvyjNvHC5H00f1JpUYEoGXpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gW2v5S5e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LQ7e2+e7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gW2v5S5e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LQ7e2+e7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BTTq1157574
	for <asahi@lists.linux.dev>; Thu, 8 Oct 2026 06:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RLa/JHNXfr18gNmyy6T2VPCPOXnWuKMxuMPJcaRk978=; b=gW2v5S5e5sa5Yb41
	tkhYl/JefCzIgByxIoWKayWoEjlGs+o7BxGfrdi5I7/DQBHO9fG/857kGsp/r1YG
	3dcOPYIdnm9yYD2D+CYaipsNYW5Wd6uz3BsA1OyD8k4iR63P7/QXLahXZFslPUif
	njCLrDG6P92+PnIhXv5A12ld6WEU1WbDSOL6kpb024dAZWUVl/UCdIh3h6o58+bh
	xPVyr1w2O5hzt4QBVMektOkw201yAfcWMR0otA3TeQJv73CghMsXwfKgh+ZYMZJA
	X/2hKzAhZXUj728/QTUQzACXEP9sl3gQLK4qqHr/n8Qg025FhQ2/TO8PE86Vq4Y+
	sUrjgA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe51e77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Thu, 08 Oct 2026 06:18:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e2d4a8623bso47946505ad.1
        for <asahi@lists.linux.dev>; Wed, 07 Oct 2026 23:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791440335; x=1792045135; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLa/JHNXfr18gNmyy6T2VPCPOXnWuKMxuMPJcaRk978=;
        b=LQ7e2+e7zRbmAms8EUraBRne3/WzwM1rkmH0gpVO40uNTFClZtSCNaWOuLFXiVka2h
         AstIz4WpJrBBVBlrKsAzI6QQH3Q5U7LUTA4whHs9aukMuhi8+vvHKaB5lHLbEGIVkg5n
         lOBme9Tu1ftGRrR+C306DPKrpJ+hEdetQKbIgiJBH3D1hVWfJLdKBxUDwFczrJU28yf1
         ZO6t07AiUFgzbT+NMFHprRwx6Wr+8nceqpRlZl6WVQf3sq/4U3Sebo6984ApSU+vmnM6
         9SPADxtTpGXIgD/Za+GW8I3v+fs3wIEmL72zK8YSnNFMiGyrx3bKo91lK1Rk8jNgKP01
         lm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791440335; x=1792045135;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLa/JHNXfr18gNmyy6T2VPCPOXnWuKMxuMPJcaRk978=;
        b=DsfZHV6FhvAkOtecck1Byz+0abPX+t1nXM0fwGcw7D1EKpWZU3PPLP0wALSwGpS7cv
         WTr49Ty/kG07PytiX4TgjOZMgbEdFZ04SMffPqZNJmMl62hGsi+TDGZ9V98sG/K35PZI
         rttb7N1NWTokTefbJNwI8lQyXpaGqNqBEFwmiggf5Lf6n79kexsUpUHt9o/tL9SI+/Da
         7+W0qD+QNV1/UL/6CjZdO+lvNy0ri01qALmrJSOluLSgyuRErLwHwqoE+tjfsYm6OV5O
         MFFId2I0YF5fm5SX3Pg3SiXPA2eOGvHGYIPhbGJGy+h6f0ld8C0MSMph9S/ewokdo8Pe
         CSpw==
X-Gm-Message-State: AFq9FYLyS3R7ro2Eh3pbbKzbX5XEvhLAgZxm2jKR5CP6t8mf4Oh0tz8g
	ipVC9cqv0sEL0vg5KVw6/xKbQfgERACMhzUI59UhYNB21a+W23cLEBvbe+sID4osKaG/Z6qCmwi
	C6OdHQekINtRt93oycBbnUt3yRPUbP4LEniYsDxeFfnX+ZCcplXLqupWulA==
X-Gm-Gg: AYBFou1mRbPOax17JEAdFwmPp8wZq77FZ8XNdDqvTQblTWiENVxtUZELj79zThno5lU
	9OWRBdWL0DA8BqW3PKPQjCWFJnCoiNpVTWTNtKVYLeDQbuW8mNsNaW3rgCY257bBf+s+1wxH3rO
	EjCZ5wUqzI5CuabQualASKRG2pkxOi05ox0KC5iw7AjhoZzAHE5nN641xwb0NgDhZyZRyb/WgFm
	HtOuUIHf9o5eiTD0v3cA3UJWDKBhKsaSgyvqrbZZ/FSLG6B6U6gAyc0LiktB8kwSDWCGn4/F2/B
	+rpxPJSDXWYsldIYWp8Qm9FbQQorCJqkoWnFogPXVl/g2hRs1AR07r+4XXFeg6n2FCLloJrIPtf
	L0jeSkoJnC2USuiao45VskIvzy9E=
X-Received: by 2002:a17:903:2445:b0:2e3:1bb4:6121 with SMTP id d9443c01a7336-2e600510556mr38285665ad.49.1791440335500;
        Wed, 07 Oct 2026 23:18:55 -0700 (PDT)
X-Received: by 2002:a17:903:2445:b0:2e3:1bb4:6121 with SMTP id d9443c01a7336-2e600510556mr38285425ad.49.1791440335008;
        Wed, 07 Oct 2026 23:18:55 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e606da8fc6sm19674205ad.58.2026.10.07.23.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:18:54 -0700 (PDT)
Message-ID: <41c5a595-7f40-4505-99a3-5041641fb025@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:48:43 +0530
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/21] arm64: dts: apple: t8103-j45x: Add headset jack
 nodes
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
 <20261004-macaudio-v2-13-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-13-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9MNJe6df5pklwxwB4JABvL9AAxccl0w6
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac735d0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=UesLP-FnXeQSrw_j-0AA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX4fXcknDf9JZ8
 dDycJ28C3zfzJrHxZMEc5WNmnKceWGW8QeeIbvLFZKDuer8pQuMCxNd/tR/8JGbl7VDWYsXMEaq
 0HHEsQtDpxpiSpkaUMOyCp22aypXVvc=
X-Proofpoint-GUID: 9MNJe6df5pklwxwB4JABvL9AAxccl0w6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX4hRtAviivD5p
 OGbUqe4VPUAmQO5EerxTQ0kfcbPeA+WV4kfoqPFWu8cDW9k+K1ihf/MDA7KPyPqjHfDA2cUJQ39
 xvoG4p0IZdqwMkfrG743wl66u5ElFQcszEIuxDzOr4Px9e8N6Eh/ohIr6wltlgu9GyzOzY5NlzS
 0x4+wfZ0FuFDG+/5e1tZyn5iG9Yg49TSwRH4daO6Omkjkh/Ubpf6oiQIttkSscn+tPmdIB6azJN
 aUYSS1Lxk9riM4vfiANZbrH+Qt1LCfaOc08DAWeUr3UEK39Ar4wRPeNFzJIWF5GhKLDCqkyUNoi
 pib5HTnz2GjfwVOZOg9NFtCF+OW3l4v02olGYZmGY+/j7StMnAcPRdAoCXasy37PwI09dV1WV6U
 kCGLg1nLd8nLAvMlZ1iYmVWoN8aBZ+Xz5Lsbv5Jk2KXUPOLAhJ5ht2+TK/k8gSlw0UpaluHGQ1p
 +dX/88sDYzL3a+ce9Xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024



On 10/4/2026 11:33 AM, James Calligeros wrote:
> The M1 iMacs integrate Apple-specific variants of the TI TAS2770
> and Cirrus CS42L42. Since it is not yet safe to expose the speakers
> on these machines, add the headset jack nodes and advertise them
> to the machine driver via the sound node.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>   arch/arm64/boot/dts/apple/t8103-j456.dts | 38 +++++++++++++++++++++++++
>   arch/arm64/boot/dts/apple/t8103-j457.dts | 38 +++++++++++++++++++++++++
>   2 files changed, 76 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
> index 090c97bb781b..1fc74ebf9ab2 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j456.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
> @@ -88,3 +88,41 @@ &pcie0_dart_1 {
>   &pcie0_dart_2 {
>   	status = "okay";
>   };
> +
> +&i2c1 {
> +	status = "okay";
> +
> +	jack_codec: codec@48 {
> +		compatible = "cirrus,cs42l83";
> +		reg = <0x48>;
> +		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "Jack";
> +		cirrus,ts-inv = <1>;
> +	};
> +};
> +
> +/ {
> +	sound: sound {
> +		compatible = "apple,j456-macaudio";
> +		model = "iMac J456";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		dai-link@1 {
> +			reg = <1>;
> +
> +			link-name = "Headphone Jack";
> +
> +			codec {
> +				sound-dai = <&jack_codec>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&mca 2>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
> index ebddde75455c..d8ea6bb53b3f 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j457.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
> @@ -69,3 +69,41 @@ ethernet0: ethernet@0,0 {
>   &pcie0_dart_2 {
>   	status = "okay";
>   };
> +
> +&i2c1 {
> +	status = "okay";
> +
> +	jack_codec: codec@48 {
> +		compatible = "cirrus,cs42l83";
> +		reg = <0x48>;
> +		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "Jack";
> +		cirrus,ts-inv = <1>;
> +	};
> +};
> +
> +/ {
> +	sound: sound {
> +		compatible = "apple,j457-macaudio";
> +		model = "iMac J457";
> +

I don't see 'apple,j457-macaudio' in the macaudio driver's OF match 
table.The driver comment instead says J457 is compatible with
'apple,j456-macaudio'.

Should this node use a fallback compatible,

e.g.
   compatible = "apple,j457-macaudio", "apple,j456-macaudio";

or should the driver add an explicit `apple,j457-macaudio` match entry?


Thanks
Ajay Kumar Nandam

> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		dai-link@1 {
> +			reg = <1>;
> +
> +			link-name = "Headphone Jack";
> +
> +			codec {
> +				sound-dai = <&jack_codec>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&mca 2>;
> +			};
> +		};
> +	};
> +};
> 

