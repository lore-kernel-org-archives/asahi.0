Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800662;
	b=j+/kZec0SA7KWzLvQ6LraDiZAR1I0oSuKUoWPe6/RkzbdB3xOkP4a31sStlVOAD6i8Sd
	 5wvs9USVM+FcKKLJ3hqT/Asa+7ydlZq/1L3r7s2qynfk7K1ZvnTvZLvuRyAXJwl+y/MJx
	 nqWIBU+Z9CotEknlrRqXt1HZ7YoP2PvzhCNqUH6q0WMnVhRKe1/YarchOn42w5aXRzmVn
	 TPlNBWIrMI88QsfrS40gFKbABRQaxMaXKDswxv+4cMdn4KgB3Hb6OD1YMHWgIjnwYUKvg
	 RhIY6udNZy6LL/apZ9O3JUd1I/ADx5AP+u8ChAiXbLPcDAKFI+HqhXls1ncL72M77bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800662;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pVJOBVyN1nzMfTuUPIh7fW3RqgQ16G6DdcppUpEF4GU=;
	b=uULEBVZssK7seUpqMAWExuiLpovIXw3Mqh5K4AvLTLKerW8bCE41fHD6KP46V73Ywii4
	 ZYUDecwH4jFSAMzqapZoABDW93vwP6oPXAyn9vJYXzkjYeuDArFrCa5Zvp3wAZT0CbWDc
	 g9R+HU8chqADovNxIc8Dme53bItFFekIM91Uk88tdNI66eXM6BQ80ul1oXimwdA9fCe9W
	 s6B7IpYQQV3EIFDB7n+nkuO3jvBQDSDZHHtLi6WNCsFh4Yn4Lv8NxGnG/V1PB2lPcgqr4
	 rQhomZS2T9DwsAW6xlCeZH0FOkXDN9qA0qpsJfeSi1DcjguSEva/ENvrbukW1dQRlWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=L8v52Uvw;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=CPDrHitx;
	arc=none smtp.remote-ip=202.12.124.144
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA435606A329
	for <asahi@lists.linux.dev>; Wed,  4 Nov 2026 13:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA435606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=L8v52Uvw;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=CPDrHitx
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 5903C1D0018E
	for <asahi@lists.linux.dev>; Wed,  4 Nov 2026 08:57:41 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 04 Nov 2026 08:57:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1793800659; x=1793887059; bh=pVJOBVyN1n
	zMfTuUPIh7fW3RqgQ16G6DdcppUpEF4GU=; b=L8v52UvwfBya0U4L/hLgefxFc7
	Bv8MakOfitQ5VKMAmJmqSjMUIK/ehSQPKG54ESvduD6M3Ro58MtTtGpWdhd69Hf7
	Z4wkLvn67NtAs9F0QXngJ2XviqwTkrAyA7HiFTSAxkK2DwRKdMfXSEZ+3A5OykX1
	OvGYm0mdGdBTTDuSiyy5/LLxK8Uti/7JmeXjRGL7c4R1De59/5YwGuAOQtUtWhas
	FLSXUBptQhSOiSc7Im9LFep0RU+n9ZQCE2MRpBm6C4CdLBH8zVj1uudUOvDwfMBK
	mhq5nAx/Qhj+7P/+nUponiKGNSGH/Mg2ywdetSfE9wLJXjLn46xFVuoE6HNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1793800659; x=1793887059; bh=pVJOBVyN1nzMfTuUPIh7fW3RqgQ16G6Ddcp
	pUpEF4GU=; b=CPDrHitxADwvO8yWW3vzVrOmW1fi2Bp+EuU1N+HtqRpP+bYKaLH
	aPBeq5gVL1PmlTWVaSuQVRItQEWLRrE/Td1v1q6eeZp147O+nkeufy1n8vRacJZQ
	0CFG8BuYae34rP9Pi7lTHXxOtYKNbxjtW3B5sMMkcDj5w2NPUNDNRyggfdWAeh7l
	0fO1xxCtPDHSey8A1ThRQ01YshRqDXzb3fhLF6Fk4SnDRTHNAXnoodQRn7YCPO0B
	VxoxyiB17DjlKWdb/DqnWWW5CEjoT74KBui1YcbPoxb1qlA6a54ztOqgYAWJsEnT
	CBdy9fMHMFSJu7hHQV8BIGnd3+ysQMKN1lw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793800659; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=; rt=PGFzYWhpQGxpc3RzLmxpbnV4LmRldj4=;
	s=fm1:rsa-sha256:c6lyOcETUFytFQhntpAsaK4CXaA17mGE2OYwIWlOxzvsJZP
	ZLVen4VnIFcRtL6bEWmwyXHo6Ng78Sn4L1BaFK4dpcUqwTty5KNyzUKkBvSE9xe+
	cnfEjYEkGgIuOF0KntNNO/EdgJ+FSpixcFz5EmEhCjwuVZRhRiDNdte5a6NvuERC
	kTHgfXcJHrV5izvztnpYPjAXxwuxMgOobJpxgpaFP+attOLaKV9acKEpG6cbCEfF
	uWkYGIKiYg/Ug4ZkDnCHOP03UN5pF4UU8/iesS44t1eKr+RZaaaCThiTPjn0MRYy
	mNMt9NU5Te32AapynXnYDo/OTFvgluN+zgf5Izw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:jPnpz73r644i69BpyGpJ/GO8EOArrqrQTkhe87e5rqI=:6kPGA2OlUJ8QUP3bEVFSNVVOtzJuPCY7C4eDgjt8I/c=;
