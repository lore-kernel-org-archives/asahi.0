Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793345321;
	b=exoAQpPXRxvqeOPmJP9GcyRa+1E1mNBYt9TEq0OJCM7w2ZWrC64c5lX9dgRPvUg8nOdT
	 TKvyDMuuiikN7Q0MUaZxz1VRUmJXkHPM/8wB7j6p7+C1/646f46RmXyfHUm7upxA0ASrf
	 LWCvyOJXukMREdf/wGOhtUtZsnYNArbK3y2neXlFHwr2X4eiWQSzJoWtT5R93YEY1t/aF
	 gGM2x14puW9/7yRVvrZuCCGep1yZekh18Sj4G2LfJSPMLwaqemRjxaE3VK/rUiUPntdqB
	 KBQiwIwu5ob+etDYBNqHGjR+KbqykCnOQN4mYIikZCVpcw4CRfIM0P1SHkQljnFvIyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
	b=JIJ9ky2GKGXP2eu2VpzweQNU5ZiOVAzq97OgnTgTBy55y5DMI7SHNaunN2PNe5czpXos
	 kNi7YJ9atCJAxeZkbStVgvOIfKsBhxhXRRORAMY59D9317Yq8ZiE/w+VATPlm2vqFFm/Y
	 lOLZfhrYFPWhyAOkLxRbJ4FVcxBHky0QeoAC5Ya7a6572iZfKTkugOKKiMcAMHWblWQkx
	 L7ChflKC3fm3UYTs/Xc6zMBnXdxrIz0f0XbdgbHcHNyETfVN/ab3OSkENY2uRn0gmRNmw
	 AkAzKvc4f+Bmyhv+StlVtGtSbA8ZDR9lQIthrQG0R7eFiqiJDVFoqfwXpbiSK0Ln8+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=e1u0VV6S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E84606A31F
	for <asahi@lists.linux.dev>; Fri, 30 Oct 2026 07:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30E84606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=e1u0VV6S
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-677bc4704cbso328034d50.0
        for <asahi@lists.linux.dev>; Fri, 30 Oct 2026 00:28:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793345320; cv=none;
        d=google.com; s=arc-20260327;
        b=AFWyz4txONLsO8W5z7XlYakTSpkPYYG2FxFExk4SJhXdRHxEoGRCAc+10wD/zbIY63
         cE3zQ07SSeL/T96NU3QsEKz8Pmxn6wcMZFsCh7IsoJjgBXK0/B6FmoYCI1mC8n89KUph
         lKGuhLOqIceyRWnINa4ztdlrRIm1nypQJzFHrg3q1KS1IGH5sYquLnPm16gLO2ld+YQT
         Ot35LGSdgyZWg93/Vr9sEJDjvRfjYxRmdWFRU/oWPep9ZtnTR9f90XGtZruneQ1Q98FQ
         rLZR5e3jxdI8sfWSsenSBAnJBUgFvJoHb9GG8rQCbo0o2O1XNNaweytYAbnQuocqxSZ+
         YHXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        fh=xQVZI6d0jD41UfCymJgS3bjH97nI3cOAH+MRW/8Ce+M=;
        b=j3S59CBrRHbryOIhpepP9RTojdsn3aGovH628NgewOCpu7PpR6imp2oRnK75cclu1e
         t3jYwctNB+MFnt0zK98/r/9X8e7uPlagp4DliaXgWc7ppBnjdoG9iJBGW2Svql8lCkr3
         Kh63/ijl0YgsxwHuZhb9K4abjhVC2F1nEw97hlArPRg0lQ2u36HvENZN8Y9gQ/JgaKyH
         VmWD6kyOgNpeht5bCuBIRXnWiEtWTV3RRtrMNeTfrwAVl7wsv/NCZmGftgEy2iKaIInq
         XToXbQE089ktjwWNUaohJ6ndYOaiWuUNuq5YnlcJnoZPnihG2zGVssf9SauX8Y4tRWVt
         pzbA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793345320; x=1793950120; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        b=e1u0VV6SYYi6QwkU5B1SPm4uMgQEMGybYXZ9uSg3cTIQIrOR6jI7TRHyt8+RLRnsKu
         SD28AoKJymf63U88/p2P/pBw49IVnR3k6iH77w6D/KNqfJEdAjs83tfIItQ3/9yT+UrP
         M4DgrwOBWQRyivBSMu8N3pfkb6d3GyzHK98Zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345320; x=1793950120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        b=fIZQUPt6svlZrrZqT3qWweKqZMZIC0ShvrVWnUvWxdcL/dcChlGGy8jXY+yKCnV9uI
         RhRikokFeUBSkWgCG6hKyGVoKqQCgSWHf94cmU4RuNJ1lOT97WP0BMk9YiF+d/F10Ve8
         A+iuR5rbogmmuIn4OnRkWP6m26OuKXCKXvKYUfsXgeE83Pj/iPH/ettmcFIV28HsRiMH
         3EHZMkh7W6gIaN2E6bNrV6jsj1TqXG0ZTiTCaZ/pLx5ZTix1SgQr1LltNQyY02Wy1dIK
         efzI+zoOWv/cc4uK8twXAqE787WkT5ejLrhI8ZKA1lbNnu4ZKeSmswZwC2XXgxhIrMBa
         /aZg==
X-Forwarded-Encrypted: i=1; AKwUvBzFB8bnt3sfTcotl2vrli9fe9BwKGLEhe20w9Frdfofo0h0e3jvVDrut8OFxcOUUujEs17Vtw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKNYaKJ0ouVZUw3lRLyrkcN9j6oAiBOHP/olNysulAyT6pzaP3E
	8pidM7z4Gn34c+3wVtEaMYK9PedrWaXs1n4xltVO98OT7pKZQ4/ZQLrLKk/aiyYj0kGTp1LWPan
	CvaMV3BUc9bnx6HfH5OJz7ZLwpccYkSHSubLbPnzN
