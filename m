Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794159184;
	b=0p7xwgNm8SpzQsxRFw3qdK5QQ0tHUFBQ67Vc6cTR/VZ7HalcOX7fd2mqJ59ADrxq9Mjl
	 7RWd+SZlwL/hN/bfa3rSI4R/MI7YGm5BRIhtQ3/ZJvU1Oaaq/5MLjwhtclxOGIdheEPmL
	 c+44M1p6oITWd3UPMTY3kDBE3TIBvXqlDJswK6/4kyHqdVSRvWOcKtuLOrB/RMv26YHyz
	 KV1B+OAuK3BMflBPNvWzXRloZ6S/oqyNSe14URwZSlG0MtqIG4x9uNO1auo3CVAQdS/gM
	 dV9cVMCPvJy/7JRN5o5/PKHZKDw9lBfpAG7h1NO3gzWfKsHQHCaB2aVoSxCn7rpsHUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794159184;
	h=DMARC-Filter:DKIM-Signature:X-Forward-Email-ID:
	 X-Forward-Email-Sender:X-Forward-Email-Version:
	 X-Forward-Email-Website:X-Complaints-To:X-Report-Abuse:
	 X-Report-Abuse-To:Mime-Version:Content-Transfer-Encoding:Content-Type:
	 Date:Message-Id:Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=mmRDTsFTMdkB1knSlLyF6ragoIMpPyE7Nd3fqt3pBKI=;
	b=cvFv7oL5lPM/x7IDaksuA4NYxMpAnRNE4PSROdzOtram8WLXLaQww5yFX74hexDJYVqO
	 i4B0ZC2qoXMnACfF5r3JPDSZVtuZgtyVt0Bzipk4nx0DctQHJa2Ke4zD6/DOhC/bXYWWN
	 UzWErxu4LWJf6/BMgKcLmMLzO7ozFdooGInhUtuF36kJT97siiloGIj3z5c78tnwHBmn8
	 4YvkL5GvpY4l0bJgiQCAGikGJnRKNeTlaxEXbi1fBYUi50XFUgZSsDstyAmSwNvbVQz57
	 U3b84c8vRg7ReEsrxNZmjx3Kv8jnOjPx/+BEncmDP1sUozpJTTixV65RV48U7iQH1/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ubuntu.com;
	spf=pass smtp.mailfrom=fe-bounces.ubuntu.com;
	dkim=pass header.d=ubuntu.com header.i=@ubuntu.com header.a=rsa-sha256 header.s=fe-953a8a3ca9 header.b=WNGR+i0w;
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15909606A320
	for <asahi@lists.linux.dev>; Sun,  8 Nov 2026 17:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15909606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.a=rsa-sha256 header.s=fe-953a8a3ca9 header.b=WNGR+i0w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1794159183;
 bh=mmRDTsFTMdkB1knSlLyF6ragoIMpPyE7Nd3fqt3pBKI=;
 b=WNGR+i0wgJQ/WOHln4C0I4S5W0BVlyvuhBIddxiOugG/Ht7OswlQFToLSLv6d6e+MvunGBIwa
 /c5Eqhh2dk5YNRE7BUkimCOIrWreZWtZQRGvC2WmhtvyYkLgx18iOB+at+IFuAL17AOsZl/V+y1
 tkXviMwquRyh5gedAKK775ZBtDKZTG9PrX4MyAgXiRZqxmPsF08hp+xCs2XPUE18iVZbqgIc8vf
 zf9g8ipEe1QAsVLpPJwlPsqwe9M0pQT9BPAQ1Id2l1K4MYLbX0h/8A76zLxmlEu/Le4oQNJ0b26
 bl0E2ksi6jbM+CqHq/epqmaiKrjbEOgJ0dp7UUjAveIg==