X-ME-Sender: <xms:0jnraoQKc69w0bBkbaDZAZXQy77UiGgal1Hys0L1KV3M1kaBprRkBg>
    <xme:0jnrahvRYoIc4ZY0-qBR70nO3Mp3aw8E9LuIjazDftJ7WC6Jg2aHVgAW2fiQ4_oIw
    kb1W2qchjWmVc1wqdphFKbUCCbunXUWR62sy9CD86tF5Q_v-n7b7tA>
X-ME-Received: <xmr:0jnrar_mtj3ZVlod5OfpqmlJAXfbqMYajmWUz7RCqpPKl6tNX_V1IOcWZ0tQugs7ym8i-H0y4Phe2XW-PMZZoUtt3yLZpD2_CTw>
X-ME-Proxy-Cause: dmFkZTGYtjO4aH3k0GUhdhJVTPB3qrFzLiZiQHBavFm+qyc9b84XpgIocNt/s38ItmHaIr
    GqsNRDwGCxT4YTMIQAv3zoBMKnpEkkA3i9WF8BKjANdRSzQG2hLv6Qs0JKtqeST+dlHHoa
    ZrlG4qvomHojGb1bGfnU29JjdtpxzB9pJe2Fl2GBE7Wi7PzHoc5LWD5DSwHdZgpqiEIJZc
    rbIQdYUzQdGGNiNEkbYVpihK1fBPf0A8WVGC+KER9Z2HArOBZwTme9TRosGFXRFCxpTja3
    vXXb7QZTur9sE9cZ4huijN00ssbgQl7goKyer4AQoZ2zDW33Wl5kzOp3a8mxS1ZcjWWfm9
    E7LX2YpTzHT3OFHTlME9YY2glNrptRVob6Pu9V5AwBfK1topzIsXaxidsPrUQdsiM4tqQ7
    uIEuYM1ShQnakTVDG5dDI+lyDYdSCUblGWXMob0jdvgJtLuQweETZJ+rsnnLYN+Gd2xdSh
    UKsdzePyEZq6grXnu4/EwvwFnXYm64z/wjDBKLic3aQOYOmAH9gtgzcNUugn9kMqur40iL
    5aqUD12SMZEMhHH7Dlf/zclahrym08AaH45TqSTIxZ8JOC+tNpG3T+lMSeY5cMYhnPD1s/
    OVU2JzgT/mimJnLUttb+CRQjKifCRcAAApRIg1Pe1VKANjA3kmBrCidUsq/Q
