Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249AA4FE2F1
	for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054835; cv=pass; b=bPJSo76gXkPd/tcFRj9eBZKzCqkthm2gqW/reThgGaMi5/8pnhNIfjsbTdvGn0rmyrulDTeavWAok14QRbjukI7zcOrwSqDCabN0Jdd38/ah52TNt7EhRp6eREwlA1gCN9oVsSWf5GuCnZDJ+0otozz9HTq3aU+NXRiKjecr75s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054835; c=relaxed/simple;
	bh=k2Rzrx7XeCBQTzrPMgf0gJ6EQIfvVKL0241+vPFdwAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TmG0HTlDkjyzyzIVoawhA7G99T3CJNU5ngegakOyP3Pzu828POzeWwiRmxhlbwCbhBjUnx2kL2DM6vpzbeoUxHDXVqMZqFyi0ZC9LbGGlrWhq+0f2RJzBXcvTRmdo95wmb5YlCYPM1geFYoyZnjA0uNxfPX+0nWshKWvfSvSsnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R3jbs/Rb; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R3jbs/Rb"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-677d35fd1d2so1504398d50.1
        for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 02:00:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792054827; cv=none;
        d=google.com; s=arc-20260327;
        b=IGXIAo8gDegTPZ89Kgk3B9MAgZmSsyjQKdUP6quPAW+XWGc0WxI1eQAuNEz/Ks942z
         6UCii+0pqLHguSCeF5NNTrh03riQgV2KBkU4Ef8Z7SLlsI1r1TSRrYpIx/WgwXxcNBKf
         JZzHNogf3iL8Zmr7gj4/MLUjQ92eguc2aDGLhch/vPnJq0PHbIn4Qu7rJSUUn6MF5pYd
         tnNw5PpOkN9/OmtrdROIo4s/jvHjoWWBxYuV8iWXeUVoatsYOoSoT7gl0uuWTT2zcRb9
         i5TKHin7M3/mutObaCyLIizH5bGDub2N9uda2NMN85d/YC4sG2OXXLZ0m5syjGcQc/6P
         tOOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H2bwf3Gv5oNr3T6PPFbiYLp5czeo2CNPZ2amlY5zFVU=;
        fh=z+P7++z2/f4YiqIAegGqbRNDa8rfAonWQyPQURFxUCg=;
        b=K0Jgcz+7IrdYhSVWNPzUxPoIYAawg9om67FA2b9YlIZSOD1BfApRlgi0eqn/gkHKrw
         XVmjMhE7juQG6uugyOmaSr2INpwG2iEBlvSN39fU1aizF/PV3jnMeyIKC+Gc7PSSOq/4
         M3U/ILWrj9C6uoxsNoQfh6FvOnMInB9AXxz7Vqhrm5yed+s+q69PNIACnImoEXFv4ISm
         w5T5gy9KKlWafKGGaRZBDZQknE9o9hORYvh0Y+V6bRElRanixoA6Wkmr/V3RKO4HcY6c
         D89t1Ivl6ukY4n2JTM6dYxBfXM49sz58+MO3soRIeehbSwMtHYPta0apeMdS/DF695sZ
         2tSw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792054827; x=1792659627; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H2bwf3Gv5oNr3T6PPFbiYLp5czeo2CNPZ2amlY5zFVU=;
        b=R3jbs/RbibBi2mGkgq3I+r5f2q7zuucDkBMKiJNpaE+o6grFgH2xoB73alN9PGYFtI
         EYfJKu2+8KUIvOiz7HQ/hBs7fxVk+9QF9jAZpNrtL2znv7p7e73W7Muo2G3a8ZYrZfu+
         tTVAMrz053c3HPMDSHEIzdxV+3SKv3gih1zwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054827; x=1792659627;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H2bwf3Gv5oNr3T6PPFbiYLp5czeo2CNPZ2amlY5zFVU=;
        b=DMKuc0Y5+iFAVCTJUS6kx4gA8hjZFRIzchkTfEUmhIt4chfX4PPkAjSY7kGrE+oSJ/
         jw2Z7oND8TK9uqBAKoVHOSENoO81BcNOFfirZty8Tm/sr5HnVsS7dv3iKDqx5j+eR5ib
         1DaZcc+zlgM1kRzIHb2aIGBhnVJlHYn1DQSlHnmhEzzCaakmFVnkjf9Tucyab32KAlo3
         oG/FJzV5VPU6JgGsWQvqbUHYRayegwQ4Up31p5xtc//6xrtozlywr8QIFxrZzXpoXc6V
         GeUPKKNQQocPVp+qUw7zXuNzot1ezFawdMTipYQdrH+67Rz6Mq3n7DPpwTbusM5EvDyV
         0u3g==