X-Gm-Gg: AYBFou0zB7Xue09VrGFTppLrh/CQZh8d8l8iuzP1lOBnnxyAQ41XPPPcjkyWj9S8tNH
	fGtPzhqrM7jwQLepIysQncu9UM2Id7PIfMetMFxBdItiD7eOb7IS0q1PxC/dOkyT2qpOf3aQmn8
	AdOm1p0E2ASKquOBdUebGdAVN8aTxePF7xIO5cND7ntt5xgneoFgHg+TmIpZ3yradHBgDi4S0mO
	pdEGXFLKM3NO/vG//MhLwOE38y9NVNLCGrLx0TUJgP6qLgaRMC9Q/BcZCgF4ED9WpFVDM8i5LE8
	t6PjbEBdJ6FJbBCNIyN4O56v0M4EcsvF36+hkFGYzfNDOnEVVj9yK8X3XDh5ChSdUDWkoaHJ63+
	6KGb+K+F637P7CRDsZyMXj6tjpuiZcNBxOOsg2Hp9BdH8bUeCd7zOTii4RMwRumktsOE=
X-Received: by 2002:a53:ac8a:0:b0:679:9afd:c0c7 with SMTP id
 956f58d0204a3-67ba508d24fmr864212d50.126.1793345320085; Fri, 30 Oct 2026
 00:28:40 -0700 (PDT)
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261014082037.1774672-1-wenst@chromium.org> <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org> <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
 <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org> <b4c0761b-34f2-42ad-97e7-ab34ae776281@oss.qualcomm.com>
 <8d4d3ec2-3c97-4a46-97f8-048fdf81b853@linaro.org> <CAGXv+5G_ig=k-eH8Cp0ES70WxTHcBS2TVj9VmHaG9caROiAuQQ@mail.gmail.com>
 <8ceba969-91d2-4b43-81d0-b26e7139664b@oss.qualcomm.com>
In-Reply-To: <8ceba969-91d2-4b43-81d0-b26e7139664b@oss.qualcomm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Oct 2026 15:28:28 +0800
X-Gm-Features: AclHuK87PpF6mvOIXqHCbuY1WKimiNRH2tQGnceMsfo-UR5TI782gxdvYJm286Q
Message-ID: <CAGXv+5GFogx_kS=N1t8-SFTp+HyxLtoHzhnL6t8Zn0GBiqMoKw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port numbering
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Minda Chen <minda.chen@starfivetech.com>, 
	Shyam Pandey <radhey.shyam.pandey@amd.com>, Wei Yang <yangwei1@eswincomputing.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Hang Cao <caohang@eswincomputing.com>, 
	Li Jun <jun.li@nxp.com>, Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>, 
	Yang Xiwen <forbidden405@foxmail.com>, 
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Stanley Chang <stanley_chang@realtek.com>, 
	Ze Huang <huang.ze@linux.dev>, Aswath Govindraju <a-govindraju@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, Mathias Nyman <mathias.nyman@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 5:44=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/15/26 11:00 AM, Chen-Yu Tsai wrote:
> > (Cc-ed Mathias, the xHCI driver maintainer in case I misunderstood xHCI=
.)
> >
> > On Thu, Oct 15, 2026 at 4:44=E2=80=AFPM Neil Armstrong
> > <neil.armstrong@linaro.org> wrote:
> >>
> >> On 10/14/26 18:36, Konrad Dybcio wrote:
> >>> On 10/14/26 11:44 AM, Neil Armstrong wrote:
> >>>> On 10/14/26 11:29, Chen-Yu Tsai wrote:
> >>>>> On Wed, Oct 14, 2026 at 5:28=E2=80=AFPM Neil Armstrong
> >>>>> <neil.armstrong@linaro.org> wrote:
>
> [...]
>
>
> >> How about the USB4, does it use the USB3.0 port ?
> >
> > I'm not familiar with USB4. A quick search says that it can tunnel
> > USB 3.x, DP, and PCIe, and it doesn't have its own USB HCI defined.
> >
> > So I'm thinking the USB4 controller would be more like a nexus node
> > or multiplexing node, or perhaps like a USB C connector. It has input
> > ports for all the protocols it can tunnel, connected to their respectiv=
e
> > controllers (XHCI, DP, PCIe). The binding probably would be very messy
> > if one controller supported multiple outgoing ports, as each downstream
> > port has a 3-to-1 relationship with its respective upstream protocol
> > interfaces.
>
> Yeah that is more or less it.
>
> There needs to be a connection between the USB4 router and the native
> (USB3 *port*, not hub | PCIe *port*, not RC | DPTX) protocol adapter
> where the tunneled packets end up at to create a PM devlink between it
> and the USB4 router.
>
> ACPI does that by adding a `usb4-host-interface =3D &reference_to_router`
> property, for DT that's still undecided:
>
> https://github.com/devicetree-org/dt-schema/pull/196
>
> As far as the Qualcomm implementation goes, I was hoping we could
> go forward with base1 numbering as the DWC3 is an XHCI controller:
>
> https://lore.kernel.org/linux-usb/20260929-topic-dwc3_tunneling_state-v4-=
0-63e296346d57@oss.qualcomm.com/

I don't have DWC3 manuals, but assuming its internal numbering follows
that of XHCI, you can't just use "udev->portnum - 1" in patch 4. That
is the logical port number on the root hub.

Instead you need

    raw_port =3D usb_hcd_find_raw_port_number(bus_to_hcd(hub->bus), port1);

to get the 1-based port number for XHCI.


ChenYu