X-ME-Proxy: <xmx:0jnraiay6RaDTQxCqFLyom7wDk8RDOE_jpvl-QjLyyedgKlG4ENJUA>
    <xmx:0jnravqwVvOQSJoDEX3w0Sa6M0sj0LwlLFI0YlW5fFEMQe4ch8vBpg>
    <xmx:0jnraiaSig5DrfOdPAr8SjPMI-8RGKx-e3s04kGc_wEOZMZyMSCWdA>
    <xmx:0jnraq599amL-u632kWRc5g0dB3OPfBCJNBnHuWkVTHlGN_adVjR8A>
    <xmx:0znraulP8X6b39yKmxcLijcbDquwDw9kAFYxNkDY3Q-rRigcgHA24NTE>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Nov 2026 08:57:38 -0500 (EST)
Date: Wed, 4 Nov 2026 14:57:37 +0100
From: Janne Grunau <j@jannau.net>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: apple: t600x: Add PCIe pwren gpios
Message-ID: <20261104135737.GB756133@robin.jannau.net>
References: <20261104-apple-pcie-pwren-v2-0-216a4066965f@cyberchaos.dev>
 <20261104-apple-pcie-pwren-v2-3-216a4066965f@cyberchaos.dev>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104-apple-pcie-pwren-v2-3-216a4066965f@cyberchaos.dev>

On Wed, Nov 04, 2026 at 12:40:31PM +0100, Yureka Lilian wrote:
> For the MacBook Pro and Mac Studio devices using the M1 Pro/Max/Ultra
> SoCs, add the appropriate fixed regulators for enabling the peripherals
> connected to the PCIe ports (WiFi, SD card reader and USB xHCI), which
> are controlled by GPIOs connected to the SMC.
> Set the regulators as the power-supply of the respective PCIe port, so
> that the endpoints are powered on before probing the ports.
> 
> Add the 'pciclass,0604' compatible string to the PCIe bridge nodes in
> the SoC to allow the pci-pwrctrl-generic driver to bind to them.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi      |  4 ++++
>  arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 16 +++++++++++++++
>  arch/arm64/boot/dts/apple/t600x-j375.dtsi      | 27 ++++++++++++++++++++++++++
>  3 files changed, 47 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> index 122a566e75d1..635635c4bfbd 100644
> --- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> +++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> @@ -460,6 +460,7 @@ pcie0: pcie@590000000 {
>  		pinctrl-names = "default";
>  
>  		port00: pci@0,0 {
> +			compatible = "pciclass,0604";
>  			device_type = "pci";

`dt-check-style --mode strict` wants "device_type" before "compatible"

> diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
> index caded1636f3d..4f9dccf839ad 100644
> --- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
> +++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
> @@ -55,6 +55,20 @@ led-0 {
>  			default-state = "keep";
>  		};
>  	};
> +
> +	vreg_pcie0_port0: regulator-pcie0-port0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "pwren-pcie0-port0";
> +		gpio = <&smc_gpio 13 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	vreg_pcie0_port1: regulator-pcie0-port1 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "pwren-pcie0-port1";
> +		gpio = <&smc_gpio 26 GPIO_ACTIVE_HIGH>;

Please do the t602x changes in the same commit. This file is included by
t602x-j414-j416.dtsi and the M2 Pro/Max devices use different gpio pins.
If they aren't overriden in the same commit this will toggled a random
GPIO pin on M2 Pro/Max Macbook Pros.

> diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
> index 8a1494949e4c..412b2fe109be 100644
> --- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
> +++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
> @@ -42,6 +42,30 @@ memory@10000000000 {
>  		device_type = "memory";
>  		reg = <0x100 0 0x2 0>; /* To be filled by loader */
>  	};
> +
> +	/* WLAN/BT */
> +	vreg_pcie0_port0: regulator-pcie0-port0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "pwren-pcie0-port0";
> +		gpio = <&smc_gpio 13 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	/* SD card reader */

this is included indirectly on t6020-j474.dts which doesn't have a card
reader.

> +	vreg_pcie0_port1: regulator-pcie0-port1 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "pwren-pcie0-port1";
> +		gpio = <&smc_gpio 26 GPIO_ACTIVE_HIGH>;

Same comment about the GPIO pins as for the Macbook Pros.

I'm not sure if the cross-SoC generation device .dtsi files were a good
idea even though the devices are very similar. I probably wouldn't
repeat that but I don't think it's worth to untangle at this point.

Janne