X-Forward-Email-ID: 6af0b240935e4de7801c9067
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.13
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Sun, 08 Nov 2026 12:32:46 -0500
Message-Id: <DMQ0CENBZQGW.L35BD1BXYE9Z@ubuntu.com>
Cc: <linux-arm-kernel@lists.infradead.org>,
 <linux-perf-users@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>, "Yuvan Shen"
 <yuvanshen09@gmail.com>, "Nick Chan" <towinchenmi@gmail.com>
Subject: Re: [PATCH 00/13] drivers/perf: apple_m1: Add M3/M4/A18 Pro Support
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: <myrialsarvay@gmail.com>, "Will Deacon" <will@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Sven Peter" <sven@kernel.org>, "Janne Grunau"
 <j@jannau.net>, "Neal Gompa" <neal@gompa.dev>, "Marc Zyngier"
 <maz@kernel.org>
X-Mailer: aerc 0.21.0
References: <20261103-m3-plus-pmu-events-v1-0-a8eb6c1139fe@gmail.com>
In-Reply-To: <20261103-m3-plus-pmu-events-v1-0-a8eb6c1139fe@gmail.com>

On Tue Nov 3, 2026 at 5:14 AM EST, Myria Sarvay via B4 Relay wrote:
> This series adds support for the CPU PMU in the new M3, M4 and A18 SoCs
> presed in apple devices. These PMUs have new encodings for events, along
> with larger codes for these events. All of these events are as Apple
> describes them in the various kpep files found under /usr/share/kpep on
> macOS 27. More events may exist, but we have no idea of their affinity,
> or what they actually count, so we don't include them here.
>
> These patches have been tested on my own M2 (t8133-j413) and M3
> (t6031-j514c) devices, as well as by Yuvan on their M4 (t8132-j713)
> device.
>
> If possible, the device tree changes should probably go through
> apple-soc, as this is where the recently picked up M4 Pro/Max dts are.
>
> Tested-by: Yuvan Shen <yuvanshen09@gmail.com> # on t8132-j713
> Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
> ---
> Myria Sarvay (12):
>       dt-bindings: arm: pmu: Add Apple M3/M4/A18 Pro SoC CPU PMU compatib=
les
>       drivers/perf: apple_m1: Remove unused variables
>       drivers/perf: apple_m1: Support per-implementation event size
>       drivers/perf: apple_m1: Use macros for per-implementation init func=
tions
>       drivers/perf: apple_m1: Add Apple M3 Series Support
>       drivers/perf: apple_m1: Add Apple M4 Series Support
>       drivers/perf: apple_m1: Add Apple A18 Support
>       arm64: dts: apple: t603x: Add PMU Device Nodes
>       arm64: dts: apple: t8122: Add PMU Device Nodes
>       arm64: dts: apple: t604x: Add PMU Device Nodes
>       arm64: dts: apple: t8132: Add PMU Device Nodes
>       arm64: dts: apple: t8140: Add PMU Device Nodes
>
Maybe the folder should be renamed to 'apple_arm' or something like
that?

> Nick Chan (1):
>       drivers/perf: apple_m1: Support per-implementation event tables
>
>  Documentation/devicetree/bindings/arm/pmu.yaml |   8 +
>  arch/arm64/boot/dts/apple/t6030.dtsi           |  12 +
>  arch/arm64/boot/dts/apple/t6031-base.dtsi      |  12 +
>  arch/arm64/boot/dts/apple/t6041.dtsi           |  12 +
>  arch/arm64/boot/dts/apple/t8122.dtsi           |  12 +
>  arch/arm64/boot/dts/apple/t8132.dtsi           |  12 +
>  arch/arm64/boot/dts/apple/t8140.dtsi           |  12 +
>  drivers/perf/apple_m1_cpu_pmu.c                | 664 +++++++++++++++++++=
+++---
>  8 files changed, 662 insertions(+), 82 deletions(-)
> ---
> base-commit: acb925da49876e74b806ccd48a7518d2d3368e5d
> change-id: 20260929-m3-plus-pmu-events-e4010ab44135
>
> Best regards,
> -- =20
> Myria Sarvay <myrialsarvay@gmail.com>