X-Forwarded-Encrypted: i=1; AKwUvBzrR3XncCb8CG9CTJymlbcMsJEBtIs9/G1RRjFL2a0W2wR7aPBHTVrmwo85umg7slTNiQCBYA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKqoIy63Kwz2lC06UAya41E9ThnPTiMQXL52sjF3HL/7eFJKwxF
	YtW7YxNFO6FfCBKn1xdqNmXAPtsVC/3uyMx12TOgONFKWfHArHWYN+Y62p9ST/abYtl3ekQNzxy
	EQZX/CRWZTAYIZX72pz4i6HtEMxVv+FUJbWzw0iuT
X-Gm-Gg: AYBFou34eQ8IkuKiRVH1bCJo8yjedanBZZGWkRUWEruNVQkgegg0IBklVgLnuaZ1glw
	BwGt9UJgrGWxVtS4UlCHG1jGrZsLW3mRkQmmyOgqZGLXS1VzLEACxYnUJdHQL/KgvMkSsI4Xmpt
	tj+3/CunXu2o3V+EAxtIcek6PYy+WL2B9CgqYwSBym05KIC5iNe3oyYXim+SKKgo/v6+kT2NI7C
	fuPOf0wzKrSY5/mztzslDW9dcIdQup/mvYYjXLR8y34amTYtMmjIw0VvmpiA2HrhykfcCgMOcbt
	cQ6qkXVwXcwucPZURqKPWkbr0daqjcI9X9+IkgubAEAhRa754+ucp0QGWV+SLNB8Z5U=
X-Received: by 2002:a53:ac9e:0:b0:675:449d:3d74 with SMTP id
 956f58d0204a3-679362786a1mr5012542d50.92.1792054826173; Thu, 15 Oct 2026
 02:00:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261014082037.1774672-1-wenst@chromium.org> <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org> <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
 <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org> <b4c0761b-34f2-42ad-97e7-ab34ae776281@oss.qualcomm.com>
 <8d4d3ec2-3c97-4a46-97f8-048fdf81b853@linaro.org>
In-Reply-To: <8d4d3ec2-3c97-4a46-97f8-048fdf81b853@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 15 Oct 2026 18:00:14 +0900
X-Gm-Features: AclHuK909vzDVZhhmMGqz8RNS4kIz2k4tldUZDjIEfGnLkXIyAs5uz5oF7-pLmQ
Message-ID: <CAGXv+5G_ig=k-eH8Cp0ES70WxTHcBS2TVj9VmHaG9caROiAuQQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port numbering
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
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

(Cc-ed Mathias, the xHCI driver maintainer in case I misunderstood xHCI.)

On Thu, Oct 15, 2026 at 4:44=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 10/14/26 18:36, Konrad Dybcio wrote:
> > On 10/14/26 11:44 AM, Neil Armstrong wrote:
> >> On 10/14/26 11:29, Chen-Yu Tsai wrote:
> >>> On Wed, Oct 14, 2026 at 5:28=E2=80=AFPM Neil Armstrong
> >>> <neil.armstrong@linaro.org> wrote:
> >>>>
> >>>> On 10/14/26 10:20, Chen-Yu Tsai wrote:
> >>>>> The DWC3 controller can operate in host mode. It does so with a XHC=
I
> >>>>> compliant host controller. The XHCI has two downstream ports, one f=
or
> >>>>> HS and one for SS. USB downstream ports start from 1, not 0.
> >
> > [...]
> >
> >
> >>> IMHO having consistent numbering across controller types would be
> >>> better. This avoids making the USB core and hub code deal with more
> >>> exceptions, and also easier to understand and write device trees.
> >>
> >> I was in the impression the port number not necessarily reflects
> >> an actual physical numbering, and can be a logical number we would
> >> then map in the kernel.
> >>
> >> I don't see any issue here having base 0 for the bindings and then
> >> converting it to base 1 for the XHCI port numbering.
> >
> > I thought base1 comes from the USB spec and not just XHCI?
>
> This is my question, is the spec says: each USB Host Controller root
> port shall be considered as a port of a Hub and numbered the same way,
> then fine, let's use the base1 numbering.
>
> As I understand how USB is architectured, all downstream ports of Hubs
> are numbered in base1, and the whole topology is based on that.
>
> But here, we are speaking of physically separate USB busses, one
> USB2.0 and one USB3.0, a controller could also have 10 USB2.0 ports
> and 5 USB3.0 ports, who knows. The way those will be numbered is not
> part of the specification because the specification only the defines
> the topology of an USB bus, like PCI(e) defines the topology on a PCI(e) =
bus.

No, the XHCI spec actually specifies how to identify the number of ports
and which port supports what version. See below.

> How we aggregate all those busses to abstract them to software is not
> part of the spec, we chose to declare a fake root Hub with a physical
> downstream port as a virtual port of the root Hub, fine but this is
> purely software abstraction.

As far as I understand the implementation in Linux and the XHCI spec,
the XHCI hardware registers give the "maximum number of ports" in
HCSPARAMS1. Then there is at least 1 "xHCI Supported Protocol Capability"
entry in the "Extended capabilities" section that describes a group of
ports (offset and number) and the USB protocol supported by that group.

Using the example given by the XHCI spec on page 330 as figure 4-35:

    XHCI port 1: HS on physical port 1
    XHCI port 2: HS on physical port 2
    XHCI port 3: HS on physical port 3
    XHCI port 4: HS on physical port 4
    XHCI port 5: SS on physical port 3
    XHCI port 6: SS on physical port 4

The DT would be something like:

    xhci {
        ports {
            port@1 { /* graph to HS EP on USB A connector 1 */ };
            port@2 { /* graph to HS EP on USB A connector 2 */ };
            port@3 { /* graph to HS EP on USB A connector 3 */ };
            port@4 { /* graph to HS EP on USB A connector 4 */ };
            port@5 { /* graph to SS EP on USB A connector 3 */ };
            port@6 { /* graph to SS EP on USB A connector 4 */ };
        };
    };

> We may only use the hardware IP port numbering in the bindings, not
> the software abstraction.

And we are using hardware port numbering. It's just the numbers used
are the physical port numbers from the XHCI registers, not the logical
port numbers on the root hubs.

In fact, we could say that the port numbers on the root hubs for XHCI
are made up.

> We could use the base1 to describe the DWC3 ports, but how to describe
> all the physical USB busses a controller can expose ? We may not limit
> the bindings to USB2.0 and USB3.0 ports only.

Technically, there is one bus for USB 2.0 and one bus for USB 3.0. But
currently for XHCI in DT, we describe the hardware ports directly,
regardless of the USB protocol they support.

I don't know why we don't describe the root hub, but maybe it's because
prior to XHCI the controller and root hub were the same entity? Even for
XHCI, the root hub is more of a logical entity.

And AFAICT, the hardware registers don't distinguish between ports on the
USB 2.0 root hub vs the USB 3.0 root hub. The port control registers are
just in an array, indexed from 1 to maxPorts, i.e. the physical index.

> How about the USB4, does it use the USB3.0 port ?

I'm not familiar with USB4. A quick search says that it can tunnel
USB 3.x, DP, and PCIe, and it doesn't have its own USB HCI defined.

So I'm thinking the USB4 controller would be more like a nexus node
or multiplexing node, or perhaps like a USB C connector. It has input
ports for all the protocols it can tunnel, connected to their respective
controllers (XHCI, DP, PCIe). The binding probably would be very messy
if one controller supported multiple outgoing ports, as each downstream
port has a 3-to-1 relationship with its respective upstream protocol
interfaces.


ChenYu
